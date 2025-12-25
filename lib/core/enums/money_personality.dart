/// Enum representing money personality types (Spending DNA)
enum MoneyPersonality {
  planner,
  spontaneous,
  anxiousSaver,
  carefree,
  optimizer,
}

extension MoneyPersonalityExtension on MoneyPersonality {
  String get displayName {
    switch (this) {
      case MoneyPersonality.planner:
        return 'The Planner';
      case MoneyPersonality.spontaneous:
        return 'The Spontaneous';
      case MoneyPersonality.anxiousSaver:
        return 'The Anxious Saver';
      case MoneyPersonality.carefree:
        return 'The Carefree';
      case MoneyPersonality.optimizer:
        return 'The Optimizer';
    }
  }

  String get description {
    switch (this) {
      case MoneyPersonality.planner:
        return 'Budgets meticulously, rarely impulse buys';
      case MoneyPersonality.spontaneous:
        return 'Lives in the moment, frequent impulse purchases';
      case MoneyPersonality.anxiousSaver:
        return 'Worries about money, hoards savings';
      case MoneyPersonality.carefree:
        return "Doesn't track money, goes with flow";
      case MoneyPersonality.optimizer:
        return 'Data-driven decisions, maximizes value';
    }
  }

  String get icon {
    switch (this) {
      case MoneyPersonality.planner:
        return '📋';
      case MoneyPersonality.spontaneous:
        return '🎲';
      case MoneyPersonality.anxiousSaver:
        return '🐿️';
      case MoneyPersonality.carefree:
        return '🦋';
      case MoneyPersonality.optimizer:
        return '🎯';
    }
  }

  List<String> get traits {
    switch (this) {
      case MoneyPersonality.planner:
        return ['High savings', 'Low variance', 'Detail-oriented', 'Risk-averse'];
      case MoneyPersonality.spontaneous:
        return ['High variance', 'Emotional spending', 'Flexible', 'Present-focused'];
      case MoneyPersonality.anxiousSaver:
        return ['Very high savings', 'Low spending', 'Future-focused', 'Worry-prone'];
      case MoneyPersonality.carefree:
        return ['Low engagement', 'Moderate spending', 'Stress-free', 'Adaptable'];
      case MoneyPersonality.optimizer:
        return ['High engagement', 'Strategic spending', 'Research-driven', 'Value-focused'];
    }
  }

  List<String> get tips {
    switch (this) {
      case MoneyPersonality.planner:
        return [
          'Allow yourself occasional treats without guilt',
          'Consider slightly more aggressive investments',
          'Your planning is a strength - share it with family',
        ];
      case MoneyPersonality.spontaneous:
        return [
          'Set up automatic savings before spending',
          'Use the 24-hour rule for purchases over \$50',
          'Track your "fun money" to enjoy guilt-free',
        ];
      case MoneyPersonality.anxiousSaver:
        return [
          'You\'re more secure than you think - review your progress',
          'Set specific goals to channel savings productively',
          'Consider treating yourself occasionally',
        ];
      case MoneyPersonality.carefree:
        return [
          'Automate everything - savings, bills, investments',
          'Set up alerts for unusual spending',
          'Check in monthly, even briefly',
        ];
      case MoneyPersonality.optimizer:
        return [
          'Don\'t let perfect be the enemy of good',
          'Factor in time value of optimization efforts',
          'Share your strategies with others',
        ];
    }
  }
}

/// Enum for payday behavior patterns
enum PaydayBehavior {
  spender,
  saver,
  balanced,
}

extension PaydayBehaviorExtension on PaydayBehavior {
  String get displayName {
    switch (this) {
      case PaydayBehavior.spender:
        return 'Spender';
      case PaydayBehavior.saver:
        return 'Saver';
      case PaydayBehavior.balanced:
        return 'Balanced';
    }
  }

  String get description {
    switch (this) {
      case PaydayBehavior.spender:
        return 'Spending increases significantly after payday';
      case PaydayBehavior.saver:
        return 'Immediately saves/invests a portion';
      case PaydayBehavior.balanced:
        return 'Spending remains consistent throughout month';
    }
  }
}

/// Enum for end-of-month patterns
enum EndOfMonthPattern {
  tight,
  stable,
  splurge,
}

extension EndOfMonthPatternExtension on EndOfMonthPattern {
  String get displayName {
    switch (this) {
      case EndOfMonthPattern.tight:
        return 'Tight';
      case EndOfMonthPattern.stable:
        return 'Stable';
      case EndOfMonthPattern.splurge:
        return 'Splurge';
    }
  }

  String get description {
    switch (this) {
      case EndOfMonthPattern.tight:
        return 'Money gets tight before next payday';
      case EndOfMonthPattern.stable:
        return 'Balance remains relatively stable';
      case EndOfMonthPattern.splurge:
        return 'Spends more knowing payday is coming';
    }
  }
}
