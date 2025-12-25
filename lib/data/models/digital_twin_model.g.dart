// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_twin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinancialDigitalTwinImpl _$$FinancialDigitalTwinImplFromJson(
  Map<String, dynamic> json,
) => _$FinancialDigitalTwinImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  currentSnapshot: FinancialSnapshot.fromJson(
    json['currentSnapshot'] as Map<String, dynamic>,
  ),
  scenarios: (json['scenarios'] as List<dynamic>)
      .map((e) => SimulationScenario.fromJson(e as Map<String, dynamic>))
      .toList(),
  projectedLifeEvents: (json['projectedLifeEvents'] as List<dynamic>)
      .map((e) => LifeEvent.fromJson(e as Map<String, dynamic>))
      .toList(),
  baseProjection: TwinProjection.fromJson(
    json['baseProjection'] as Map<String, dynamic>,
  ),
  lastSimulated: DateTime.parse(json['lastSimulated'] as String),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$FinancialDigitalTwinImplToJson(
  _$FinancialDigitalTwinImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'currentSnapshot': instance.currentSnapshot,
  'scenarios': instance.scenarios,
  'projectedLifeEvents': instance.projectedLifeEvents,
  'baseProjection': instance.baseProjection,
  'lastSimulated': instance.lastSimulated.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
};

