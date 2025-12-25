import '../../core/enums/enums.dart';
import '../models/models.dart';
import '../services/services.dart';

/// Repository for budgets - abstracts the BudgetService
/// Provides business logic and clean interface for ViewModels
class BudgetRepository {
  BudgetRepository({
    BudgetService? budgetService,
  }) : _budgetService = budgetService ?? BudgetService();

  final BudgetService _budgetService;

  // ===== Read Operations =====

  /// Stream all budgets for a user
  Stream<List<BudgetModel>> watchBudgets(String userId) {
    return _budgetService.watchBudgets(userId);
  }

  /// Stream a single budget
  Stream<BudgetModel?> watchBudget({
    required String userId,
    required String budgetId,
  }) {
    return _budgetService.watchBudget(
      userId: userId,
      budgetId: budgetId,
    );
  }

  /// Get a single budget
  Future<BudgetModel?> getBudget({
    required String userId,
    required String budgetId,
  }) {
    return _budgetService.getBudget(
      userId: userId,
      budgetId: budgetId,
    );
  }

  /// Get budget by category
  Future<BudgetModel?> getBudgetByCategory({
    required String userId,
    required CategoryType category,
  }) {
    return _budgetService.getBudgetByCategory(
      userId: userId,
      category: category,
    );
  }

  // ===== Write Operations =====

  /// Create a new budget
  Future<BudgetModel> createBudget({
    required String userId,
    required String name,
    required CategoryType category,
    required double amount,
    required BudgetPeriod period,
    required DateTime startDate,
    DateTime? endDate,
    bool rollover = false,
    List<double>? alertThresholds,
  }) {
    return _budgetService.createBudget(
      userId: userId,
      name: name,
      category: category,
      amount: amount,
      period: period,
      startDate: startDate,
      endDate: endDate,
      rollover: rollover,
      alertThresholds: alertThresholds,
    );
  }

  /// Create a budget from a full model (for merchant budgets, templates, etc.)
  Future<BudgetModel> createBudgetFromModel(BudgetModel budget) {
    return _budgetService.createBudget(
      userId: budget.userId,
      name: budget.name,
      category: budget.category,
      amount: budget.amount,
      period: budget.period,
      startDate: budget.startDate,
      endDate: budget.endDate,
      rollover: budget.rollover,
      alertThresholds: budget.alertThresholds,
      targetType: budget.targetType,
      merchantName: budget.merchantName,
      merchantPatterns: budget.merchantPatterns,
      isShared: budget.isShared,
      sharedWith: budget.sharedWith,
      templateId: budget.templateId,
    );
  }

  /// Create a merchant-based budget
  Future<BudgetModel> createMerchantBudget({
    required String userId,
    required String name,
    required String merchantName,
    required double amount,
    required BudgetPeriod period,
    required DateTime startDate,
    List<String>? merchantPatterns,
    bool rollover = false,
  }) {
    return _budgetService.createMerchantBudget(
      userId: userId,
      name: name,
      merchantName: merchantName,
      amount: amount,
      period: period,
      startDate: startDate,
      merchantPatterns: merchantPatterns,
      rollover: rollover,
    );
  }

  /// Get budget by merchant
  Future<BudgetModel?> getBudgetByMerchant({
    required String userId,
    required String merchantName,
  }) {
    return _budgetService.getBudgetByMerchant(
      userId: userId,
      merchantName: merchantName,
    );
  }

  /// Share a budget with another user
  Future<void> shareBudget({
    required String userId,
    required String budgetId,
    required String shareWithUserId,
  }) {
    return _budgetService.shareBudget(
      userId: userId,
      budgetId: budgetId,
      shareWithUserId: shareWithUserId,
    );
  }

  /// Stop sharing a budget
  Future<void> stopSharingBudget({
    required String userId,
    required String budgetId,
  }) {
    return _budgetService.stopSharingBudget(
      userId: userId,
      budgetId: budgetId,
    );
  }

