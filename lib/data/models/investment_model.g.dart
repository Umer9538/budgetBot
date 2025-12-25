// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'investment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvestmentProfileImpl _$$InvestmentProfileImplFromJson(
  Map<String, dynamic> json,
) => _$InvestmentProfileImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  assessment: RiskAssessment.fromJson(
    json['assessment'] as Map<String, dynamic>,
  ),
  riskProfile: $enumDecode(_$InvestmentRiskEnumMap, json['riskProfile']),
  riskScore: (json['riskScore'] as num).toInt(),
  goals: (json['goals'] as List<dynamic>)
      .map((e) => InvestmentGoal.fromJson(e as Map<String, dynamic>))
      .toList(),
  currentPortfolio: json['currentPortfolio'] == null
      ? null
      : PortfolioAnalysis.fromJson(
          json['currentPortfolio'] as Map<String, dynamic>,
        ),
  recommendations: (json['recommendations'] as List<dynamic>)
      .map((e) => InvestmentRecommendation.fromJson(e as Map<String, dynamic>))
      .toList(),
  assessedAt: DateTime.parse(json['assessedAt'] as String),
  nextReassessmentDate: json['nextReassessmentDate'] == null
      ? null
      : DateTime.parse(json['nextReassessmentDate'] as String),
);

Map<String, dynamic> _$$InvestmentProfileImplToJson(
  _$InvestmentProfileImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'assessment': instance.assessment,
  'riskProfile': _$InvestmentRiskEnumMap[instance.riskProfile]!,
  'riskScore': instance.riskScore,
  'goals': instance.goals,
  'currentPortfolio': instance.currentPortfolio,
  'recommendations': instance.recommendations,
  'assessedAt': instance.assessedAt.toIso8601String(),
  'nextReassessmentDate': instance.nextReassessmentDate?.toIso8601String(),
};

const _$InvestmentRiskEnumMap = {
  InvestmentRisk.conservative: 'conservative',
  InvestmentRisk.moderatelyConservative: 'moderatelyConservative',
  InvestmentRisk.moderate: 'moderate',
  InvestmentRisk.moderatelyAggressive: 'moderatelyAggressive',
  InvestmentRisk.aggressive: 'aggressive',
};

