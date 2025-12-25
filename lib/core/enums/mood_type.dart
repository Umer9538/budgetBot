/// Enum representing user mood/emotional states
enum MoodType {
  happy,
  calm,
  neutral,
  stressed,
  anxious,
  sad,
  excited,
  tired,
  frustrated,
}

extension MoodTypeExtension on MoodType {
  String get displayName {
    switch (this) {
      case MoodType.happy:
        return 'Happy';
      case MoodType.calm:
        return 'Calm';
      case MoodType.neutral:
        return 'Neutral';
      case MoodType.stressed:
        return 'Stressed';
      case MoodType.anxious:
        return 'Anxious';
      case MoodType.sad:
        return 'Sad';
      case MoodType.excited:
        return 'Excited';
      case MoodType.tired:
        return 'Tired';
      case MoodType.frustrated:
        return 'Frustrated';
    }
  }

  String get icon {
    switch (this) {
      case MoodType.happy:
        return '😊';
      case MoodType.calm:
        return '😌';
      case MoodType.neutral:
        return '😐';
      case MoodType.stressed:
        return '😰';
      case MoodType.anxious:
        return '😟';
      case MoodType.sad:
        return '😢';
      case MoodType.excited:
        return '🤩';
      case MoodType.tired:
        return '😴';
      case MoodType.frustrated:
        return '😤';
    }
  }

  /// Risk level for emotional spending (0-10)
  int get spendingRisk {
    switch (this) {
      case MoodType.happy:
        return 3;
      case MoodType.calm:
        return 1;
      case MoodType.neutral:
        return 2;
      case MoodType.stressed:
        return 8;
      case MoodType.anxious:
        return 7;
      case MoodType.sad:
        return 6;
      case MoodType.excited:
        return 5;
      case MoodType.tired:
        return 4;
      case MoodType.frustrated:
        return 7;
    }
  }

  bool get isHighRisk {
    return spendingRisk >= 6;
  }

  String get spendingAdvice {
    switch (this) {
      case MoodType.happy:
        return 'Enjoy, but stay mindful of your budget!';
      case MoodType.calm:
        return 'Great state for financial decisions.';
      case MoodType.neutral:
        return 'Good time for routine purchases.';
      case MoodType.stressed:
        return 'Consider waiting before making purchases.';
      case MoodType.anxious:
        return 'Take a breath before checkout.';
      case MoodType.sad:
        return 'Retail therapy rarely helps - try a walk instead.';
      case MoodType.excited:
        return 'Excitement can lead to impulse buys - pause and reflect.';
      case MoodType.tired:
        return 'Tired minds make poor decisions - shop later.';
      case MoodType.frustrated:
        return 'Frustration spending is common - wait 24 hours.';
    }
  }
}

/// Enum for stress levels derived from biometrics
enum StressLevel {
  low,
  moderate,
  elevated,
  high,
  veryHigh,
}

extension StressLevelExtension on StressLevel {
  String get displayName {
    switch (this) {
      case StressLevel.low:
        return 'Low';
      case StressLevel.moderate:
        return 'Moderate';
      case StressLevel.elevated:
        return 'Elevated';
      case StressLevel.high:
        return 'High';
      case StressLevel.veryHigh:
        return 'Very High';
    }
  }

  String get icon {
    switch (this) {
      case StressLevel.low:
        return '🟢';
      case StressLevel.moderate:
        return '🟡';
      case StressLevel.elevated:
        return '🟠';
      case StressLevel.high:
        return '🔴';
      case StressLevel.veryHigh:
        return '🚨';
    }
  }

  bool get shouldAlert {
    return this == StressLevel.high || this == StressLevel.veryHigh;
  }
}
