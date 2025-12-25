import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env_config.dart';
import '../../core/enums/enums.dart';
import '../models/models.dart';

/// Provider for CashflowPredictionService
final cashflowPredictionServiceProvider = Provider<CashflowPredictionService>((ref) {
  return CashflowPredictionService();
});

/// Service for predicting cashflow and detecting potential crises
class CashflowPredictionService {
  CashflowPredictionService({
    FirebaseFirestore? firestore,
    Dio? dio,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _dio = dio ?? Dio();

  final FirebaseFirestore _firestore;
  final Dio _dio;

  // Collections
  CollectionReference<Map<String, dynamic>> _predictionsCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('cashflow_predictions');
  }

  CollectionReference<Map<String, dynamic>> _recurringCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('recurring_transactions');
  }

  CollectionReference<Map<String, dynamic>> _alertsCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('cashflow_alerts');
  }

  CollectionReference<Map<String, dynamic>> _transactionsCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('transactions');
  }

  CollectionReference<Map<String, dynamic>> _accountsCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('accounts');
  }

  // ===== Main Prediction Logic =====

  /// Generate cashflow prediction for the next N days
  Future<CashflowPrediction> generatePrediction({
    required String userId,
    int daysAhead = 30,
    bool useAI = true,
  }) async {
    // Get current balance
    final currentBalance = await _getCurrentBalance(userId);

    // Detect recurring transactions
    final recurringTransactions = await detectRecurringTransactions(userId);

    // Get upcoming events
    final upcomingEvents = await _getUpcomingEvents(
      userId: userId,
      recurringTransactions: recurringTransactions,
      daysAhead: daysAhead,
    );

    // Generate daily projections
    final dailyProjections = _generateDailyProjections(
      startBalance: currentBalance,
      events: upcomingEvents,
      daysAhead: daysAhead,
    );

    // Determine status and crisis info
    final (status, crisisDate, crisisAmount, crisisReason) = _analyzePrediction(
      dailyProjections: dailyProjections,
      currentBalance: currentBalance,
    );

    // Calculate confidence
    final confidence = _calculateConfidence(
      recurringTransactions: recurringTransactions,
      upcomingEvents: upcomingEvents,
    );

    // Generate recommendations
    List<String> recommendations = _generateRecommendations(
      status: status,
      dailyProjections: dailyProjections,
      upcomingEvents: upcomingEvents,
      currentBalance: currentBalance,
    );

    // Enhance with AI if enabled
    if (useAI && EnvConfig.isOpenAIConfigured && status.requiresAction) {
      final aiRecommendations = await _getAIRecommendations(
        status: status,
        currentBalance: currentBalance,
        crisisDate: crisisDate,
        crisisAmount: crisisAmount,
        upcomingEvents: upcomingEvents,
      );
      recommendations = [...recommendations, ...aiRecommendations];
    }

    // Create prediction
    final prediction = CashflowPrediction(
      id: '',
      userId: userId,
      currentBalance: currentBalance,
      predictedBalance: dailyProjections.isNotEmpty
          ? dailyProjections.last.balance
          : currentBalance,
      predictionDate: DateTime.now(),
      status: status,
      confidence: confidence,
      upcomingEvents: upcomingEvents,
      dailyProjections: dailyProjections,
      crisisDate: crisisDate,
      crisisAmount: crisisAmount,
      crisisReason: crisisReason,
      recommendations: recommendations,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    // Save prediction
    await _savePrediction(userId, prediction);

    // Create alert if needed
    if (status.requiresAction) {
      await _createCrisisAlert(userId, prediction);
    }

    return prediction;
  }

  /// Get current total balance across all accounts
  Future<double> _getCurrentBalance(String userId) async {
    final snapshot = await _accountsCollection(userId)
        .where('isActive', isEqualTo: true)
        .get();

    double total = 0;
    for (final doc in snapshot.docs) {
      final data = doc.data();
      total += (data['balance'] as num?)?.toDouble() ?? 0;
    }

    return total;
  }

  // ===== Recurring Transaction Detection =====

  /// Detect recurring transactions from transaction history
  Future<List<RecurringTransaction>> detectRecurringTransactions(String userId) async {
    // Get existing detected recurring transactions
    final existingSnapshot = await _recurringCollection(userId)
        .where('isActive', isEqualTo: true)
        .get();

    final existing = existingSnapshot.docs
        .map((doc) => RecurringTransaction.fromFirestore(doc))
        .toList();

    // Get recent transactions for pattern detection
    final threeMonthsAgo = DateTime.now().subtract(const Duration(days: 90));
    final transactionsSnapshot = await _transactionsCollection(userId)
        .where('date', isGreaterThan: threeMonthsAgo.toIso8601String())
        .orderBy('date', descending: true)
        .get();

    final transactions = transactionsSnapshot.docs
        .map((doc) => TransactionModel.fromFirestore(doc))
        .toList();

    // Detect new recurring patterns
    final detected = _detectPatterns(transactions);

    // Merge existing with newly detected
    final merged = _mergeRecurringTransactions(existing, detected);

    // Save new detections
    for (final recurring in merged) {
      if (!existing.any((e) => e.id == recurring.id)) {
        await _saveRecurringTransaction(userId, recurring);
      }
    }

    return merged;
  }

  /// Detect recurring patterns in transactions
  List<RecurringTransaction> _detectPatterns(List<TransactionModel> transactions) {
    final patterns = <RecurringTransaction>[];
    final merchantGroups = <String, List<TransactionModel>>{};

    // Group by merchant
    for (final t in transactions) {
      final key = t.merchantName.toLowerCase();
      merchantGroups[key] = [...(merchantGroups[key] ?? []), t];
    }

    // Analyze each merchant group
    for (final entry in merchantGroups.entries) {
      if (entry.value.length < 2) continue;

      final merchantTxns = entry.value..sort((a, b) => a.date.compareTo(b.date));
      final pattern = _analyzeFrequency(merchantTxns);

      if (pattern != null) {
        final avgAmount = merchantTxns.map((t) => t.amount.abs()).reduce((a, b) => a + b) /
            merchantTxns.length;

        patterns.add(RecurringTransaction(
          id: 'recurring_${entry.key.hashCode}',
          userId: merchantTxns.first.userId,
          name: merchantTxns.first.merchantName,
          amount: avgAmount,
          frequency: pattern,
          nextDate: _predictNextDate(merchantTxns.last.date, pattern),
          type: merchantTxns.first.amount < 0
              ? CashflowEventType.expense
              : CashflowEventType.income,
          category: merchantTxns.first.category,
          merchantName: merchantTxns.first.merchantName,
          history: merchantTxns.map((t) => t.date).toList(),
          confidence: _patternConfidence(merchantTxns, pattern),
          createdAt: DateTime.now(),
        ));
      }
    }

    return patterns;
  }

  /// Analyze transaction frequency to determine recurrence pattern
  RecurringFrequency? _analyzeFrequency(List<TransactionModel> transactions) {
    if (transactions.length < 2) return null;

    final intervals = <int>[];
    for (int i = 1; i < transactions.length; i++) {
      intervals.add(transactions[i].date.difference(transactions[i - 1].date).inDays);
    }

    final avgInterval = intervals.reduce((a, b) => a + b) / intervals.length;
    final variance = intervals.map((i) => pow(i - avgInterval, 2)).reduce((a, b) => a + b) /
        intervals.length;
    final stdDev = sqrt(variance);

    // Check if pattern is consistent (low variance)
    if (stdDev > avgInterval * 0.3) return null;

    // Determine frequency based on average interval
    if (avgInterval <= 2) return RecurringFrequency.daily;
    if (avgInterval >= 5 && avgInterval <= 9) return RecurringFrequency.weekly;
    if (avgInterval >= 12 && avgInterval <= 17) return RecurringFrequency.biWeekly;
    if (avgInterval >= 25 && avgInterval <= 35) return RecurringFrequency.monthly;
    if (avgInterval >= 80 && avgInterval <= 100) return RecurringFrequency.quarterly;
    if (avgInterval >= 350 && avgInterval <= 380) return RecurringFrequency.yearly;

    return null;
  }

  /// Predict next occurrence date
  DateTime _predictNextDate(DateTime lastDate, RecurringFrequency frequency) {
    final now = DateTime.now();
    DateTime next = lastDate;

    while (next.isBefore(now)) {
      switch (frequency) {
        case RecurringFrequency.daily:
          next = next.add(const Duration(days: 1));
          break;
        case RecurringFrequency.weekly:
          next = next.add(const Duration(days: 7));
          break;
        case RecurringFrequency.biWeekly:
          next = next.add(const Duration(days: 14));
          break;
        case RecurringFrequency.monthly:
          next = DateTime(next.year, next.month + 1, next.day);
          break;
        case RecurringFrequency.quarterly:
          next = DateTime(next.year, next.month + 3, next.day);
          break;
        case RecurringFrequency.yearly:
          next = DateTime(next.year + 1, next.month, next.day);
          break;
      }
    }

    return next;
  }

  /// Calculate confidence in pattern detection
  PredictionConfidence _patternConfidence(
    List<TransactionModel> transactions,
    RecurringFrequency frequency,
  ) {
    final count = transactions.length;
    final intervals = <int>[];

    for (int i = 1; i < transactions.length; i++) {
      intervals.add(transactions[i].date.difference(transactions[i - 1].date).inDays);
    }

    final avgInterval = intervals.reduce((a, b) => a + b) / intervals.length;
    final variance = intervals.map((i) => pow(i - avgInterval, 2)).reduce((a, b) => a + b) /
        intervals.length;
    final coefficientOfVariation = sqrt(variance) / avgInterval;

    // Score based on count and consistency
    int score = 0;
    if (count >= 6) score += 40;
    else if (count >= 4) score += 25;
    else if (count >= 3) score += 15;
    else score += 5;

    if (coefficientOfVariation < 0.1) score += 50;
    else if (coefficientOfVariation < 0.2) score += 35;
    else if (coefficientOfVariation < 0.3) score += 20;
    else score += 5;

    return PredictionConfidenceExtension.fromPercentage(score);
  }

  /// Merge existing and newly detected recurring transactions
  List<RecurringTransaction> _mergeRecurringTransactions(
    List<RecurringTransaction> existing,
    List<RecurringTransaction> detected,
  ) {
    final merged = <RecurringTransaction>[...existing];

    for (final d in detected) {
      final existingIdx = merged.indexWhere(
        (e) => e.merchantName?.toLowerCase() == d.merchantName?.toLowerCase(),
      );

      if (existingIdx == -1) {
        merged.add(d);
      } else {
        // Update existing with newer data
        merged[existingIdx] = merged[existingIdx].copyWith(
          nextDate: d.nextDate,
          confidence: d.confidence,
          history: [...merged[existingIdx].history, ...d.history].toSet().toList(),
        );
      }
    }

    return merged;
  }

  // ===== Projection Generation =====

  /// Get upcoming cashflow events
  Future<List<CashflowEvent>> _getUpcomingEvents({
    required String userId,
    required List<RecurringTransaction> recurringTransactions,
    required int daysAhead,
  }) async {
    final events = <CashflowEvent>[];
    final now = DateTime.now();
    final endDate = now.add(Duration(days: daysAhead));

    // Add events from recurring transactions
    for (final recurring in recurringTransactions) {
      final occurrences = recurring.getOccurrencesInRange(now, endDate);

      for (final date in occurrences) {
        events.add(CashflowEvent(
          id: '${recurring.id}_${date.millisecondsSinceEpoch}',
          name: recurring.name,
          amount: recurring.type == CashflowEventType.income
              ? recurring.amount
              : -recurring.amount,
          date: date,
          type: recurring.type,
          isRecurring: true,
          recurringPattern: recurring.frequency.displayName,
          category: recurring.category,
          confidence: recurring.confidence,
          merchantName: recurring.merchantName,
        ));
      }
    }

    // Sort by date
    events.sort((a, b) => a.date.compareTo(b.date));

    return events;
  }

  /// Generate daily balance projections
  List<DailyBalance> _generateDailyProjections({
    required double startBalance,
    required List<CashflowEvent> events,
    required int daysAhead,
  }) {
    final projections = <DailyBalance>[];
    final now = DateTime.now();
    double runningBalance = startBalance;

    for (int day = 0; day <= daysAhead; day++) {
      final date = DateTime(now.year, now.month, now.day + day);
      final dayEvents = events.where((e) =>
          e.date.year == date.year &&
          e.date.month == date.month &&
          e.date.day == date.day).toList();

      double inflow = 0;
      double outflow = 0;
      final eventIds = <String>[];

      for (final event in dayEvents) {
        if (event.amount > 0) {
          inflow += event.amount;
        } else {
          outflow += event.amount.abs();
        }
        eventIds.add(event.id);
        runningBalance += event.amount;
      }

      projections.add(DailyBalance(
        date: date,
        balance: runningBalance,
        inflow: inflow,
        outflow: outflow,
        eventIds: eventIds,
      ));
    }

    return projections;
  }

  /// Analyze prediction to determine status and crisis info
  (CashflowStatus, DateTime?, double?, String?) _analyzePrediction({
    required List<DailyBalance> dailyProjections,
    required double currentBalance,
  }) {
    if (dailyProjections.isEmpty) {
      return (CashflowStatus.healthy, null, null, null);
    }

    // Find lowest balance point
    double lowestBalance = currentBalance;
    DateTime? lowestDate;

    for (final projection in dailyProjections) {
      if (projection.balance < lowestBalance) {
        lowestBalance = projection.balance;
        lowestDate = projection.date;
      }
    }

    // Determine status based on lowest projected balance
    CashflowStatus status;
    DateTime? crisisDate;
    double? crisisAmount;
    String? crisisReason;

    if (lowestBalance < 0) {
      status = CashflowStatus.crisis;
      crisisDate = lowestDate;
      crisisAmount = lowestBalance.abs();
      crisisReason = 'Balance projected to go negative by \$${crisisAmount.toStringAsFixed(2)}';
    } else if (lowestBalance < 100) {
      status = CashflowStatus.critical;
      crisisDate = lowestDate;
      crisisAmount = lowestBalance;
      crisisReason = 'Balance will drop below \$100 safety buffer';
    } else if (lowestBalance < 500) {
      status = CashflowStatus.warning;
      crisisDate = lowestDate;
      crisisReason = 'Balance approaching minimum recommended buffer';
    } else if (lowestBalance < currentBalance * 0.5) {
      status = CashflowStatus.watch;
      crisisReason = 'Significant balance drop expected';
    } else {
      status = CashflowStatus.healthy;
    }

    return (status, crisisDate, crisisAmount, crisisReason);
  }

  /// Calculate overall prediction confidence
  PredictionConfidence _calculateConfidence({
    required List<RecurringTransaction> recurringTransactions,
    required List<CashflowEvent> upcomingEvents,
  }) {
    if (recurringTransactions.isEmpty && upcomingEvents.isEmpty) {
      return PredictionConfidence.veryLow;
    }

    // Average confidence of all detected patterns
    int totalScore = 0;
    int count = 0;

    for (final recurring in recurringTransactions) {
      if (recurring.confidence != null) {
        final (min, max) = recurring.confidence!.percentageRange;
        totalScore += (min + max) ~/ 2;
        count++;
      }
    }

    if (count == 0) return PredictionConfidence.low;

    // Boost confidence based on data volume
    int avgScore = totalScore ~/ count;
    if (recurringTransactions.length >= 5) avgScore += 10;
    if (upcomingEvents.length >= 10) avgScore += 5;

    return PredictionConfidenceExtension.fromPercentage(avgScore.clamp(0, 100));
  }

  /// Generate recommendations based on prediction
  List<String> _generateRecommendations({
    required CashflowStatus status,
    required List<DailyBalance> dailyProjections,
    required List<CashflowEvent> upcomingEvents,
    required double currentBalance,
  }) {
    final recommendations = <String>[];

    if (status == CashflowStatus.healthy) {
      recommendations.add('Your cashflow looks healthy for the next 30 days.');
      return recommendations;
    }

    // Find large upcoming expenses
    final largeExpenses = upcomingEvents
        .where((e) => e.isExpense && e.amount.abs() > currentBalance * 0.2)
        .toList();

    if (largeExpenses.isNotEmpty) {
      for (final expense in largeExpenses.take(3)) {
        recommendations.add(
          'Large expense of \$${expense.amount.abs().toStringAsFixed(0)} for ${expense.name} coming on ${_formatDate(expense.date)}',
        );
      }
    }

    // Status-specific recommendations
    switch (status) {
      case CashflowStatus.crisis:
        recommendations.add('URGENT: Consider transferring funds to avoid overdraft');
        recommendations.add('Review and postpone non-essential expenses');
        recommendations.add('Contact creditors about payment arrangements if needed');
        break;
      case CashflowStatus.critical:
        recommendations.add('Build an emergency buffer of at least \$500');
        recommendations.add('Look for expenses that can be reduced or delayed');
        recommendations.add('Consider picking up extra income sources');
        break;
      case CashflowStatus.warning:
        recommendations.add('Monitor your spending closely this month');
        recommendations.add('Avoid large discretionary purchases');
        recommendations.add('Ensure income deposits are on schedule');
        break;
      case CashflowStatus.watch:
        recommendations.add('Keep an eye on upcoming large expenses');
        recommendations.add('Consider building a larger safety buffer');
        break;
      case CashflowStatus.healthy:
        break;
    }

    return recommendations;
  }

  String _formatDate(DateTime date) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                   'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[date.month - 1]} ${date.day}';
  }

  // ===== AI Integration =====

  /// Get AI-powered recommendations
  Future<List<String>> _getAIRecommendations({
    required CashflowStatus status,
    required double currentBalance,
    DateTime? crisisDate,
    double? crisisAmount,
    required List<CashflowEvent> upcomingEvents,
  }) async {
    try {
      final prompt = _buildAIPrompt(
        status: status,
        currentBalance: currentBalance,
        crisisDate: crisisDate,
        crisisAmount: crisisAmount,
        upcomingEvents: upcomingEvents,
      );

      final response = await _dio.post(
        '${EnvConfig.aiBaseUrl}/chat/completions',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${EnvConfig.openAIApiKey}',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          'model': EnvConfig.openAIModel,
          'messages': [
            {
              'role': 'system',
              'content': '''You are a financial advisor helping someone avoid a cashflow crisis.
Provide 2-3 specific, actionable recommendations.
Be empathetic but direct. Focus on immediate actions they can take.
Do not use markdown formatting. Keep each recommendation to 1-2 sentences.'''
            },
            {'role': 'user', 'content': prompt}
          ],
          'max_tokens': 300,
          'temperature': 0.7,
        },
      );

      final content = response.data['choices'][0]['message']['content'] as String;
      return content
          .split('\n')
          .where((line) => line.trim().isNotEmpty)
          .map((line) => line.replaceAll(RegExp(r'^\d+\.\s*'), '').trim())
          .where((line) => line.isNotEmpty)
          .take(3)
          .toList();
    } catch (e) {
      debugPrint('Error getting AI recommendations: $e');
      return [];
    }
  }

  String _buildAIPrompt({
    required CashflowStatus status,
    required double currentBalance,
    DateTime? crisisDate,
    double? crisisAmount,
    required List<CashflowEvent> upcomingEvents,
  }) {
    final buffer = StringBuffer();
    buffer.writeln('Current balance: \$${currentBalance.toStringAsFixed(2)}');
    buffer.writeln('Status: ${status.displayName}');

    if (crisisDate != null) {
      buffer.writeln('Crisis predicted: ${_formatDate(crisisDate)}');
    }
    if (crisisAmount != null) {
      buffer.writeln('Projected shortfall: \$${crisisAmount.toStringAsFixed(2)}');
    }

    buffer.writeln('\nUpcoming expenses:');
    final expenses = upcomingEvents.where((e) => e.isExpense).take(5);
    for (final e in expenses) {
      buffer.writeln('- ${e.name}: \$${e.amount.abs().toStringAsFixed(0)} on ${_formatDate(e.date)}');
    }

    buffer.writeln('\nUpcoming income:');
    final income = upcomingEvents.where((e) => e.isIncome).take(3);
    for (final i in income) {
      buffer.writeln('- ${i.name}: \$${i.amount.toStringAsFixed(0)} on ${_formatDate(i.date)}');
    }

    buffer.writeln('\nWhat specific actions should this person take to avoid the cashflow crisis?');

    return buffer.toString();
  }

  // ===== Storage Operations =====

  /// Save prediction to Firestore
  Future<void> _savePrediction(String userId, CashflowPrediction prediction) async {
    final docRef = _predictionsCollection(userId).doc();
    await docRef.set({
      ...prediction.toJson(),
      'id': docRef.id,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// Save recurring transaction
  Future<void> _saveRecurringTransaction(String userId, RecurringTransaction recurring) async {
    await _recurringCollection(userId).doc(recurring.id).set({
      ...recurring.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// Create crisis alert
  Future<void> _createCrisisAlert(String userId, CashflowPrediction prediction) async {
    final alert = CashflowAlert(
      id: '',
      userId: userId,
      type: prediction.status == CashflowStatus.crisis
          ? AlertType.cashflowCrisis
          : AlertType.cashflowWarning,
      title: prediction.status == CashflowStatus.crisis
          ? 'Cashflow Crisis Predicted'
          : 'Cashflow Warning',
      message: prediction.crisisReason ?? 'Your balance is projected to drop significantly.',
      severity: prediction.status,
      alertDate: DateTime.now(),
      crisisDate: prediction.crisisDate,
      projectedShortfall: prediction.crisisAmount,
      suggestedActions: prediction.recommendations,
      createdAt: DateTime.now(),
    );

    final docRef = _alertsCollection(userId).doc();
    await docRef.set({
      ...alert.toJson(),
      'id': docRef.id,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  // ===== Read Operations =====

  /// Get latest prediction
  Future<CashflowPrediction?> getLatestPrediction(String userId) async {
    final snapshot = await _predictionsCollection(userId)
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;
    return CashflowPrediction.fromFirestore(snapshot.docs.first);
  }

  /// Stream predictions
  Stream<CashflowPrediction?> watchLatestPrediction(String userId) {
    return _predictionsCollection(userId)
        .orderBy('createdAt', descending: true)
        .limit(1)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) return null;
      return CashflowPrediction.fromFirestore(snapshot.docs.first);
    });
  }

  /// Get recurring transactions
  Future<List<RecurringTransaction>> getRecurringTransactions(String userId) async {
    final snapshot = await _recurringCollection(userId)
        .where('isActive', isEqualTo: true)
        .get();

    return snapshot.docs
        .map((doc) => RecurringTransaction.fromFirestore(doc))
        .toList();
  }

  /// Stream recurring transactions
  Stream<List<RecurringTransaction>> watchRecurringTransactions(String userId) {
    return _recurringCollection(userId)
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => RecurringTransaction.fromFirestore(doc)).toList());
  }

  /// Get active alerts
  Future<List<CashflowAlert>> getActiveAlerts(String userId) async {
    final snapshot = await _alertsCollection(userId)
        .where('isDismissed', isEqualTo: false)
        .orderBy('createdAt', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => CashflowAlert.fromFirestore(doc))
        .toList();
  }

  /// Dismiss alert
  Future<void> dismissAlert(String userId, String alertId) async {
    await _alertsCollection(userId).doc(alertId).update({
      'isDismissed': true,
    });
  }
}
