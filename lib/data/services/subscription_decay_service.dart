import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env_config.dart';
import '../../core/enums/enums.dart';
import '../models/models.dart';
import '../models/subscription_model.dart';

/// Provider for SubscriptionDecayService
final subscriptionDecayServiceProvider = Provider<SubscriptionDecayService>((ref) {
  return SubscriptionDecayService();
});

/// Service for detecting and analyzing subscription decay
class SubscriptionDecayService {
  SubscriptionDecayService({
    FirebaseFirestore? firestore,
    Dio? dio,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _dio = dio ?? Dio();

  final FirebaseFirestore _firestore;
  final Dio _dio;

  // Collection references
  CollectionReference _subscriptionsCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('subscriptions');

  CollectionReference get _analysisCollection =>
      _firestore.collection('subscription_decay_analysis');

  // ===== Subscription CRUD =====

  /// Add a subscription manually
  Future<Subscription> addSubscription({
    required String userId,
    required String name,
    required double amount,
    required BillingFrequency frequency,
    required CategoryType category,
    DateTime? nextBillingDate,
    String? merchantName,
  }) async {
    final subscription = Subscription(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      name: name,
      amount: amount,
      frequency: frequency,
      status: SubscriptionStatus.active,
      category: category,
      nextBillingDate: nextBillingDate,
      merchantName: merchantName,
      decayStatus: DecayStatus.active,
      usageScore: 100,
      createdAt: DateTime.now(),
    );

    await _subscriptionsCollection(userId).doc(subscription.id).set({
      ...subscription.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    return subscription;
  }

  /// Get all subscriptions
  Future<List<Subscription>> getSubscriptions(String userId) async {
    final snapshot = await _subscriptionsCollection(userId)
        .where('status', isEqualTo: SubscriptionStatus.active.name)
        .get();

    return snapshot.docs
        .map((d) => Subscription.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  /// Stream subscriptions
  Stream<List<Subscription>> watchSubscriptions(String userId) {
    return _subscriptionsCollection(userId)
        .where('status', isEqualTo: SubscriptionStatus.active.name)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((d) => Subscription.fromJson(d.data() as Map<String, dynamic>))
            .toList());
  }

  /// Update subscription
  Future<void> updateSubscription(String userId, Subscription subscription) async {
    await _subscriptionsCollection(userId).doc(subscription.id).update({
      ...subscription.toJson(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Cancel subscription
  Future<void> cancelSubscription(String userId, String subscriptionId) async {
    await _subscriptionsCollection(userId).doc(subscriptionId).update({
      'status': SubscriptionStatus.cancelled.name,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Record subscription usage
  Future<void> recordUsage(String userId, String subscriptionId) async {
    await _subscriptionsCollection(userId).doc(subscriptionId).update({
      'lastUsedDate': FieldValue.serverTimestamp(),
      'usageCount': FieldValue.increment(1),
    });
  }

  // ===== Auto-Detection =====

  /// Detect subscriptions from transaction history
  Future<List<Subscription>> detectSubscriptions(String userId) async {
    final transactions = await _getRecentTransactions(userId, daysBack: 90);
    final detected = <Subscription>[];

    // Group transactions by merchant
    final merchantGroups = <String, List<TransactionModel>>{};
    for (final t in transactions) {
      final merchant = t.merchantName ?? t.category.displayName;
      merchantGroups[merchant] = [...(merchantGroups[merchant] ?? []), t];
    }

    // Analyze each merchant for recurring patterns
    for (final entry in merchantGroups.entries) {
      final merchant = entry.key;
      final txns = entry.value;

      if (txns.length < 2) continue;

      // Check for recurring pattern
      final recurringInfo = _detectRecurringPattern(txns);
      if (recurringInfo == null) continue;

      // Check if already tracked
      final existing = await _subscriptionsCollection(userId)
          .where('merchantName', isEqualTo: merchant)
          .limit(1)
          .get();

      if (existing.docs.isNotEmpty) continue;

      // Check against known templates
      final template = _findMatchingTemplate(merchant);

      detected.add(Subscription(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        userId: userId,
        name: template?.name ?? merchant,
        amount: recurringInfo.amount,
        frequency: recurringInfo.frequency,
        status: SubscriptionStatus.active,
        category: template?.category ?? txns.first.category,
        merchantName: merchant,
        logoUrl: template?.logoUrl,
        nextBillingDate: _calculateNextBilling(txns.last.date, recurringInfo.frequency),
        autoDetected: true,
        decayStatus: DecayStatus.active,
        usageScore: 100,
        createdAt: DateTime.now(),
      ));
    }

    // Save detected subscriptions
    for (final sub in detected) {
      await _subscriptionsCollection(userId).doc(sub.id).set({
        ...sub.toJson(),
        'createdAt': FieldValue.serverTimestamp(),
      });
    }

    return detected;
  }

  // ===== Decay Analysis =====

  /// Analyze subscription decay
  Future<SubscriptionDecayAnalysis> analyzeDecay(String userId) async {
    final subscriptions = await getSubscriptions(userId);
    final items = <SubscriptionDecayItem>[];

    double totalMonthly = 0;
    double wastedMonthly = 0;
    int atRisk = 0;
    int abandoned = 0;

    for (final sub in subscriptions) {
      final monthlyEquiv = sub.frequency.monthlyEquivalent(sub.amount);
      totalMonthly += monthlyEquiv;

      // Calculate usage score
      final usageScore = _calculateUsageScore(sub);

      // Determine decay status
      final decayStatus = _determineDecayStatus(usageScore, sub.lastUsedDate);

      // Calculate value score
      final valueScore = _calculateValueScore(sub, usageScore);

      // Generate recommendation
      final recommendation = _generateItemRecommendation(sub, decayStatus, valueScore);

      // Find alternatives
      final alternatives = _findAlternatives(sub);

      // Determine actions
      final shouldCancel = decayStatus == DecayStatus.abandoned;
      final shouldDowngrade = decayStatus == DecayStatus.dormant && valueScore < 30;

      if (decayStatus == DecayStatus.abandoned) {
        abandoned++;
        wastedMonthly += monthlyEquiv;
      } else if (decayStatus == DecayStatus.dormant || decayStatus == DecayStatus.declining) {
        atRisk++;
        wastedMonthly += monthlyEquiv * (1 - usageScore / 100);
      }

      // Update subscription with new decay status
      await _subscriptionsCollection(userId).doc(sub.id).update({
        'decayStatus': decayStatus.name,
        'usageScore': usageScore,
      });

      items.add(SubscriptionDecayItem(
        subscription: sub.copyWith(decayStatus: decayStatus, usageScore: usageScore),
        decayStatus: decayStatus,
        usageScore: usageScore,
        valueScore: valueScore,
        daysSinceLastUse: sub.lastUsedDate != null
            ? DateTime.now().difference(sub.lastUsedDate!).inDays
            : 999,
        monthlyEquivalent: monthlyEquiv,
        recommendation: recommendation,
        alternatives: alternatives,
        shouldCancel: shouldCancel,
        shouldDowngrade: shouldDowngrade,
      ));
    }

    // Sort by waste potential
    items.sort((a, b) {
      if (a.shouldCancel != b.shouldCancel) {
        return a.shouldCancel! ? -1 : 1;
      }
      return a.usageScore.compareTo(b.usageScore);
    });

    // Generate overall recommendations
    final recommendations = await _generateOverallRecommendations(items, wastedMonthly);

    final analysis = SubscriptionDecayAnalysis(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      analysisDate: DateTime.now(),
      items: items,
      totalMonthlySpend: totalMonthly,
      wastedMonthlySpend: wastedMonthly,
      potentialSavings: wastedMonthly * 12, // Annual savings
      totalSubscriptions: subscriptions.length,
      atRiskSubscriptions: atRisk,
      abandonedSubscriptions: abandoned,
      recommendations: recommendations,
      createdAt: DateTime.now(),
    );

    // Save analysis
    await _analysisCollection.doc(analysis.id).set({
      ...analysis.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    return analysis;
  }

  /// Get latest decay analysis
  Future<SubscriptionDecayAnalysis?> getLatestAnalysis(String userId) async {
    final snapshot = await _analysisCollection
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;

    return SubscriptionDecayAnalysis.fromJson(
      snapshot.docs.first.data() as Map<String, dynamic>,
    );
  }

  // ===== Private Methods =====

  Future<List<TransactionModel>> _getRecentTransactions(
    String userId, {
    int daysBack = 90,
  }) async {
    final cutoff = DateTime.now().subtract(Duration(days: daysBack));

    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .where('date', isGreaterThan: Timestamp.fromDate(cutoff))
        .where('type', isEqualTo: 'expense')
        .get();

    return snapshot.docs
        .map((d) => TransactionModel.fromJson(d.data()))
        .toList();
  }

  _RecurringInfo? _detectRecurringPattern(List<TransactionModel> transactions) {
    if (transactions.length < 2) return null;

    // Sort by date
    final sorted = [...transactions]..sort((a, b) => a.date.compareTo(b.date));

    // Calculate intervals
    final intervals = <int>[];
    for (var i = 1; i < sorted.length; i++) {
      intervals.add(sorted[i].date.difference(sorted[i - 1].date).inDays);
    }

    if (intervals.isEmpty) return null;

    // Calculate average interval
    final avgInterval = intervals.reduce((a, b) => a + b) / intervals.length;

    // Determine frequency
    BillingFrequency? frequency;
    if (avgInterval <= 10) {
      frequency = BillingFrequency.weekly;
    } else if (avgInterval <= 40) {
      frequency = BillingFrequency.monthly;
    } else if (avgInterval <= 100) {
      frequency = BillingFrequency.quarterly;
    } else if (avgInterval <= 400) {
      frequency = BillingFrequency.yearly;
    }

    if (frequency == null) return null;

    // Check consistency (coefficient of variation < 0.3)
    final variance = intervals.map((i) => (i - avgInterval) * (i - avgInterval))
            .reduce((a, b) => a + b) / intervals.length;
    final stdDev = variance > 0 ? variance / avgInterval : 0;

    if (stdDev > 0.3) return null;

    // Calculate average amount
    final avgAmount = sorted.fold<double>(0, (sum, t) => sum + t.amount.abs()) / sorted.length;

    return _RecurringInfo(frequency: frequency, amount: avgAmount);
  }

  DateTime _calculateNextBilling(DateTime lastDate, BillingFrequency frequency) {
    switch (frequency) {
      case BillingFrequency.weekly:
        return lastDate.add(const Duration(days: 7));
      case BillingFrequency.monthly:
        return DateTime(lastDate.year, lastDate.month + 1, lastDate.day);
      case BillingFrequency.quarterly:
        return DateTime(lastDate.year, lastDate.month + 3, lastDate.day);
      case BillingFrequency.yearly:
        return DateTime(lastDate.year + 1, lastDate.month, lastDate.day);
      default:
        return lastDate.add(const Duration(days: 30));
    }
  }

  SubscriptionTemplate? _findMatchingTemplate(String merchant) {
    final lowerMerchant = merchant.toLowerCase();
    return _knownTemplates.firstWhere(
      (t) => t.merchantPatterns.any((p) => lowerMerchant.contains(p.toLowerCase())),
      orElse: () => SubscriptionTemplate(
        name: merchant,
        merchantPatterns: [],
        category: CategoryType.streamingServices,
        typicalFrequency: BillingFrequency.monthly,
      ),
    );
  }

  double _calculateUsageScore(Subscription sub) {
    if (sub.lastUsedDate == null) return 0;

    final daysSinceUse = DateTime.now().difference(sub.lastUsedDate!).inDays;
    final billingDays = sub.frequency.daysInPeriod;

    if (billingDays == 0) return 100; // One-time

    // Score based on usage within billing period
    if (daysSinceUse <= billingDays * 0.25) return 100;
    if (daysSinceUse <= billingDays * 0.5) return 75;
    if (daysSinceUse <= billingDays) return 50;
    if (daysSinceUse <= billingDays * 2) return 25;
    return 0;
  }

  DecayStatus _determineDecayStatus(double usageScore, DateTime? lastUsed) {
    if (lastUsed == null) return DecayStatus.abandoned;

    final daysSinceUse = DateTime.now().difference(lastUsed).inDays;

    if (usageScore >= 70) return DecayStatus.active;
    if (usageScore >= 40 || daysSinceUse <= 30) return DecayStatus.declining;
    if (usageScore >= 10 || daysSinceUse <= 60) return DecayStatus.dormant;
    return DecayStatus.abandoned;
  }

  double _calculateValueScore(Subscription sub, double usageScore) {
    // Value = Usage relative to cost
    final monthlyEquiv = sub.frequency.monthlyEquivalent(sub.amount);

    // Normalize cost (assume $15/month is average)
    final costFactor = 15 / (monthlyEquiv > 0 ? monthlyEquiv : 15);

    return (usageScore * costFactor).clamp(0, 100);
  }

  String _generateItemRecommendation(
    Subscription sub,
    DecayStatus status,
    double valueScore,
  ) {
    switch (status) {
      case DecayStatus.abandoned:
        return 'Cancel immediately - you haven\'t used ${sub.name} in over 2 months.';
      case DecayStatus.dormant:
        return 'Consider cancelling ${sub.name} - usage is very low.';
      case DecayStatus.declining:
        if (valueScore < 30) {
          return 'Usage declining - evaluate if ${sub.name} is still worth it.';
        }
        return 'Usage dropping - try to use ${sub.name} more or consider alternatives.';
      case DecayStatus.active:
        return 'Good value - you\'re actively using ${sub.name}.';
    }
  }

  List<String> _findAlternatives(Subscription sub) {
    // Simple alternatives based on category
    switch (sub.category) {
      case CategoryType.streamingServices:
        return ['YouTube (free)', 'Library card', 'Free streaming services'];
      case CategoryType.gaming:
        if (sub.name.toLowerCase().contains('music')) {
          return ['YouTube Music (free tier)', 'Spotify Free', 'SoundCloud'];
        }
        if (sub.name.toLowerCase().contains('storage')) {
          return ['Google Drive (15GB free)', 'Local backup', 'Dropbox Basic'];
        }
        return ['Free-to-play games', 'Game Pass trials'];
      default:
        if (sub.name.toLowerCase().contains('music')) {
          return ['YouTube Music (free tier)', 'Spotify Free', 'SoundCloud'];
        }
        if (sub.name.toLowerCase().contains('storage')) {
          return ['Google Drive (15GB free)', 'Local backup', 'Dropbox Basic'];
        }
        break;
    }
    return [];
  }

  Future<List<String>> _generateOverallRecommendations(
    List<SubscriptionDecayItem> items,
    double wastedMonthly,
  ) async {
    final recommendations = <String>[];

    final abandoned = items.where((i) => i.decayStatus == DecayStatus.abandoned).toList();
    final dormant = items.where((i) => i.decayStatus == DecayStatus.dormant).toList();

    if (abandoned.isNotEmpty) {
      final names = abandoned.take(3).map((i) => i.subscription.name).join(', ');
      recommendations.add('Cancel unused subscriptions: $names');
    }

    if (dormant.isNotEmpty) {
      recommendations.add('Review ${dormant.length} subscriptions with declining usage.');
    }

    if (wastedMonthly > 20) {
      recommendations.add(
        'You could save \$${wastedMonthly.toStringAsFixed(0)}/month by optimizing subscriptions.',
      );
    }

    if (items.length > 10) {
      recommendations.add('Consider consolidating services - you have ${items.length} subscriptions.');
    }

    // AI recommendations
    if (EnvConfig.openAIApiKey.isNotEmpty && items.isNotEmpty) {
      try {
        final aiRecs = await _getAIRecommendations(items);
        recommendations.addAll(aiRecs);
      } catch (e) {
        debugPrint('AI recommendations failed: $e');
      }
    }

    return recommendations;
  }

  Future<List<String>> _getAIRecommendations(List<SubscriptionDecayItem> items) async {
    final prompt = '''
Analyze these subscriptions and provide 2 specific money-saving recommendations:

${items.map((i) => '- ${i.subscription.name}: \$${i.monthlyEquivalent.toStringAsFixed(2)}/mo, Usage: ${i.usageScore.toStringAsFixed(0)}%, Status: ${i.decayStatus.displayName}').join('\n')}

Provide exactly 2 actionable recommendations to save money.
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
          {'role': 'system', 'content': 'You are a frugal financial advisor.'},
          {'role': 'user', 'content': prompt},
        ],
        'max_tokens': 200,
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

  // Known subscription templates
  static final List<SubscriptionTemplate> _knownTemplates = [
    const SubscriptionTemplate(
      name: 'Netflix',
      merchantPatterns: ['netflix'],
      category: CategoryType.streamingServices,
      typicalFrequency: BillingFrequency.monthly,
      typicalPrice: 15.49,
    ),
    const SubscriptionTemplate(
      name: 'Spotify',
      merchantPatterns: ['spotify'],
      category: CategoryType.streamingServices,
      typicalFrequency: BillingFrequency.monthly,
      typicalPrice: 10.99,
    ),
    const SubscriptionTemplate(
      name: 'Amazon Prime',
      merchantPatterns: ['amazon prime', 'amzn prime'],
      category: CategoryType.onlineShopping,
      typicalFrequency: BillingFrequency.monthly,
      typicalPrice: 14.99,
    ),
    const SubscriptionTemplate(
      name: 'Disney+',
      merchantPatterns: ['disney+', 'disney plus'],
      category: CategoryType.streamingServices,
      typicalFrequency: BillingFrequency.monthly,
      typicalPrice: 13.99,
    ),
    const SubscriptionTemplate(
      name: 'Apple Music',
      merchantPatterns: ['apple music'],
      category: CategoryType.streamingServices,
      typicalFrequency: BillingFrequency.monthly,
      typicalPrice: 10.99,
    ),
    const SubscriptionTemplate(
      name: 'iCloud Storage',
      merchantPatterns: ['icloud', 'apple.com/bill'],
      category: CategoryType.miscellaneous,
      typicalFrequency: BillingFrequency.monthly,
      typicalPrice: 2.99,
    ),
    const SubscriptionTemplate(
      name: 'Google One',
      merchantPatterns: ['google one', 'google storage'],
      category: CategoryType.miscellaneous,
      typicalFrequency: BillingFrequency.monthly,
      typicalPrice: 2.99,
    ),
    const SubscriptionTemplate(
      name: 'Gym Membership',
      merchantPatterns: ['planet fitness', 'la fitness', 'equinox', 'gym'],
      category: CategoryType.fitness,
      typicalFrequency: BillingFrequency.monthly,
      typicalPrice: 30.00,
    ),
  ];
}

class _RecurringInfo {
  final BillingFrequency frequency;
  final double amount;

  _RecurringInfo({required this.frequency, required this.amount});
}
