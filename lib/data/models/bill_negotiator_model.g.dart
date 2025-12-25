// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_negotiator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BillNegotiatorImpl _$$BillNegotiatorImplFromJson(Map<String, dynamic> json) =>
    _$BillNegotiatorImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      trackedBills: (json['trackedBills'] as List<dynamic>)
          .map((e) => TrackedBill.fromJson(e as Map<String, dynamic>))
          .toList(),
      negotiations: (json['negotiations'] as List<dynamic>)
          .map((e) => NegotiationSession.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: NegotiatorStats.fromJson(json['stats'] as Map<String, dynamic>),
      lastAnalyzed: DateTime.parse(json['lastAnalyzed'] as String),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BillNegotiatorImplToJson(
  _$BillNegotiatorImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'trackedBills': instance.trackedBills,
  'negotiations': instance.negotiations,
  'stats': instance.stats,
  'lastAnalyzed': instance.lastAnalyzed.toIso8601String(),
  'createdAt': instance.createdAt?.toIso8601String(),
};

_$TrackedBillImpl _$$TrackedBillImplFromJson(Map<String, dynamic> json) =>
    _$TrackedBillImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      provider: json['provider'] as String,
      category: $enumDecode(_$BillCategoryEnumMap, json['category']),
      currentAmount: (json['currentAmount'] as num).toDouble(),
      marketAverage: (json['marketAverage'] as num).toDouble(),
      potentialSavings: (json['potentialSavings'] as num).toDouble(),
      negotiationPriority: $enumDecode(
        _$BillPriorityEnumMap,
        json['negotiationPriority'],
      ),
      difficulty: $enumDecode(
        _$NegotiationDifficultyEnumMap,
        json['difficulty'],
      ),
      lastBillDate: DateTime.parse(json['lastBillDate'] as String),
      contractEndDate: json['contractEndDate'] == null
          ? null
          : DateTime.parse(json['contractEndDate'] as String),
      hasAutoPay: json['hasAutoPay'] as bool,
      loyaltyMonths: (json['loyaltyMonths'] as num).toInt(),
      accountNumber: json['accountNumber'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      previousRates: (json['previousRates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$TrackedBillImplToJson(
  _$TrackedBillImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'provider': instance.provider,
  'category': _$BillCategoryEnumMap[instance.category]!,
  'currentAmount': instance.currentAmount,
  'marketAverage': instance.marketAverage,
  'potentialSavings': instance.potentialSavings,
  'negotiationPriority': _$BillPriorityEnumMap[instance.negotiationPriority]!,
  'difficulty': _$NegotiationDifficultyEnumMap[instance.difficulty]!,
  'lastBillDate': instance.lastBillDate.toIso8601String(),
  'contractEndDate': instance.contractEndDate?.toIso8601String(),
  'hasAutoPay': instance.hasAutoPay,
  'loyaltyMonths': instance.loyaltyMonths,
  'accountNumber': instance.accountNumber,
  'phoneNumber': instance.phoneNumber,
  'previousRates': instance.previousRates,
  'notes': instance.notes,
};

const _$BillCategoryEnumMap = {
  BillCategory.internet: 'internet',
  BillCategory.cable: 'cable',
  BillCategory.phone: 'phone',
  BillCategory.insurance: 'insurance',
  BillCategory.utilities: 'utilities',
  BillCategory.subscription: 'subscription',
  BillCategory.gym: 'gym',
  BillCategory.bankFees: 'bankFees',
  BillCategory.creditCard: 'creditCard',
  BillCategory.other: 'other',
};

const _$BillPriorityEnumMap = {
  BillPriority.high: 'high',
  BillPriority.medium: 'medium',
  BillPriority.low: 'low',
};

const _$NegotiationDifficultyEnumMap = {
  NegotiationDifficulty.easy: 'easy',
  NegotiationDifficulty.moderate: 'moderate',
  NegotiationDifficulty.hard: 'hard',
};

_$NegotiationSessionImpl _$$NegotiationSessionImplFromJson(
  Map<String, dynamic> json,
) => _$NegotiationSessionImpl(
  id: json['id'] as String,
  billId: json['billId'] as String,
  status: $enumDecode(_$NegotiationStatusEnumMap, json['status']),
  startedAt: DateTime.parse(json['startedAt'] as String),
  script: NegotiationScript.fromJson(json['script'] as Map<String, dynamic>),
  steps: (json['steps'] as List<dynamic>)
      .map((e) => NegotiationStep.fromJson(e as Map<String, dynamic>))
      .toList(),
  originalAmount: (json['originalAmount'] as num).toDouble(),
  negotiatedAmount: (json['negotiatedAmount'] as num?)?.toDouble(),
  savingsAchieved: (json['savingsAchieved'] as num?)?.toDouble(),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  notes: json['notes'] as String?,
  outcome: json['outcome'] as String?,
);

Map<String, dynamic> _$$NegotiationSessionImplToJson(
  _$NegotiationSessionImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'billId': instance.billId,
  'status': _$NegotiationStatusEnumMap[instance.status]!,
  'startedAt': instance.startedAt.toIso8601String(),
  'script': instance.script,
  'steps': instance.steps,
  'originalAmount': instance.originalAmount,
  'negotiatedAmount': instance.negotiatedAmount,
  'savingsAchieved': instance.savingsAchieved,
  'completedAt': instance.completedAt?.toIso8601String(),
  'notes': instance.notes,
  'outcome': instance.outcome,
};

const _$NegotiationStatusEnumMap = {
  NegotiationStatus.notStarted: 'notStarted',
  NegotiationStatus.inProgress: 'inProgress',
  NegotiationStatus.waitingCallback: 'waitingCallback',
  NegotiationStatus.successful: 'successful',
  NegotiationStatus.partialSuccess: 'partialSuccess',
  NegotiationStatus.unsuccessful: 'unsuccessful',
  NegotiationStatus.cancelled: 'cancelled',
};

_$NegotiationScriptImpl _$$NegotiationScriptImplFromJson(
  Map<String, dynamic> json,
) => _$NegotiationScriptImpl(
  id: json['id'] as String,
  opening: json['opening'] as String,
  keyPoints: (json['keyPoints'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  competitorMentions: (json['competitorMentions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  responseHandlers: (json['responseHandlers'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  closingLine: json['closingLine'] as String,
  escalationPhrases: (json['escalationPhrases'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  targetSavings: (json['targetSavings'] as num).toDouble(),
  minimumAcceptable: (json['minimumAcceptable'] as num).toDouble(),
);

Map<String, dynamic> _$$NegotiationScriptImplToJson(
  _$NegotiationScriptImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'opening': instance.opening,
  'keyPoints': instance.keyPoints,
  'competitorMentions': instance.competitorMentions,
  'responseHandlers': instance.responseHandlers,
  'closingLine': instance.closingLine,
  'escalationPhrases': instance.escalationPhrases,
  'targetSavings': instance.targetSavings,
  'minimumAcceptable': instance.minimumAcceptable,
};

_$NegotiationStepImpl _$$NegotiationStepImplFromJson(
  Map<String, dynamic> json,
) => _$NegotiationStepImpl(
  stepNumber: (json['stepNumber'] as num).toInt(),
  instruction: json['instruction'] as String,
  expectedResponse: json['expectedResponse'] as String,
  suggestedReply: json['suggestedReply'] as String,
  completed: json['completed'] as bool?,
  actualOutcome: json['actualOutcome'] as String?,
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
);

Map<String, dynamic> _$$NegotiationStepImplToJson(
  _$NegotiationStepImpl instance,
) => <String, dynamic>{
  'stepNumber': instance.stepNumber,
  'instruction': instance.instruction,
  'expectedResponse': instance.expectedResponse,
  'suggestedReply': instance.suggestedReply,
  'completed': instance.completed,
  'actualOutcome': instance.actualOutcome,
  'completedAt': instance.completedAt?.toIso8601String(),
};

_$NegotiatorStatsImpl _$$NegotiatorStatsImplFromJson(
  Map<String, dynamic> json,
) => _$NegotiatorStatsImpl(
  totalNegotiations: (json['totalNegotiations'] as num).toInt(),
  successfulNegotiations: (json['successfulNegotiations'] as num).toInt(),
  totalSavings: (json['totalSavings'] as num).toDouble(),
  averageSavingsPerBill: (json['averageSavingsPerBill'] as num).toDouble(),
  successRate: (json['successRate'] as num).toDouble(),
  savingsByCategory: (json['savingsByCategory'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry($enumDecode(_$BillCategoryEnumMap, k), (e as num).toDouble()),
  ),
  recentWins: (json['recentWins'] as List<dynamic>)
      .map((e) => NegotiationWin.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$NegotiatorStatsImplToJson(
  _$NegotiatorStatsImpl instance,
) => <String, dynamic>{
  'totalNegotiations': instance.totalNegotiations,
  'successfulNegotiations': instance.successfulNegotiations,
  'totalSavings': instance.totalSavings,
  'averageSavingsPerBill': instance.averageSavingsPerBill,
  'successRate': instance.successRate,
  'savingsByCategory': instance.savingsByCategory.map(
    (k, e) => MapEntry(_$BillCategoryEnumMap[k]!, e),
  ),
  'recentWins': instance.recentWins,
};

_$NegotiationWinImpl _$$NegotiationWinImplFromJson(Map<String, dynamic> json) =>
    _$NegotiationWinImpl(
      billName: json['billName'] as String,
      provider: json['provider'] as String,
      savings: (json['savings'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$NegotiationWinImplToJson(
  _$NegotiationWinImpl instance,
) => <String, dynamic>{
  'billName': instance.billName,
  'provider': instance.provider,
  'savings': instance.savings,
  'date': instance.date.toIso8601String(),
  'description': instance.description,
};

_$ServiceProviderImpl _$$ServiceProviderImplFromJson(
  Map<String, dynamic> json,
) => _$ServiceProviderImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  category: $enumDecode(_$BillCategoryEnumMap, json['category']),
  retentionPhone: json['retentionPhone'] as String,
  bestTimesToCall: (json['bestTimesToCall'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  averageDiscount: (json['averageDiscount'] as num).toDouble(),
  successRate: (json['successRate'] as num).toDouble(),
  knownPromotions: (json['knownPromotions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  negotiationTips: (json['negotiationTips'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
);

Map<String, dynamic> _$$ServiceProviderImplToJson(
  _$ServiceProviderImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'category': _$BillCategoryEnumMap[instance.category]!,
  'retentionPhone': instance.retentionPhone,
  'bestTimesToCall': instance.bestTimesToCall,
  'averageDiscount': instance.averageDiscount,
  'successRate': instance.successRate,
  'knownPromotions': instance.knownPromotions,
  'negotiationTips': instance.negotiationTips,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
};
