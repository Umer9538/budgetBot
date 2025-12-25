import 'package:flutter/material.dart';

import '../../core/enums/enums.dart';

/// Budget template types
enum BudgetTemplateType {
  rule503020,
  rule702010,
  zeroBased,
  envelope,
  minimalist,
  custom,
}

extension BudgetTemplateTypeExtension on BudgetTemplateType {
  String get displayName {
    switch (this) {
      case BudgetTemplateType.rule503020:
        return '50/30/20 Rule';
      case BudgetTemplateType.rule702010:
        return '70/20/10 Rule';
      case BudgetTemplateType.zeroBased:
        return 'Zero-Based Budget';
      case BudgetTemplateType.envelope:
        return 'Envelope System';
      case BudgetTemplateType.minimalist:
        return 'Minimalist Budget';
      case BudgetTemplateType.custom:
        return 'Custom Template';
    }
  }

  String get description {
    switch (this) {
      case BudgetTemplateType.rule503020:
        return '50% needs, 30% wants, 20% savings - perfect for balanced budgeting';
      case BudgetTemplateType.rule702010:
        return '70% expenses, 20% savings, 10% giving/debt - simpler approach';
      case BudgetTemplateType.zeroBased:
        return 'Every dollar has a job - assign all income to categories';
      case BudgetTemplateType.envelope:
        return 'Allocate cash to envelopes - great for spending control';
      case BudgetTemplateType.minimalist:
        return 'Focus on essentials only - maximize savings';
      case BudgetTemplateType.custom:
        return 'Build your own template from scratch';
    }
  }

  IconData get icon {
    switch (this) {
      case BudgetTemplateType.rule503020:
        return Icons.pie_chart;
      case BudgetTemplateType.rule702010:
        return Icons.donut_large;
      case BudgetTemplateType.zeroBased:
        return Icons.account_balance_wallet;
      case BudgetTemplateType.envelope:
        return Icons.mail;
      case BudgetTemplateType.minimalist:
        return Icons.minimize;
      case BudgetTemplateType.custom:
        return Icons.tune;
    }
  }

  Color get color {
    switch (this) {
      case BudgetTemplateType.rule503020:
        return const Color(0xFF6366F1); // Indigo
      case BudgetTemplateType.rule702010:
        return const Color(0xFF8B5CF6); // Violet
      case BudgetTemplateType.zeroBased:
        return const Color(0xFF10B981); // Emerald
      case BudgetTemplateType.envelope:
        return const Color(0xFFF59E0B); // Amber
      case BudgetTemplateType.minimalist:
        return const Color(0xFF64748B); // Slate
      case BudgetTemplateType.custom:
        return const Color(0xFFEC4899); // Pink
    }
  }
}

/// A budget template with predefined allocations
class BudgetTemplate {
  const BudgetTemplate({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.allocations,
    this.icon,
    this.color,
  });

  final String id;
  final BudgetTemplateType type;
  final String name;
  final String description;
  final List<BudgetAllocation> allocations;
  final IconData? icon;
  final Color? color;

  /// Calculate actual budget amounts based on income
  List<TemplateBudgetItem> calculateBudgets(double monthlyIncome) {
    return allocations.map((allocation) {
      final amount = (monthlyIncome * allocation.percentage / 5).round() * 5.0;
      return TemplateBudgetItem(
        category: allocation.category,
        name: allocation.name,
        amount: amount,
        percentage: allocation.percentage,
        isEssential: allocation.isEssential,
      );
    }).toList();
  }

  /// Get total percentage (should be <= 1.0)
  double get totalPercentage =>
      allocations.fold(0.0, (sum, a) => sum + a.percentage);

  /// Check if template is valid (total <= 100%)
  bool get isValid => totalPercentage <= 1.0;
}

/// A single allocation within a template
class BudgetAllocation {
  const BudgetAllocation({
    required this.category,
    required this.name,
    required this.percentage,
    this.isEssential = false,
    this.description,
  });

  final CategoryType category;
  final String name;
  final double percentage; // 0.0 to 1.0
  final bool isEssential;
  final String? description;

  /// Display percentage as string
  String get percentageDisplay => '${(percentage * 100).toStringAsFixed(0)}%';
}

/// Calculated budget item from a template
class TemplateBudgetItem {
  const TemplateBudgetItem({
    required this.category,
    required this.name,
    required this.amount,
    required this.percentage,
    required this.isEssential,
  });

  final CategoryType category;
  final String name;
  final double amount;
  final double percentage;
  final bool isEssential;

