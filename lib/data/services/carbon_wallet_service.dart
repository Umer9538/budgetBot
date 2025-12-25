import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env_config.dart';
import '../../core/enums/enums.dart';
import '../models/models.dart';
import '../models/carbon_wallet_model.dart';

/// Provider for CarbonWalletService
final carbonWalletServiceProvider = Provider<CarbonWalletService>((ref) {
  return CarbonWalletService();
});

/// Service for tracking environmental impact of spending
class CarbonWalletService {
  CarbonWalletService({
    FirebaseFirestore? firestore,
    Dio? dio,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _dio = dio ?? Dio();

  final FirebaseFirestore _firestore;
  final Dio _dio;

  // Collection references
  CollectionReference _walletCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('carbon_wallet');

  CollectionReference _goalsCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('carbon_goals');

  CollectionReference _offsetsCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('carbon_offsets');

  // ===== Carbon Analysis =====

  /// Generate carbon wallet report for a period
  Future<CarbonWallet> generateCarbonReport({
    required String userId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final now = DateTime.now();
    final start = startDate ?? DateTime(now.year, now.month, 1);
    final end = endDate ?? now;

    // Get transactions for period
    final transactions = await _getTransactions(userId, start, end);

    // Calculate carbon for each transaction
    double totalCarbon = 0;
    final categoryBreakdown = <String, double>{};
    final carbonTransactions = <CarbonTransaction>[];

    for (final t in transactions) {
      if (t.type != TransactionType.expense) continue;

      final carbonKg = _calculateCarbonFootprint(t);
      totalCarbon += carbonKg;

      // Add to category breakdown
      final categoryName = t.category.displayName;
      categoryBreakdown[categoryName] = (categoryBreakdown[categoryName] ?? 0) + carbonKg;

      carbonTransactions.add(CarbonTransaction(
        transactionId: t.id,
        merchantName: t.merchantName ?? t.category.displayName,
        amount: t.amount.abs(),
        carbonKg: carbonKg,
        category: t.category,
        date: t.date,
        alternativeSuggestion: _getAlternativeSuggestion(t),
        potentialSavingsKg: _getPotentialSavings(t, carbonKg),
      ));
    }

    // Get top emitters
    carbonTransactions.sort((a, b) => b.carbonKg.compareTo(a.carbonKg));
    final topEmitters = carbonTransactions.take(10).toList();

    // Get total offsets
    final offsetsSnapshot = await _offsetsCollection(userId)
        .where('purchaseDate', isGreaterThan: Timestamp.fromDate(start))
        .where('purchaseDate', isLessThan: Timestamp.fromDate(end))
        .get();

    final offsetCarbon = offsetsSnapshot.docs.fold<double>(0, (sum, doc) {
      final data = doc.data() as Map<String, dynamic>;
      return sum + (data['amountKg'] as double? ?? 0);
    });

    // Calculate impact level
    final impactLevel = _calculateImpactLevel(totalCarbon, transactions.length);

    // Compare to average (assume 300kg/month average)
    final daysInPeriod = end.difference(start).inDays;
    final monthlyEquivalent = totalCarbon / daysInPeriod * 30;
    final comparedToAverage = ((monthlyEquivalent - 300) / 300 * 100);

    // Get active goals
    final goalsSnapshot = await _goalsCollection(userId)
        .where('status', isEqualTo: CarbonGoalStatus.active.name)
        .get();
    final goals = goalsSnapshot.docs
        .map((d) => CarbonGoal.fromJson(d.data() as Map<String, dynamic>))
        .toList();

    // Generate recommendations
    final recommendations = await _generateRecommendations(
      categoryBreakdown,
      topEmitters,
      comparedToAverage,
    );

    final wallet = CarbonWallet(
      id: '${start.millisecondsSinceEpoch}_${end.millisecondsSinceEpoch}',
      userId: userId,
      periodStart: start,
      periodEnd: end,
      totalCarbonKg: totalCarbon,
      offsetCarbonKg: offsetCarbon,
      netCarbonKg: totalCarbon - offsetCarbon,
      impactLevel: impactLevel,
      categoryBreakdown: categoryBreakdown,
      topEmitters: topEmitters,
      comparedToAverage: comparedToAverage,
      recommendations: recommendations,
      goals: goals,
      createdAt: DateTime.now(),
    );

    // Save report
    await _walletCollection(userId).doc(wallet.id).set({
      ...wallet.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    return wallet;
  }

  /// Get latest carbon report
  Future<CarbonWallet?> getLatestReport(String userId) async {
    final snapshot = await _walletCollection(userId)
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;

    return CarbonWallet.fromJson(snapshot.docs.first.data() as Map<String, dynamic>);
  }

  /// Stream latest carbon report
  Stream<CarbonWallet?> watchLatestReport(String userId) {
    return _walletCollection(userId)
        .orderBy('createdAt', descending: true)
        .limit(1)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) return null;
      return CarbonWallet.fromJson(snapshot.docs.first.data() as Map<String, dynamic>);
    });
  }

  // ===== Carbon Goals =====

  /// Create a carbon reduction goal
  Future<CarbonGoal> createGoal({
    required String userId,
    required String title,
    required String description,
    required double targetReductionKg,
    required DateTime endDate,
    String? category,
    int? rewardPoints,
  }) async {
    final goal = CarbonGoal(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      targetReductionKg: targetReductionKg,
      currentReductionKg: 0,
      startDate: DateTime.now(),
      endDate: endDate,
      status: CarbonGoalStatus.active,
      category: category,
      rewardPoints: rewardPoints ?? 50,
    );

    await _goalsCollection(userId).doc(goal.id).set(goal.toJson());

    return goal;
  }

  /// Get all goals
  Future<List<CarbonGoal>> getGoals(String userId) async {
    final snapshot = await _goalsCollection(userId).get();
    return snapshot.docs
        .map((d) => CarbonGoal.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  /// Update goal progress
  Future<void> updateGoalProgress(
    String userId,
    String goalId,
    double progressKg,
  ) async {
    final doc = await _goalsCollection(userId).doc(goalId).get();
    if (!doc.exists) return;

    final goal = CarbonGoal.fromJson(doc.data() as Map<String, dynamic>);
    final newProgress = goal.currentReductionKg + progressKg;

    CarbonGoalStatus newStatus = goal.status;
    if (newProgress >= goal.targetReductionKg) {
      newStatus = CarbonGoalStatus.completed;
    }

    await _goalsCollection(userId).doc(goalId).update({
      'currentReductionKg': newProgress,
      'status': newStatus.name,
    });
  }

  // ===== Carbon Offsets =====

  /// Purchase carbon offset
  Future<CarbonOffset> purchaseOffset({
    required String userId,
    required double amountKg,
    required double costUsd,
    required String provider,
    required String projectName,
  }) async {
    final offset = CarbonOffset(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      amountKg: amountKg,
      costUsd: costUsd,
      provider: provider,
      projectName: projectName,
      purchaseDate: DateTime.now(),
    );

    await _offsetsCollection(userId).doc(offset.id).set(offset.toJson());

    return offset;
  }

  /// Get total offsets
  Future<double> getTotalOffsets(String userId) async {
    final snapshot = await _offsetsCollection(userId).get();

    return snapshot.docs.fold<double>(0, (sum, doc) {
      final data = doc.data() as Map<String, dynamic>;
      return sum + (data['amountKg'] as double? ?? 0);
    });
  }

  // ===== Private Methods =====

  Future<List<TransactionModel>> _getTransactions(
    String userId,
    DateTime start,
    DateTime end,
  ) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .where('date', isGreaterThan: Timestamp.fromDate(start))
        .where('date', isLessThan: Timestamp.fromDate(end))
        .get();

    return snapshot.docs
        .map((d) => TransactionModel.fromJson(d.data()))
        .toList();
  }

  double _calculateCarbonFootprint(TransactionModel transaction) {
    // Use category-specific carbon factor
    final factor = CategoryCarbonFactors.getFactorForCategory(transaction.category);

    // Apply merchant-specific adjustments
    double multiplier = 1.0;
    final merchant = transaction.merchantName?.toLowerCase() ?? '';

    // High-impact merchants
    if (merchant.contains('airline') ||
        merchant.contains('flight') ||
        merchant.contains('united') ||
        merchant.contains('delta') ||
        merchant.contains('american air')) {
      multiplier = 2.5; // Flights have high impact
    } else if (merchant.contains('gas') ||
        merchant.contains('shell') ||
        merchant.contains('chevron') ||
        merchant.contains('exxon')) {
      multiplier = 1.5; // Fuel
    } else if (merchant.contains('whole foods') ||
        merchant.contains('trader joe') ||
        merchant.contains('organic')) {
      multiplier = 0.7; // Generally lower impact
    } else if (merchant.contains('thrift') || merchant.contains('goodwill')) {
      multiplier = 0.3; // Second-hand is much better
    }

    return transaction.amount.abs() * factor * multiplier;
  }

  CarbonImpactLevel _calculateImpactLevel(double totalCarbon, int transactionCount) {
    if (transactionCount == 0) return CarbonImpactLevel.veryLow;

    // Normalize to monthly (assume 30 days of data)
    final monthlyCarbon = totalCarbon;

    if (monthlyCarbon < 100) return CarbonImpactLevel.veryLow;
    if (monthlyCarbon < 200) return CarbonImpactLevel.low;
    if (monthlyCarbon < 350) return CarbonImpactLevel.moderate;
    if (monthlyCarbon < 500) return CarbonImpactLevel.high;
    return CarbonImpactLevel.veryHigh;
  }

  String? _getAlternativeSuggestion(TransactionModel transaction) {
    final merchant = transaction.merchantName?.toLowerCase() ?? '';
    final category = transaction.category;

    // Transportation categories
    if (category == CategoryType.fuel ||
        category == CategoryType.rideShare ||
        category == CategoryType.carPayment) {
      if (merchant.contains('uber') || merchant.contains('lyft')) {
        return 'Consider public transit or biking for short trips';
      }
      if (merchant.contains('gas') || merchant.contains('shell') || merchant.contains('chevron')) {
        return 'Consider carpooling or an electric vehicle';
      }
      return 'Consider public transit or carpooling';
    }

    // Food categories
    if (category == CategoryType.restaurants ||
        category == CategoryType.foodDelivery ||
        category == CategoryType.coffeeShops) {
      if (merchant.contains('mcdonald') ||
          merchant.contains('burger') ||
          merchant.contains('wendy')) {
        return 'Plant-based meals have 50% lower carbon footprint';
      }
      return 'Cooking at home reduces food carbon footprint by 50%';
    }

    // Shopping categories
    if (category == CategoryType.clothing ||
        category == CategoryType.electronics ||
        category == CategoryType.homeGoods ||
        category == CategoryType.onlineShopping) {
      return 'Consider second-hand or sustainable brands';
    }

    return null;
  }

  double? _getPotentialSavings(TransactionModel transaction, double currentCarbon) {
    final alternative = _getAlternativeSuggestion(transaction);
    if (alternative == null) return null;

    // Estimate 30-50% savings with alternatives
    return currentCarbon * 0.4;
  }

  Future<List<String>> _generateRecommendations(
    Map<String, double> categoryBreakdown,
    List<CarbonTransaction> topEmitters,
    double comparedToAverage,
  ) async {
    final recommendations = <String>[];

    // Find highest impact category
    if (categoryBreakdown.isNotEmpty) {
      final topCategory = categoryBreakdown.entries
          .reduce((a, b) => a.value > b.value ? a : b);
      recommendations.add(
        '${topCategory.key} is your highest impact category at ${topCategory.value.toStringAsFixed(1)}kg CO2.',
      );
    }

    // Add specific recommendations
    if (categoryBreakdown['Transportation'] != null &&
        categoryBreakdown['Transportation']! > 50) {
      recommendations.add(
        'Consider carpooling or public transit to reduce transportation emissions.',
      );
    }

    if (categoryBreakdown['Food'] != null && categoryBreakdown['Food']! > 30) {
      recommendations.add(
        'Try one meatless day per week - it can reduce food emissions by 15%.',
      );
    }

    if (comparedToAverage > 20) {
      recommendations.add(
        'Your footprint is ${comparedToAverage.toStringAsFixed(0)}% above average. Small changes can help!',
      );
    } else if (comparedToAverage < -20) {
      recommendations.add(
        'Great job! Your footprint is ${(-comparedToAverage).toStringAsFixed(0)}% below average.',
      );
    }

    // AI recommendations
    if (EnvConfig.openAIApiKey.isNotEmpty && topEmitters.isNotEmpty) {
      try {
        final aiRecs = await _getAIRecommendations(categoryBreakdown, topEmitters);
        recommendations.addAll(aiRecs);
      } catch (e) {
        debugPrint('AI carbon recommendations failed: $e');
      }
    }

    return recommendations.take(5).toList();
  }

  Future<List<String>> _getAIRecommendations(
    Map<String, double> categoryBreakdown,
    List<CarbonTransaction> topEmitters,
  ) async {
    final prompt = '''
Based on this carbon footprint data, provide 2 specific eco-friendly recommendations:

Category breakdown (kg CO2):
${categoryBreakdown.entries.map((e) => '- ${e.key}: ${e.value.toStringAsFixed(1)}kg').join('\n')}

Top emitters:
${topEmitters.take(3).map((e) => '- ${e.merchantName}: ${e.carbonKg.toStringAsFixed(1)}kg').join('\n')}

Provide 2 actionable recommendations to reduce carbon footprint.
''';

    final response = await _dio.post(
      '${EnvConfig.aiBaseUrl}/chat/completions',
      options: Options(headers: {
        'Authorization': 'Bearer ${EnvConfig.openAIApiKey}',
        'Content-Type': 'application/json',
      }),
      data: {
        'model': 'gpt-4o-mini',
        'messages': [
          {'role': 'system', 'content': 'You are an environmental sustainability advisor.'},
          {'role': 'user', 'content': prompt},
        ],
        'max_tokens': 150,
      },
    );

    final content = response.data['choices'][0]['message']['content'] as String;
    return content
        .split('\n')
        .where((l) => l.trim().isNotEmpty)
        .map((l) => l.replaceFirst(RegExp(r'^\d+\.\s*'), '').trim())
        .take(2)
        .toList();
  }
}
