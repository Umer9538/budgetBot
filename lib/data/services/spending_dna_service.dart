import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env_config.dart';
import '../../core/enums/enums.dart';
import '../models/models.dart';
import '../models/spending_dna_model.dart';

/// Provider for SpendingDNAService
final spendingDNAServiceProvider = Provider<SpendingDNAService>((ref) {
  return SpendingDNAService();
});

/// Service for analyzing and building Spending DNA profiles
class SpendingDNAService {
  SpendingDNAService({
    FirebaseFirestore? firestore,
    Dio? dio,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _dio = dio ?? Dio();

  final FirebaseFirestore _firestore;
  final Dio _dio;

  // Collection reference
  DocumentReference _dnaDocument(String userId) =>
      _firestore.collection('users').doc(userId).collection('profile').doc('spending_dna');

  // ===== DNA Analysis =====

  /// Generate or update Spending DNA profile
  Future<SpendingDNA> analyzeSpendingDNA(String userId) async {
    // Get transaction history (90 days)
    final transactions = await _getTransactions(userId, daysBack: 90);

    if (transactions.isEmpty) {
      return _createDefaultDNA(userId);
    }

    // Analyze personality
    final personality = _analyzePersonality(transactions);

    // Analyze payday behavior
    final paydayBehavior = _analyzePaydayBehavior(transactions);

    // Analyze end-of-month pattern
    final endOfMonthPattern = _analyzeEndOfMonthPattern(transactions);

    // Build pattern profile
    final patternProfile = _buildPatternProfile(transactions);

    // Identify behavioral traits
    final traits = _identifyTraits(transactions, patternProfile);

    // Calculate category affinities
    final categoryAffinities = _calculateCategoryAffinities(transactions);

    // Calculate scores
    final financialHealthScore = _calculateFinancialHealthScore(transactions);
    final consistencyScore = _calculateConsistencyScore(transactions);
    final savingsRate = _calculateSavingsRate(transactions);

    final dna = SpendingDNA(
      id: userId,
      userId: userId,
      personality: personality,
      paydayBehavior: paydayBehavior,
      endOfMonthPattern: endOfMonthPattern,
      patternProfile: patternProfile,
      traits: traits,
      categoryAffinities: categoryAffinities,
      financialHealthScore: financialHealthScore,
      consistencyScore: consistencyScore,
      savingsRate: savingsRate,
      lastUpdated: DateTime.now(),
      createdAt: DateTime.now(),
    );

    // Save to Firestore
    await _dnaDocument(userId).set({
      ...dna.toJson(),
      'lastUpdated': FieldValue.serverTimestamp(),
    });

    return dna;
  }

  /// Get existing DNA profile
  Future<SpendingDNA?> getDNA(String userId) async {
    final doc = await _dnaDocument(userId).get();
    if (!doc.exists) return null;

    return SpendingDNA.fromJson(doc.data() as Map<String, dynamic>);
  }

  /// Stream DNA profile
  Stream<SpendingDNA?> watchDNA(String userId) {
    return _dnaDocument(userId).snapshots().map((doc) {
      if (!doc.exists) return null;
      return SpendingDNA.fromJson(doc.data() as Map<String, dynamic>);
    });
  }

  /// Compare current behavior to DNA for anomaly detection
  Future<DNAComparison> compareToDNA(String userId, {int daysToCompare = 7}) async {
    final dna = await getDNA(userId);
    if (dna == null) {
      return const DNAComparison(
        similarityScore: 100,
        anomalies: [],
        isSuspicious: false,
        comparisonPeriod: '7 days',
      );
    }

    final recentTransactions = await _getTransactions(userId, daysBack: daysToCompare);
    final anomalies = <String>[];
    final categoryDeviations = <String, double>{};
    final timeDeviations = <String, double>{};

    // Compare category spending
    final recentCategorySpend = _calculateCategoryAffinities(recentTransactions);
    for (final entry in recentCategorySpend.entries) {
      final baseline = dna.categoryAffinities[entry.key] ?? 0;
      final deviation = (entry.value - baseline).abs();
      if (deviation > 20) {
        categoryDeviations[entry.key] = deviation;
        anomalies.add('Unusual spending in ${entry.key}: ${deviation.toStringAsFixed(0)}% deviation');
      }
    }

    // Compare time patterns
    final recentProfile = _buildPatternProfile(recentTransactions);
    final avgSpendDeviation = (recentProfile.avgDailySpend - dna.patternProfile.avgDailySpend).abs() /
        (dna.patternProfile.avgDailySpend > 0 ? dna.patternProfile.avgDailySpend : 1) *
        100;

    if (avgSpendDeviation > 50) {
      timeDeviations['daily_average'] = avgSpendDeviation;
      anomalies.add('Daily spending ${avgSpendDeviation.toStringAsFixed(0)}% different from usual');
    }

    // Calculate similarity score
    double similarityScore = 100;
    similarityScore -= categoryDeviations.values.fold<double>(0, (sum, d) => sum + d / 5);
    similarityScore -= avgSpendDeviation / 2;
    similarityScore = similarityScore.clamp(0, 100);

    return DNAComparison(
      similarityScore: similarityScore,
      anomalies: anomalies,
      isSuspicious: similarityScore < 50 || anomalies.length > 3,
      comparisonPeriod: '$daysToCompare days',
      categoryDeviations: categoryDeviations,
      timeDeviations: timeDeviations,
    );
  }

  /// Get personalized tips based on DNA
  Future<List<String>> getPersonalizedTips(String userId) async {
    final dna = await getDNA(userId);
    if (dna == null) return [];

    final tips = <String>[];

    // Personality-based tips
    tips.addAll(dna.personality.tips);

    // Behavior-based tips
    if (dna.paydayBehavior == PaydayBehavior.spender) {
      tips.add('Set up automatic savings on payday before you can spend it.');
    }

    if (dna.endOfMonthPattern == EndOfMonthPattern.tight) {
      tips.add('Try the envelope method to ensure money lasts all month.');
    }

    // Score-based tips
    if (dna.savingsRate < 10) {
      tips.add('Aim to save at least 10% of income - start with 1% and increase monthly.');
    }

    if (dna.consistencyScore < 50) {
      tips.add('Your spending varies a lot - try a weekly budget to add consistency.');
    }

    // AI-enhanced tips
    if (EnvConfig.openAIApiKey.isNotEmpty) {
      try {
        final aiTips = await _getAITips(dna);
        tips.addAll(aiTips);
      } catch (e) {
        debugPrint('AI tips failed: $e');
      }
    }

    return tips.take(5).toList();
  }

  // ===== Private Analysis Methods =====

  Future<List<TransactionModel>> _getTransactions(String userId, {int daysBack = 90}) async {
    final cutoff = DateTime.now().subtract(Duration(days: daysBack));

    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .where('date', isGreaterThan: Timestamp.fromDate(cutoff))
        .get();

    return snapshot.docs
        .map((d) => TransactionModel.fromJson(d.data()))
        .toList();
  }

  MoneyPersonality _analyzePersonality(List<TransactionModel> transactions) {
    final expenses = transactions.where((t) => t.type == TransactionType.expense).toList();
    final income = transactions.where((t) => t.type == TransactionType.income).toList();

    if (expenses.isEmpty) return MoneyPersonality.carefree;

    // Calculate metrics
    final totalExpense = expenses.fold<double>(0, (sum, t) => sum + t.amount.abs());
    final totalIncome = income.fold<double>(0, (sum, t) => sum + t.amount.abs());
    final savingsRate = totalIncome > 0 ? (totalIncome - totalExpense) / totalIncome : 0;

    // Calculate variance
    final avgExpense = totalExpense / expenses.length;
    final variance = expenses.fold<double>(0, (sum, t) {
          final diff = t.amount.abs() - avgExpense;
          return sum + diff * diff;
        }) /
        expenses.length;
    final coeffVar = avgExpense > 0 ? sqrt(variance) / avgExpense : 0;

    // Determine personality
    if (savingsRate > 0.3 && coeffVar < 0.5) {
      return MoneyPersonality.planner;
    }
    if (savingsRate > 0.25) {
      return MoneyPersonality.anxiousSaver;
    }
    if (coeffVar > 1.0) {
      return MoneyPersonality.spontaneous;
    }
    if (expenses.length < 20) {
      return MoneyPersonality.carefree;
    }
    return MoneyPersonality.optimizer;
  }

  PaydayBehavior _analyzePaydayBehavior(List<TransactionModel> transactions) {
    // Assume payday is around 1st and 15th
    final paydayTransactions = transactions.where((t) {
      final day = t.date.day;
      return (day >= 1 && day <= 5) || (day >= 15 && day <= 20);
    }).toList();

    final otherTransactions = transactions.where((t) {
      final day = t.date.day;
      return !((day >= 1 && day <= 5) || (day >= 15 && day <= 20));
    }).toList();

    if (paydayTransactions.isEmpty || otherTransactions.isEmpty) {
      return PaydayBehavior.balanced;
    }

    final paydayAvg = paydayTransactions.fold<double>(0, (sum, t) => sum + t.amount.abs()) /
        paydayTransactions.length;
    final otherAvg = otherTransactions.fold<double>(0, (sum, t) => sum + t.amount.abs()) /
        otherTransactions.length;

    final ratio = paydayAvg / (otherAvg > 0 ? otherAvg : 1);

    if (ratio > 1.5) return PaydayBehavior.spender;
    if (ratio < 0.7) return PaydayBehavior.saver;
    return PaydayBehavior.balanced;
  }

  EndOfMonthPattern _analyzeEndOfMonthPattern(List<TransactionModel> transactions) {
    final endOfMonth = transactions.where((t) => t.date.day >= 25).toList();
    final midMonth = transactions.where((t) => t.date.day >= 10 && t.date.day <= 20).toList();

    if (endOfMonth.isEmpty || midMonth.isEmpty) {
      return EndOfMonthPattern.stable;
    }

    final endAvg = endOfMonth.fold<double>(0, (sum, t) => sum + t.amount.abs()) / endOfMonth.length;
    final midAvg = midMonth.fold<double>(0, (sum, t) => sum + t.amount.abs()) / midMonth.length;

    final ratio = endAvg / (midAvg > 0 ? midAvg : 1);

    if (ratio < 0.5) return EndOfMonthPattern.tight;
    if (ratio > 1.3) return EndOfMonthPattern.splurge;
    return EndOfMonthPattern.stable;
  }

  SpendingPatternProfile _buildPatternProfile(List<TransactionModel> transactions) {
    final expenses = transactions.where((t) => t.type == TransactionType.expense).toList();

    if (expenses.isEmpty) {
      return const SpendingPatternProfile(
        avgDailySpend: 0,
        avgWeekendSpend: 0,
        avgWeekdaySpend: 0,
        spendingVariance: 0,
        peakSpendingDay: 'Saturday',
        peakSpendingTime: 'afternoon',
        impulseSpendingRatio: 0,
        plannedSpendingRatio: 1,
        hourlySpendingPattern: {},
        weeklySpendingPattern: {},
        monthlySpendingPattern: {},
      );
    }

    // Daily average
    final days = expenses.map((t) => '${t.date.year}-${t.date.month}-${t.date.day}').toSet().length;
    final totalSpend = expenses.fold<double>(0, (sum, t) => sum + t.amount.abs());
    final avgDaily = days > 0 ? totalSpend / days : 0.0;

    // Weekend vs weekday
    final weekend = expenses.where((t) => t.date.weekday >= 6);
    final weekday = expenses.where((t) => t.date.weekday < 6);

    final weekendTotal = weekend.fold<double>(0, (sum, t) => sum + t.amount.abs());
    final weekdayTotal = weekday.fold<double>(0, (sum, t) => sum + t.amount.abs());

    final avgWeekend = weekend.isNotEmpty ? weekendTotal / weekend.length : 0.0;
    final avgWeekday = weekday.isNotEmpty ? weekdayTotal / weekday.length : 0.0;

    // Variance
    final avgExpense = totalSpend / expenses.length;
    final variance = expenses.fold<double>(0, (sum, t) {
          final diff = t.amount.abs() - avgExpense;
          return sum + diff * diff;
        }) /
        expenses.length;

    // Peak day
    final daySpend = <int, double>{};
    for (final t in expenses) {
      daySpend[t.date.weekday] = (daySpend[t.date.weekday] ?? 0) + t.amount.abs();
    }
    final peakDay = daySpend.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    final dayNames = ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];

    // Peak time
    final hourSpend = <int, double>{};
    for (final t in expenses) {
      hourSpend[t.date.hour] = (hourSpend[t.date.hour] ?? 0) + t.amount.abs();
    }
    final peakHour = hourSpend.entries.reduce((a, b) => a.value > b.value ? a : b).key;
    String peakTime;
    if (peakHour < 6) {
      peakTime = 'night';
    } else if (peakHour < 12) {
      peakTime = 'morning';
    } else if (peakHour < 18) {
      peakTime = 'afternoon';
    } else {
      peakTime = 'evening';
    }

    // Impulse ratio (small frequent transactions)
    final smallTransactions = expenses.where((t) => t.amount.abs() < 20);
    final impulseRatio = expenses.isNotEmpty ? smallTransactions.length / expenses.length : 0.0;

    // Build patterns
    final hourlyPattern = <String, double>{};
    for (var h = 0; h < 24; h++) {
      hourlyPattern[h.toString()] = hourSpend[h] ?? 0;
    }

    final weeklyPattern = <String, double>{};
    for (var d = 1; d <= 7; d++) {
      weeklyPattern[dayNames[d]] = daySpend[d] ?? 0;
    }

    return SpendingPatternProfile(
      avgDailySpend: avgDaily,
      avgWeekendSpend: avgWeekend,
      avgWeekdaySpend: avgWeekday,
      spendingVariance: variance,
      peakSpendingDay: dayNames[peakDay],
      peakSpendingTime: peakTime,
      impulseSpendingRatio: impulseRatio,
      plannedSpendingRatio: 1 - impulseRatio,
      hourlySpendingPattern: hourlyPattern,
      weeklySpendingPattern: weeklyPattern,
      monthlySpendingPattern: {},
    );
  }

  List<BehavioralTrait> _identifyTraits(
    List<TransactionModel> transactions,
    SpendingPatternProfile profile,
  ) {
    final traits = <BehavioralTrait>[];

    // Impulse spending trait
    if (profile.impulseSpendingRatio > 0.5) {
      traits.add(BehavioralTrait(
        id: 'high_impulse',
        name: 'Frequent Small Purchases',
        description: 'You make many small purchases that can add up.',
        category: TraitCategory.impulse,
        score: profile.impulseSpendingRatio * 100,
        impact: TraitImpact.negative,
        recommendation: 'Try batching small purchases or using a waiting period.',
      ));
    }

    // Weekend spender
    if (profile.avgWeekendSpend > profile.avgWeekdaySpend * 1.5) {
      traits.add(BehavioralTrait(
        id: 'weekend_spender',
        name: 'Weekend Spender',
        description: 'You spend significantly more on weekends.',
        category: TraitCategory.timing,
        score: (profile.avgWeekendSpend / profile.avgWeekdaySpend) * 50,
        impact: TraitImpact.neutral,
        recommendation: 'Set a separate weekend budget to stay mindful.',
      ));
    }

    // Consistent spender
    if (profile.spendingVariance < 100) {
      traits.add(BehavioralTrait(
        id: 'consistent',
        name: 'Consistent Spender',
        description: 'Your spending is predictable and steady.',
        category: TraitCategory.planning,
        score: 80,
        impact: TraitImpact.positive,
      ));
    }

    // Night owl spender
    if (profile.peakSpendingTime == 'night' || profile.peakSpendingTime == 'evening') {
      traits.add(BehavioralTrait(
        id: 'night_spender',
        name: 'Evening/Night Spender',
        description: 'Most of your spending happens late in the day.',
        category: TraitCategory.timing,
        score: 60,
        impact: TraitImpact.neutral,
        recommendation: 'Late-night purchases may be more impulsive - sleep on big decisions.',
      ));
    }

    return traits;
  }

  Map<String, double> _calculateCategoryAffinities(List<TransactionModel> transactions) {
    final expenses = transactions.where((t) => t.type == TransactionType.expense);
    final total = expenses.fold<double>(0, (sum, t) => sum + t.amount.abs());

    if (total == 0) return {};

    final categoryTotals = <CategoryType, double>{};
    for (final t in expenses) {
      categoryTotals[t.category] = (categoryTotals[t.category] ?? 0) + t.amount.abs();
    }

    return categoryTotals.map((k, v) => MapEntry(k.name, (v / total) * 100));
  }

  double _calculateFinancialHealthScore(List<TransactionModel> transactions) {
    final expenses = transactions.where((t) => t.type == TransactionType.expense);
    final income = transactions.where((t) => t.type == TransactionType.income);

    final totalExpense = expenses.fold<double>(0, (sum, t) => sum + t.amount.abs());
    final totalIncome = income.fold<double>(0, (sum, t) => sum + t.amount.abs());

    if (totalIncome == 0) return 50;

    final ratio = totalExpense / totalIncome;

    if (ratio < 0.5) return 95;
    if (ratio < 0.7) return 80;
    if (ratio < 0.9) return 65;
    if (ratio < 1.0) return 50;
    return 30;
  }

  double _calculateConsistencyScore(List<TransactionModel> transactions) {
    final expenses = transactions.where((t) => t.type == TransactionType.expense).toList();
    if (expenses.isEmpty) return 100;

    // Group by day
    final dailySpend = <String, double>{};
    for (final t in expenses) {
      final key = '${t.date.year}-${t.date.month}-${t.date.day}';
      dailySpend[key] = (dailySpend[key] ?? 0) + t.amount.abs();
    }

    if (dailySpend.isEmpty) return 100;

    // Calculate coefficient of variation
    final values = dailySpend.values.toList();
    final avg = values.reduce((a, b) => a + b) / values.length;
    final variance = values.fold<double>(0, (sum, v) => sum + (v - avg) * (v - avg)) / values.length;
    final coeffVar = avg > 0 ? sqrt(variance) / avg : 0.0;

    // Convert to score (lower variance = higher score)
    return (100.0 - coeffVar * 50.0).clamp(0.0, 100.0);
  }

  double _calculateSavingsRate(List<TransactionModel> transactions) {
    final expenses = transactions.where((t) => t.type == TransactionType.expense);
    final income = transactions.where((t) => t.type == TransactionType.income);

    final totalExpense = expenses.fold<double>(0, (sum, t) => sum + t.amount.abs());
    final totalIncome = income.fold<double>(0, (sum, t) => sum + t.amount.abs());

    if (totalIncome == 0) return 0;

    return ((totalIncome - totalExpense) / totalIncome * 100).clamp(0, 100);
  }

  SpendingDNA _createDefaultDNA(String userId) {
    return SpendingDNA(
      id: userId,
      userId: userId,
      personality: MoneyPersonality.carefree,
      paydayBehavior: PaydayBehavior.balanced,
      endOfMonthPattern: EndOfMonthPattern.stable,
      patternProfile: const SpendingPatternProfile(
        avgDailySpend: 0,
        avgWeekendSpend: 0,
        avgWeekdaySpend: 0,
        spendingVariance: 0,
        peakSpendingDay: 'Saturday',
        peakSpendingTime: 'afternoon',
        impulseSpendingRatio: 0,
        plannedSpendingRatio: 1,
        hourlySpendingPattern: {},
        weeklySpendingPattern: {},
        monthlySpendingPattern: {},
      ),
      traits: [],
      categoryAffinities: {},
      financialHealthScore: 50,
      consistencyScore: 100,
      savingsRate: 0,
      createdAt: DateTime.now(),
    );
  }

  Future<List<String>> _getAITips(SpendingDNA dna) async {
    final prompt = '''
Based on this spending profile, provide 2 personalized tips:

Personality: ${dna.personality.displayName}
Payday Behavior: ${dna.paydayBehavior.displayName}
End of Month: ${dna.endOfMonthPattern.displayName}
Savings Rate: ${dna.savingsRate.toStringAsFixed(1)}%
Financial Health: ${dna.financialHealthScore.toStringAsFixed(0)}/100

Top spending categories: ${dna.categoryAffinities.entries.take(3).map((e) => '${e.key}: ${e.value.toStringAsFixed(0)}%').join(', ')}

Provide 2 specific, actionable tips.
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
          {'role': 'system', 'content': 'You are a personal finance coach.'},
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
