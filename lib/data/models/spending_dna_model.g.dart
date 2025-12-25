// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spending_dna_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SpendingDNAImpl _$$SpendingDNAImplFromJson(Map<String, dynamic> json) =>
    _$SpendingDNAImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      personality: $enumDecode(_$MoneyPersonalityEnumMap, json['personality']),
      paydayBehavior: $enumDecode(
        _$PaydayBehaviorEnumMap,
        json['paydayBehavior'],
      ),
      endOfMonthPattern: $enumDecode(
        _$EndOfMonthPatternEnumMap,
        json['endOfMonthPattern'],
      ),
      patternProfile: SpendingPatternProfile.fromJson(
        json['patternProfile'] as Map<String, dynamic>,
      ),
      traits: (json['traits'] as List<dynamic>)
          .map((e) => BehavioralTrait.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryAffinities: (json['categoryAffinities'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, (e as num).toDouble())),
      financialHealthScore: (json['financialHealthScore'] as num).toDouble(),
      consistencyScore: (json['consistencyScore'] as num).toDouble(),
      savingsRate: (json['savingsRate'] as num).toDouble(),
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$SpendingDNAImplToJson(
  _$SpendingDNAImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'personality': _$MoneyPersonalityEnumMap[instance.personality]!,
  'paydayBehavior': _$PaydayBehaviorEnumMap[instance.paydayBehavior]!,
  'endOfMonthPattern': _$EndOfMonthPatternEnumMap[instance.endOfMonthPattern]!,
  'patternProfile': instance.patternProfile,
  'traits': instance.traits,
  'categoryAffinities': instance.categoryAffinities,
  'financialHealthScore': instance.financialHealthScore,
  'consistencyScore': instance.consistencyScore,
  'savingsRate': instance.savingsRate,
  'lastUpdated': instance.lastUpdated?.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$MoneyPersonalityEnumMap = {
  MoneyPersonality.planner: 'planner',
  MoneyPersonality.spontaneous: 'spontaneous',
  MoneyPersonality.anxiousSaver: 'anxiousSaver',
  MoneyPersonality.carefree: 'carefree',
  MoneyPersonality.optimizer: 'optimizer',
};

const _$PaydayBehaviorEnumMap = {
  PaydayBehavior.spender: 'spender',
  PaydayBehavior.saver: 'saver',
  PaydayBehavior.balanced: 'balanced',
};

const _$EndOfMonthPatternEnumMap = {
  EndOfMonthPattern.tight: 'tight',
  EndOfMonthPattern.stable: 'stable',
  EndOfMonthPattern.splurge: 'splurge',
};

_$SpendingPatternProfileImpl _$$SpendingPatternProfileImplFromJson(
  Map<String, dynamic> json,
) => _$SpendingPatternProfileImpl(
  avgDailySpend: (json['avgDailySpend'] as num).toDouble(),
  avgWeekendSpend: (json['avgWeekendSpend'] as num).toDouble(),
  avgWeekdaySpend: (json['avgWeekdaySpend'] as num).toDouble(),
  spendingVariance: (json['spendingVariance'] as num).toDouble(),
  peakSpendingDay: json['peakSpendingDay'] as String,
  peakSpendingTime: json['peakSpendingTime'] as String,
  impulseSpendingRatio: (json['impulseSpendingRatio'] as num).toDouble(),
  plannedSpendingRatio: (json['plannedSpendingRatio'] as num).toDouble(),
  hourlySpendingPattern: (json['hourlySpendingPattern'] as Map<String, dynamic>)
      .map((k, e) => MapEntry(k, (e as num).toDouble())),
  weeklySpendingPattern: (json['weeklySpendingPattern'] as Map<String, dynamic>)
      .map((k, e) => MapEntry(k, (e as num).toDouble())),
  monthlySpendingPattern:
      (json['monthlySpendingPattern'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
);

Map<String, dynamic> _$$SpendingPatternProfileImplToJson(
  _$SpendingPatternProfileImpl instance,
) => <String, dynamic>{
  'avgDailySpend': instance.avgDailySpend,
  'avgWeekendSpend': instance.avgWeekendSpend,
  'avgWeekdaySpend': instance.avgWeekdaySpend,
  'spendingVariance': instance.spendingVariance,
  'peakSpendingDay': instance.peakSpendingDay,
  'peakSpendingTime': instance.peakSpendingTime,
  'impulseSpendingRatio': instance.impulseSpendingRatio,
  'plannedSpendingRatio': instance.plannedSpendingRatio,
  'hourlySpendingPattern': instance.hourlySpendingPattern,
  'weeklySpendingPattern': instance.weeklySpendingPattern,
  'monthlySpendingPattern': instance.monthlySpendingPattern,
};

_$BehavioralTraitImpl _$$BehavioralTraitImplFromJson(
  Map<String, dynamic> json,
) => _$BehavioralTraitImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  category: $enumDecode(_$TraitCategoryEnumMap, json['category']),
  score: (json['score'] as num).toDouble(),
  impact: $enumDecode(_$TraitImpactEnumMap, json['impact']),
  recommendation: json['recommendation'] as String?,
);

Map<String, dynamic> _$$BehavioralTraitImplToJson(
  _$BehavioralTraitImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'category': _$TraitCategoryEnumMap[instance.category]!,
  'score': instance.score,
  'impact': _$TraitImpactEnumMap[instance.impact]!,
  'recommendation': instance.recommendation,
};

const _$TraitCategoryEnumMap = {
  TraitCategory.spending: 'spending',
  TraitCategory.saving: 'saving',
  TraitCategory.planning: 'planning',
  TraitCategory.impulse: 'impulse',
  TraitCategory.social: 'social',
  TraitCategory.timing: 'timing',
};

const _$TraitImpactEnumMap = {
  TraitImpact.positive: 'positive',
  TraitImpact.negative: 'negative',
  TraitImpact.neutral: 'neutral',
};

_$DNAComparisonImpl _$$DNAComparisonImplFromJson(Map<String, dynamic> json) =>
    _$DNAComparisonImpl(
      similarityScore: (json['similarityScore'] as num).toDouble(),
      anomalies: (json['anomalies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isSuspicious: json['isSuspicious'] as bool,
      comparisonPeriod: json['comparisonPeriod'] as String,
      categoryDeviations: (json['categoryDeviations'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, (e as num).toDouble())),
      timeDeviations: (json['timeDeviations'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$DNAComparisonImplToJson(_$DNAComparisonImpl instance) =>
    <String, dynamic>{
      'similarityScore': instance.similarityScore,
      'anomalies': instance.anomalies,
      'isSuspicious': instance.isSuspicious,
      'comparisonPeriod': instance.comparisonPeriod,
      'categoryDeviations': instance.categoryDeviations,
      'timeDeviations': instance.timeDeviations,
    };
