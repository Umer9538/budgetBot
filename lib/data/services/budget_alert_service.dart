import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/enums/enums.dart';
import '../models/models.dart';
import 'budget_service.dart';
import 'notification_service.dart';

/// Alert status for a budget
class BudgetAlertStatus {
  const BudgetAlertStatus({
    required this.budgetId,
    required this.budgetName,
    required this.spent,
    required this.limit,
    required this.percentUsed,
    required this.alertLevel,
    required this.isOverBudget,
  });

  final String budgetId;
  final String budgetName;
  final double spent;
  final double limit;
  final double percentUsed;
  final AlertLevel alertLevel;
  final bool isOverBudget;

  /// Get color for alert level
  int get colorValue {
    switch (alertLevel) {
      case AlertLevel.safe:
        return 0xFF4CAF50; // Green
      case AlertLevel.caution:
        return 0xFFFFC107; // Yellow
      case AlertLevel.warning:
        return 0xFFFF9800; // Orange
      case AlertLevel.danger:
        return 0xFFF44336; // Red
      case AlertLevel.exceeded:
        return 0xFF9C27B0; // Purple
    }
  }

  /// Get message for current alert level
  String get message {
    switch (alertLevel) {
      case AlertLevel.safe:
        return 'You\'re on track with your $budgetName budget';
      case AlertLevel.caution:
        return 'You\'ve used half of your $budgetName budget';
      case AlertLevel.warning:
        return 'You\'ve used 75% of your $budgetName budget';
      case AlertLevel.danger:
        return 'You\'re close to your $budgetName budget limit';
      case AlertLevel.exceeded:
        return 'You\'ve exceeded your $budgetName budget!';
    }
  }
}

/// Alert levels based on budget usage
enum AlertLevel {
  safe, // < 50%
  caution, // 50-74%
  warning, // 75-89%
  danger, // 90-99%
  exceeded, // >= 100%
}

/// Service for monitoring budgets and triggering alerts
class BudgetAlertService {
  BudgetAlertService({
    required this.budgetService,
    required this.notificationService,
  });

  final BudgetService budgetService;
  final NotificationService notificationService;

  // Track which thresholds have been notified to avoid duplicate notifications
  final Map<String, Set<double>> _notifiedThresholds = {};

  // Hive box for persisting notified thresholds
  static const String _boxName = 'budget_alert_thresholds';
  Box<List<dynamic>>? _thresholdsBox;

  /// Initialize the service
  Future<void> initialize() async {
    _thresholdsBox = await Hive.openBox<List<dynamic>>(_boxName);
    _loadNotifiedThresholds();
  }

  /// Load previously notified thresholds from storage
  void _loadNotifiedThresholds() {
    if (_thresholdsBox == null) return;

    for (final key in _thresholdsBox!.keys) {
      final values = _thresholdsBox!.get(key);
      if (values != null) {
        _notifiedThresholds[key as String] =
            values.map((v) => v as double).toSet();
      }
    }
  }

  /// Save notified thresholds to storage
  Future<void> _saveNotifiedThreshold(
      String budgetId, double threshold) async {
    _notifiedThresholds.putIfAbsent(budgetId, () => {});
    _notifiedThresholds[budgetId]!.add(threshold);

    await _thresholdsBox?.put(
        budgetId, _notifiedThresholds[budgetId]!.toList());
  }

  /// Clear notified thresholds for a budget (e.g., on period reset)
  Future<void> resetBudgetAlerts(String budgetId) async {
    _notifiedThresholds.remove(budgetId);
    await _thresholdsBox?.delete(budgetId);
  }

