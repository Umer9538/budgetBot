/// Enum representing subscription statuses
enum SubscriptionStatus {
  active,
  paused,
  cancelled,
  expiring,
}

extension SubscriptionStatusExtension on SubscriptionStatus {
  String get displayName {
    switch (this) {
      case SubscriptionStatus.active:
        return 'Active';
      case SubscriptionStatus.paused:
        return 'Paused';
      case SubscriptionStatus.cancelled:
        return 'Cancelled';
      case SubscriptionStatus.expiring:
        return 'Expiring Soon';
    }
  }

  String get icon {
    switch (this) {
      case SubscriptionStatus.active:
        return '✅';
      case SubscriptionStatus.paused:
        return '⏸️';
      case SubscriptionStatus.cancelled:
        return '❌';
      case SubscriptionStatus.expiring:
        return '⚠️';
    }
  }

  bool get isActive {
    return this == SubscriptionStatus.active;
  }
}

/// Enum for subscription billing frequency
enum BillingFrequency {
  weekly,
  monthly,
  quarterly,
  yearly,
  oneTime,
}

extension BillingFrequencyExtension on BillingFrequency {
  String get displayName {
    switch (this) {
      case BillingFrequency.weekly:
        return 'Weekly';
      case BillingFrequency.monthly:
        return 'Monthly';
      case BillingFrequency.quarterly:
        return 'Quarterly';
      case BillingFrequency.yearly:
        return 'Yearly';
      case BillingFrequency.oneTime:
        return 'One-Time';
    }
  }

  int get daysInPeriod {
    switch (this) {
      case BillingFrequency.weekly:
        return 7;
      case BillingFrequency.monthly:
        return 30;
      case BillingFrequency.quarterly:
        return 90;
      case BillingFrequency.yearly:
        return 365;
      case BillingFrequency.oneTime:
        return 0;
    }
  }

  double monthlyEquivalent(double amount) {
    switch (this) {
      case BillingFrequency.weekly:
        return amount * 4.33;
      case BillingFrequency.monthly:
        return amount;
      case BillingFrequency.quarterly:
        return amount / 3;
      case BillingFrequency.yearly:
        return amount / 12;
      case BillingFrequency.oneTime:
        return 0;
    }
  }
}

/// Enum for subscription decay/usage status
enum DecayStatus {
  active,
  declining,
  dormant,
  abandoned,
}

extension DecayStatusExtension on DecayStatus {
  String get displayName {
    switch (this) {
      case DecayStatus.active:
        return 'Active';
      case DecayStatus.declining:
        return 'Declining';
      case DecayStatus.dormant:
        return 'Dormant';
      case DecayStatus.abandoned:
        return 'Abandoned';
    }
  }

  String get description {
    switch (this) {
      case DecayStatus.active:
        return 'Using regularly';
      case DecayStatus.declining:
        return 'Usage dropping';
      case DecayStatus.dormant:
        return 'Rarely using';
      case DecayStatus.abandoned:
        return 'Not using at all';
    }
  }

  String get icon {
    switch (this) {
      case DecayStatus.active:
        return '✅';
      case DecayStatus.declining:
        return '📉';
      case DecayStatus.dormant:
        return '😴';
      case DecayStatus.abandoned:
        return '❌';
    }
  }

  bool get shouldWarn {
    return this == DecayStatus.dormant || this == DecayStatus.abandoned;
  }
}
