// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetModelImpl _$$BudgetModelImplFromJson(Map<String, dynamic> json) =>
    _$BudgetModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      category: $enumDecode(_$CategoryTypeEnumMap, json['category']),
      amount: (json['amount'] as num).toDouble(),
      period: $enumDecode(_$BudgetPeriodEnumMap, json['period']),
      startDate: _timestampFromJsonRequired(json['startDate']),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      rollover: json['rollover'] as bool? ?? false,
      rolloverAmount: (json['rolloverAmount'] as num?)?.toDouble() ?? 0.0,
      spent: (json['spent'] as num?)?.toDouble() ?? 0.0,
      alertThresholds:
          (json['alertThresholds'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [0.5, 0.75, 0.9, 1.0],
      isShared: json['isShared'] as bool? ?? false,
      sharedWith:
          (json['sharedWith'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isActive: json['isActive'] as bool? ?? true,
      colorHex: json['colorHex'] as String?,
      iconName: json['iconName'] as String?,
      targetType:
          $enumDecodeNullable(_$BudgetTargetTypeEnumMap, json['targetType']) ??
          BudgetTargetType.category,
      merchantName: json['merchantName'] as String?,
      merchantPatterns:
          (json['merchantPatterns'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      templateId: json['templateId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BudgetModelImplToJson(_$BudgetModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'category': _$CategoryTypeEnumMap[instance.category]!,
      'amount': instance.amount,
      'period': _$BudgetPeriodEnumMap[instance.period]!,
      'startDate': _timestampToJson(instance.startDate),
      'endDate': instance.endDate?.toIso8601String(),
      'rollover': instance.rollover,
      'rolloverAmount': instance.rolloverAmount,
      'spent': instance.spent,
      'alertThresholds': instance.alertThresholds,
      'isShared': instance.isShared,
      'sharedWith': instance.sharedWith,
      'isActive': instance.isActive,
      'colorHex': instance.colorHex,
      'iconName': instance.iconName,
      'targetType': _$BudgetTargetTypeEnumMap[instance.targetType]!,
      'merchantName': instance.merchantName,
      'merchantPatterns': instance.merchantPatterns,
      'templateId': instance.templateId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
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

const _$BudgetTargetTypeEnumMap = {
  BudgetTargetType.category: 'category',
  BudgetTargetType.merchant: 'merchant',
};