_$FinancialSnapshotImpl _$$FinancialSnapshotImplFromJson(
  Map<String, dynamic> json,
) => _$FinancialSnapshotImpl(
  currentNetWorth: (json['currentNetWorth'] as num).toDouble(),
  monthlyIncome: (json['monthlyIncome'] as num).toDouble(),
  monthlyExpenses: (json['monthlyExpenses'] as num).toDouble(),
  savingsRate: (json['savingsRate'] as num).toDouble(),
  emergencyFundMonths: (json['emergencyFundMonths'] as num).toDouble(),
  debtToIncomeRatio: (json['debtToIncomeRatio'] as num).toDouble(),
  investmentBalance: (json['investmentBalance'] as num).toDouble(),
  retirementBalance: (json['retirementBalance'] as num).toDouble(),
  assetAllocation: (json['assetAllocation'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  liabilities: (json['liabilities'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  snapshotDate: DateTime.parse(json['snapshotDate'] as String),
);

Map<String, dynamic> _$$FinancialSnapshotImplToJson(
  _$FinancialSnapshotImpl instance,
) => <String, dynamic>{
  'currentNetWorth': instance.currentNetWorth,
  'monthlyIncome': instance.monthlyIncome,
  'monthlyExpenses': instance.monthlyExpenses,
  'savingsRate': instance.savingsRate,
  'emergencyFundMonths': instance.emergencyFundMonths,
  'debtToIncomeRatio': instance.debtToIncomeRatio,
  'investmentBalance': instance.investmentBalance,
  'retirementBalance': instance.retirementBalance,
  'assetAllocation': instance.assetAllocation,
  'liabilities': instance.liabilities,
  'snapshotDate': instance.snapshotDate.toIso8601String(),
};

_$SimulationScenarioImpl _$$SimulationScenarioImplFromJson(
  Map<String, dynamic> json,
) => _$SimulationScenarioImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  type: $enumDecode(_$ScenarioTypeEnumMap, json['type']),
  parameters: (json['parameters'] as List<dynamic>)
      .map((e) => ScenarioParameter.fromJson(e as Map<String, dynamic>))
      .toList(),
  projection: TwinProjection.fromJson(
    json['projection'] as Map<String, dynamic>,
  ),
  probability: (json['probability'] as num).toDouble(),
  isUserCreated: json['isUserCreated'] as bool,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$SimulationScenarioImplToJson(
  _$SimulationScenarioImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'type': _$ScenarioTypeEnumMap[instance.type]!,
  'parameters': instance.parameters,
  'projection': instance.projection,
  'probability': instance.probability,
  'isUserCreated': instance.isUserCreated,
  'createdAt': instance.createdAt?.toIso8601String(),
};

const _$ScenarioTypeEnumMap = {
  ScenarioType.jobLoss: 'jobLoss',
  ScenarioType.jobChange: 'jobChange',
  ScenarioType.marriage: 'marriage',
  ScenarioType.divorce: 'divorce',
  ScenarioType.childBirth: 'childBirth',
  ScenarioType.homePurchase: 'homePurchase',
  ScenarioType.retirement: 'retirement',
  ScenarioType.healthEmergency: 'healthEmergency',
  ScenarioType.marketCrash: 'marketCrash',
  ScenarioType.inheritance: 'inheritance',
  ScenarioType.businessStart: 'businessStart',
  ScenarioType.relocation: 'relocation',
  ScenarioType.custom: 'custom',
};

_$ScenarioParameterImpl _$$ScenarioParameterImplFromJson(
  Map<String, dynamic> json,
) => _$ScenarioParameterImpl(
  name: json['name'] as String,
  label: json['label'] as String,
  type: $enumDecode(_$ParameterTypeEnumMap, json['type']),
  value: json['value'],
  minValue: json['minValue'],
  maxValue: json['maxValue'],
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  unit: json['unit'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$$ScenarioParameterImplToJson(
  _$ScenarioParameterImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'label': instance.label,
  'type': _$ParameterTypeEnumMap[instance.type]!,
  'value': instance.value,
  'minValue': instance.minValue,
  'maxValue': instance.maxValue,
  'options': instance.options,
  'unit': instance.unit,
  'description': instance.description,
};

const _$ParameterTypeEnumMap = {
  ParameterType.currency: 'currency',
  ParameterType.percentage: 'percentage',
  ParameterType.months: 'months',
  ParameterType.years: 'years',
  ParameterType.number: 'number',
  ParameterType.select: 'select',
  ParameterType.toggle: 'toggle',
};

_$LifeEventImpl _$$LifeEventImplFromJson(Map<String, dynamic> json) =>
    _$LifeEventImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ScenarioTypeEnumMap, json['type']),
      projectedDate: DateTime.parse(json['projectedDate'] as String),
      financialImpact: (json['financialImpact'] as num).toDouble(),
      monthlyImpact: (json['monthlyImpact'] as num).toDouble(),
      durationMonths: (json['durationMonths'] as num).toInt(),
      confidence: (json['confidence'] as num).toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$LifeEventImplToJson(_$LifeEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ScenarioTypeEnumMap[instance.type]!,
      'projectedDate': instance.projectedDate.toIso8601String(),
      'financialImpact': instance.financialImpact,
      'monthlyImpact': instance.monthlyImpact,
      'durationMonths': instance.durationMonths,
      'confidence': instance.confidence,
      'notes': instance.notes,
    };

_$TwinProjectionImpl _$$TwinProjectionImplFromJson(Map<String, dynamic> json) =>
    _$TwinProjectionImpl(
      id: json['id'] as String,
      yearsProjected: (json['yearsProjected'] as num).toInt(),
      simulationRuns: (json['simulationRuns'] as num).toInt(),
      yearlyProjections: (json['yearlyProjections'] as List<dynamic>)
          .map((e) => ProjectionYear.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestCase: ProjectionOutcome.fromJson(
        json['bestCase'] as Map<String, dynamic>,
      ),
      medianCase: ProjectionOutcome.fromJson(
        json['medianCase'] as Map<String, dynamic>,
      ),
      worstCase: ProjectionOutcome.fromJson(
        json['worstCase'] as Map<String, dynamic>,
      ),
      successProbability: (json['successProbability'] as num).toDouble(),
      ruinProbability: (json['ruinProbability'] as num).toDouble(),
      generatedAt: DateTime.parse(json['generatedAt'] as String),
    );

Map<String, dynamic> _$$TwinProjectionImplToJson(
  _$TwinProjectionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'yearsProjected': instance.yearsProjected,
  'simulationRuns': instance.simulationRuns,
  'yearlyProjections': instance.yearlyProjections,
  'bestCase': instance.bestCase,
  'medianCase': instance.medianCase,
  'worstCase': instance.worstCase,
  'successProbability': instance.successProbability,
  'ruinProbability': instance.ruinProbability,
  'generatedAt': instance.generatedAt.toIso8601String(),
};

_$ProjectionYearImpl _$$ProjectionYearImplFromJson(Map<String, dynamic> json) =>
    _$ProjectionYearImpl(
      year: (json['year'] as num).toInt(),
      medianNetWorth: (json['medianNetWorth'] as num).toDouble(),
      lowNetWorth: (json['lowNetWorth'] as num).toDouble(),
      highNetWorth: (json['highNetWorth'] as num).toDouble(),
      medianIncome: (json['medianIncome'] as num).toDouble(),
      medianExpenses: (json['medianExpenses'] as num).toDouble(),
      medianSavings: (json['medianSavings'] as num).toDouble(),
      projectedEvents: (json['projectedEvents'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ProjectionYearImplToJson(
  _$ProjectionYearImpl instance,
) => <String, dynamic>{
  'year': instance.year,
  'medianNetWorth': instance.medianNetWorth,
  'lowNetWorth': instance.lowNetWorth,
  'highNetWorth': instance.highNetWorth,
  'medianIncome': instance.medianIncome,
  'medianExpenses': instance.medianExpenses,
  'medianSavings': instance.medianSavings,
  'projectedEvents': instance.projectedEvents,
};

_$ProjectionOutcomeImpl _$$ProjectionOutcomeImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectionOutcomeImpl(
  finalNetWorth: (json['finalNetWorth'] as num).toDouble(),
  totalEarnings: (json['totalEarnings'] as num).toDouble(),
  totalSpending: (json['totalSpending'] as num).toDouble(),
  totalSaved: (json['totalSaved'] as num).toDouble(),
  investmentReturns: (json['investmentReturns'] as num).toDouble(),
  retirementAge: (json['retirementAge'] as num).toInt(),
  achievedGoals: json['achievedGoals'] as bool,
  keyMilestones: (json['keyMilestones'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$ProjectionOutcomeImplToJson(
  _$ProjectionOutcomeImpl instance,
) => <String, dynamic>{
  'finalNetWorth': instance.finalNetWorth,
  'totalEarnings': instance.totalEarnings,
  'totalSpending': instance.totalSpending,
  'totalSaved': instance.totalSaved,
  'investmentReturns': instance.investmentReturns,
  'retirementAge': instance.retirementAge,
  'achievedGoals': instance.achievedGoals,
  'keyMilestones': instance.keyMilestones,
};

_$ScenarioComparisonImpl _$$ScenarioComparisonImplFromJson(
  Map<String, dynamic> json,
) => _$ScenarioComparisonImpl(
  scenario1Id: json['scenario1Id'] as String,
  scenario2Id: json['scenario2Id'] as String,
  netWorthDifference: (json['netWorthDifference'] as num).toDouble(),
  retirementAgeDifference: (json['retirementAgeDifference'] as num).toDouble(),
  successProbabilityDifference: (json['successProbabilityDifference'] as num)
      .toDouble(),
  keyDifferences: (json['keyDifferences'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  recommendation: json['recommendation'] as String,
);

Map<String, dynamic> _$$ScenarioComparisonImplToJson(
  _$ScenarioComparisonImpl instance,
) => <String, dynamic>{
  'scenario1Id': instance.scenario1Id,
  'scenario2Id': instance.scenario2Id,
  'netWorthDifference': instance.netWorthDifference,
  'retirementAgeDifference': instance.retirementAgeDifference,
  'successProbabilityDifference': instance.successProbabilityDifference,
  'keyDifferences': instance.keyDifferences,
  'recommendation': instance.recommendation,
};