  /// Get alert status for a budget
  BudgetAlertStatus getBudgetAlertStatus(BudgetModel budget) {
    final spent = budget.spent;
    final limit = budget.amount;
    final percentUsed = limit > 0 ? spent / limit : 0.0;

    AlertLevel alertLevel;
    if (percentUsed >= 1.0) {
      alertLevel = AlertLevel.exceeded;
    } else if (percentUsed >= 0.9) {
      alertLevel = AlertLevel.danger;
    } else if (percentUsed >= 0.75) {
      alertLevel = AlertLevel.warning;
    } else if (percentUsed >= 0.5) {
      alertLevel = AlertLevel.caution;
    } else {
      alertLevel = AlertLevel.safe;
    }

    return BudgetAlertStatus(
      budgetId: budget.id,
      budgetName: budget.name,
      spent: spent,
      limit: limit,
      percentUsed: percentUsed,
      alertLevel: alertLevel,
      isOverBudget: percentUsed >= 1.0,
    );
  }

  /// Check budget and send notification if threshold crossed
  Future<void> checkAndNotify(BudgetModel budget) async {
    final spent = budget.spent;
    final limit = budget.amount;
    final percentUsed = limit > 0 ? spent / limit : 0.0;

    // Get thresholds for this budget (defaults: 50%, 75%, 90%, 100%)
    final thresholds = budget.alertThresholds ?? [0.5, 0.75, 0.9, 1.0];

    // Get already notified thresholds
    final notified = _notifiedThresholds[budget.id] ?? {};

    // Find the highest crossed threshold that hasn't been notified
    for (final threshold in thresholds.reversed) {
      if (percentUsed >= threshold && !notified.contains(threshold)) {
        // Send notification
        await notificationService.showBudgetAlert(
          budgetId: budget.id,
          budgetName: budget.name,
          percentUsed: percentUsed,
          spent: spent,
          limit: limit,
        );

        // Mark threshold as notified
        await _saveNotifiedThreshold(budget.id, threshold);

        // Only notify for the highest crossed threshold
        break;
      }
    }
  }

  /// Check all budgets for a user and send notifications
  Future<List<BudgetAlertStatus>> checkAllBudgets(String userId) async {
    final budgets = await budgetService.getBudgets(userId);
    final statuses = <BudgetAlertStatus>[];

    for (final budget in budgets) {
      await checkAndNotify(budget);
      statuses.add(getBudgetAlertStatus(budget));
    }

    return statuses;
  }

  /// Get all budget statuses (without sending notifications)
  Future<List<BudgetAlertStatus>> getAllBudgetStatuses(String userId) async {
    final budgets = await budgetService.getBudgets(userId);
    return budgets.map((b) => getBudgetAlertStatus(b)).toList();
  }

  /// Get budgets that are over or near limit
  Future<List<BudgetAlertStatus>> getAlertingBudgets(String userId) async {
    final statuses = await getAllBudgetStatuses(userId);
    return statuses
        .where((s) =>
            s.alertLevel == AlertLevel.warning ||
            s.alertLevel == AlertLevel.danger ||
            s.alertLevel == AlertLevel.exceeded)
        .toList();
  }

  /// Calculate remaining budget
  double getRemainingBudget(BudgetModel budget) {
    return budget.amount - budget.spent;
  }

