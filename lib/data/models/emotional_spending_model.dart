import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/enums.dart';

part 'emotional_spending_model.freezed.dart';
part 'emotional_spending_model.g.dart';

/// Model for emotional spending analysis
@freezed
class EmotionalSpendingAnalysis with _$EmotionalSpendingAnalysis {
  const factory EmotionalSpendingAnalysis({
    required String id,
    required String userId,
    required DateTime analysisDate,
    required EmotionalSpendingProfile profile,
    @Default([]) List<EmotionalPattern> patterns,
    @Default([]) List<EmotionalTrigger> triggers,
    @Default([]) List<String> recommendations,
    double? totalEmotionalSpending,
    double? percentageOfTotal,
    DateTime? createdAt,
  }) = _EmotionalSpendingAnalysis;

  factory EmotionalSpendingAnalysis.fromJson(Map<String, dynamic> json) =>
      _$EmotionalSpendingAnalysisFromJson(json);
}

/// User's emotional spending profile
@freezed
class EmotionalSpendingProfile with _$EmotionalSpendingProfile {
  const factory EmotionalSpendingProfile({
    required MoodType dominantMood,
    required double emotionalSpendingScore, // 0-100
    required Map<String, double> moodSpendingMap, // mood -> avg spending
    required Map<String, int> moodFrequencyMap, // mood -> count
    String? primaryTriggerCategory,
    String? primaryTriggerTime,
    @Default(false) bool isHighRiskSpender,
    @Default([]) List<String> vulnerableMoods,
  }) = _EmotionalSpendingProfile;

  factory EmotionalSpendingProfile.fromJson(Map<String, dynamic> json) =>
      _$EmotionalSpendingProfileFromJson(json);
}

/// Pattern of emotional spending
@freezed
class EmotionalPattern with _$EmotionalPattern {
  const factory EmotionalPattern({
    required String id,
    required MoodType mood,
    required PatternType type,
    required String description,
    required double avgAmount,
    required int occurrences,
    required double confidence,
    String? category,
    String? timeOfDay, // morning, afternoon, evening, night
    String? dayOfWeek,
    @Default([]) List<String> associatedMerchants,
  }) = _EmotionalPattern;

  factory EmotionalPattern.fromJson(Map<String, dynamic> json) =>
      _$EmotionalPatternFromJson(json);
}

/// Emotional spending trigger
@freezed
class EmotionalTrigger with _$EmotionalTrigger {
  const factory EmotionalTrigger({
    required String id,
    required MoodType triggerMood,
    required TriggerType type,
    required String description,
    required double riskLevel, // 0-10
    required double avgSpendIncrease, // percentage
    String? category,
    String? timePattern,
    @Default([]) List<String> warningSignals,
    @Default([]) List<String> copingStrategies,
  }) = _EmotionalTrigger;

  factory EmotionalTrigger.fromJson(Map<String, dynamic> json) =>
      _$EmotionalTriggerFromJson(json);
}

/// Mood entry for transaction
@freezed
class MoodEntry with _$MoodEntry {
  const factory MoodEntry({
    required String id,
    required String transactionId,
    required MoodType mood,
    int? stressLevel, // 0-10
    String? note,
    DateTime? recordedAt,
  }) = _MoodEntry;

  factory MoodEntry.fromJson(Map<String, dynamic> json) =>
      _$MoodEntryFromJson(json);
}

/// Types of emotional patterns
enum PatternType {
  stressShopping,
  rewardSeeking,
  boredomSpending,
  socialPressure,
  comfortPurchase,
  impulseControl,
  celebratory,
  avoidance,
}

extension PatternTypeExtension on PatternType {
  String get displayName {
    switch (this) {
      case PatternType.stressShopping:
        return 'Stress Shopping';
      case PatternType.rewardSeeking:
        return 'Reward Seeking';
      case PatternType.boredomSpending:
        return 'Boredom Spending';
      case PatternType.socialPressure:
        return 'Social Pressure';
      case PatternType.comfortPurchase:
        return 'Comfort Purchase';
      case PatternType.impulseControl:
        return 'Impulse Control';
      case PatternType.celebratory:
        return 'Celebratory';
      case PatternType.avoidance:
        return 'Avoidance Spending';
    }
  }

  String get icon {
    switch (this) {
      case PatternType.stressShopping:
        return '😰';
      case PatternType.rewardSeeking:
        return '🎁';
      case PatternType.boredomSpending:
        return '😐';
      case PatternType.socialPressure:
        return '👥';
      case PatternType.comfortPurchase:
        return '🛋️';
      case PatternType.impulseControl:
        return '⚡';
      case PatternType.celebratory:
        return '🎉';
      case PatternType.avoidance:
        return '🙈';
    }
  }
}

/// Types of emotional triggers
enum TriggerType {
  timeOfDay,
  dayOfWeek,
  payDay,
  weatherRelated,
  socialEvent,
  workStress,
  relationship,
  health,
  seasonal,
}

extension TriggerTypeExtension on TriggerType {
  String get displayName {
    switch (this) {
      case TriggerType.timeOfDay:
        return 'Time of Day';
      case TriggerType.dayOfWeek:
        return 'Day of Week';
      case TriggerType.payDay:
        return 'Pay Day';
      case TriggerType.weatherRelated:
        return 'Weather Related';
      case TriggerType.socialEvent:
        return 'Social Event';
      case TriggerType.workStress:
        return 'Work Stress';
      case TriggerType.relationship:
        return 'Relationship';
      case TriggerType.health:
        return 'Health Related';
      case TriggerType.seasonal:
        return 'Seasonal';
    }
  }
}
