// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carbon_wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CarbonWalletImpl _$$CarbonWalletImplFromJson(Map<String, dynamic> json) =>
    _$CarbonWalletImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      periodStart: DateTime.parse(json['periodStart'] as String),
      periodEnd: DateTime.parse(json['periodEnd'] as String),
      totalCarbonKg: (json['totalCarbonKg'] as num).toDouble(),
      offsetCarbonKg: (json['offsetCarbonKg'] as num).toDouble(),
      netCarbonKg: (json['netCarbonKg'] as num).toDouble(),
      impactLevel: $enumDecode(_$CarbonImpactLevelEnumMap, json['impactLevel']),
      categoryBreakdown: (json['categoryBreakdown'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, (e as num).toDouble())),
      topEmitters: (json['topEmitters'] as List<dynamic>)
          .map((e) => CarbonTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      comparedToAverage: (json['comparedToAverage'] as num).toDouble(),
      recommendations:
          (json['recommendations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      goals:
          (json['goals'] as List<dynamic>?)
              ?.map((e) => CarbonGoal.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CarbonWalletImplToJson(_$CarbonWalletImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'periodStart': instance.periodStart.toIso8601String(),
      'periodEnd': instance.periodEnd.toIso8601String(),
      'totalCarbonKg': instance.totalCarbonKg,
      'offsetCarbonKg': instance.offsetCarbonKg,
      'netCarbonKg': instance.netCarbonKg,
      'impactLevel': _$CarbonImpactLevelEnumMap[instance.impactLevel]!,
      'categoryBreakdown': instance.categoryBreakdown,
      'topEmitters': instance.topEmitters,
      'comparedToAverage': instance.comparedToAverage,
      'recommendations': instance.recommendations,
      'goals': instance.goals,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$CarbonImpactLevelEnumMap = {
  CarbonImpactLevel.veryLow: 'veryLow',
  CarbonImpactLevel.low: 'low',
  CarbonImpactLevel.moderate: 'moderate',
  CarbonImpactLevel.high: 'high',
  CarbonImpactLevel.veryHigh: 'veryHigh',
};

_$CarbonTransactionImpl _$$CarbonTransactionImplFromJson(
  Map<String, dynamic> json,
) => _$CarbonTransactionImpl(
  transactionId: json['transactionId'] as String,
  merchantName: json['merchantName'] as String,
  amount: (json['amount'] as num).toDouble(),
  carbonKg: (json['carbonKg'] as num).toDouble(),
  category: $enumDecode(_$CategoryTypeEnumMap, json['category']),
  date: DateTime.parse(json['date'] as String),
  alternativeSuggestion: json['alternativeSuggestion'] as String?,
  potentialSavingsKg: (json['potentialSavingsKg'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$CarbonTransactionImplToJson(
  _$CarbonTransactionImpl instance,
) => <String, dynamic>{
  'transactionId': instance.transactionId,
  'merchantName': instance.merchantName,
  'amount': instance.amount,
  'carbonKg': instance.carbonKg,
  'category': _$CategoryTypeEnumMap[instance.category]!,
  'date': instance.date.toIso8601String(),
  'alternativeSuggestion': instance.alternativeSuggestion,
  'potentialSavingsKg': instance.potentialSavingsKg,
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

_$CarbonGoalImpl _$$CarbonGoalImplFromJson(Map<String, dynamic> json) =>
    _$CarbonGoalImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      targetReductionKg: (json['targetReductionKg'] as num).toDouble(),
      currentReductionKg: (json['currentReductionKg'] as num).toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      status: $enumDecode(_$CarbonGoalStatusEnumMap, json['status']),
      category: json['category'] as String?,
      rewardPoints: (json['rewardPoints'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CarbonGoalImplToJson(_$CarbonGoalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'targetReductionKg': instance.targetReductionKg,
      'currentReductionKg': instance.currentReductionKg,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'status': _$CarbonGoalStatusEnumMap[instance.status]!,
      'category': instance.category,
      'rewardPoints': instance.rewardPoints,
    };

const _$CarbonGoalStatusEnumMap = {
  CarbonGoalStatus.active: 'active',
  CarbonGoalStatus.completed: 'completed',
  CarbonGoalStatus.failed: 'failed',
  CarbonGoalStatus.expired: 'expired',
};

_$CarbonOffsetImpl _$$CarbonOffsetImplFromJson(Map<String, dynamic> json) =>
    _$CarbonOffsetImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      amountKg: (json['amountKg'] as num).toDouble(),
      costUsd: (json['costUsd'] as num).toDouble(),
      provider: json['provider'] as String,
      projectName: json['projectName'] as String,
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      certificateUrl: json['certificateUrl'] as String?,
    );

Map<String, dynamic> _$$CarbonOffsetImplToJson(_$CarbonOffsetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amountKg': instance.amountKg,
      'costUsd': instance.costUsd,
      'provider': instance.provider,
      'projectName': instance.projectName,
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'certificateUrl': instance.certificateUrl,
    };
