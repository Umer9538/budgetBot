import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env_config.dart';
import '../../core/enums/enums.dart';
import '../models/models.dart';

/// Provider for InsightService
final insightServiceProvider = Provider<InsightService>((ref) {
  return InsightService();
});

/// Service for generating and managing AI-powered spending insights
class InsightService {
  InsightService({
    FirebaseFirestore? firestore,
    Dio? dio,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _dio = dio ?? Dio();

  final FirebaseFirestore _firestore;
  final Dio _dio;

  /// Get insights collection for a user
  CollectionReference<Map<String, dynamic>> _insightsCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('insights');
  }

  /// Get transactions collection for a user
  CollectionReference<Map<String, dynamic>> _transactionsCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('transactions');
  }

  // ===== Read Operations =====

  /// Stream all active insights for a user
  Stream<List<InsightModel>> watchInsights(String userId) {
    return _insightsCollection(userId)
        .where('isDismissed', isEqualTo: false)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => InsightModel.fromFirestore(doc)).toList());
  }

  /// Get all active insights
  Future<List<InsightModel>> getInsights(String userId) async {
    final snapshot = await _insightsCollection(userId)
        .where('isDismissed', isEqualTo: false)
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs.map((doc) => InsightModel.fromFirestore(doc)).toList();
  }

  /// Get unread insights count
  Future<int> getUnreadCount(String userId) async {
    final snapshot = await _insightsCollection(userId)
        .where('isDismissed', isEqualTo: false)
        .where('isRead', isEqualTo: false)
        .get();

    return snapshot.docs.length;
  }

  // ===== Write Operations =====

  /// Create a new insight
  Future<InsightModel> createInsight({
    required String userId,
    required InsightType type,
    required String title,
    required String description,
    Map<String, dynamic>? data,
    bool actionable = true,
    InsightAction? action,
    InsightPriority priority = InsightPriority.medium,
    DateTime? expiresAt,
  }) async {
    final docRef = _insightsCollection(userId).doc();

    final insight = InsightModel(
      id: docRef.id,
      userId: userId,
      type: type,
      title: title,
      description: description,
      data: data,
      actionable: actionable,
      action: action,
      priority: priority,
      createdAt: DateTime.now(),
      expiresAt: expiresAt,
    );

    // Manually build map to avoid serialization issues with nested freezed classes
    await docRef.set({
      'id': docRef.id,
      'userId': userId,
      'type': type.name,
      'title': title,
      'description': description,
      'data': data,
      'actionable': actionable,
      'action': action?.toJson(),
      'priority': priority.name,
      'isRead': false,
      'isDismissed': false,
      'createdAt': FieldValue.serverTimestamp(),
      'expiresAt': expiresAt?.toIso8601String(),
    });

    return insight;
  }

  /// Mark insight as read
  Future<void> markAsRead(String userId, String insightId) async {
    await _insightsCollection(userId).doc(insightId).update({
      'isRead': true,
    });
  }

  /// Dismiss an insight
  Future<void> dismissInsight(String userId, String insightId) async {
    await _insightsCollection(userId).doc(insightId).update({
      'isDismissed': true,
    });
  }

  /// Delete old/expired insights
  Future<int> cleanupExpiredInsights(String userId) async {
    final now = DateTime.now();
    final snapshot = await _insightsCollection(userId)
        .where('expiresAt', isLessThan: now.toIso8601String())
        .get();

    int count = 0;
    for (final doc in snapshot.docs) {
      await doc.reference.delete();
      count++;
    }

    return count;
  }

  // ===== Insight Generation =====

  /// Generate all insights for a user based on their spending data
  Future<List<InsightModel>> generateInsights({
    required String userId,
    int analysisMonths = 3,
    bool useAI = true,
  }) async {
    final insights = <InsightModel>[];

    debugPrint('InsightService: Starting insight generation for user: $userId');
    debugPrint('InsightService: Analysis months: $analysisMonths, useAI: $useAI');
    debugPrint('InsightService: OpenRouter configured: ${EnvConfig.isOpenRouterConfigured}');

    // Get historical transactions
    final transactions = await _getTransactions(userId, months: analysisMonths);
    debugPrint('InsightService: Found ${transactions.length} transactions');

    if (transactions.isEmpty) {
      debugPrint('InsightService: No transactions found, returning empty insights');
      return insights;
    }

    // Analyze spending patterns
    final patterns = _analyzeSpendingPatterns(transactions);

    // Generate pattern insights
    insights.addAll(await _generatePatternInsights(userId, patterns));

    // Detect anomalies
    insights.addAll(await _generateAnomalyInsights(userId, transactions, patterns));

    // Generate recommendations
    insights.addAll(await _generateRecommendations(userId, transactions, patterns));

    // Generate achievements
    insights.addAll(await _generateAchievements(userId, transactions, patterns));
    debugPrint('InsightService: Generated ${insights.length} basic insights');

    // Enhance with AI if enabled
    if (useAI && EnvConfig.isOpenAIConfigured) {
      debugPrint('InsightService: Generating AI insights...');
      final aiInsights = await _generateAIInsights(userId, transactions, patterns);
      debugPrint('InsightService: Generated ${aiInsights.length} AI insights');
      insights.addAll(aiInsights);
    } else {
      debugPrint('InsightService: Skipping AI insights (useAI: $useAI, configured: ${EnvConfig.isOpenAIConfigured})');
    }

    debugPrint('InsightService: Total insights generated: ${insights.length}');

    // Save insights to Firestore
    int savedCount = 0;
    for (final insight in insights) {
      await _saveInsightIfNew(userId, insight);
      savedCount++;
    }
    debugPrint('InsightService: Attempted to save $savedCount insights to Firestore');

    return insights;
  }

  /// Get transactions for analysis
  Future<List<TransactionModel>> _getTransactions(String userId, {int months = 3}) async {
    final startDate = DateTime.now().subtract(Duration(days: months * 30));
    debugPrint('InsightService: Fetching transactions from ${startDate.toIso8601String()}');

    try {
      final snapshot = await _transactionsCollection(userId)
          .where('date', isGreaterThan: startDate.toIso8601String())
          .orderBy('date', descending: true)
          .get();

      debugPrint('InsightService: Firestore returned ${snapshot.docs.length} transaction documents');

      final allTransactions = snapshot.docs
          .map((doc) => TransactionModel.fromFirestore(doc))
          .toList();

      // Filter by transaction type, not amount sign
      final expenses = allTransactions.where((t) => t.type == TransactionType.expense).toList();
      debugPrint('InsightService: Found ${expenses.length} expense transactions out of ${allTransactions.length} total');

      return expenses;
    } catch (e, stack) {
      debugPrint('InsightService: Error fetching transactions: $e');
      debugPrint('InsightService: Stack: $stack');
      return [];
    }
  }

  /// Analyze spending patterns from transactions
  SpendingPatterns _analyzeSpendingPatterns(List<TransactionModel> transactions) {
    final now = DateTime.now();
    final thisMonth = transactions.where((t) =>
        t.date.month == now.month && t.date.year == now.year).toList();
    final lastMonth = transactions.where((t) =>
        t.date.month == now.month - 1 ||
        (now.month == 1 && t.date.month == 12 && t.date.year == now.year - 1)).toList();

    // Calculate spending by category
    final categorySpending = <CategoryType, double>{};
    final categoryCount = <CategoryType, int>{};
    final merchantSpending = <String, double>{};
    final weekdaySpending = <int, double>{};
    final hourlySpending = <int, double>{};

    for (final t in transactions) {
      final amount = t.amount.abs();

      // By category
      categorySpending[t.category] = (categorySpending[t.category] ?? 0) + amount;
      categoryCount[t.category] = (categoryCount[t.category] ?? 0) + 1;

      // By merchant
      if (t.merchantName != null) {
        merchantSpending[t.merchantName!] =
            (merchantSpending[t.merchantName!] ?? 0) + amount;
      }

      // By weekday (1 = Monday, 7 = Sunday)
      weekdaySpending[t.date.weekday] =
          (weekdaySpending[t.date.weekday] ?? 0) + amount;

      // By hour
      hourlySpending[t.date.hour] =
          (hourlySpending[t.date.hour] ?? 0) + amount;
    }

    // Calculate totals
    final totalSpending = categorySpending.values.fold(0.0, (a, b) => a + b);
    final thisMonthTotal = thisMonth.fold(0.0, (sum, t) => sum + t.amount.abs());
    final lastMonthTotal = lastMonth.fold(0.0, (sum, t) => sum + t.amount.abs());

    // Find top categories
    final sortedCategories = categorySpending.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final topCategories = sortedCategories.take(5).map((e) => e.key).toList();

    // Find top merchants
    final sortedMerchants = merchantSpending.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final topMerchants = sortedMerchants.take(5).map((e) => e.key).toList();

    // Calculate averages
    final avgTransactionAmount = totalSpending / transactions.length;
    final avgDailySpending = totalSpending / 90; // 3 months

    // Find peak spending day
    final peakWeekday = weekdaySpending.entries
        .reduce((a, b) => a.value > b.value ? a : b).key;

    // Month over month change
    final monthOverMonthChange = lastMonthTotal > 0
        ? ((thisMonthTotal - lastMonthTotal) / lastMonthTotal) * 100
        : 0.0;

    return SpendingPatterns(
      totalSpending: totalSpending,
      thisMonthSpending: thisMonthTotal,
      lastMonthSpending: lastMonthTotal,
      monthOverMonthChange: monthOverMonthChange,
      categorySpending: categorySpending,
      categoryCount: categoryCount,
      merchantSpending: merchantSpending,
      weekdaySpending: weekdaySpending,
      hourlySpending: hourlySpending,
      topCategories: topCategories,
      topMerchants: topMerchants,
      avgTransactionAmount: avgTransactionAmount,
      avgDailySpending: avgDailySpending,
      peakSpendingWeekday: peakWeekday,
      transactionCount: transactions.length,
    );
  }

  /// Generate insights from spending patterns
  Future<List<InsightModel>> _generatePatternInsights(
    String userId,
    SpendingPatterns patterns,
  ) async {
    final insights = <InsightModel>[];

    // Top spending category insight
    if (patterns.topCategories.isNotEmpty) {
      final topCategory = patterns.topCategories.first;
      final amount = patterns.categorySpending[topCategory] ?? 0;
      final percentage = (amount / patterns.totalSpending * 100).toStringAsFixed(1);

      insights.add(InsightModel(
        id: 'pattern_top_category_${DateTime.now().millisecondsSinceEpoch}',
        userId: userId,
        type: InsightType.pattern,
        title: 'Top Spending Category',
        description: '${topCategory.displayName} accounts for $percentage% of your spending (\$${amount.toStringAsFixed(0)}). This is your largest expense category.',
        data: {
          'category': topCategory.name,
          'amount': amount,
          'percentage': double.parse(percentage),
        },
        priority: InsightPriority.medium,
        action: const InsightAction(
          type: 'view_category',
          label: 'View Details',
        ),
      ));
    }

    // Month over month change
    if (patterns.monthOverMonthChange.abs() > 10) {
      final isIncrease = patterns.monthOverMonthChange > 0;
      final changePercent = patterns.monthOverMonthChange.abs().toStringAsFixed(1);

      insights.add(InsightModel(
        id: 'pattern_mom_change_${DateTime.now().millisecondsSinceEpoch}',
        userId: userId,
        type: isIncrease ? InsightType.warning : InsightType.achievement,
        title: isIncrease ? 'Spending Increased' : 'Spending Decreased',
        description: isIncrease
            ? 'Your spending is up $changePercent% compared to last month. You spent \$${patterns.thisMonthSpending.toStringAsFixed(0)} this month vs \$${patterns.lastMonthSpending.toStringAsFixed(0)} last month.'
            : 'Great job! Your spending is down $changePercent% compared to last month. You saved \$${(patterns.lastMonthSpending - patterns.thisMonthSpending).toStringAsFixed(0)}.',
        data: {
          'thisMonth': patterns.thisMonthSpending,
          'lastMonth': patterns.lastMonthSpending,
          'changePercent': patterns.monthOverMonthChange,
        },
        priority: isIncrease ? InsightPriority.high : InsightPriority.medium,
      ));
    }

    // Peak spending day
    final weekdayNames = ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    final peakDay = weekdayNames[patterns.peakSpendingWeekday];
    final peakAmount = patterns.weekdaySpending[patterns.peakSpendingWeekday] ?? 0;

    insights.add(InsightModel(
      id: 'pattern_peak_day_${DateTime.now().millisecondsSinceEpoch}',
      userId: userId,
      type: InsightType.pattern,
      title: 'Peak Spending Day',
      description: 'You tend to spend the most on ${peakDay}s (\$${peakAmount.toStringAsFixed(0)} total). Consider planning your shopping for other days.',
      data: {
        'weekday': patterns.peakSpendingWeekday,
        'weekdayName': peakDay,
        'amount': peakAmount,
      },
      priority: InsightPriority.low,
    ));

    // Frequent merchant
    if (patterns.topMerchants.isNotEmpty) {
      final topMerchant = patterns.topMerchants.first;
      final merchantAmount = patterns.merchantSpending[topMerchant] ?? 0;

      insights.add(InsightModel(
        id: 'pattern_top_merchant_${DateTime.now().millisecondsSinceEpoch}',
        userId: userId,
        type: InsightType.pattern,
        title: 'Favorite Merchant',
        description: 'You\'ve spent \$${merchantAmount.toStringAsFixed(0)} at $topMerchant. This is your most frequented merchant.',
        data: {
          'merchant': topMerchant,
          'amount': merchantAmount,
        },
        priority: InsightPriority.low,
      ));
    }

    return insights;
  }

  /// Generate anomaly detection insights
  Future<List<InsightModel>> _generateAnomalyInsights(
    String userId,
    List<TransactionModel> transactions,
    SpendingPatterns patterns,
  ) async {
    final insights = <InsightModel>[];

    // Detect unusually large transactions (> 3x average)
    final threshold = patterns.avgTransactionAmount * 3;
    final largeTransactions = transactions.where((t) => t.amount.abs() > threshold).toList();

    for (final t in largeTransactions.take(3)) {
      insights.add(InsightModel(
        id: 'anomaly_large_${t.id}',
        userId: userId,
        type: InsightType.anomaly,
        title: 'Unusual Transaction Detected',
        description: 'A \$${t.amount.abs().toStringAsFixed(2)} transaction at ${t.merchantName} is ${(t.amount.abs() / patterns.avgTransactionAmount).toStringAsFixed(1)}x your average transaction.',
        data: {
          'transactionId': t.id,
          'amount': t.amount.abs(),
          'merchant': t.merchantName,
          'average': patterns.avgTransactionAmount,
        },
        priority: InsightPriority.high,
        action: InsightAction(
          type: 'view_transaction',
          label: 'Review',
          params: {'transactionId': t.id},
        ),
      ));
    }

    // Detect category spending spike (> 50% increase from usual)
    for (final category in patterns.topCategories) {
      final currentSpending = patterns.categorySpending[category] ?? 0;
      final avgMonthlyForCategory = currentSpending / 3; // Assuming 3 months of data

      // Check if this month's category spending is unusually high
      final thisMonthCategorySpending = transactions
          .where((t) => t.category == category &&
                 t.date.month == DateTime.now().month)
          .fold(0.0, (sum, t) => sum + t.amount.abs());

      if (thisMonthCategorySpending > avgMonthlyForCategory * 1.5 && avgMonthlyForCategory > 50) {
        insights.add(InsightModel(
          id: 'anomaly_category_spike_${category.name}',
          userId: userId,
          type: InsightType.anomaly,
          title: '${category.displayName} Spending Spike',
          description: 'You\'ve already spent \$${thisMonthCategorySpending.toStringAsFixed(0)} on ${category.displayName} this month, which is ${((thisMonthCategorySpending / avgMonthlyForCategory - 1) * 100).toStringAsFixed(0)}% above your usual.',
          data: {
            'category': category.name,
            'currentSpending': thisMonthCategorySpending,
            'averageSpending': avgMonthlyForCategory,
          },
          priority: InsightPriority.high,
          action: InsightAction(
            type: 'create_budget',
            label: 'Set Budget',
            params: {'category': category.name},
          ),
        ));
      }
    }

    return insights;
  }

  /// Generate recommendation insights
  Future<List<InsightModel>> _generateRecommendations(
    String userId,
    List<TransactionModel> transactions,
    SpendingPatterns patterns,
  ) async {
    final insights = <InsightModel>[];

    // Recommend budget for top spending categories without budgets
    for (final category in patterns.topCategories.take(3)) {
      final monthlySpending = (patterns.categorySpending[category] ?? 0) / 3;
      if (monthlySpending > 100) {
        insights.add(InsightModel(
          id: 'rec_budget_${category.name}',
          userId: userId,
          type: InsightType.recommendation,
          title: 'Create a ${category.displayName} Budget',
          description: 'You spend about \$${monthlySpending.toStringAsFixed(0)}/month on ${category.displayName}. Setting a budget can help you control this expense.',
          data: {
            'category': category.name,
            'suggestedBudget': (monthlySpending * 0.9).round(), // Suggest 10% less
            'currentSpending': monthlySpending,
          },
          priority: InsightPriority.medium,
          actionable: true,
          action: InsightAction(
            type: 'create_budget',
            label: 'Create Budget',
            params: {
              'category': category.name,
              'amount': (monthlySpending * 0.9).round(),
            },
          ),
        ));
      }
    }

    // Dining out savings recommendation
    final diningCategories = [CategoryType.restaurants, CategoryType.coffeeShops, CategoryType.foodDelivery];
    double totalDining = 0;
    for (final cat in diningCategories) {
      totalDining += patterns.categorySpending[cat] ?? 0;
    }
    final monthlyDining = totalDining / 3;

    if (monthlyDining > 200) {
      final potentialSavings = monthlyDining * 0.3;
      insights.add(InsightModel(
        id: 'rec_dining_savings',
        userId: userId,
        type: InsightType.recommendation,
        title: 'Dining Out Savings Opportunity',
        description: 'You spend \$${monthlyDining.toStringAsFixed(0)}/month on dining out. Cooking at home more could save you \$${potentialSavings.toStringAsFixed(0)}/month.',
        data: {
          'currentSpending': monthlyDining,
          'potentialSavings': potentialSavings,
        },
        priority: InsightPriority.medium,
        action: const InsightAction(
          type: 'view_tip',
          label: 'See Tips',
        ),
      ));
    }

    // Subscription review recommendation
    final subscriptionSpending = patterns.categorySpending[CategoryType.streamingServices] ?? 0;
    if (subscriptionSpending > 50) {
      insights.add(InsightModel(
        id: 'rec_subscription_review',
        userId: userId,
        type: InsightType.recommendation,
        title: 'Review Your Subscriptions',
        description: 'You\'re spending \$${(subscriptionSpending / 3).toStringAsFixed(0)}/month on subscriptions. Consider reviewing which ones you actually use.',
        data: {
          'monthlySpending': subscriptionSpending / 3,
        },
        priority: InsightPriority.low,
        action: const InsightAction(
          type: 'view_subscriptions',
          label: 'Review',
        ),
      ));
    }

    return insights;
  }

  /// Generate achievement insights
  Future<List<InsightModel>> _generateAchievements(
    String userId,
    List<TransactionModel> transactions,
    SpendingPatterns patterns,
  ) async {
    final insights = <InsightModel>[];

    // Spending decrease achievement
    if (patterns.monthOverMonthChange < -15) {
      insights.add(InsightModel(
        id: 'achievement_spending_down',
        userId: userId,
        type: InsightType.achievement,
        title: 'Budget Champion!',
        description: 'You reduced your spending by ${patterns.monthOverMonthChange.abs().toStringAsFixed(0)}% this month. Keep up the great work!',
        data: {
          'reduction': patterns.monthOverMonthChange.abs(),
        },
        priority: InsightPriority.medium,
      ));
    }

    // Low transaction count (mindful spending)
    final thisMonthCount = transactions
        .where((t) => t.date.month == DateTime.now().month)
        .length;
    if (thisMonthCount < 30 && thisMonthCount > 0) {
      insights.add(InsightModel(
        id: 'achievement_mindful_spending',
        userId: userId,
        type: InsightType.achievement,
        title: 'Mindful Spender',
        description: 'You\'ve made only $thisMonthCount transactions this month. Quality over quantity!',
        data: {
          'transactionCount': thisMonthCount,
        },
        priority: InsightPriority.low,
      ));
    }

    return insights;
  }

  /// Generate AI-powered insights using OpenAI
  Future<List<InsightModel>> _generateAIInsights(
    String userId,
    List<TransactionModel> transactions,
    SpendingPatterns patterns,
  ) async {
    final insights = <InsightModel>[];

    debugPrint('InsightService: Starting AI insight generation');
    debugPrint('InsightService: API URL: ${EnvConfig.aiBaseUrl}/chat/completions');
    debugPrint('InsightService: Model: ${EnvConfig.openAIModel}');

    try {
      final prompt = _buildAIPrompt(patterns);
      debugPrint('InsightService: Prompt built, making API request...');

      final response = await _dio.post(
        '${EnvConfig.aiBaseUrl}/chat/completions',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${EnvConfig.openRouterApiKey}',
            'Content-Type': 'application/json',
            'HTTP-Referer': 'https://budgetbot.app',
            'X-Title': 'BudgetBot',
          },
        ),
        data: {
          'model': EnvConfig.openAIModel,
          'messages': [
            {
              'role': 'system',
              'content': '''You are a personal finance advisor analyzing spending patterns.
Provide 2-3 specific, actionable insights based on the data.
Each insight should be:
- Specific to the user's actual spending
- Actionable with clear next steps
- Encouraging but honest

Respond in JSON format:
{
  "insights": [
    {
      "title": "Short title",
      "description": "2-3 sentence description with specific numbers",
      "type": "recommendation|tip|warning",
      "priority": "low|medium|high"
    }
  ]
}'''
            },
            {
              'role': 'user',
              'content': prompt,
            }
          ],
          'max_tokens': 500,
          'temperature': 0.7,
        },
      );

      debugPrint('InsightService: API response received, status: ${response.statusCode}');

      final content = response.data['choices'][0]['message']['content'] as String;
      debugPrint('InsightService: AI response content: $content');

      final jsonStr = content.contains('{')
          ? content.substring(content.indexOf('{'), content.lastIndexOf('}') + 1)
          : content;

      final parsed = _parseAIResponse(jsonStr);
      debugPrint('InsightService: Parsed ${parsed.length} AI insights from response');

      for (final aiInsight in parsed) {
        insights.add(InsightModel(
          id: 'ai_${DateTime.now().millisecondsSinceEpoch}_${insights.length}',
          userId: userId,
          type: _mapInsightType(aiInsight['type'] as String?),
          title: aiInsight['title'] as String? ?? 'AI Insight',
          description: aiInsight['description'] as String? ?? '',
          priority: _mapPriority(aiInsight['priority'] as String?),
          data: {'aiGenerated': true},
        ));
      }
    } on DioException catch (e) {
      debugPrint('InsightService: DioException generating AI insights: ${e.message}');
      debugPrint('InsightService: Response: ${e.response?.data}');
      debugPrint('InsightService: Status code: ${e.response?.statusCode}');
    } catch (e, stack) {
      debugPrint('InsightService: Error generating AI insights: $e');
      debugPrint('InsightService: Stack: $stack');
    }

    return insights;
  }

  String _buildAIPrompt(SpendingPatterns patterns) {
    final categoryBreakdown = patterns.categorySpending.entries
        .where((e) => e.value > 10)
        .map((e) => '${e.key.displayName}: \$${e.value.toStringAsFixed(0)}')
        .join(', ');

    return '''
Analyze this spending data and provide personalized insights:

Total spending (3 months): \$${patterns.totalSpending.toStringAsFixed(0)}
This month: \$${patterns.thisMonthSpending.toStringAsFixed(0)}
Last month: \$${patterns.lastMonthSpending.toStringAsFixed(0)}
Month-over-month change: ${patterns.monthOverMonthChange.toStringAsFixed(1)}%

Spending by category: $categoryBreakdown

Top merchants: ${patterns.topMerchants.take(3).join(', ')}

Average transaction: \$${patterns.avgTransactionAmount.toStringAsFixed(0)}
Average daily spending: \$${patterns.avgDailySpending.toStringAsFixed(0)}
''';
  }

  List<Map<String, dynamic>> _parseAIResponse(String jsonStr) {
    try {
      final decoded = jsonStr.replaceAll('\n', '').replaceAll('\r', '');
      // Simple JSON parsing - in production use proper JSON decoder
      if (decoded.contains('"insights"')) {
        final startIdx = decoded.indexOf('[');
        final endIdx = decoded.lastIndexOf(']') + 1;
        if (startIdx != -1 && endIdx > startIdx) {
          final arrayStr = decoded.substring(startIdx, endIdx);
          // Parse manually for safety
          return _parseInsightsArray(arrayStr);
        }
      }
    } catch (e) {
      debugPrint('Error parsing AI response: $e');
    }
    return [];
  }

  List<Map<String, dynamic>> _parseInsightsArray(String arrayStr) {
    // Simple regex-based parsing for safety
    final insights = <Map<String, dynamic>>[];
    final pattern = RegExp(r'"title"\s*:\s*"([^"]+)".*?"description"\s*:\s*"([^"]+)".*?"type"\s*:\s*"([^"]+)".*?"priority"\s*:\s*"([^"]+)"', dotAll: true);

    for (final match in pattern.allMatches(arrayStr)) {
      insights.add({
        'title': match.group(1),
        'description': match.group(2),
        'type': match.group(3),
        'priority': match.group(4),
      });
    }

    return insights;
  }

  InsightType _mapInsightType(String? type) {
    switch (type?.toLowerCase()) {
      case 'warning':
        return InsightType.warning;
      case 'tip':
        return InsightType.tip;
      case 'achievement':
        return InsightType.achievement;
      case 'anomaly':
        return InsightType.anomaly;
      case 'pattern':
        return InsightType.pattern;
      default:
        return InsightType.recommendation;
    }
  }

  InsightPriority _mapPriority(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'critical':
        return InsightPriority.critical;
      case 'high':
        return InsightPriority.high;
      case 'low':
        return InsightPriority.low;
      default:
        return InsightPriority.medium;
    }
  }

  /// Save insight if similar one doesn't exist recently
  Future<void> _saveInsightIfNew(String userId, InsightModel insight) async {
    // Use a deterministic ID based on type and title to avoid duplicates
    // This avoids needing a composite index in Firestore
    final insightKey = '${insight.type.name}_${insight.title.replaceAll(' ', '_').toLowerCase()}';
    final docRef = _insightsCollection(userId).doc(insightKey);

    final existing = await docRef.get();

    // Check if exists and was created within the last 7 days
    if (existing.exists) {
      final data = existing.data();
      if (data != null && data['createdAt'] != null) {
        DateTime? createdAt;
        final createdAtValue = data['createdAt'];
        if (createdAtValue is Timestamp) {
          createdAt = createdAtValue.toDate();
        } else if (createdAtValue is String) {
          createdAt = DateTime.tryParse(createdAtValue);
        }

        if (createdAt != null) {
          final weekAgo = DateTime.now().subtract(const Duration(days: 7));
          if (createdAt.isAfter(weekAgo)) {
            // Recent duplicate exists, skip
            return;
          }
        }
      }
    }

    // Create or update the insight - manually build the map to avoid serialization issues
    final expiresAt = DateTime.now().add(const Duration(days: 30));

    await docRef.set({
      'id': insightKey,
      'userId': userId,
      'type': insight.type.name,
      'title': insight.title,
      'description': insight.description,
      'data': insight.data,
      'actionable': insight.actionable,
      'action': insight.action?.toJson(),  // Convert to Map explicitly
      'priority': insight.priority.name,
      'isRead': false,
      'isDismissed': false,
      'createdAt': FieldValue.serverTimestamp(),
      'expiresAt': expiresAt.toIso8601String(),
    });
  }
}

/// Data class for spending patterns analysis
class SpendingPatterns {
  const SpendingPatterns({
    required this.totalSpending,
    required this.thisMonthSpending,
    required this.lastMonthSpending,
    required this.monthOverMonthChange,
    required this.categorySpending,
    required this.categoryCount,
    required this.merchantSpending,
    required this.weekdaySpending,
    required this.hourlySpending,
    required this.topCategories,
    required this.topMerchants,
    required this.avgTransactionAmount,
    required this.avgDailySpending,
    required this.peakSpendingWeekday,
    required this.transactionCount,
  });

  final double totalSpending;
  final double thisMonthSpending;
  final double lastMonthSpending;
  final double monthOverMonthChange;
  final Map<CategoryType, double> categorySpending;
  final Map<CategoryType, int> categoryCount;
  final Map<String, double> merchantSpending;
  final Map<int, double> weekdaySpending;
  final Map<int, double> hourlySpending;
  final List<CategoryType> topCategories;
  final List<String> topMerchants;
  final double avgTransactionAmount;
  final double avgDailySpending;
  final int peakSpendingWeekday;
  final int transactionCount;
}
