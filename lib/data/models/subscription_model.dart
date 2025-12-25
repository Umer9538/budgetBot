import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/enums.dart';

part 'subscription_model.freezed.dart';
part 'subscription_model.g.dart';

/// Model for subscription tracking
@freezed
class Subscription with _$Subscription {
  const factory Subscription({
    required String id,
    required String userId,
    required String name,
    required double amount,
    required BillingFrequency frequency,
    required SubscriptionStatus status,
    required CategoryType category,
    DateTime? startDate,
    DateTime? nextBillingDate,
    DateTime? lastUsedDate,
    String? merchantName,
    String? logoUrl,
    String? description,
    @Default(DecayStatus.active) DecayStatus decayStatus,
    double? usageScore, // 0-100
    int? usageCount, // times used in billing period
    bool? autoDetected,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Subscription;

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

/// Subscription decay analysis result
@freezed
class SubscriptionDecayAnalysis with _$SubscriptionDecayAnalysis {
  const factory SubscriptionDecayAnalysis({
    required String id,
    required String userId,
    required DateTime analysisDate,
    required List<SubscriptionDecayItem> items,
    required double totalMonthlySpend,
    required double wastedMonthlySpend,
    required double potentialSavings,
    required int totalSubscriptions,
    required int atRiskSubscriptions,
    required int abandonedSubscriptions,
    @Default([]) List<String> recommendations,
    DateTime? createdAt,
  }) = _SubscriptionDecayAnalysis;

  factory SubscriptionDecayAnalysis.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDecayAnalysisFromJson(json);
}

/// Individual subscription decay item
@freezed
class SubscriptionDecayItem with _$SubscriptionDecayItem {
  const factory SubscriptionDecayItem({
    required Subscription subscription,
    required DecayStatus decayStatus,
    required double usageScore,
    required double valueScore, // cost vs usage ratio
    required int daysSinceLastUse,
    required double monthlyEquivalent,
    required String recommendation,
    @Default([]) List<String> alternatives,
    bool? shouldCancel,
    bool? shouldDowngrade,
  }) = _SubscriptionDecayItem;

  factory SubscriptionDecayItem.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDecayItemFromJson(json);
}

/// Known subscription templates for auto-detection
@freezed
class SubscriptionTemplate with _$SubscriptionTemplate {
  const factory SubscriptionTemplate({
    required String name,
    required List<String> merchantPatterns,
    required CategoryType category,
    required BillingFrequency typicalFrequency,
    String? logoUrl,
    double? typicalPrice,
  }) = _SubscriptionTemplate;

  factory SubscriptionTemplate.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionTemplateFromJson(json);
}
