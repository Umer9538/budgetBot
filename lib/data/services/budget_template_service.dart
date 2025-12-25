import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/enums/enums.dart';
import '../models/models.dart';
import 'budget_service.dart';

/// Service for managing and applying budget templates
class BudgetTemplateService {
  BudgetTemplateService({
    BudgetService? budgetService,
  }) : _budgetService = budgetService ?? BudgetService();

  final BudgetService _budgetService;

  /// Get all available templates
  List<BudgetTemplate> getAllTemplates() {
    return BudgetTemplates.all;
  }

  /// Get template by type
  BudgetTemplate? getTemplate(BudgetTemplateType type) {
    return BudgetTemplates.getByType(type);
  }

  /// Preview budgets from a template (doesn't save)
  List<TemplateBudgetItem> previewTemplate({
    required BudgetTemplateType type,
    required double monthlyIncome,
  }) {
    final template = BudgetTemplates.getByType(type);
    if (template == null) return [];

    return template.calculateBudgets(monthlyIncome);
  }

  /// Apply a template and create budgets
  Future<List<BudgetModel>> applyTemplate({
    required String userId,
    required BudgetTemplateType type,
    required double monthlyIncome,
    BudgetPeriod period = BudgetPeriod.monthly,
    bool enableRollover = false,
    List<String>? sharedWith,
  }) async {
    final template = BudgetTemplates.getByType(type);
    if (template == null) return [];

    final items = template.calculateBudgets(monthlyIncome);
    final createdBudgets = <BudgetModel>[];
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, 1); // Start of current month

    for (final item in items) {
      // Skip if amount is too small
      if (item.amount < 5) continue;

      final budget = await _budgetService.createBudget(
        userId: userId,
        name: item.name,
        category: item.category,
        amount: item.amount,
        period: period,
        startDate: startDate,
        rollover: enableRollover,
        templateId: template.id,
        isShared: sharedWith != null && sharedWith.isNotEmpty,
        sharedWith: sharedWith,
      );

      createdBudgets.add(budget);
    }

    return createdBudgets;
  }

  /// Apply template with custom modifications
  Future<List<BudgetModel>> applyCustomizedTemplate({
    required String userId,
    required BudgetTemplateType type,
    required double monthlyIncome,
    required Map<CategoryType, double> customAmounts,
    BudgetPeriod period = BudgetPeriod.monthly,
    bool enableRollover = false,
  }) async {
    final template = BudgetTemplates.getByType(type);
    if (template == null) return [];

    final items = template.calculateBudgets(monthlyIncome);
    final createdBudgets = <BudgetModel>[];
    final now = DateTime.now();
    final startDate = DateTime(now.year, now.month, 1);

    for (final item in items) {
      // Use custom amount if provided, otherwise use template amount
      final amount = customAmounts[item.category] ?? item.amount;

      if (amount < 5) continue;

      final budget = await _budgetService.createBudget(
        userId: userId,
        name: item.name,
        category: item.category,
        amount: amount,
        period: period,
        startDate: startDate,
        rollover: enableRollover,
        templateId: template.id,
      );

      createdBudgets.add(budget);
    }

    return createdBudgets;
  }

  /// Calculate how much of income is allocated by a template
  double calculateTotalAllocation({
    required BudgetTemplateType type,
    required double monthlyIncome,
  }) {
    final template = BudgetTemplates.getByType(type);
    if (template == null) return 0;

    return monthlyIncome * template.totalPercentage;
  }

  /// Get remaining unallocated income after template
  double getRemainingIncome({
    required BudgetTemplateType type,
    required double monthlyIncome,
  }) {
    final allocated = calculateTotalAllocation(type: type, monthlyIncome: monthlyIncome);
    return monthlyIncome - allocated;
  }

  /// Validate template fits within income
  bool validateTemplate({
    required BudgetTemplateType type,
    required double monthlyIncome,
    double maxAllocationPercent = 1.0,
  }) {
    final template = BudgetTemplates.getByType(type);
    if (template == null) return false;

    return template.totalPercentage <= maxAllocationPercent;
  }

  /// Get template summary statistics
  TemplateSummary getTemplateSummary({
    required BudgetTemplateType type,
    required double monthlyIncome,
  }) {
    final template = BudgetTemplates.getByType(type);
    if (template == null) {
      return TemplateSummary(
        totalCategories: 0,
        essentialCategories: 0,
        totalAllocation: 0,
        essentialAllocation: 0,
        discretionaryAllocation: 0,
        savingsAllocation: 0,
      );
    }

    final items = template.calculateBudgets(monthlyIncome);

    double essentialTotal = 0;
    double savingsTotal = 0;
    double discretionaryTotal = 0;
    int essentialCount = 0;

    for (final item in items) {
      if (item.isEssential) {
        essentialCount++;
        if (item.category == CategoryType.savings ||
            item.category == CategoryType.investmentContributions) {
          savingsTotal += item.amount;
        } else {
          essentialTotal += item.amount;
        }
      } else {
        discretionaryTotal += item.amount;
      }
    }

    return TemplateSummary(
      totalCategories: items.length,
      essentialCategories: essentialCount,
      totalAllocation: monthlyIncome * template.totalPercentage,
      essentialAllocation: essentialTotal,
      discretionaryAllocation: discretionaryTotal,
      savingsAllocation: savingsTotal,
    );
  }

  /// Recommend a template based on user preferences
  BudgetTemplateType recommendTemplate({
    required double monthlyIncome,
    required double savingsGoalPercent,
    bool hasDebt = false,
    bool wantsSimplicity = false,
  }) {
    // High savers -> Minimalist
    if (savingsGoalPercent >= 0.30) {
      return BudgetTemplateType.minimalist;
    }

    // Has debt -> 70/20/10 (includes debt payoff)
    if (hasDebt) {
      return BudgetTemplateType.rule702010;
    }

    // Wants simplicity -> 70/20/10
    if (wantsSimplicity) {
      return BudgetTemplateType.rule702010;
    }

    // Detail-oriented -> Zero-based
    if (monthlyIncome > 8000) {
      return BudgetTemplateType.zeroBased;
    }

    // Default -> 50/30/20
    return BudgetTemplateType.rule503020;
  }
}

/// Summary of a template's allocations
class TemplateSummary {
  const TemplateSummary({
    required this.totalCategories,
    required this.essentialCategories,
    required this.totalAllocation,
    required this.essentialAllocation,
    required this.discretionaryAllocation,
    required this.savingsAllocation,
  });

  final int totalCategories;
  final int essentialCategories;
  final double totalAllocation;
  final double essentialAllocation;
  final double discretionaryAllocation;
  final double savingsAllocation;

  int get discretionaryCategories => totalCategories - essentialCategories;

  double get essentialPercent =>
      totalAllocation > 0 ? essentialAllocation / totalAllocation : 0;

  double get discretionaryPercent =>
      totalAllocation > 0 ? discretionaryAllocation / totalAllocation : 0;

  double get savingsPercent =>
      totalAllocation > 0 ? savingsAllocation / totalAllocation : 0;
}

/// Provider for budget template service
final budgetTemplateServiceProvider = Provider<BudgetTemplateService>((ref) {
  return BudgetTemplateService();
});
