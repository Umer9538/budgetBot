import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/enums/enums.dart';
import '../models/models.dart';
import '../services/services.dart';

/// Provider for CashflowRepository
final cashflowRepositoryProvider = Provider<CashflowRepository>((ref) {
  final service = ref.watch(cashflowPredictionServiceProvider);
  return CashflowRepository(service: service);
});

/// Repository for cashflow predictions and alerts
class CashflowRepository {
  CashflowRepository({
    required CashflowPredictionService service,
  }) : _service = service;

  final CashflowPredictionService _service;

  // ===== Prediction Operations =====

  /// Generate a new cashflow prediction
  Future<CashflowPrediction> generatePrediction({
    required String userId,
    int daysAhead = 30,
    bool useAI = true,
  }) {
    return _service.generatePrediction(
      userId: userId,
      daysAhead: daysAhead,
      useAI: useAI,
    );
  }

  /// Get the latest prediction
  Future<CashflowPrediction?> getLatestPrediction(String userId) {
    return _service.getLatestPrediction(userId);
  }

  /// Stream the latest prediction
  Stream<CashflowPrediction?> watchLatestPrediction(String userId) {
    return _service.watchLatestPrediction(userId);
  }

  /// Refresh prediction if older than specified hours
  Future<CashflowPrediction> refreshPredictionIfNeeded({
    required String userId,
    int maxAgeHours = 6,
  }) async {
    final latest = await _service.getLatestPrediction(userId);

    if (latest == null ||
        latest.createdAt == null ||
        DateTime.now().difference(latest.createdAt!).inHours >= maxAgeHours) {
      return generatePrediction(userId: userId);
    }

    return latest;
  }

  // ===== Recurring Transactions =====

  /// Detect recurring transactions from history
  Future<List<RecurringTransaction>> detectRecurringTransactions(String userId) {
    return _service.detectRecurringTransactions(userId);
  }

  /// Get all recurring transactions
  Future<List<RecurringTransaction>> getRecurringTransactions(String userId) {
    return _service.getRecurringTransactions(userId);
  }

  /// Stream recurring transactions
  Stream<List<RecurringTransaction>> watchRecurringTransactions(String userId) {
    return _service.watchRecurringTransactions(userId);
  }

  // ===== Alerts =====

  /// Get active cashflow alerts
  Future<List<CashflowAlert>> getActiveAlerts(String userId) {
    return _service.getActiveAlerts(userId);
  }

  /// Dismiss an alert
  Future<void> dismissAlert(String userId, String alertId) {
    return _service.dismissAlert(userId, alertId);
  }

  // ===== Business Logic =====

  /// Get cashflow summary for dashboard
  Future<CashflowSummary> getCashflowSummary(String userId) async {
    final prediction = await _service.getLatestPrediction(userId);
    final alerts = await _service.getActiveAlerts(userId);
    final recurring = await _service.getRecurringTransactions(userId);

    if (prediction == null) {
      return CashflowSummary(
        status: CashflowStatus.healthy,
        currentBalance: 0,
        predictedBalance30Days: 0,
        daysUntilCrisis: null,
        activeAlertCount: alerts.length,
        recurringExpenseCount: recurring.where((r) => r.type == CashflowEventType.expense).length,
        recurringIncomeCount: recurring.where((r) => r.type == CashflowEventType.income).length,
        needsAttention: false,
      );
    }

    return CashflowSummary(
      status: prediction.status,
      currentBalance: prediction.currentBalance,
      predictedBalance30Days: prediction.predictedBalance,
      lowestBalance: prediction.lowestProjectedBalance,
      lowestBalanceDate: prediction.lowestBalanceDate,
      daysUntilCrisis: prediction.daysUntilCrisis,
      crisisAmount: prediction.crisisAmount,
      activeAlertCount: alerts.length,
      recurringExpenseCount: recurring.where((r) => r.type == CashflowEventType.expense).length,
      recurringIncomeCount: recurring.where((r) => r.type == CashflowEventType.income).length,
      needsAttention: prediction.needsAttention,
      confidence: prediction.confidence,
    );
  }

  /// Check if user needs immediate attention
  Future<bool> needsImmediateAttention(String userId) async {
    final prediction = await _service.getLatestPrediction(userId);
    return prediction?.isCrisisImminent ?? false;
  }

  /// Get upcoming events for next N days
  Future<List<CashflowEvent>> getUpcomingEvents({
    required String userId,
    int days = 7,
  }) async {
    final prediction = await _service.getLatestPrediction(userId);
    if (prediction == null) return [];

    final cutoff = DateTime.now().add(Duration(days: days));
    return prediction.upcomingEvents
        .where((e) => e.date.isBefore(cutoff))
        .toList();
  }

  /// Get monthly recurring totals
  Future<MonthlyRecurringTotals> getMonthlyRecurringTotals(String userId) async {
    final recurring = await _service.getRecurringTransactions(userId);

    double monthlyIncome = 0;
    double monthlyExpenses = 0;

    for (final r in recurring) {
      final monthlyAmount = _toMonthlyAmount(r.amount, r.frequency);

      if (r.type == CashflowEventType.income) {
        monthlyIncome += monthlyAmount;
      } else {
        monthlyExpenses += monthlyAmount;
      }
    }

    return MonthlyRecurringTotals(
      income: monthlyIncome,
      expenses: monthlyExpenses,
      netCashflow: monthlyIncome - monthlyExpenses,
    );
  }

  double _toMonthlyAmount(double amount, RecurringFrequency frequency) {
    switch (frequency) {
      case RecurringFrequency.daily:
        return amount * 30;
      case RecurringFrequency.weekly:
        return amount * 4.33;
      case RecurringFrequency.biWeekly:
        return amount * 2.17;
      case RecurringFrequency.monthly:
        return amount;
      case RecurringFrequency.quarterly:
        return amount / 3;
      case RecurringFrequency.yearly:
        return amount / 12;
    }
  }
}

/// Summary of cashflow status for dashboard
class CashflowSummary {
  const CashflowSummary({
    required this.status,
    required this.currentBalance,
    required this.predictedBalance30Days,
    this.lowestBalance,
    this.lowestBalanceDate,
    this.daysUntilCrisis,
    this.crisisAmount,
    required this.activeAlertCount,
    required this.recurringExpenseCount,
    required this.recurringIncomeCount,
    required this.needsAttention,
    this.confidence,
  });

  final CashflowStatus status;
  final double currentBalance;
  final double predictedBalance30Days;
  final double? lowestBalance;
  final DateTime? lowestBalanceDate;
  final int? daysUntilCrisis;
  final double? crisisAmount;
  final int activeAlertCount;
  final int recurringExpenseCount;
  final int recurringIncomeCount;
  final bool needsAttention;
  final PredictionConfidence? confidence;

  double get balanceChange => predictedBalance30Days - currentBalance;
  bool get isPositiveTrend => balanceChange >= 0;
}

/// Monthly recurring totals
class MonthlyRecurringTotals {
  const MonthlyRecurringTotals({
    required this.income,
    required this.expenses,
    required this.netCashflow,
  });

  final double income;
  final double expenses;
  final double netCashflow;

  bool get isPositive => netCashflow >= 0;
}
