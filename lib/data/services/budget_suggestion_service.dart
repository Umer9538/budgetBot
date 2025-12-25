import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env_config.dart';
import '../../core/constants/api_constants.dart';
import '../../core/enums/enums.dart';
import '../models/models.dart';

/// Service for AI-powered budget suggestions based on spending history and income
class BudgetSuggestionService {
  BudgetSuggestionService({
    FirebaseFirestore? firestore,
    Dio? dio,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _dio = dio ?? Dio();

  final FirebaseFirestore _firestore;
  final Dio _dio;

  /// Get AI-powered budget suggestions for a user
  Future<List<BudgetSuggestion>> getSuggestions({
    required String userId,
    double? monthlyIncome,
    int analysisMonths = 3,
  }) async {
    // Get historical spending data
    final spendingByCategory = await _analyzeHistoricalSpending(
      userId: userId,
      months: analysisMonths,
    );

    // Get current income if not provided
    final income = monthlyIncome ?? await _estimateMonthlyIncome(userId);

    // Generate suggestions based on spending patterns
    final suggestions = <BudgetSuggestion>[];

    for (final entry in spendingByCategory.entries) {
      final category = entry.key;
      final stats = entry.value;

      final suggestion = _generateSuggestion(
        category: category,
        stats: stats,
        monthlyIncome: income,
      );

      if (suggestion != null) {
        suggestions.add(suggestion);
      }
    }

    // Try AI enhancement if configured
    if (EnvConfig.isOpenAIConfigured) {
      try {
        final enhancedSuggestions = await _enhanceWithAI(
          suggestions: suggestions,
          monthlyIncome: income,
          spendingData: spendingByCategory,
        );
        return enhancedSuggestions;
      } catch (e) {
        debugPrint('AI enhancement failed, using rule-based suggestions: $e');
      }
    }

    // Sort by priority (essential categories first)
    suggestions.sort((a, b) => b.priority.compareTo(a.priority));

    return suggestions;
  }

  /// Analyze historical spending by category
  Future<Map<CategoryType, SpendingStats>> _analyzeHistoricalSpending({
    required String userId,
    required int months,
  }) async {
    final startDate = DateTime.now().subtract(Duration(days: months * 30));

    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .where('type', isEqualTo: TransactionType.expense.name)
        .where('date', isGreaterThan: startDate.toIso8601String())
        .get();

    final transactions = snapshot.docs
        .map((doc) => TransactionModel.fromFirestore(doc))
        .toList();

    // Group by category
    final byCategory = <CategoryType, List<double>>{};
    for (final tx in transactions) {
      byCategory.putIfAbsent(tx.category, () => []).add(tx.amount);
    }

    // Calculate statistics
    final stats = <CategoryType, SpendingStats>{};
    for (final entry in byCategory.entries) {
      final amounts = entry.value;
      final total = amounts.fold(0.0, (sum, a) => sum + a);
      final average = total / months;
      final max = amounts.reduce((a, b) => a > b ? a : b);
      final min = amounts.reduce((a, b) => a < b ? a : b);

      stats[entry.key] = SpendingStats(
        category: entry.key,
        totalSpent: total,
        monthlyAverage: average,
        transactionCount: amounts.length,
        maxTransaction: max,
        minTransaction: min,
      );
    }

    return stats;
  }

  /// Estimate monthly income from transaction history
  Future<double> _estimateMonthlyIncome(String userId) async {
    final startDate = DateTime.now().subtract(const Duration(days: 90));

    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .where('type', isEqualTo: TransactionType.income.name)
        .where('date', isGreaterThan: startDate.toIso8601String())
        .get();

    final incomeTransactions = snapshot.docs
        .map((doc) => TransactionModel.fromFirestore(doc))
        .toList();

    if (incomeTransactions.isEmpty) {
      return 5000.0; // Default assumption
    }

    final total = incomeTransactions.fold(0.0, (sum, tx) => sum + tx.amount);
    return total / 3; // 3 months of data
  }

  /// Generate a budget suggestion based on spending stats
  BudgetSuggestion? _generateSuggestion({
    required CategoryType category,
    required SpendingStats stats,
    required double monthlyIncome,
  }) {
    // Skip if very low spending
    if (stats.monthlyAverage < 10) return null;

    // Calculate suggested amount based on category and spending
    double suggestedAmount;
    String rationale;
    int priority;

    // Priority categories get income-based percentages
    switch (category.group) {
      case CategoryGroup.housing:
        suggestedAmount = monthlyIncome * 0.30; // 30% of income
        rationale = 'Housing should be ~30% of income';
        priority = 100;
        break;
      case CategoryGroup.foodAndDining:
        suggestedAmount = _calculateFoodBudget(stats, monthlyIncome);
        rationale = 'Based on your spending patterns + 10% buffer';
        priority = 90;
        break;
      case CategoryGroup.transportation:
        suggestedAmount = monthlyIncome * 0.15;
        rationale = 'Transportation typically 10-15% of income';
        priority = 85;
        break;
      case CategoryGroup.healthAndWellness:
        suggestedAmount = stats.monthlyAverage * 1.1;
        rationale = 'Healthcare spending + 10% buffer for emergencies';
        priority = 80;
        break;
      case CategoryGroup.entertainment:
        suggestedAmount = monthlyIncome * 0.05;
        rationale = 'Entertainment ~5% of income (fun money!)';
        priority = 40;
        break;
      case CategoryGroup.shopping:
        suggestedAmount = stats.monthlyAverage * 0.9; // Suggest slight reduction
        rationale = 'Slightly reduced from average for savings';
        priority = 50;
        break;
      case CategoryGroup.financial:
        suggestedAmount = stats.monthlyAverage * 1.05;
        rationale = 'Fixed expenses - budgeted at current level';
        priority = 95;
        break;
      default:
        suggestedAmount = stats.monthlyAverage * 1.1;
        rationale = 'Based on your average spending + 10% buffer';
        priority = 30;
    }

    // Round to nearest $5
    suggestedAmount = (suggestedAmount / 5).round() * 5.0;

    // Cap at reasonable percentage of income
    final maxForCategory = monthlyIncome * 0.4;
    if (suggestedAmount > maxForCategory) {
      suggestedAmount = maxForCategory;
      rationale += ' (capped at 40% of income)';
    }

    return BudgetSuggestion(
      category: category,
      suggestedAmount: suggestedAmount,
      currentAverage: stats.monthlyAverage,
      rationale: rationale,
      priority: priority,
      confidence: _calculateConfidence(stats),
    );
  }

  /// Calculate food budget with nuance
  double _calculateFoodBudget(SpendingStats stats, double monthlyIncome) {
    // Base on actual spending but ensure minimum
    final minFood = monthlyIncome * 0.10; // At least 10% for food
    final maxFood = monthlyIncome * 0.20; // At most 20% for food

    var suggested = stats.monthlyAverage * 1.1; // 10% buffer

    if (suggested < minFood) suggested = minFood;
    if (suggested > maxFood) suggested = maxFood;

    return suggested;
  }

  /// Calculate confidence score based on data quality
  double _calculateConfidence(SpendingStats stats) {
    // More transactions = higher confidence
    if (stats.transactionCount >= 20) return 0.9;
    if (stats.transactionCount >= 10) return 0.7;
    if (stats.transactionCount >= 5) return 0.5;
    return 0.3;
  }

  /// Enhance suggestions using OpenAI
  Future<List<BudgetSuggestion>> _enhanceWithAI({
    required List<BudgetSuggestion> suggestions,
    required double monthlyIncome,
    required Map<CategoryType, SpendingStats> spendingData,
  }) async {
    final spendingSummary = spendingData.entries
        .map((e) => '${e.key.displayName}: \$${e.value.monthlyAverage.toStringAsFixed(0)}/month')
        .join('\n');

    final currentSuggestions = suggestions
        .map((s) => '${s.category.displayName}: \$${s.suggestedAmount.toStringAsFixed(0)}')
        .join('\n');

    final prompt = '''
As a financial advisor, review and optimize these budget suggestions.

Monthly Income: \$${monthlyIncome.toStringAsFixed(0)}

Current Spending (3-month average):
$spendingSummary

Initial Budget Suggestions:
$currentSuggestions

Provide optimized budget amounts as JSON array with format:
[{"category": "categoryName", "amount": number, "rationale": "reason"}]

Consider:
1. 50/30/20 rule (50% needs, 30% wants, 20% savings)
2. User's actual spending patterns
3. Room for savings goals
4. Emergency fund buffer

Return ONLY the JSON array, no other text.
''';

    try {
      final response = await _dio.post(
        '${ApiConstants.openAiBaseUrl}/chat/completions',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${EnvConfig.openAIApiKey}',
            'Content-Type': 'application/json',
          },
        ),
        data: jsonEncode({
          'model': EnvConfig.openAIModel,
          'messages': [
            {
              'role': 'system',
              'content': 'You are a certified financial planner. Respond only with valid JSON.',
            },
            {'role': 'user', 'content': prompt},
          ],
          'max_tokens': 1000,
          'temperature': 0.3,
        }),
      );

      if (response.statusCode == 200) {
        final content = response.data['choices'][0]['message']['content'] as String;
        final aiSuggestions = _parseAISuggestions(content, suggestions);
        if (aiSuggestions.isNotEmpty) {
          return aiSuggestions;
        }
      }
    } catch (e) {
      debugPrint('AI enhancement error: $e');
    }

    return suggestions;
  }

