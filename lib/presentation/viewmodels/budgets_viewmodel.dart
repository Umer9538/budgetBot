import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/enums/enums.dart';
import '../../data/models/models.dart';
import '../../data/repositories/budget_repository.dart';
import '../../data/repositories/notification_repository.dart';
import 'auth_viewmodel.dart';

/// State for budgets
class BudgetsState {
  const BudgetsState({
    this.budgets = const [],
    this.isLoading = false,
    this.error,
    this.summary,
  });

  final List<BudgetModel> budgets;
  final bool isLoading;
  final String? error;
  final BudgetSummary? summary;

  BudgetsState copyWith({
    List<BudgetModel>? budgets,
    bool? isLoading,
    String? error,
    BudgetSummary? summary,
  }) {
    return BudgetsState(
      budgets: budgets ?? this.budgets,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      summary: summary ?? this.summary,
    );
  }
}

/// ViewModel for budgets
class BudgetsViewModel extends StateNotifier<BudgetsState> {
  BudgetsViewModel({
    required String userId,
    BudgetRepository? repository,
    NotificationRepository? notificationRepository,
  })  : _userId = userId,
        _repository = repository ?? BudgetRepository(),
        _notificationRepository = notificationRepository,
        super(const BudgetsState()) {
    _init();
  }

  final String _userId;
  final BudgetRepository _repository;
  final NotificationRepository? _notificationRepository;
  StreamSubscription? _subscription;

  // Track which budget alerts have been sent to avoid duplicates
  final Set<String> _sentAlerts = {};

  void _init() {
    _loadBudgets();
    _loadSummary();
  }

  void _loadBudgets() {
    state = state.copyWith(isLoading: true);
    _subscription?.cancel();
    _subscription = _repository.watchBudgets(_userId).listen(
      (budgets) {
        state = state.copyWith(
          budgets: budgets,
          isLoading: false,
        );
        // Check for budget alerts
        _checkBudgetAlerts(budgets);
      },
      onError: (error) {
        state = state.copyWith(
          isLoading: false,
          error: 'Failed to load budgets',
        );
      },
    );
  }

  /// Check budgets for alert thresholds and send notifications
  void _checkBudgetAlerts(List<BudgetModel> budgets) {
    if (_notificationRepository == null) return;

    for (final budget in budgets) {
      final percentUsed = budget.spent / budget.amount;

      // Create unique key for each threshold level
      String? alertKey;
      if (percentUsed >= 1.0) {
        alertKey = '${budget.id}_exceeded';
      } else if (percentUsed >= 0.9) {
        alertKey = '${budget.id}_90';
      } else if (percentUsed >= 0.75) {
        alertKey = '${budget.id}_75';
      }

      // Only send notification if we haven't already for this threshold
      if (alertKey != null && !_sentAlerts.contains(alertKey)) {
        _sentAlerts.add(alertKey);
        _createBudgetAlertNotification(budget, percentUsed);
      }
    }
  }

  /// Create budget alert notification
  Future<void> _createBudgetAlertNotification(
    BudgetModel budget,
    double percentUsed,
  ) async {
    if (_notificationRepository == null) return;

    try {
      await _notificationRepository.createBudgetAlert(
        userId: _userId,
        budgetId: budget.id,
        budgetName: budget.name,
        percentUsed: percentUsed,
        spent: budget.spent,
        limit: budget.amount,
      );
      debugPrint('Created budget alert for ${budget.name}: ${(percentUsed * 100).toInt()}%');
    } catch (e) {
      debugPrint('Failed to create budget notification: $e');
    }
  }

  Future<void> _loadSummary() async {
    try {
      final summary = await _repository.getBudgetSummary(_userId);
      state = state.copyWith(summary: summary);
    } catch (e) {
      // Ignore summary errors
    }
  }

  /// Create a new budget
  Future<bool> createBudget({
    required String name,
    required CategoryType category,
    required double amount,
    required BudgetPeriod period,
    required DateTime startDate,
    DateTime? endDate,
    bool rollover = false,
    List<double>? alertThresholds,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.createBudget(
        userId: _userId,
        name: name,
        category: category,
        amount: amount,
        period: period,
        startDate: startDate,
        endDate: endDate,
        rollover: rollover,
        alertThresholds: alertThresholds,
      );
      await _loadSummary();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to create budget',
      );
      return false;
    }
  }

  /// Update a budget
  Future<bool> updateBudget({
    required String budgetId,
    String? name,
    double? amount,
    BudgetPeriod? period,
    DateTime? startDate,
    DateTime? endDate,
    bool? rollover,
    List<double>? alertThresholds,
    bool? isActive,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.updateBudget(
        userId: _userId,
        budgetId: budgetId,
        name: name,
        amount: amount,
        period: period,
        startDate: startDate,
        endDate: endDate,
        rollover: rollover,
        alertThresholds: alertThresholds,
        isActive: isActive,
      );
      await _loadSummary();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to update budget',
      );
      return false;
    }
  }

  /// Delete a budget
  Future<bool> deleteBudget(String budgetId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.deleteBudget(
        userId: _userId,
        budgetId: budgetId,
      );
      await _loadSummary();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to delete budget',
      );
      return false;
    }
  }

  /// Get budgets by status
  List<BudgetModel> get onTrackBudgets =>
      state.budgets.where((b) => b.isOnTrack).toList();

  List<BudgetModel> get warningBudgets =>
      state.budgets.where((b) => b.isWarning || b.isApproaching).toList();

  List<BudgetModel> get exceededBudgets =>
      state.budgets.where((b) => b.isExceeded).toList();

  /// Get alert budgets (warning + exceeded)
  List<BudgetModel> get alertBudgets =>
      state.budgets.where((b) => b.isWarning || b.isExceeded).toList();

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Refresh data
  Future<void> refresh() async {
    _loadBudgets();
    await _loadSummary();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

/// Provider for BudgetsViewModel
final budgetsViewModelProvider =
    StateNotifierProvider.autoDispose<BudgetsViewModel, BudgetsState>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) {
    throw Exception('User not authenticated');
  }
  final notificationRepository = ref.watch(notificationRepositoryProvider);
  return BudgetsViewModel(
    userId: userId,
    notificationRepository: notificationRepository,
  );
});

/// Provider for budget summary
final budgetSummaryProvider = Provider.autoDispose<BudgetSummary?>((ref) {
  return ref.watch(budgetsViewModelProvider).summary;
});

/// Provider for alert budgets
final alertBudgetsProvider = Provider.autoDispose<List<BudgetModel>>((ref) {
  final viewModel = ref.watch(budgetsViewModelProvider.notifier);
  return viewModel.alertBudgets;
});
