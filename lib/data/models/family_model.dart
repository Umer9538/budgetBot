import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/enums.dart';

part 'family_model.freezed.dart';
part 'family_model.g.dart';

/// Model for Family Financial Mesh
@freezed
class FamilyGroup with _$FamilyGroup {
  const factory FamilyGroup({
    required String id,
    required String name,
    required String adminUserId,
    required List<FamilyMember> members,
    required FamilySettings settings,
    @Default([]) List<SharedBudget> sharedBudgets,
    @Default([]) List<FamilyGoal> goals,
    @Default([]) List<Allowance> allowances,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _FamilyGroup;

  factory FamilyGroup.fromJson(Map<String, dynamic> json) =>
      _$FamilyGroupFromJson(json);
}

/// Family member model
@freezed
class FamilyMember with _$FamilyMember {
  const factory FamilyMember({
    required String odUserId,
    required String displayName,
    required FamilyRole role,
    required DateTime joinedAt,
    String? avatarUrl,
    String? email,
    @Default(true) bool isActive,
    @Default([]) List<String> visibleCategories, // categories they can see
    double? monthlyAllowance,
    double? spentThisMonth,
  }) = _FamilyMember;

  factory FamilyMember.fromJson(Map<String, dynamic> json) =>
      _$FamilyMemberFromJson(json);
}

/// Family settings
@freezed
class FamilySettings with _$FamilySettings {
  const factory FamilySettings({
    @Default(true) bool allowSharedBudgets,
    @Default(true) bool allowSharedGoals,
    @Default(false) bool showIndividualSpending,
    @Default(true) bool enableAllowances,
    @Default(true) bool notifyOnLargeSpending,
    double? largeSpendingThreshold,
    @Default('USD') String currency,
  }) = _FamilySettings;

  factory FamilySettings.fromJson(Map<String, dynamic> json) =>
      _$FamilySettingsFromJson(json);
}

/// Shared budget within family
@freezed
class SharedBudget with _$SharedBudget {
  const factory SharedBudget({
    required String id,
    required String name,
    required CategoryType category,
    required double limit,
    required double spent,
    required BudgetPeriod period,
    required List<String> memberIds, // who contributes
    DateTime? startDate,
    DateTime? endDate,
  }) = _SharedBudget;

  factory SharedBudget.fromJson(Map<String, dynamic> json) =>
      _$SharedBudgetFromJson(json);
}

/// Family financial goal
@freezed
class FamilyGoal with _$FamilyGoal {
  const factory FamilyGoal({
    required String id,
    required String title,
    required String description,
    required double targetAmount,
    required double currentAmount,
    required DateTime targetDate,
    required FamilyGoalStatus status,
    required List<GoalContribution> contributions,
    String? icon,
    String? imageUrl,
  }) = _FamilyGoal;

  factory FamilyGoal.fromJson(Map<String, dynamic> json) =>
      _$FamilyGoalFromJson(json);
}

enum FamilyGoalStatus {
  active,
  completed,
  paused,
  cancelled,
}

extension FamilyGoalStatusExtension on FamilyGoalStatus {
  String get displayName {
    switch (this) {
      case FamilyGoalStatus.active:
        return 'Active';
      case FamilyGoalStatus.completed:
        return 'Completed';
      case FamilyGoalStatus.paused:
        return 'Paused';
      case FamilyGoalStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get icon {
    switch (this) {
      case FamilyGoalStatus.active:
        return '🎯';
      case FamilyGoalStatus.completed:
        return '✅';
      case FamilyGoalStatus.paused:
        return '⏸️';
      case FamilyGoalStatus.cancelled:
        return '❌';
    }
  }
}

/// Goal contribution from a member
@freezed
class GoalContribution with _$GoalContribution {
  const factory GoalContribution({
    required String odUserId,
    required String displayName,
    required double amount,
    required DateTime date,
    String? note,
  }) = _GoalContribution;

  factory GoalContribution.fromJson(Map<String, dynamic> json) =>
      _$GoalContributionFromJson(json);
}

/// Allowance for kids/teens
@freezed
class Allowance with _$Allowance {
  const factory Allowance({
    required String id,
    required String recipientUserId,
    required String recipientName,
    required double amount,
    required AllowanceFrequency frequency,
    required DateTime nextPaymentDate,
    @Default(true) bool isActive,
    @Default([]) List<AllowanceRule> rules,
    DateTime? lastPaidDate,
    double? spentThisPeriod,
  }) = _Allowance;

  factory Allowance.fromJson(Map<String, dynamic> json) =>
      _$AllowanceFromJson(json);
}

enum AllowanceFrequency {
  daily,
  weekly,
  biWeekly,
  monthly,
}

extension AllowanceFrequencyExtension on AllowanceFrequency {
  String get displayName {
    switch (this) {
      case AllowanceFrequency.daily:
        return 'Daily';
      case AllowanceFrequency.weekly:
        return 'Weekly';
      case AllowanceFrequency.biWeekly:
        return 'Bi-Weekly';
      case AllowanceFrequency.monthly:
        return 'Monthly';
    }
  }
}

/// Allowance spending rules
@freezed
class AllowanceRule with _$AllowanceRule {
  const factory AllowanceRule({
    required String id,
    required AllowanceRuleType type,
    required String description,
    CategoryType? restrictedCategory,
    double? maxSinglePurchase,
    bool? requiresApproval,
  }) = _AllowanceRule;

  factory AllowanceRule.fromJson(Map<String, dynamic> json) =>
      _$AllowanceRuleFromJson(json);
}

enum AllowanceRuleType {
  categoryRestriction,
  spendingLimit,
  approvalRequired,
  savingsMinimum,
}

extension AllowanceRuleTypeExtension on AllowanceRuleType {
  String get displayName {
    switch (this) {
      case AllowanceRuleType.categoryRestriction:
        return 'Category Restriction';
      case AllowanceRuleType.spendingLimit:
        return 'Spending Limit';
      case AllowanceRuleType.approvalRequired:
        return 'Approval Required';
      case AllowanceRuleType.savingsMinimum:
        return 'Savings Minimum';
    }
  }
}

/// Family activity feed item
@freezed
class FamilyActivity with _$FamilyActivity {
  const factory FamilyActivity({
    required String id,
    required String familyId,
    required String memberUserId,
    required String memberName,
    required FamilyActivityType type,
    required String description,
    required DateTime timestamp,
    double? amount,
    String? relatedId, // budget, goal, transaction ID
  }) = _FamilyActivity;

  factory FamilyActivity.fromJson(Map<String, dynamic> json) =>
      _$FamilyActivityFromJson(json);
}

enum FamilyActivityType {
  goalContribution,
  budgetUpdate,
  allowanceReceived,
  allowanceSpent,
  memberJoined,
  goalCompleted,
  sharedExpense,
}

extension FamilyActivityTypeExtension on FamilyActivityType {
  String get icon {
    switch (this) {
      case FamilyActivityType.goalContribution:
        return '💰';
      case FamilyActivityType.budgetUpdate:
        return '📊';
      case FamilyActivityType.allowanceReceived:
        return '🎁';
      case FamilyActivityType.allowanceSpent:
        return '🛍️';
      case FamilyActivityType.memberJoined:
        return '👋';
      case FamilyActivityType.goalCompleted:
        return '🎉';
      case FamilyActivityType.sharedExpense:
        return '👥';
    }
  }
}
