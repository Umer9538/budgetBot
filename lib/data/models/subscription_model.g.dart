// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionImpl _$$SubscriptionImplFromJson(Map<String, dynamic> json) =>
    _$SubscriptionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      frequency: $enumDecode(_$BillingFrequencyEnumMap, json['frequency']),
      status: $enumDecode(_$SubscriptionStatusEnumMap, json['status']),
      category: $enumDecode(_$CategoryTypeEnumMap, json['category']),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      nextBillingDate: json['nextBillingDate'] == null
          ? null
          : DateTime.parse(json['nextBillingDate'] as String),
      lastUsedDate: json['lastUsedDate'] == null
          ? null
          : DateTime.parse(json['lastUsedDate'] as String),
      merchantName: json['merchantName'] as String?,
      logoUrl: json['logoUrl'] as String?,
      description: json['description'] as String?,
      decayStatus:
          $enumDecodeNullable(_$DecayStatusEnumMap, json['decayStatus']) ??
          DecayStatus.active,
      usageScore: (json['usageScore'] as num?)?.toDouble(),
      usageCount: (json['usageCount'] as num?)?.toInt(),
      autoDetected: json['autoDetected'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SubscriptionImplToJson(_$SubscriptionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'amount': instance.amount,
      'frequency': _$BillingFrequencyEnumMap[instance.frequency]!,
      'status': _$SubscriptionStatusEnumMap[instance.status]!,
      'category': _$CategoryTypeEnumMap[instance.category]!,
      'startDate': instance.startDate?.toIso8601String(),
      'nextBillingDate': instance.nextBillingDate?.toIso8601String(),
      'lastUsedDate': instance.lastUsedDate?.toIso8601String(),
      'merchantName': instance.merchantName,
      'logoUrl': instance.logoUrl,
      'description': instance.description,
      'decayStatus': _$DecayStatusEnumMap[instance.decayStatus]!,
      'usageScore': instance.usageScore,
      'usageCount': instance.usageCount,
      'autoDetected': instance.autoDetected,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$BillingFrequencyEnumMap = {
  BillingFrequency.weekly: 'weekly',
  BillingFrequency.monthly: 'monthly',
  BillingFrequency.quarterly: 'quarterly',
  BillingFrequency.yearly: 'yearly',
  BillingFrequency.oneTime: 'oneTime',
};

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.active: 'active',
  SubscriptionStatus.paused: 'paused',
  SubscriptionStatus.cancelled: 'cancelled',
  SubscriptionStatus.expiring: 'expiring',
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

const _$DecayStatusEnumMap = {
  DecayStatus.active: 'active',
  DecayStatus.declining: 'declining',
  DecayStatus.dormant: 'dormant',
  DecayStatus.abandoned: 'abandoned',
};

_$SubscriptionDecayAnalysisImpl _$$SubscriptionDecayAnalysisImplFromJson(
  Map<String, dynamic> json,
) => _$SubscriptionDecayAnalysisImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  analysisDate: DateTime.parse(json['analysisDate'] as String),
  items: (json['items'] as List<dynamic>)
      .map((e) => SubscriptionDecayItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalMonthlySpend: (json['totalMonthlySpend'] as num).toDouble(),
  wastedMonthlySpend: (json['wastedMonthlySpend'] as num).toDouble(),
  potentialSavings: (json['potentialSavings'] as num).toDouble(),
  totalSubscriptions: (json['totalSubscriptions'] as num).toInt(),
  atRiskSubscriptions: (json['atRiskSubscriptions'] as num).toInt(),
  abandonedSubscriptions: (json['abandonedSubscriptions'] as num).toInt(),
  recommendations:
      (json['recommendations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$SubscriptionDecayAnalysisImplToJson(
  _$SubscriptionDecayAnalysisImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'analysisDate': instance.analysisDate.toIso8601String(),
  'items': instance.items,
  'totalMonthlySpend': instance.totalMonthlySpend,
  'wastedMonthlySpend': instance.wastedMonthlySpend,
  'potentialSavings': instance.potentialSavings,
  'totalSubscriptions': instance.totalSubscriptions,
  'atRiskSubscriptions': instance.atRiskSubscriptions,
  'abandonedSubscriptions': instance.abandonedSubscriptions,
  'recommendations': instance.recommendations,
  'createdAt': instance.createdAt?.toIso8601String(),
};

_$SubscriptionDecayItemImpl _$$SubscriptionDecayItemImplFromJson(
  Map<String, dynamic> json,
) => _$SubscriptionDecayItemImpl(
  subscription: Subscription.fromJson(
    json['subscription'] as Map<String, dynamic>,
  ),
  decayStatus: $enumDecode(_$DecayStatusEnumMap, json['decayStatus']),
  usageScore: (json['usageScore'] as num).toDouble(),
  valueScore: (json['valueScore'] as num).toDouble(),
  daysSinceLastUse: (json['daysSinceLastUse'] as num).toInt(),
  monthlyEquivalent: (json['monthlyEquivalent'] as num).toDouble(),
  recommendation: json['recommendation'] as String,
  alternatives:
      (json['alternatives'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  shouldCancel: json['shouldCancel'] as bool?,
  shouldDowngrade: json['shouldDowngrade'] as bool?,
);

Map<String, dynamic> _$$SubscriptionDecayItemImplToJson(
  _$SubscriptionDecayItemImpl instance,
) => <String, dynamic>{
  'subscription': instance.subscription,
  'decayStatus': _$DecayStatusEnumMap[instance.decayStatus]!,
  'usageScore': instance.usageScore,
  'valueScore': instance.valueScore,
  'daysSinceLastUse': instance.daysSinceLastUse,
  'monthlyEquivalent': instance.monthlyEquivalent,
  'recommendation': instance.recommendation,
  'alternatives': instance.alternatives,
  'shouldCancel': instance.shouldCancel,
  'shouldDowngrade': instance.shouldDowngrade,
};

_$SubscriptionTemplateImpl _$$SubscriptionTemplateImplFromJson(
  Map<String, dynamic> json,
) => _$SubscriptionTemplateImpl(
  name: json['name'] as String,
  merchantPatterns: (json['merchantPatterns'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  category: $enumDecode(_$CategoryTypeEnumMap, json['category']),
  typicalFrequency: $enumDecode(
    _$BillingFrequencyEnumMap,
    json['typicalFrequency'],
  ),
  logoUrl: json['logoUrl'] as String?,
  typicalPrice: (json['typicalPrice'] as num?)?.toDouble(),
);

Map<String, dynamic> _$$SubscriptionTemplateImplToJson(
  _$SubscriptionTemplateImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'merchantPatterns': instance.merchantPatterns,
  'category': _$CategoryTypeEnumMap[instance.category]!,
  'typicalFrequency': _$BillingFrequencyEnumMap[instance.typicalFrequency]!,
  'logoUrl': instance.logoUrl,
  'typicalPrice': instance.typicalPrice,
};