  /// Parse AI suggestions response
  List<BudgetSuggestion> _parseAISuggestions(
    String content,
    List<BudgetSuggestion> fallback,
  ) {
    try {
      // Extract JSON from response
      final jsonMatch = RegExp(r'\[[\s\S]*\]').firstMatch(content);
      if (jsonMatch == null) return fallback;

      final jsonList = jsonDecode(jsonMatch.group(0)!) as List;
      final results = <BudgetSuggestion>[];

      for (final item in jsonList) {
        final categoryName = item['category'] as String;
        final amount = (item['amount'] as num).toDouble();
        final rationale = item['rationale'] as String? ?? 'AI recommended';

        // Find matching category
        CategoryType? category;
        for (final cat in CategoryType.values) {
          if (cat.displayName.toLowerCase() == categoryName.toLowerCase() ||
              cat.name.toLowerCase() == categoryName.toLowerCase()) {
            category = cat;
            break;
          }
        }

        if (category != null) {
          // Find original suggestion for stats
          final original = fallback.where((s) => s.category == category).firstOrNull;

          results.add(BudgetSuggestion(
            category: category,
            suggestedAmount: amount,
            currentAverage: original?.currentAverage ?? 0,
            rationale: rationale,
            priority: original?.priority ?? 50,
            confidence: 0.85, // AI suggestions get good confidence
            isAIEnhanced: true,
          ));
        }
      }

      return results.isNotEmpty ? results : fallback;
    } catch (e) {
      debugPrint('Error parsing AI suggestions: $e');
      return fallback;
    }
  }

