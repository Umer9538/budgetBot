import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env_config.dart';
import '../../core/enums/enums.dart';
import '../models/models.dart';
import '../models/local_intelligence_model.dart';

/// Provider for LocalIntelligenceService
final localIntelligenceServiceProvider = Provider<LocalIntelligenceService>((ref) {
  return LocalIntelligenceService();
});

/// Provider for user's local intelligence data
final localIntelligenceProvider = FutureProvider.family<LocalIntelligence?, String>((ref, userId) {
  final service = ref.watch(localIntelligenceServiceProvider);
  return service.getLocalIntelligence(userId);
});

/// Provider for local deals
final localDealsProvider = StreamProvider.family<List<LocalDeal>, String>((ref, userId) {
  final service = ref.watch(localIntelligenceServiceProvider);
  return service.watchLocalDeals(userId);
});

/// Provider for neighborhood benchmark
final neighborhoodBenchmarkProvider = FutureProvider.family<NeighborhoodBenchmark?, String>((ref, userId) {
  final service = ref.watch(localIntelligenceServiceProvider);
  return service.getNeighborhoodBenchmark(userId);
});

/// Provider for community savings groups
final savingsGroupsProvider = StreamProvider.family<List<CommunitySavingsGroup>, String>((ref, userId) {
  final service = ref.watch(localIntelligenceServiceProvider);
  return service.watchSavingsGroups(userId);
});