  /// Format amount with currency
  String get formattedAmount => '\$${amount.toStringAsFixed(0)}';

  /// Format percentage
  String get formattedPercentage => '${(percentage * 100).toStringAsFixed(0)}%';
}

/// Predefined budget templates
class BudgetTemplates {
  BudgetTemplates._();

  /// 50/30/20 Rule Template
  static const rule503020 = BudgetTemplate(
    id: 'template_503020',
    type: BudgetTemplateType.rule503020,
    name: '50/30/20 Rule',
    description: 'A balanced approach: 50% needs, 30% wants, 20% savings',
    allocations: [
      // Needs (50%)
      BudgetAllocation(
        category: CategoryType.rentMortgage,
        name: 'Housing',
        percentage: 0.25,
        isEssential: true,
        description: 'Rent or mortgage payment',
      ),
      BudgetAllocation(
        category: CategoryType.utilities,
        name: 'Utilities',
        percentage: 0.05,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.groceries,
        name: 'Groceries',
        percentage: 0.10,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.fuel,
        name: 'Transportation',
        percentage: 0.07,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.insurance,
        name: 'Insurance',
        percentage: 0.03,
        isEssential: true,
      ),
      // Wants (30%)
      BudgetAllocation(
        category: CategoryType.restaurants,
        name: 'Dining Out',
        percentage: 0.08,
      ),
      BudgetAllocation(
        category: CategoryType.streamingServices,
        name: 'Entertainment',
        percentage: 0.07,
      ),
      BudgetAllocation(
        category: CategoryType.clothing,
        name: 'Shopping',
        percentage: 0.08,
      ),
      BudgetAllocation(
        category: CategoryType.hobbies,
        name: 'Hobbies',
        percentage: 0.07,
      ),
      // Savings (20%)
      BudgetAllocation(
        category: CategoryType.savings,
        name: 'Savings',
        percentage: 0.15,
        isEssential: true,
        description: 'Emergency fund & savings goals',
      ),
      BudgetAllocation(
        category: CategoryType.investmentContributions,
        name: 'Investments',
        percentage: 0.05,
        isEssential: true,
      ),
    ],
  );

  /// 70/20/10 Rule Template
  static const rule702010 = BudgetTemplate(
    id: 'template_702010',
    type: BudgetTemplateType.rule702010,
    name: '70/20/10 Rule',
    description: 'Simple: 70% living expenses, 20% savings, 10% giving/debt',
    allocations: [
      // Living Expenses (70%)
      BudgetAllocation(
        category: CategoryType.rentMortgage,
        name: 'Housing',
        percentage: 0.28,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.utilities,
        name: 'Utilities',
        percentage: 0.05,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.groceries,
        name: 'Groceries',
        percentage: 0.12,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.fuel,
        name: 'Transportation',
        percentage: 0.10,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.restaurants,
        name: 'Dining & Entertainment',
        percentage: 0.10,
      ),
      BudgetAllocation(
        category: CategoryType.miscellaneous,
        name: 'Personal & Misc',
        percentage: 0.05,
      ),
      // Savings (20%)
      BudgetAllocation(
        category: CategoryType.savings,
        name: 'Savings',
        percentage: 0.20,
        isEssential: true,
      ),
      // Giving/Debt (10%)
      BudgetAllocation(
        category: CategoryType.charity,
        name: 'Giving & Debt Payoff',
        percentage: 0.10,
      ),
    ],
  );

