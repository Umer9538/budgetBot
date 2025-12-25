/// Enum representing types of alerts/notifications
enum AlertType {
  budgetWarning,
  budgetExceeded,
  budgetApproaching,
  cashflowCrisis,
  cashflowWarning,
  subscriptionDecay,
  unusualSpending,
  savingsOpportunity,
  billDue,
  goalAchieved,
  streakMilestone,
  insightAvailable,
  emotionalSpendingAlert,
  negotiationComplete,
}

extension AlertTypeExtension on AlertType {
  String get displayName {
    switch (this) {
      case AlertType.budgetWarning:
        return 'Budget Warning';
      case AlertType.budgetExceeded:
        return 'Budget Exceeded';
      case AlertType.budgetApproaching:
        return 'Approaching Budget';
      case AlertType.cashflowCrisis:
        return 'Cashflow Crisis';
      case AlertType.cashflowWarning:
        return 'Cashflow Warning';
      case AlertType.subscriptionDecay:
        return 'Unused Subscription';
      case AlertType.unusualSpending:
        return 'Unusual Spending';
      case AlertType.savingsOpportunity:
        return 'Savings Opportunity';
      case AlertType.billDue:
        return 'Bill Due';
      case AlertType.goalAchieved:
        return 'Goal Achieved';
      case AlertType.streakMilestone:
        return 'Streak Milestone';
      case AlertType.insightAvailable:
        return 'New Insight';
      case AlertType.emotionalSpendingAlert:
        return 'Emotional Spending Alert';
      case AlertType.negotiationComplete:
        return 'Negotiation Complete';
    }
  }

  AlertSeverity get severity {
    switch (this) {
      case AlertType.budgetExceeded:
      case AlertType.cashflowCrisis:
        return AlertSeverity.critical;

      case AlertType.budgetWarning:
      case AlertType.cashflowWarning:
      case AlertType.emotionalSpendingAlert:
      case AlertType.unusualSpending:
        return AlertSeverity.high;

      case AlertType.budgetApproaching:
      case AlertType.subscriptionDecay:
      case AlertType.billDue:
      case AlertType.savingsOpportunity:
        return AlertSeverity.medium;

      case AlertType.goalAchieved:
      case AlertType.streakMilestone:
      case AlertType.insightAvailable:
      case AlertType.negotiationComplete:
        return AlertSeverity.low;
    }
  }

  String get icon {
    switch (this) {
      case AlertType.budgetWarning:
        return '⚠️';
      case AlertType.budgetExceeded:
        return '🔴';
      case AlertType.budgetApproaching:
        return '🟡';
      case AlertType.cashflowCrisis:
        return '🚨';
      case AlertType.cashflowWarning:
        return '⚠️';
      case AlertType.subscriptionDecay:
        return '🔔';
      case AlertType.unusualSpending:
        return '❓';
      case AlertType.savingsOpportunity:
        return '💡';
      case AlertType.billDue:
        return '📅';
      case AlertType.goalAchieved:
        return '🎉';
      case AlertType.streakMilestone:
        return '🔥';
      case AlertType.insightAvailable:
        return '💡';
      case AlertType.emotionalSpendingAlert:
        return '🧘';
      case AlertType.negotiationComplete:
        return '✅';
    }
  }
}

/// Enum for alert severity levels
enum AlertSeverity {
  low,
  medium,
  high,
  critical,
}

extension AlertSeverityExtension on AlertSeverity {
  String get displayName {
    switch (this) {
      case AlertSeverity.low:
        return 'Low';
      case AlertSeverity.medium:
        return 'Medium';
      case AlertSeverity.high:
        return 'High';
      case AlertSeverity.critical:
        return 'Critical';
    }
  }

  int get priority {
    switch (this) {
      case AlertSeverity.low:
        return 0;
      case AlertSeverity.medium:
        return 1;
      case AlertSeverity.high:
        return 2;
      case AlertSeverity.critical:
        return 3;
    }
  }
}