/// Service for Local Economic Intelligence
class LocalIntelligenceService {
  LocalIntelligenceService({
    FirebaseFirestore? firestore,
    Dio? dio,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _dio = dio ?? Dio();

  final FirebaseFirestore _firestore;
  final Dio _dio;
  final _random = Random();

  // Collection references
  DocumentReference _profileDocument(String userId) =>
      _firestore.collection('users').doc(userId).collection('profile').doc('local_profile');

  CollectionReference _dealsCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('local_deals');

  CollectionReference _comparisonsCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('price_comparisons');

  CollectionReference _groupsCollection() =>
      _firestore.collection('savings_groups');

  // ===== Local Intelligence =====

  /// Get local intelligence data
  Future<LocalIntelligence?> getLocalIntelligence(String userId) async {
    final profile = await getLocalProfile(userId);
    if (profile == null) return null;

    final comparisons = await getPriceComparisons(userId);
    final benchmark = await getNeighborhoodBenchmark(userId);
    final deals = await getLocalDeals(userId);
    final groups = await getSavingsGroups(userId);

    return LocalIntelligence(
      id: userId,
      userId: userId,
      localProfile: profile,
      priceComparisons: comparisons,
      benchmark: benchmark ?? _createEmptyBenchmark(profile.neighborhood),
      deals: deals,
      savingsGroups: groups,
      lastUpdated: DateTime.now(),
    );
  }

  // ===== Local Profile =====

  /// Get local profile
  Future<LocalProfile?> getLocalProfile(String userId) async {
    final doc = await _profileDocument(userId).get();
    if (!doc.exists) return null;

    return LocalProfile.fromJson(doc.data() as Map<String, dynamic>);
  }

  /// Set up local profile
  Future<LocalProfile> setupLocalProfile({
    required String userId,
    required String zipCode,
    required String city,
    required String state,
    String? neighborhood,
    double? latitude,
    double? longitude,
    double searchRadiusMiles = 10,
    List<String> preferredStores = const [],
    List<CategoryType> trackedCategories = const [],
    bool shareAnonymousData = true,
  }) async {
    final profile = LocalProfile(
      zipCode: zipCode,
      city: city,
      state: state,
      neighborhood: neighborhood ?? '$city, $state',
      latitude: latitude ?? 0,
      longitude: longitude ?? 0,
      searchRadiusMiles: searchRadiusMiles,
      preferredStores: preferredStores,
      trackedCategories: trackedCategories.isEmpty
          ? [CategoryType.groceries, CategoryType.restaurants, CategoryType.clothing, CategoryType.utilities]
          : trackedCategories,
      shareAnonymousData: shareAnonymousData,
    );

    await _profileDocument(userId).set(profile.toJson());
    return profile;
  }

  /// Update local profile
  Future<void> updateLocalProfile(String userId, LocalProfile profile) async {
    await _profileDocument(userId).update(profile.toJson());
  }

  // ===== Price Comparisons =====

  /// Get price comparisons
  Future<List<PriceComparison>> getPriceComparisons(String userId) async {
    final snapshot = await _comparisonsCollection(userId)
        .orderBy('comparedAt', descending: true)
        .limit(50)
        .get();

    return snapshot.docs
        .map((d) => PriceComparison.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  /// Compare price for an item
  Future<PriceComparison> comparePrice({
    required String userId,
    required String itemName,
    required CategoryType category,
    required double userPaidPrice,
    String? storeName,
  }) async {
    final profile = await getLocalProfile(userId);

    // Get local prices (in production, would call external APIs)
    final localPrices = await _fetchLocalPrices(
      itemName: itemName,
      category: category,
      zipCode: profile?.zipCode ?? '00000',
      radiusMiles: profile?.searchRadiusMiles ?? 10,
    );

    final bestPrice = localPrices.isEmpty
        ? userPaidPrice
        : localPrices.map((p) => p.price).reduce(min);
    final bestLocation = localPrices.isEmpty
        ? storeName ?? 'Unknown'
        : localPrices.firstWhere((p) => p.price == bestPrice).storeName;
    final avgPrice = localPrices.isEmpty
        ? userPaidPrice
        : localPrices.map((p) => p.price).reduce((a, b) => a + b) / localPrices.length;

    final comparison = PriceComparison(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      itemName: itemName,
      category: category,
      prices: localPrices,
      bestPrice: bestPrice,
      bestPriceLocation: bestLocation,
      averagePrice: avgPrice,
      userPaidPrice: userPaidPrice,
      potentialSavings: (userPaidPrice - bestPrice).clamp(0, double.infinity),
      comparedAt: DateTime.now(),
    );

    await _comparisonsCollection(userId).doc(comparison.id).set(comparison.toJson());
    return comparison;
  }

  // ===== Neighborhood Benchmark =====

  /// Get neighborhood benchmark
  Future<NeighborhoodBenchmark?> getNeighborhoodBenchmark(String userId) async {
    final profile = await getLocalProfile(userId);
    if (profile == null) return null;

    // Get user's spending by category
    final userSpending = await _getUserSpendingByCategory(userId);

    // Get benchmark data (in production, would aggregate from community)
    final benchmarkData = await _fetchBenchmarkData(profile.zipCode);

    final categoryBenchmarks = <String, CategoryBenchmark>{};
    final insights = <BenchmarkInsight>[];

    for (final category in profile.trackedCategories) {
      final userAmount = userSpending[category.name] ?? 0.0;
      final neighborhoodAvg = benchmarkData[category.name]?['average'] ?? userAmount;
      final neighborhoodMedian = benchmarkData[category.name]?['median'] ?? userAmount;

      final percentile = _calculatePercentile(userAmount, neighborhoodAvg, neighborhoodMedian);
      final comparison = _getSpendingComparison(percentile);

      categoryBenchmarks[category.name] = CategoryBenchmark(
        categoryName: category.displayName,
        neighborhoodAverage: neighborhoodAvg,
        neighborhoodMedian: neighborhoodMedian,
        userSpending: userAmount,
        percentile: percentile,
        comparison: comparison,
        potentialSavings: comparison == SpendingComparison.muchHigher ||
                comparison == SpendingComparison.higher
            ? userAmount - neighborhoodMedian
            : 0,
      );

      // Generate insights
      if (comparison == SpendingComparison.muchHigher) {
        insights.add(BenchmarkInsight(
          title: 'High ${category.displayName} Spending',
          description: 'You spend ${((userAmount / neighborhoodMedian - 1) * 100).toStringAsFixed(0)}% more than your neighbors on ${category.displayName.toLowerCase()}',
          type: LocalInsightType.warning,
          potentialImpact: userAmount - neighborhoodMedian,
          actionItem: 'Review your ${category.displayName.toLowerCase()} expenses for savings opportunities',
        ));
      } else if (comparison == SpendingComparison.muchLower) {
        insights.add(BenchmarkInsight(
          title: 'Great ${category.displayName} Management',
          description: 'You spend ${((1 - userAmount / neighborhoodMedian) * 100).toStringAsFixed(0)}% less than neighbors on ${category.displayName.toLowerCase()}',
          type: LocalInsightType.celebration,
          potentialImpact: neighborhoodMedian - userAmount,
          actionItem: 'Keep up the good work!',
        ));
      }
    }

    // Calculate overall rank
    final userTotal = userSpending.values.fold<double>(0, (sum, v) => sum + v);
    final avgTotal = categoryBenchmarks.values
        .fold<double>(0, (sum, b) => sum + b.neighborhoodAverage);
    final overallPercentile = _calculatePercentile(userTotal, avgTotal, avgTotal * 0.9);

    return NeighborhoodBenchmark(
      neighborhoodName: profile.neighborhood,
      householdsCompared: 150 + _random.nextInt(100), // Simulated
      medianIncome: 65000 + _random.nextDouble() * 30000, // Simulated
      categoryBenchmarks: categoryBenchmarks,
      userOverallRank: overallPercentile,
      insights: insights,
      lastUpdated: DateTime.now(),
    );
  }

  // ===== Local Deals =====

  /// Get local deals
  Future<List<LocalDeal>> getLocalDeals(String userId) async {
    final snapshot = await _dealsCollection(userId)
        .where('validUntil', isGreaterThan: Timestamp.now())
        .orderBy('validUntil')
        .orderBy('savingsPercent', descending: true)
        .limit(50)
        .get();

    return snapshot.docs
        .map((d) => LocalDeal.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  /// Watch local deals
  Stream<List<LocalDeal>> watchLocalDeals(String userId) {
    return _dealsCollection(userId)
        .where('validUntil', isGreaterThan: Timestamp.now())
        .orderBy('validUntil')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((d) => LocalDeal.fromJson(d.data() as Map<String, dynamic>))
            .toList());
  }

  /// Fetch and store local deals
  Future<List<LocalDeal>> refreshLocalDeals(String userId) async {
    final profile = await getLocalProfile(userId);
    if (profile == null) return [];

    // In production, would fetch from deal APIs
    final deals = await _fetchLocalDeals(
      zipCode: profile.zipCode,
      categories: profile.trackedCategories,
      radiusMiles: profile.searchRadiusMiles,
    );

    // Store deals
    final batch = _firestore.batch();
    for (final deal in deals) {
      batch.set(_dealsCollection(userId).doc(deal.id), deal.toJson());
    }
    await batch.commit();

    return deals;
  }

  /// Report a deal (community contribution)
  Future<LocalDeal> reportDeal({
    required String userId,
    required String title,
    required String description,
    required String storeName,
    required String storeAddress,
    required double originalPrice,
    required double dealPrice,
    required CategoryType category,
    required DateTime validUntil,
  }) async {
    final profile = await getLocalProfile(userId);

    final deal = LocalDeal(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      storeName: storeName,
      storeAddress: storeAddress,
      distanceMiles: 0, // Would calculate from user location
      originalPrice: originalPrice,
      dealPrice: dealPrice,
      savingsPercent: ((originalPrice - dealPrice) / originalPrice) * 100,
      category: category,
      validFrom: DateTime.now(),
      validUntil: validUntil,
      source: DealSource.community,
      isVerified: false,
      claimedCount: 0,
    );

    // Add to user's deals and community deals
    await _dealsCollection(userId).doc(deal.id).set(deal.toJson());

    // Add to global deals collection for the area
    if (profile?.shareAnonymousData == true) {
      await _firestore
          .collection('community_deals')
          .doc(profile?.zipCode ?? 'unknown')
          .collection('deals')
          .doc(deal.id)
          .set(deal.toJson());
    }

    return deal;
  }

  // ===== Community Savings Groups =====

  /// Get savings groups
  Future<List<CommunitySavingsGroup>> getSavingsGroups(String userId) async {
    final profile = await getLocalProfile(userId);
    if (profile == null) return [];

    final snapshot = await _groupsCollection()
        .where('neighborhood', isEqualTo: profile.neighborhood)
        .where('isPublic', isEqualTo: true)
        .get();

    return snapshot.docs
        .map((d) => CommunitySavingsGroup.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  /// Watch savings groups
  Stream<List<CommunitySavingsGroup>> watchSavingsGroups(String userId) {
    return _profileDocument(userId).snapshots().asyncMap((profileDoc) async {
      if (!profileDoc.exists) return <CommunitySavingsGroup>[];

      final profile = LocalProfile.fromJson(profileDoc.data() as Map<String, dynamic>);

      final snapshot = await _groupsCollection()
          .where('neighborhood', isEqualTo: profile.neighborhood)
          .where('isPublic', isEqualTo: true)
          .get();

      return snapshot.docs
          .map((d) => CommunitySavingsGroup.fromJson(d.data() as Map<String, dynamic>))
          .toList();
    });
  }

  /// Create a savings group
  Future<CommunitySavingsGroup> createSavingsGroup({
    required String userId,
    required String name,
    required String description,
    required GroupType type,
    required List<String> categories,
    bool isPublic = true,
    String? meetingSchedule,
    String? contactInfo,
  }) async {
    final profile = await getLocalProfile(userId);

    final group = CommunitySavingsGroup(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      description: description,
      type: type,
      memberCount: 1,
      totalSaved: 0,
      neighborhood: profile?.neighborhood ?? 'Unknown',
      categories: categories,
      isPublic: isPublic,
      createdAt: DateTime.now(),
      meetingSchedule: meetingSchedule,
      contactInfo: contactInfo,
    );

    await _groupsCollection().doc(group.id).set(group.toJson());
    return group;
  }

  /// Join a savings group
  Future<void> joinSavingsGroup(String userId, String groupId) async {
    await _groupsCollection().doc(groupId).update({
      'memberCount': FieldValue.increment(1),
    });

    await _firestore
        .collection('users')
        .doc(userId)
        .collection('joined_groups')
        .doc(groupId)
        .set({'joinedAt': FieldValue.serverTimestamp()});
  }

  // ===== Local Economic Stats =====

  /// Get local economic stats
  Future<LocalEconomicStats> getLocalEconomicStats(String zipCode) async {
    // In production, would fetch from economic data APIs
    return LocalEconomicStats(
      zipCode: zipCode,
      averageGasPrice: 3.50 + _random.nextDouble() * 0.5,
      averageRent: 1500 + _random.nextDouble() * 1000,
      costOfLivingIndex: 95 + _random.nextDouble() * 20,
      groceryIndex: 98 + _random.nextDouble() * 10,
      utilitiesIndex: 95 + _random.nextDouble() * 15,
      transportIndex: 100 + _random.nextDouble() * 10,
      categoryAverages: {
        'groceries': 400 + _random.nextDouble() * 200,
        'dining': 250 + _random.nextDouble() * 150,
        'utilities': 150 + _random.nextDouble() * 100,
        'transportation': 200 + _random.nextDouble() * 100,
      },
      priceTrends: [
        PriceTrend(
          itemName: 'Gas',
          currentPrice: 3.55,
          changePercent: 2.5,
          direction: TrendDirection.up,
          timeframe: 'Last 30 days',
          prediction: 'Expected to stabilize',
        ),
        PriceTrend(
          itemName: 'Groceries',
          currentPrice: 0, // Index
          changePercent: -1.2,
          direction: TrendDirection.down,
          timeframe: 'Last 30 days',
          prediction: 'Seasonal decrease expected',
        ),
      ],
      lastUpdated: DateTime.now(),
    );
  }

  // ===== Private Helper Methods =====

  Future<List<LocalPrice>> _fetchLocalPrices({
    required String itemName,
    required CategoryType category,
    required String zipCode,
    required double radiusMiles,
  }) async {
    // In production, would call price comparison APIs
    // Simulated data for now
    final stores = ['Walmart', 'Target', 'Costco', 'Kroger', 'Whole Foods'];
    final basePrice = 10.0 + _random.nextDouble() * 20;

    return stores.map((store) {
      final variance = (_random.nextDouble() - 0.5) * 0.3;
      return LocalPrice(
        storeName: store,
        storeAddress: '123 Main St, $zipCode',
        price: basePrice * (1 + variance),
        distanceMiles: _random.nextDouble() * radiusMiles,
        lastVerified: DateTime.now().subtract(Duration(days: _random.nextInt(7))),
        confidence: PriceConfidence.values[_random.nextInt(3)],
        inStock: _random.nextBool(),
      );
    }).toList();
  }

  Future<Map<String, Map<String, double>>> _fetchBenchmarkData(String zipCode) async {
    // In production, would aggregate from community data
    return {
      'groceries': {'average': 450, 'median': 400},
      'dining': {'average': 300, 'median': 250},
      'shopping': {'average': 200, 'median': 150},
      'utilities': {'average': 180, 'median': 160},
      'transportation': {'average': 250, 'median': 200},
      'entertainment': {'average': 150, 'median': 100},
    };
  }

  Future<Map<String, double>> _getUserSpendingByCategory(String userId) async {
    final cutoff = DateTime.now().subtract(const Duration(days: 30));
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .where('date', isGreaterThan: Timestamp.fromDate(cutoff))
        .where('type', isEqualTo: 'expense')
        .get();

    final spending = <String, double>{};
    for (final doc in snapshot.docs) {
      final data = doc.data();
      final category = data['category'] as String? ?? 'other';
      final amount = (data['amount'] as num?)?.toDouble().abs() ?? 0;
      spending[category] = (spending[category] ?? 0) + amount;
    }

    return spending;
  }

  Future<List<LocalDeal>> _fetchLocalDeals({
    required String zipCode,
    required List<CategoryType> categories,
    required double radiusMiles,
  }) async {
    // In production, would fetch from deal APIs
    final deals = <LocalDeal>[];

    for (final category in categories) {
      deals.add(LocalDeal(
        id: '${category.name}_${DateTime.now().millisecondsSinceEpoch}',
        title: '${category.displayName} Deal',
        description: 'Save on ${category.displayName.toLowerCase()} this week',
        storeName: 'Local Store',
        storeAddress: '123 Main St, $zipCode',
        distanceMiles: _random.nextDouble() * radiusMiles,
        originalPrice: 20 + _random.nextDouble() * 30,
        dealPrice: 15 + _random.nextDouble() * 20,
        savingsPercent: 15 + _random.nextDouble() * 25,
        category: category,
        validFrom: DateTime.now(),
        validUntil: DateTime.now().add(Duration(days: 3 + _random.nextInt(7))),
        source: DealSource.store,
        isVerified: true,
        claimedCount: _random.nextInt(50),
      ));
    }

    return deals;
  }

  double _calculatePercentile(double userValue, double average, double median) {
    // Simplified percentile calculation
    if (userValue <= median * 0.5) return 10;
    if (userValue <= median * 0.75) return 25;
    if (userValue <= median) return 50;
    if (userValue <= average) return 60;
    if (userValue <= average * 1.25) return 75;
    if (userValue <= average * 1.5) return 85;
    return 95;
  }

  SpendingComparison _getSpendingComparison(double percentile) {
    if (percentile <= 20) return SpendingComparison.muchLower;
    if (percentile <= 40) return SpendingComparison.lower;
    if (percentile <= 60) return SpendingComparison.average;
    if (percentile <= 80) return SpendingComparison.higher;
    return SpendingComparison.muchHigher;
  }

  NeighborhoodBenchmark _createEmptyBenchmark(String neighborhood) {
    return NeighborhoodBenchmark(
      neighborhoodName: neighborhood,
      householdsCompared: 0,
      medianIncome: 0,
      categoryBenchmarks: {},
      userOverallRank: 50,
      insights: [],
      lastUpdated: DateTime.now(),
    );
  }
}