  /// Get quick suggestions based on income (no historical analysis)
  List<BudgetSuggestion> getQuickSuggestions(double monthlyIncome) {
    return [
      BudgetSuggestion(
        category: CategoryType.rentMortgage,
        suggestedAmount: (monthlyIncome * 0.30 / 5).round() * 5.0,
        currentAverage: 0,
        rationale: '30% of income for housing (50/30/20 rule)',
        priority: 100,
        confidence: 0.9,
      ),
      BudgetSuggestion(
        category: CategoryType.groceries,
        suggestedAmount: (monthlyIncome * 0.10 / 5).round() * 5.0,
        currentAverage: 0,
        rationale: '10% of income for groceries',
        priority: 95,
        confidence: 0.8,
      ),
      BudgetSuggestion(
        category: CategoryType.utilities,
        suggestedAmount: (monthlyIncome * 0.05 / 5).round() * 5.0,
        currentAverage: 0,
        rationale: '5% of income for utilities',
        priority: 90,
        confidence: 0.8,
      ),
      BudgetSuggestion(
        category: CategoryType.fuel,
        suggestedAmount: (monthlyIncome * 0.08 / 5).round() * 5.0,
        currentAverage: 0,
        rationale: '8% of income for transportation',
        priority: 85,
        confidence: 0.7,
      ),
      BudgetSuggestion(
        category: CategoryType.restaurants,
        suggestedAmount: (monthlyIncome * 0.05 / 5).round() * 5.0,
        currentAverage: 0,
        rationale: '5% of income for dining out',
        priority: 60,
        confidence: 0.7,
      ),
      BudgetSuggestion(
        category: CategoryType.streamingServices,
        suggestedAmount: 50,
        currentAverage: 0,
        rationale: 'Typical streaming subscriptions',
        priority: 50,
        confidence: 0.6,
      ),
      BudgetSuggestion(
        category: CategoryType.savings,
        suggestedAmount: (monthlyIncome * 0.20 / 5).round() * 5.0,
        currentAverage: 0,
        rationale: '20% of income for savings (50/30/20 rule)',
        priority: 100,
        confidence: 0.9,
      ),
    ];
  }
}

/// Statistics for spending in a category
class SpendingStats {
  const SpendingStats({
    required this.category,
    required this.totalSpent,
    required this.monthlyAverage,
    required this.transactionCount,
    required this.maxTransaction,
    required this.minTransaction,
  });

  final CategoryType category;
  final double totalSpent;
  final double monthlyAverage;
  final int transactionCount;
  final double maxTransaction;
  final double minTransaction;
}

/// A budget suggestion with rationale
class BudgetSuggestion {
  const BudgetSuggestion({
    required this.category,
    required this.suggestedAmount,
    required this.currentAverage,
    required this.rationale,
    required this.priority,
    required this.confidence,
    this.isAIEnhanced = false,
  });

  final CategoryType category;
  final double suggestedAmount;
  final double currentAverage;
  final String rationale;
  final int priority; // Higher = more important
  final double confidence; // 0.0 to 1.0
  final bool isAIEnhanced;

  /// Difference from current spending
  double get difference => suggestedAmount - currentAverage;

  /// Whether this suggests spending less
  bool get suggestsReduction => difference < 0;

  /// Percentage change from current
  double get percentChange =>
      currentAverage > 0 ? (difference / currentAverage) * 100 : 0;
}

/// Provider for budget suggestion service
final budgetSuggestionServiceProvider = Provider<BudgetSuggestionService>((ref) {
  return BudgetSuggestionService();
});
