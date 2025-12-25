/// Enum representing onboarding steps
enum OnboardingStep {
  welcome,
  accountCreation,
  bankConnection,
  initialSetup,
  featureIntro,
  firstInsight,
  completed,
}

extension OnboardingStepExtension on OnboardingStep {
  String get displayName {
    switch (this) {
      case OnboardingStep.welcome:
        return 'Welcome';
      case OnboardingStep.accountCreation:
        return 'Create Account';
      case OnboardingStep.bankConnection:
        return 'Connect Bank';
      case OnboardingStep.initialSetup:
        return 'Initial Setup';
      case OnboardingStep.featureIntro:
        return 'Feature Tour';
      case OnboardingStep.firstInsight:
        return 'First Insight';
      case OnboardingStep.completed:
        return 'Completed';
    }
  }

  int get stepNumber {
    return index + 1;
  }

  int get totalSteps {
    return OnboardingStep.values.length - 1; // Exclude 'completed'
  }

  double get progress {
    if (this == OnboardingStep.completed) return 1.0;
    return index / (OnboardingStep.values.length - 1);
  }

  bool get isRequired {
    switch (this) {
      case OnboardingStep.welcome:
      case OnboardingStep.accountCreation:
        return true;
      case OnboardingStep.bankConnection:
      case OnboardingStep.initialSetup:
      case OnboardingStep.featureIntro:
      case OnboardingStep.firstInsight:
      case OnboardingStep.completed:
        return false;
    }
  }

  OnboardingStep? get next {
    final nextIndex = index + 1;
    if (nextIndex >= OnboardingStep.values.length) return null;
    return OnboardingStep.values[nextIndex];
  }

  OnboardingStep? get previous {
    if (index == 0) return null;
    return OnboardingStep.values[index - 1];
  }
}

/// Enum for user subscription plans
enum SubscriptionPlan {
  free,
  premium,
  family,
}

extension SubscriptionPlanExtension on SubscriptionPlan {
  String get displayName {
    switch (this) {
      case SubscriptionPlan.free:
        return 'Free';
      case SubscriptionPlan.premium:
        return 'Premium';
      case SubscriptionPlan.family:
        return 'Family';
    }
  }

  double get monthlyPrice {
    switch (this) {
      case SubscriptionPlan.free:
        return 0;
      case SubscriptionPlan.premium:
        return 9.99;
      case SubscriptionPlan.family:
        return 14.99;
    }
  }

  int get maxBankConnections {
    switch (this) {
      case SubscriptionPlan.free:
        return 2;
      case SubscriptionPlan.premium:
      case SubscriptionPlan.family:
        return -1; // Unlimited
    }
  }

  int get maxBudgets {
    switch (this) {
      case SubscriptionPlan.free:
        return 3;
      case SubscriptionPlan.premium:
      case SubscriptionPlan.family:
        return -1; // Unlimited
    }
  }

  bool get hasEmotionalAI {
    return this != SubscriptionPlan.free;
  }

  bool get hasDigitalTwin {
    return this != SubscriptionPlan.free;
  }

  bool get hasBillNegotiator {
    return this != SubscriptionPlan.free;
  }

  bool get hasFamilyFeatures {
    return this == SubscriptionPlan.family;
  }

  int get maxFamilyMembers {
    switch (this) {
      case SubscriptionPlan.free:
      case SubscriptionPlan.premium:
        return 0;
      case SubscriptionPlan.family:
        return 6;
    }
  }
}