  /// Get shared budgets
  Future<List<BudgetModel>> getSharedBudgets(String userId) {
    return _budgetService.getSharedBudgets(userId);
  }

  /// Reset budget with rollover
  Future<void> resetBudgetWithRollover({
    required String userId,
    required String budgetId,
  }) {
    return _budgetService.resetBudgetWithRollover(
      userId: userId,
      budgetId: budgetId,
    );
  }

  /// Update a budget
  Future<void> updateBudget({
    required String userId,
    required String budgetId,
    String? name,
    double? amount,
    BudgetPeriod? period,
    DateTime? startDate,
    DateTime? endDate,
    bool? rollover,
    List<double>? alertThresholds,
    bool? isActive,
  }) {
    return _budgetService.updateBudget(
      userId: userId,
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
  }

  /// Update budget spent amount
  Future<void> updateBudgetSpent({
    required String userId,
    required String budgetId,
    required double spent,
  }) {
    return _budgetService.updateBudgetSpent(
      userId: userId,
      budgetId: budgetId,
      spent: spent,
    );
  }

  /// Increment budget spent
  Future<void> incrementBudgetSpent({
    required String userId,
    required String budgetId,
    required double amount,
  }) {
    return _budgetService.incrementBudgetSpent(
      userId: userId,
      budgetId: budgetId,
      amount: amount,
    );
  }

  /// Delete a budget (soft delete)
  Future<void> deleteBudget({
    required String userId,
    required String budgetId,
  }) {
    return _budgetService.deleteBudget(
      userId: userId,
      budgetId: budgetId,
    );
  }

  /// Reset budget spent amount
  Future<void> resetBudgetSpent({
    required String userId,
    required String budgetId,
    DateTime? newStartDate,
  }) {
    return _budgetService.resetBudgetSpent(
      userId: userId,
      budgetId: budgetId,
      newStartDate: newStartDate,
    );
  }

  // ===== Business Logic =====

  /// Get budget summary for a user
  Future<BudgetSummary> getBudgetSummary(String userId) async {
    final budgets = await _budgetService.getBudgets(userId);

    double totalBudget = 0;
    double totalSpent = 0;
    int onTrack = 0;
    int warning = 0;
    int exceeded = 0;

    for (final budget in budgets) {
      totalBudget += budget.amount;
      totalSpent += budget.spent;

      if (budget.isExceeded) {
        exceeded++;
      } else if (budget.isWarning || budget.isApproaching) {
        warning++;
      } else {
        onTrack++;
      }
    }

    return BudgetSummary(
      totalBudget: totalBudget,
      totalSpent: totalSpent,
      remaining: totalBudget - totalSpent,
      budgetCount: budgets.length,
      onTrack: onTrack,
      warning: warning,
      exceeded: exceeded,
    );
  }

  /// Get budgets that need alerts (warning or exceeded)
  Future<List<BudgetModel>> getAlertBudgets(String userId) async {
    final budgets = await _budgetService.getBudgets(userId);
    return budgets.where((b) => b.isWarning || b.isExceeded).toList();
  }
}

/// Data class for budget summary
class BudgetSummary {
  const BudgetSummary({
    required this.totalBudget,
    required this.totalSpent,
    required this.remaining,
    required this.budgetCount,
    required this.onTrack,
    required this.warning,
    required this.exceeded,
  });

  final double totalBudget;
  final double totalSpent;
  final double remaining;
  final int budgetCount;
  final int onTrack;
  final int warning;
  final int exceeded;

  double get percentUsed =>
      totalBudget > 0 ? (totalSpent / totalBudget) : 0.0;

  Map<String, dynamic> toMap() => {
        'totalBudget': totalBudget,
        'totalSpent': totalSpent,
        'remaining': remaining,
        'budgetCount': budgetCount,
        'onTrack': onTrack,
        'warning': warning,
        'exceeded': exceeded,
      };
}