  /// Calculate daily allowance for remaining budget period
  double getDailyAllowance(BudgetModel budget) {
    final remaining = getRemainingBudget(budget);
    if (remaining <= 0) return 0;

    final now = DateTime.now();
    DateTime endDate;

    switch (budget.period) {
      case BudgetPeriod.daily:
        return remaining;
      case BudgetPeriod.weekly:
        final dayOfWeek = now.weekday;
        final daysUntilEndOfWeek = 7 - dayOfWeek;
        return remaining / (daysUntilEndOfWeek + 1);
      case BudgetPeriod.biWeekly:
        final weekOfPeriod =  ((now.difference(budget.startDate).inDays) ~/ 7) % 2;
        final daysLeft = 14 - (now.difference(budget.startDate).inDays % 14);
        return remaining / daysLeft;
      case BudgetPeriod.monthly:
        final daysInMonth =
            DateTime(now.year, now.month + 1, 0).day;
        final daysLeft = daysInMonth - now.day + 1;
        return remaining / daysLeft;
      case BudgetPeriod.quarterly:
        final quarterEnd = DateTime(
          now.year,
          ((now.month - 1) ~/ 3 + 1) * 3 + 1,
          1,
        ).subtract(const Duration(days: 1));
        final daysLeft = quarterEnd.difference(now).inDays + 1;
        return remaining / daysLeft;
      case BudgetPeriod.yearly:
        endDate = DateTime(now.year, 12, 31);
        final daysLeft = endDate.difference(now).inDays + 1;
        return remaining / daysLeft;
      case BudgetPeriod.custom:
        if (budget.endDate != null) {
          final daysLeft = budget.endDate!.difference(now).inDays + 1;
          return daysLeft > 0 ? remaining / daysLeft : 0;
        }
        return remaining;
    }
  }
}

/// State for budget alerts
class BudgetAlertsState {
  const BudgetAlertsState({
    this.statuses = const [],
    this.alertingBudgets = const [],
    this.isLoading = false,
    this.error,
  });

  final List<BudgetAlertStatus> statuses;
  final List<BudgetAlertStatus> alertingBudgets;
  final bool isLoading;
  final String? error;

  BudgetAlertsState copyWith({
    List<BudgetAlertStatus>? statuses,
    List<BudgetAlertStatus>? alertingBudgets,
    bool? isLoading,
    String? error,
  }) {
    return BudgetAlertsState(
      statuses: statuses ?? this.statuses,
      alertingBudgets: alertingBudgets ?? this.alertingBudgets,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// ViewModel for budget alerts
class BudgetAlertsViewModel extends StateNotifier<BudgetAlertsState> {
  BudgetAlertsViewModel(this._alertService, this._userId)
      : super(const BudgetAlertsState()) {
    _initialize();
  }

  final BudgetAlertService _alertService;
  final String? _userId;

  Future<void> _initialize() async {
    await _alertService.initialize();
    if (_userId != null) {
      await refresh();
    }
  }

  /// Refresh all budget alerts
  Future<void> refresh() async {
    if (_userId == null) return;

    state = state.copyWith(isLoading: true, error: null);

    try {
      final statuses = await _alertService.checkAllBudgets(_userId);
      final alerting = statuses
          .where((s) =>
              s.alertLevel == AlertLevel.warning ||
              s.alertLevel == AlertLevel.danger ||
              s.alertLevel == AlertLevel.exceeded)
          .toList();

      state = state.copyWith(
        statuses: statuses,
        alertingBudgets: alerting,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  /// Get alert status for a specific budget
  BudgetAlertStatus? getStatusForBudget(String budgetId) {
    try {
      return state.statuses.firstWhere((s) => s.budgetId == budgetId);
    } catch (_) {
      return null;
    }
  }
}

/// Riverpod providers

final budgetServiceProvider = Provider<BudgetService>((ref) {
  return BudgetService();
});

final budgetAlertServiceProvider = Provider<BudgetAlertService>((ref) {
  final budgetService = ref.watch(budgetServiceProvider);
  final notificationService = ref.watch(notificationServiceProvider);
  return BudgetAlertService(
    budgetService: budgetService,
    notificationService: notificationService,
  );
});

final budgetAlertsViewModelProvider =
    StateNotifierProvider<BudgetAlertsViewModel, BudgetAlertsState>((ref) {
  final alertService = ref.watch(budgetAlertServiceProvider);
  // TODO: Get actual user ID from auth state
  const userId = null; // Will be set when user logs in
  return BudgetAlertsViewModel(alertService, userId);
});

/// Provider for alerting budgets count (for badges)
final alertingBudgetsCountProvider = Provider<int>((ref) {
  final state = ref.watch(budgetAlertsViewModelProvider);
  return state.alertingBudgets.length;
});