  /// Zero-Based Budget Template
  static const zeroBased = BudgetTemplate(
    id: 'template_zero_based',
    type: BudgetTemplateType.zeroBased,
    name: 'Zero-Based Budget',
    description: 'Every dollar has a purpose - income minus expenses = zero',
    allocations: [
      // Fixed Expenses
      BudgetAllocation(
        category: CategoryType.rentMortgage,
        name: 'Housing',
        percentage: 0.25,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.utilities,
        name: 'Utilities',
        percentage: 0.05,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.insurance,
        name: 'Insurance',
        percentage: 0.05,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.phoneAndInternet,
        name: 'Phone & Internet',
        percentage: 0.03,
        isEssential: true,
      ),
      // Variable Expenses
      BudgetAllocation(
        category: CategoryType.groceries,
        name: 'Groceries',
        percentage: 0.10,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.fuel,
        name: 'Gas & Transportation',
        percentage: 0.08,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.restaurants,
        name: 'Dining Out',
        percentage: 0.05,
      ),
      BudgetAllocation(
        category: CategoryType.streamingServices,
        name: 'Subscriptions',
        percentage: 0.02,
      ),
      BudgetAllocation(
        category: CategoryType.clothing,
        name: 'Clothing',
        percentage: 0.03,
      ),
      BudgetAllocation(
        category: CategoryType.personalCare,
        name: 'Personal Care',
        percentage: 0.02,
      ),
      BudgetAllocation(
        category: CategoryType.medical,
        name: 'Healthcare',
        percentage: 0.04,
        isEssential: true,
      ),
      // Savings Goals
      BudgetAllocation(
        category: CategoryType.savings,
        name: 'Emergency Fund',
        percentage: 0.10,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.investmentContributions,
        name: 'Retirement',
        percentage: 0.10,
        isEssential: true,
      ),
      // Discretionary
      BudgetAllocation(
        category: CategoryType.hobbies,
        name: 'Fun Money',
        percentage: 0.05,
      ),
      BudgetAllocation(
        category: CategoryType.gifts,
        name: 'Gifts',
        percentage: 0.03,
      ),
    ],
  );

  /// Envelope System Template
  static const envelope = BudgetTemplate(
    id: 'template_envelope',
    type: BudgetTemplateType.envelope,
    name: 'Envelope System',
    description: 'Cash-based categories - when the envelope is empty, stop spending',
    allocations: [
      BudgetAllocation(
        category: CategoryType.groceries,
        name: 'Groceries Envelope',
        percentage: 0.12,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.restaurants,
        name: 'Dining Out Envelope',
        percentage: 0.05,
      ),
      BudgetAllocation(
        category: CategoryType.fuel,
        name: 'Gas Envelope',
        percentage: 0.08,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.streamingServices,
        name: 'Entertainment Envelope',
        percentage: 0.05,
      ),
      BudgetAllocation(
        category: CategoryType.clothing,
        name: 'Clothing Envelope',
        percentage: 0.04,
      ),
      BudgetAllocation(
        category: CategoryType.personalCare,
        name: 'Personal Envelope',
        percentage: 0.03,
      ),
      BudgetAllocation(
        category: CategoryType.miscellaneous,
        name: 'Misc Envelope',
        percentage: 0.03,
      ),
      // Fixed (not cash-based but tracked)
      BudgetAllocation(
        category: CategoryType.rentMortgage,
        name: 'Housing (Auto-pay)',
        percentage: 0.30,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.utilities,
        name: 'Bills (Auto-pay)',
        percentage: 0.10,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.savings,
        name: 'Savings (Auto-transfer)',
        percentage: 0.20,
        isEssential: true,
      ),
    ],
  );

  /// Minimalist Budget Template
  static const minimalist = BudgetTemplate(
    id: 'template_minimalist',
    type: BudgetTemplateType.minimalist,
    name: 'Minimalist Budget',
    description: 'Focus on essentials, maximize savings',
    allocations: [
      BudgetAllocation(
        category: CategoryType.rentMortgage,
        name: 'Housing',
        percentage: 0.25,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.utilities,
        name: 'Utilities',
        percentage: 0.05,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.groceries,
        name: 'Food',
        percentage: 0.12,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.fuel,
        name: 'Transportation',
        percentage: 0.08,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.medical,
        name: 'Healthcare',
        percentage: 0.05,
        isEssential: true,
      ),
      BudgetAllocation(
        category: CategoryType.savings,
        name: 'Savings & Investments',
        percentage: 0.40,
        isEssential: true,
        description: 'Aggressive savings for FIRE',
      ),
      BudgetAllocation(
        category: CategoryType.miscellaneous,
        name: 'Everything Else',
        percentage: 0.05,
      ),
    ],
  );

  /// Get all available templates
  static List<BudgetTemplate> get all => [
        rule503020,
        rule702010,
        zeroBased,
        envelope,
        minimalist,
      ];

  /// Get template by type
  static BudgetTemplate? getByType(BudgetTemplateType type) {
    switch (type) {
      case BudgetTemplateType.rule503020:
        return rule503020;
      case BudgetTemplateType.rule702010:
        return rule702010;
      case BudgetTemplateType.zeroBased:
        return zeroBased;
      case BudgetTemplateType.envelope:
        return envelope;
      case BudgetTemplateType.minimalist:
        return minimalist;
      case BudgetTemplateType.custom:
        return null;
    }
  }

  /// Get template by ID
  static BudgetTemplate? getById(String id) {
    return all.where((t) => t.id == id).firstOrNull;
  }
}