_$RiskAssessmentImpl _$$RiskAssessmentImplFromJson(Map<String, dynamic> json) =>
    _$RiskAssessmentImpl(
      answers: (json['answers'] as List<dynamic>)
          .map((e) => RiskAnswer.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalScore: (json['totalScore'] as num).toInt(),
      behavioralFactors: BehavioralRiskFactors.fromJson(
        json['behavioralFactors'] as Map<String, dynamic>,
      ),
      completedAt: DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$RiskAssessmentImplToJson(
  _$RiskAssessmentImpl instance,
) => <String, dynamic>{
  'answers': instance.answers,
  'totalScore': instance.totalScore,
  'behavioralFactors': instance.behavioralFactors,
  'completedAt': instance.completedAt.toIso8601String(),
};

_$RiskAnswerImpl _$$RiskAnswerImplFromJson(Map<String, dynamic> json) =>
    _$RiskAnswerImpl(
      questionId: json['questionId'] as String,
      question: json['question'] as String,
      selectedOption: (json['selectedOption'] as num).toInt(),
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$$RiskAnswerImplToJson(_$RiskAnswerImpl instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'question': instance.question,
      'selectedOption': instance.selectedOption,
      'score': instance.score,
    };

_$RiskQuestionImpl _$$RiskQuestionImplFromJson(Map<String, dynamic> json) =>
    _$RiskQuestionImpl(
      id: json['id'] as String,
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => RiskOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      category: json['category'] as String,
    );

Map<String, dynamic> _$$RiskQuestionImplToJson(_$RiskQuestionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'options': instance.options,
      'category': instance.category,
    };

_$RiskOptionImpl _$$RiskOptionImplFromJson(Map<String, dynamic> json) =>
    _$RiskOptionImpl(
      text: json['text'] as String,
      score: (json['score'] as num).toInt(),
    );

Map<String, dynamic> _$$RiskOptionImplToJson(_$RiskOptionImpl instance) =>
    <String, dynamic>{'text': instance.text, 'score': instance.score};

_$BehavioralRiskFactorsImpl _$$BehavioralRiskFactorsImplFromJson(
  Map<String, dynamic> json,
) => _$BehavioralRiskFactorsImpl(
  incomeStability: (json['incomeStability'] as num).toDouble(),
  savingsConsistency: (json['savingsConsistency'] as num).toDouble(),
  spendingVolatility: (json['spendingVolatility'] as num).toDouble(),
  emergencyFundMonths: (json['emergencyFundMonths'] as num).toDouble(),
  debtToIncomeRatio: (json['debtToIncomeRatio'] as num).toDouble(),
  hasHighInterestDebt: json['hasHighInterestDebt'] as bool,
  adjustmentReason: json['adjustmentReason'] as String?,
);

Map<String, dynamic> _$$BehavioralRiskFactorsImplToJson(
  _$BehavioralRiskFactorsImpl instance,
) => <String, dynamic>{
  'incomeStability': instance.incomeStability,
  'savingsConsistency': instance.savingsConsistency,
  'spendingVolatility': instance.spendingVolatility,
  'emergencyFundMonths': instance.emergencyFundMonths,
  'debtToIncomeRatio': instance.debtToIncomeRatio,
  'hasHighInterestDebt': instance.hasHighInterestDebt,
  'adjustmentReason': instance.adjustmentReason,
};

_$InvestmentGoalImpl _$$InvestmentGoalImplFromJson(Map<String, dynamic> json) =>
    _$InvestmentGoalImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      targetAmount: (json['targetAmount'] as num).toDouble(),
      currentAmount: (json['currentAmount'] as num).toDouble(),
      timeHorizonYears: (json['timeHorizonYears'] as num).toInt(),
      priority: $enumDecode(_$GoalPriorityEnumMap, json['priority']),
      type: $enumDecode(_$GoalTypeEnumMap, json['type']),
      targetDate: DateTime.parse(json['targetDate'] as String),
      requiredMonthlyContribution: (json['requiredMonthlyContribution'] as num)
          .toDouble(),
      projectedValue: (json['projectedValue'] as num).toDouble(),
      isOnTrack: json['isOnTrack'] as bool,
    );

Map<String, dynamic> _$$InvestmentGoalImplToJson(
  _$InvestmentGoalImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'targetAmount': instance.targetAmount,
  'currentAmount': instance.currentAmount,
  'timeHorizonYears': instance.timeHorizonYears,
  'priority': _$GoalPriorityEnumMap[instance.priority]!,
  'type': _$GoalTypeEnumMap[instance.type]!,
  'targetDate': instance.targetDate.toIso8601String(),
  'requiredMonthlyContribution': instance.requiredMonthlyContribution,
  'projectedValue': instance.projectedValue,
  'isOnTrack': instance.isOnTrack,
};

const _$GoalPriorityEnumMap = {
  GoalPriority.essential: 'essential',
  GoalPriority.important: 'important',
  GoalPriority.desirable: 'desirable',
};

const _$GoalTypeEnumMap = {
  GoalType.retirement: 'retirement',
  GoalType.emergencyFund: 'emergencyFund',
  GoalType.homePurchase: 'homePurchase',
  GoalType.education: 'education',
  GoalType.travel: 'travel',
  GoalType.wealthBuilding: 'wealthBuilding',
  GoalType.majorPurchase: 'majorPurchase',
  GoalType.other: 'other',
};

_$PortfolioAnalysisImpl _$$PortfolioAnalysisImplFromJson(
  Map<String, dynamic> json,
) => _$PortfolioAnalysisImpl(
  totalValue: (json['totalValue'] as num).toDouble(),
  holdings: (json['holdings'] as List<dynamic>)
      .map((e) => PortfolioHolding.fromJson(e as Map<String, dynamic>))
      .toList(),
  assetAllocation: (json['assetAllocation'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  diversification: DiversificationScore.fromJson(
    json['diversification'] as Map<String, dynamic>,
  ),
  projectedAnnualReturn: (json['projectedAnnualReturn'] as num).toDouble(),
  riskLevel: (json['riskLevel'] as num).toDouble(),
  issues: (json['issues'] as List<dynamic>)
      .map((e) => PortfolioIssue.fromJson(e as Map<String, dynamic>))
      .toList(),
  analyzedAt: DateTime.parse(json['analyzedAt'] as String),
);

Map<String, dynamic> _$$PortfolioAnalysisImplToJson(
  _$PortfolioAnalysisImpl instance,
) => <String, dynamic>{
  'totalValue': instance.totalValue,
  'holdings': instance.holdings,
  'assetAllocation': instance.assetAllocation,
  'diversification': instance.diversification,
  'projectedAnnualReturn': instance.projectedAnnualReturn,
  'riskLevel': instance.riskLevel,
  'issues': instance.issues,
  'analyzedAt': instance.analyzedAt.toIso8601String(),
};

_$PortfolioHoldingImpl _$$PortfolioHoldingImplFromJson(
  Map<String, dynamic> json,
) => _$PortfolioHoldingImpl(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  assetType: $enumDecode(_$AssetTypeEnumMap, json['assetType']),
  shares: (json['shares'] as num).toDouble(),
  currentPrice: (json['currentPrice'] as num).toDouble(),
  totalValue: (json['totalValue'] as num).toDouble(),
  percentOfPortfolio: (json['percentOfPortfolio'] as num).toDouble(),
  gainLoss: (json['gainLoss'] as num).toDouble(),
  gainLossPercent: (json['gainLossPercent'] as num).toDouble(),
);

Map<String, dynamic> _$$PortfolioHoldingImplToJson(
  _$PortfolioHoldingImpl instance,
) => <String, dynamic>{
  'symbol': instance.symbol,
  'name': instance.name,
  'assetType': _$AssetTypeEnumMap[instance.assetType]!,
  'shares': instance.shares,
  'currentPrice': instance.currentPrice,
  'totalValue': instance.totalValue,
  'percentOfPortfolio': instance.percentOfPortfolio,
  'gainLoss': instance.gainLoss,
  'gainLossPercent': instance.gainLossPercent,
};

const _$AssetTypeEnumMap = {
  AssetType.stock: 'stock',
  AssetType.bond: 'bond',
  AssetType.etf: 'etf',
  AssetType.mutualFund: 'mutualFund',
  AssetType.crypto: 'crypto',
  AssetType.realEstate: 'realEstate',
  AssetType.commodity: 'commodity',
  AssetType.cash: 'cash',
};

_$DiversificationScoreImpl _$$DiversificationScoreImplFromJson(
  Map<String, dynamic> json,
) => _$DiversificationScoreImpl(
  overallScore: (json['overallScore'] as num).toDouble(),
  assetClassScore: (json['assetClassScore'] as num).toDouble(),
  sectorScore: (json['sectorScore'] as num).toDouble(),
  geographicScore: (json['geographicScore'] as num).toDouble(),
  level: $enumDecode(_$DiversificationLevelEnumMap, json['level']),
  recommendations: (json['recommendations'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$DiversificationScoreImplToJson(
  _$DiversificationScoreImpl instance,
) => <String, dynamic>{
  'overallScore': instance.overallScore,
  'assetClassScore': instance.assetClassScore,
  'sectorScore': instance.sectorScore,
  'geographicScore': instance.geographicScore,
  'level': _$DiversificationLevelEnumMap[instance.level]!,
  'recommendations': instance.recommendations,
};

const _$DiversificationLevelEnumMap = {
  DiversificationLevel.poor: 'poor',
  DiversificationLevel.fair: 'fair',
  DiversificationLevel.good: 'good',
  DiversificationLevel.excellent: 'excellent',
};

_$PortfolioIssueImpl _$$PortfolioIssueImplFromJson(Map<String, dynamic> json) =>
    _$PortfolioIssueImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      severity: $enumDecode(_$IssueSeverityEnumMap, json['severity']),
      recommendation: json['recommendation'] as String,
    );

Map<String, dynamic> _$$PortfolioIssueImplToJson(
  _$PortfolioIssueImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'severity': _$IssueSeverityEnumMap[instance.severity]!,
  'recommendation': instance.recommendation,
};

const _$IssueSeverityEnumMap = {
  IssueSeverity.low: 'low',
  IssueSeverity.medium: 'medium',
  IssueSeverity.high: 'high',
  IssueSeverity.critical: 'critical',
};

_$InvestmentRecommendationImpl _$$InvestmentRecommendationImplFromJson(
  Map<String, dynamic> json,
) => _$InvestmentRecommendationImpl(
  id: json['id'] as String,
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  assetType: $enumDecode(_$AssetTypeEnumMap, json['assetType']),
  recommendationType: $enumDecode(
    _$RecommendationTypeEnumMap,
    json['recommendationType'],
  ),
  reasoning: json['reasoning'] as String,
  suggestedAllocation: (json['suggestedAllocation'] as num).toDouble(),
  currentPrice: (json['currentPrice'] as num?)?.toDouble(),
  expenseRatio: (json['expenseRatio'] as num?)?.toDouble(),
  dividendYield: (json['dividendYield'] as num?)?.toDouble(),
  riskLevel: $enumDecode(_$RiskLevelEnumMap, json['riskLevel']),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  recommendedAt: DateTime.parse(json['recommendedAt'] as String),
  isTaxAdvantaged: json['isTaxAdvantaged'] as bool,
  taxAdvantageExplanation: json['taxAdvantageExplanation'] as String?,
);

Map<String, dynamic> _$$InvestmentRecommendationImplToJson(
  _$InvestmentRecommendationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'symbol': instance.symbol,
  'name': instance.name,
  'assetType': _$AssetTypeEnumMap[instance.assetType]!,
  'recommendationType':
      _$RecommendationTypeEnumMap[instance.recommendationType]!,
  'reasoning': instance.reasoning,
  'suggestedAllocation': instance.suggestedAllocation,
  'currentPrice': instance.currentPrice,
  'expenseRatio': instance.expenseRatio,
  'dividendYield': instance.dividendYield,
  'riskLevel': _$RiskLevelEnumMap[instance.riskLevel]!,
  'tags': instance.tags,
  'recommendedAt': instance.recommendedAt.toIso8601String(),
  'isTaxAdvantaged': instance.isTaxAdvantaged,
  'taxAdvantageExplanation': instance.taxAdvantageExplanation,
};

const _$RecommendationTypeEnumMap = {
  RecommendationType.buy: 'buy',
  RecommendationType.hold: 'hold',
  RecommendationType.increasPosition: 'increasPosition',
  RecommendationType.reducePosition: 'reducePosition',
  RecommendationType.dollarCostAverage: 'dollarCostAverage',
};

const _$RiskLevelEnumMap = {
  RiskLevel.veryLow: 'veryLow',
  RiskLevel.low: 'low',
  RiskLevel.moderate: 'moderate',
  RiskLevel.high: 'high',
  RiskLevel.veryHigh: 'veryHigh',
};

_$DCAplanImpl _$$DCAplanImplFromJson(Map<String, dynamic> json) =>
    _$DCAplanImpl(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      monthlyAmount: (json['monthlyAmount'] as num).toDouble(),
      dayOfMonth: (json['dayOfMonth'] as num).toInt(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      totalContributions: (json['totalContributions'] as num).toInt(),
      totalInvested: (json['totalInvested'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
      averageCost: (json['averageCost'] as num).toDouble(),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$DCAplanImplToJson(_$DCAplanImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'monthlyAmount': instance.monthlyAmount,
      'dayOfMonth': instance.dayOfMonth,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'totalContributions': instance.totalContributions,
      'totalInvested': instance.totalInvested,
      'currentValue': instance.currentValue,
      'averageCost': instance.averageCost,
      'isActive': instance.isActive,
    };

_$TaxAdvantageRecommendationImpl _$$TaxAdvantageRecommendationImplFromJson(
  Map<String, dynamic> json,
) => _$TaxAdvantageRecommendationImpl(
  accountType: $enumDecode(_$TaxAccountTypeEnumMap, json['accountType']),
  reason: json['reason'] as String,
  annualLimit: (json['annualLimit'] as num).toDouble(),
  currentContribution: (json['currentContribution'] as num).toDouble(),
  remainingRoom: (json['remainingRoom'] as num).toDouble(),
  potentialTaxSavings: (json['potentialTaxSavings'] as num).toDouble(),
  eligibilityNotes: (json['eligibilityNotes'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$TaxAdvantageRecommendationImplToJson(
  _$TaxAdvantageRecommendationImpl instance,
) => <String, dynamic>{
  'accountType': _$TaxAccountTypeEnumMap[instance.accountType]!,
  'reason': instance.reason,
  'annualLimit': instance.annualLimit,
  'currentContribution': instance.currentContribution,
  'remainingRoom': instance.remainingRoom,
  'potentialTaxSavings': instance.potentialTaxSavings,
  'eligibilityNotes': instance.eligibilityNotes,
};

const _$TaxAccountTypeEnumMap = {
  TaxAccountType.traditional401k: 'traditional401k',
  TaxAccountType.roth401k: 'roth401k',
  TaxAccountType.traditionalIRA: 'traditionalIRA',
  TaxAccountType.rothIRA: 'rothIRA',
  TaxAccountType.hsa: 'hsa',
  TaxAccountType.plan529: 'plan529',
  TaxAccountType.sep: 'sep',
};

_$InvestmentEducationImpl _$$InvestmentEducationImplFromJson(
  Map<String, dynamic> json,
) => _$InvestmentEducationImpl(
  id: json['id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  topic: $enumDecode(_$EducationTopicEnumMap, json['topic']),
  level: $enumDecode(_$EducationLevelEnumMap, json['level']),
  readTimeMinutes: (json['readTimeMinutes'] as num).toInt(),
  isCompleted: json['isCompleted'] as bool,
);

Map<String, dynamic> _$$InvestmentEducationImplToJson(
  _$InvestmentEducationImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'topic': _$EducationTopicEnumMap[instance.topic]!,
  'level': _$EducationLevelEnumMap[instance.level]!,
  'readTimeMinutes': instance.readTimeMinutes,
  'isCompleted': instance.isCompleted,
};

const _$EducationTopicEnumMap = {
  EducationTopic.basics: 'basics',
  EducationTopic.diversification: 'diversification',
  EducationTopic.riskManagement: 'riskManagement',
  EducationTopic.taxOptimization: 'taxOptimization',
  EducationTopic.retirement: 'retirement',
  EducationTopic.marketAnalysis: 'marketAnalysis',
};

const _$EducationLevelEnumMap = {
  EducationLevel.beginner: 'beginner',
  EducationLevel.intermediate: 'intermediate',
  EducationLevel.advanced: 'advanced',
};
