/// Enum representing budget time periods
enum BudgetPeriod {
  daily,
  weekly,
  biWeekly,
  monthly,
  quarterly,
  yearly,
  custom,
}

extension BudgetPeriodExtension on BudgetPeriod {
  String get displayName {
    switch (this) {
      case BudgetPeriod.daily:
        return 'Daily';
      case BudgetPeriod.weekly:
        return 'Weekly';
      case BudgetPeriod.biWeekly:
        return 'Bi-Weekly';
      case BudgetPeriod.monthly:
        return 'Monthly';
      case BudgetPeriod.quarterly:
        return 'Quarterly';
      case BudgetPeriod.yearly:
        return 'Yearly';
      case BudgetPeriod.custom:
        return 'Custom';
    }
  }

  int get days {
    switch (this) {
      case BudgetPeriod.daily:
        return 1;
      case BudgetPeriod.weekly:
        return 7;
      case BudgetPeriod.biWeekly:
        return 14;
      case BudgetPeriod.monthly:
        return 30;
      case BudgetPeriod.quarterly:
        return 90;
      case BudgetPeriod.yearly:
        return 365;
      case BudgetPeriod.custom:
        return 0; // Must be set manually
    }
  }

  String get shortName {
    switch (this) {
      case BudgetPeriod.daily:
        return '/day';
      case BudgetPeriod.weekly:
        return '/week';
      case BudgetPeriod.biWeekly:
        return '/2 weeks';
      case BudgetPeriod.monthly:
        return '/month';
      case BudgetPeriod.quarterly:
        return '/quarter';
      case BudgetPeriod.yearly:
        return '/year';
      case BudgetPeriod.custom:
        return '';
    }
  }
}
