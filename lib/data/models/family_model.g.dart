// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FamilyGroupImpl _$$FamilyGroupImplFromJson(Map<String, dynamic> json) =>
    _$FamilyGroupImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      adminUserId: json['adminUserId'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => FamilyMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      settings: FamilySettings.fromJson(
        json['settings'] as Map<String, dynamic>,
      ),
      sharedBudgets:
          (json['sharedBudgets'] as List<dynamic>?)
              ?.map((e) => SharedBudget.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      goals:
          (json['goals'] as List<dynamic>?)
              ?.map((e) => FamilyGoal.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      allowances:
          (json['allowances'] as List<dynamic>?)
              ?.map((e) => Allowance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FamilyGroupImplToJson(_$FamilyGroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adminUserId': instance.adminUserId,
      'members': instance.members,
      'settings': instance.settings,
      'sharedBudgets': instance.sharedBudgets,
      'goals': instance.goals,
      'allowances': instance.allowances,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$FamilyMemberImpl _$$FamilyMemberImplFromJson(Map<String, dynamic> json) =>
    _$FamilyMemberImpl(
      odUserId: json['odUserId'] as String,
      displayName: json['displayName'] as String,
      role: $enumDecode(_$FamilyRoleEnumMap, json['role']),
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      avatarUrl: json['avatarUrl'] as String?,
      email: json['email'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      visibleCategories:
          (json['visibleCategories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      monthlyAllowance: (json['monthlyAllowance'] as num?)?.toDouble(),
      spentThisMonth: (json['spentThisMonth'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$FamilyMemberImplToJson(_$FamilyMemberImpl instance) =>
    <String, dynamic>{
      'odUserId': instance.odUserId,
      'displayName': instance.displayName,
      'role': _$FamilyRoleEnumMap[instance.role]!,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'avatarUrl': instance.avatarUrl,
      'email': instance.email,
      'isActive': instance.isActive,
      'visibleCategories': instance.visibleCategories,
      'monthlyAllowance': instance.monthlyAllowance,
      'spentThisMonth': instance.spentThisMonth,
    };

const _$FamilyRoleEnumMap = {
  FamilyRole.admin: 'admin',
  FamilyRole.adult: 'adult',
  FamilyRole.teen: 'teen',
  FamilyRole.child: 'child',
  FamilyRole.viewer: 'viewer',
};

_$FamilySettingsImpl _$$FamilySettingsImplFromJson(Map<String, dynamic> json) =>
    _$FamilySettingsImpl(
      allowSharedBudgets: json['allowSharedBudgets'] as bool? ?? true,
      allowSharedGoals: json['allowSharedGoals'] as bool? ?? true,
      showIndividualSpending: json['showIndividualSpending'] as bool? ?? false,
      enableAllowances: json['enableAllowances'] as bool? ?? true,
      notifyOnLargeSpending: json['notifyOnLargeSpending'] as bool? ?? true,
      largeSpendingThreshold: (json['largeSpendingThreshold'] as num?)
          ?.toDouble(),
      currency: json['currency'] as String? ?? 'USD',
    );

Map<String, dynamic> _$$FamilySettingsImplToJson(
  _$FamilySettingsImpl instance,
) => <String, dynamic>{
  'allowSharedBudgets': instance.allowSharedBudgets,
  'allowSharedGoals': instance.allowSharedGoals,
  'showIndividualSpending': instance.showIndividualSpending,
  'enableAllowances': instance.enableAllowances,
  'notifyOnLargeSpending': instance.notifyOnLargeSpending,
  'largeSpendingThreshold': instance.largeSpendingThreshold,
  'currency': instance.currency,
};

_$SharedBudgetImpl _$$SharedBudgetImplFromJson(Map<String, dynamic> json) =>
    _$SharedBudgetImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      category: $enumDecode(_$CategoryTypeEnumMap, json['category']),
      limit: (json['limit'] as num).toDouble(),
      spent: (json['spent'] as num).toDouble(),
      period: $enumDecode(_$BudgetPeriodEnumMap, json['period']),
      memberIds: (json['memberIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$SharedBudgetImplToJson(_$SharedBudgetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': _$CategoryTypeEnumMap[instance.category]!,
      'limit': instance.limit,
      'spent': instance.spent,
      'period': _$BudgetPeriodEnumMap[instance.period]!,
      'memberIds': instance.memberIds,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };

const _$CategoryTypeEnumMap = {
  CategoryType.salary: 'salary',
  CategoryType.freelance: 'freelance',
  CategoryType.investments: 'investments',
  CategoryType.otherIncome: 'otherIncome',
  CategoryType.rentMortgage: 'rentMortgage',
  CategoryType.utilities: 'utilities',
  CategoryType.maintenance: 'maintenance',
  CategoryType.phoneAndInternet: 'phoneAndInternet',
  CategoryType.fuel: 'fuel',
  CategoryType.publicTransit: 'publicTransit',
  CategoryType.rideShare: 'rideShare',
  CategoryType.carPayment: 'carPayment',
  CategoryType.groceries: 'groceries',
  CategoryType.restaurants: 'restaurants',
  CategoryType.coffeeShops: 'coffeeShops',
  CategoryType.foodDelivery: 'foodDelivery',
  CategoryType.clothing: 'clothing',
  CategoryType.electronics: 'electronics',
  CategoryType.homeGoods: 'homeGoods',
  CategoryType.onlineShopping: 'onlineShopping',
  CategoryType.streamingServices: 'streamingServices',
  CategoryType.gaming: 'gaming',
  CategoryType.eventsAndConcerts: 'eventsAndConcerts',
  CategoryType.hobbies: 'hobbies',
  CategoryType.medical: 'medical',
  CategoryType.pharmacy: 'pharmacy',
  CategoryType.fitness: 'fitness',
  CategoryType.mentalHealth: 'mentalHealth',
  CategoryType.personalCare: 'personalCare',
  CategoryType.investmentContributions: 'investmentContributions',
  CategoryType.fees: 'fees',
  CategoryType.insurance: 'insurance',
  CategoryType.taxes: 'taxes',
  CategoryType.savings: 'savings',
  CategoryType.gifts: 'gifts',
  CategoryType.charity: 'charity',
  CategoryType.education: 'education',
  CategoryType.miscellaneous: 'miscellaneous',
};

const _$BudgetPeriodEnumMap = {
  BudgetPeriod.daily: 'daily',
  BudgetPeriod.weekly: 'weekly',
  BudgetPeriod.biWeekly: 'biWeekly',
  BudgetPeriod.monthly: 'monthly',
  BudgetPeriod.quarterly: 'quarterly',
  BudgetPeriod.yearly: 'yearly',
  BudgetPeriod.custom: 'custom',
};

_$FamilyGoalImpl _$$FamilyGoalImplFromJson(Map<String, dynamic> json) =>
    _$FamilyGoalImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      targetAmount: (json['targetAmount'] as num).toDouble(),
      currentAmount: (json['currentAmount'] as num).toDouble(),
      targetDate: DateTime.parse(json['targetDate'] as String),
      status: $enumDecode(_$FamilyGoalStatusEnumMap, json['status']),
      contributions: (json['contributions'] as List<dynamic>)
          .map((e) => GoalContribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      icon: json['icon'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$FamilyGoalImplToJson(_$FamilyGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'targetAmount': instance.targetAmount,
      'currentAmount': instance.currentAmount,
      'targetDate': instance.targetDate.toIso8601String(),
      'status': _$FamilyGoalStatusEnumMap[instance.status]!,
      'contributions': instance.contributions,
      'icon': instance.icon,
      'imageUrl': instance.imageUrl,
    };

const _$FamilyGoalStatusEnumMap = {
  FamilyGoalStatus.active: 'active',
  FamilyGoalStatus.completed: 'completed',
  FamilyGoalStatus.paused: 'paused',
  FamilyGoalStatus.cancelled: 'cancelled',
};

_$GoalContributionImpl _$$GoalContributionImplFromJson(
  Map<String, dynamic> json,
) => _$GoalContributionImpl(
  odUserId: json['odUserId'] as String,
  displayName: json['displayName'] as String,
  amount: (json['amount'] as num).toDouble(),
  date: DateTime.parse(json['date'] as String),
  note: json['note'] as String?,
);

Map<String, dynamic> _$$GoalContributionImplToJson(
  _$GoalContributionImpl instance,
) => <String, dynamic>{
  'odUserId': instance.odUserId,
  'displayName': instance.displayName,
  'amount': instance.amount,
  'date': instance.date.toIso8601String(),
  'note': instance.note,
};

_$AllowanceImpl _$$AllowanceImplFromJson(Map<String, dynamic> json) =>
    _$AllowanceImpl(
      id: json['id'] as String,
      recipientUserId: json['recipientUserId'] as String,
      recipientName: json['recipientName'] as String,
      amount: (json['amount'] as num).toDouble(),
      frequency: $enumDecode(_$AllowanceFrequencyEnumMap, json['frequency']),
      nextPaymentDate: DateTime.parse(json['nextPaymentDate'] as String),
      isActive: json['isActive'] as bool? ?? true,
      rules:
          (json['rules'] as List<dynamic>?)
              ?.map((e) => AllowanceRule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastPaidDate: json['lastPaidDate'] == null
          ? null
          : DateTime.parse(json['lastPaidDate'] as String),
      spentThisPeriod: (json['spentThisPeriod'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AllowanceImplToJson(_$AllowanceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipientUserId': instance.recipientUserId,
      'recipientName': instance.recipientName,
      'amount': instance.amount,
      'frequency': _$AllowanceFrequencyEnumMap[instance.frequency]!,
      'nextPaymentDate': instance.nextPaymentDate.toIso8601String(),
      'isActive': instance.isActive,
      'rules': instance.rules,
      'lastPaidDate': instance.lastPaidDate?.toIso8601String(),
      'spentThisPeriod': instance.spentThisPeriod,
    };

const _$AllowanceFrequencyEnumMap = {
  AllowanceFrequency.daily: 'daily',
  AllowanceFrequency.weekly: 'weekly',
  AllowanceFrequency.biWeekly: 'biWeekly',
  AllowanceFrequency.monthly: 'monthly',
};

_$AllowanceRuleImpl _$$AllowanceRuleImplFromJson(Map<String, dynamic> json) =>
    _$AllowanceRuleImpl(
      id: json['id'] as String,
      type: $enumDecode(_$AllowanceRuleTypeEnumMap, json['type']),
      description: json['description'] as String,
      restrictedCategory: $enumDecodeNullable(
        _$CategoryTypeEnumMap,
        json['restrictedCategory'],
      ),
      maxSinglePurchase: (json['maxSinglePurchase'] as num?)?.toDouble(),
      requiresApproval: json['requiresApproval'] as bool?,
    );

Map<String, dynamic> _$$AllowanceRuleImplToJson(_$AllowanceRuleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$AllowanceRuleTypeEnumMap[instance.type]!,
      'description': instance.description,
      'restrictedCategory': _$CategoryTypeEnumMap[instance.restrictedCategory],
      'maxSinglePurchase': instance.maxSinglePurchase,
      'requiresApproval': instance.requiresApproval,
    };

const _$AllowanceRuleTypeEnumMap = {
  AllowanceRuleType.categoryRestriction: 'categoryRestriction',
  AllowanceRuleType.spendingLimit: 'spendingLimit',
  AllowanceRuleType.approvalRequired: 'approvalRequired',
  AllowanceRuleType.savingsMinimum: 'savingsMinimum',
};

_$FamilyActivityImpl _$$FamilyActivityImplFromJson(Map<String, dynamic> json) =>
    _$FamilyActivityImpl(
      id: json['id'] as String,
      familyId: json['familyId'] as String,
      memberUserId: json['memberUserId'] as String,
      memberName: json['memberName'] as String,
      type: $enumDecode(_$FamilyActivityTypeEnumMap, json['type']),
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      amount: (json['amount'] as num?)?.toDouble(),
      relatedId: json['relatedId'] as String?,
    );

Map<String, dynamic> _$$FamilyActivityImplToJson(
  _$FamilyActivityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'familyId': instance.familyId,
  'memberUserId': instance.memberUserId,
  'memberName': instance.memberName,
  'type': _$FamilyActivityTypeEnumMap[instance.type]!,
  'description': instance.description,
  'timestamp': instance.timestamp.toIso8601String(),
  'amount': instance.amount,
  'relatedId': instance.relatedId,
};

const _$FamilyActivityTypeEnumMap = {
  FamilyActivityType.goalContribution: 'goalContribution',
  FamilyActivityType.budgetUpdate: 'budgetUpdate',
  FamilyActivityType.allowanceReceived: 'allowanceReceived',
  FamilyActivityType.allowanceSpent: 'allowanceSpent',
  FamilyActivityType.memberJoined: 'memberJoined',
  FamilyActivityType.goalCompleted: 'goalCompleted',
  FamilyActivityType.sharedExpense: 'sharedExpense',
};
