import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/enums.dart';

part 'spending_dna_model.freezed.dart';
part 'spending_dna_model.g.dart';

/// Model for Spending DNA (unique behavioral fingerprint)
@freezed
class SpendingDNA with _$SpendingDNA {
  const factory SpendingDNA({
    required String id,
    required String userId,
    required MoneyPersonality personality,
    required PaydayBehavior paydayBehavior,
    required EndOfMonthPattern endOfMonthPattern,
    required SpendingPatternProfile patternProfile,
    required List<BehavioralTrait> traits,
    required Map<String, double> categoryAffinities, // category -> score 0-100
    required double financialHealthScore, // 0-100
    required double consistencyScore, // 0-100
    required double savingsRate, // percentage
    DateTime? lastUpdated,
    DateTime? createdAt,
  }) = _SpendingDNA;

  factory SpendingDNA.fromJson(Map<String, dynamic> json) =>
      _$SpendingDNAFromJson(json);
}

/// Spending pattern profile with detailed metrics
@freezed
class SpendingPatternProfile with _$SpendingPatternProfile {
  const factory SpendingPatternProfile({
    required double avgDailySpend,
    required double avgWeekendSpend,
    required double avgWeekdaySpend,
    required double spendingVariance,
    required String peakSpendingDay, // day of week
    required String peakSpendingTime, // time of day
    required double impulseSpendingRatio, // 0-1
    required double plannedSpendingRatio, // 0-1
    required Map<String, double> hourlySpendingPattern, // hour -> avg spend
    required Map<String, double> weeklySpendingPattern, // day -> avg spend
    required Map<String, double> monthlySpendingPattern, // week -> avg spend
  }) = _SpendingPatternProfile;

  factory SpendingPatternProfile.fromJson(Map<String, dynamic> json) =>
      _$SpendingPatternProfileFromJson(json);
}

/// Individual behavioral trait
@freezed
class BehavioralTrait with _$BehavioralTrait {
  const factory BehavioralTrait({
    required String id,
    required String name,
    required String description,
    required TraitCategory category,
    required double score, // 0-100
    required TraitImpact impact, // positive, negative, neutral
    String? recommendation,
  }) = _BehavioralTrait;

  factory BehavioralTrait.fromJson(Map<String, dynamic> json) =>
      _$BehavioralTraitFromJson(json);
}

enum TraitCategory {
  spending,
  saving,
  planning,
  impulse,
  social,
  timing,
}

extension TraitCategoryExtension on TraitCategory {
  String get displayName {
    switch (this) {
      case TraitCategory.spending:
        return 'Spending Habits';
      case TraitCategory.saving:
        return 'Saving Habits';
      case TraitCategory.planning:
        return 'Planning';
      case TraitCategory.impulse:
        return 'Impulse Control';
      case TraitCategory.social:
        return 'Social Spending';
      case TraitCategory.timing:
        return 'Timing Patterns';
    }
  }
}

enum TraitImpact {
  positive,
  negative,
  neutral,
}

extension TraitImpactExtension on TraitImpact {
  String get icon {
    switch (this) {
      case TraitImpact.positive:
        return '✅';
      case TraitImpact.negative:
        return '⚠️';
      case TraitImpact.neutral:
        return '➖';
    }
  }
}

/// DNA comparison for fraud detection or anomaly
@freezed
class DNAComparison with _$DNAComparison {
  const factory DNAComparison({
    required double similarityScore, // 0-100
    required List<String> anomalies,
    required bool isSuspicious,
    required String comparisonPeriod,
    Map<String, double>? categoryDeviations,
    Map<String, double>? timeDeviations,
  }) = _DNAComparison;

  factory DNAComparison.fromJson(Map<String, dynamic> json) =>
      _$DNAComparisonFromJson(json);
}
