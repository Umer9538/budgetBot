// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emotional_spending_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmotionalSpendingAnalysisImpl _$$EmotionalSpendingAnalysisImplFromJson(
  Map<String, dynamic> json,
) => _$EmotionalSpendingAnalysisImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  analysisDate: DateTime.parse(json['analysisDate'] as String),
  profile: EmotionalSpendingProfile.fromJson(
    json['profile'] as Map<String, dynamic>,
  ),
  patterns:
      (json['patterns'] as List<dynamic>?)
          ?.map((e) => EmotionalPattern.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  triggers:
      (json['triggers'] as List<dynamic>?)
          ?.map((e) => EmotionalTrigger.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  recommendations:
      (json['recommendations'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  totalEmotionalSpending: (json['totalEmotionalSpending'] as num?)?.toDouble(),
  percentageOfTotal: (json['percentageOfTotal'] as num?)?.toDouble(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$$EmotionalSpendingAnalysisImplToJson(
  _$EmotionalSpendingAnalysisImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'analysisDate': instance.analysisDate.toIso8601String(),
  'profile': instance.profile,
  'patterns': instance.patterns,
  'triggers': instance.triggers,
  'recommendations': instance.recommendations,
  'totalEmotionalSpending': instance.totalEmotionalSpending,
  'percentageOfTotal': instance.percentageOfTotal,
  'createdAt': instance.createdAt?.toIso8601String(),
};

_$EmotionalSpendingProfileImpl _$$EmotionalSpendingProfileImplFromJson(
  Map<String, dynamic> json,
) => _$EmotionalSpendingProfileImpl(
  dominantMood: $enumDecode(_$MoodTypeEnumMap, json['dominantMood']),
  emotionalSpendingScore: (json['emotionalSpendingScore'] as num).toDouble(),
  moodSpendingMap: (json['moodSpendingMap'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  moodFrequencyMap: Map<String, int>.from(json['moodFrequencyMap'] as Map),
  primaryTriggerCategory: json['primaryTriggerCategory'] as String?,
  primaryTriggerTime: json['primaryTriggerTime'] as String?,
  isHighRiskSpender: json['isHighRiskSpender'] as bool? ?? false,
  vulnerableMoods:
      (json['vulnerableMoods'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$EmotionalSpendingProfileImplToJson(
  _$EmotionalSpendingProfileImpl instance,
) => <String, dynamic>{
  'dominantMood': _$MoodTypeEnumMap[instance.dominantMood]!,
  'emotionalSpendingScore': instance.emotionalSpendingScore,
  'moodSpendingMap': instance.moodSpendingMap,
  'moodFrequencyMap': instance.moodFrequencyMap,
  'primaryTriggerCategory': instance.primaryTriggerCategory,
  'primaryTriggerTime': instance.primaryTriggerTime,
  'isHighRiskSpender': instance.isHighRiskSpender,
  'vulnerableMoods': instance.vulnerableMoods,
};

const _$MoodTypeEnumMap = {
  MoodType.happy: 'happy',
  MoodType.calm: 'calm',
  MoodType.neutral: 'neutral',
  MoodType.stressed: 'stressed',
  MoodType.anxious: 'anxious',
  MoodType.sad: 'sad',
  MoodType.excited: 'excited',
  MoodType.tired: 'tired',
  MoodType.frustrated: 'frustrated',
};

_$EmotionalPatternImpl _$$EmotionalPatternImplFromJson(
  Map<String, dynamic> json,
) => _$EmotionalPatternImpl(
  id: json['id'] as String,
  mood: $enumDecode(_$MoodTypeEnumMap, json['mood']),
  type: $enumDecode(_$PatternTypeEnumMap, json['type']),
  description: json['description'] as String,
  avgAmount: (json['avgAmount'] as num).toDouble(),
  occurrences: (json['occurrences'] as num).toInt(),
  confidence: (json['confidence'] as num).toDouble(),
  category: json['category'] as String?,
  timeOfDay: json['timeOfDay'] as String?,
  dayOfWeek: json['dayOfWeek'] as String?,
  associatedMerchants:
      (json['associatedMerchants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$EmotionalPatternImplToJson(
  _$EmotionalPatternImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'mood': _$MoodTypeEnumMap[instance.mood]!,
  'type': _$PatternTypeEnumMap[instance.type]!,
  'description': instance.description,
  'avgAmount': instance.avgAmount,
  'occurrences': instance.occurrences,
  'confidence': instance.confidence,
  'category': instance.category,
  'timeOfDay': instance.timeOfDay,
  'dayOfWeek': instance.dayOfWeek,
  'associatedMerchants': instance.associatedMerchants,
};

const _$PatternTypeEnumMap = {
  PatternType.stressShopping: 'stressShopping',
  PatternType.rewardSeeking: 'rewardSeeking',
  PatternType.boredomSpending: 'boredomSpending',
  PatternType.socialPressure: 'socialPressure',
  PatternType.comfortPurchase: 'comfortPurchase',
  PatternType.impulseControl: 'impulseControl',
  PatternType.celebratory: 'celebratory',
  PatternType.avoidance: 'avoidance',
};

_$EmotionalTriggerImpl _$$EmotionalTriggerImplFromJson(
  Map<String, dynamic> json,
) => _$EmotionalTriggerImpl(
  id: json['id'] as String,
  triggerMood: $enumDecode(_$MoodTypeEnumMap, json['triggerMood']),
  type: $enumDecode(_$TriggerTypeEnumMap, json['type']),
  description: json['description'] as String,
  riskLevel: (json['riskLevel'] as num).toDouble(),
  avgSpendIncrease: (json['avgSpendIncrease'] as num).toDouble(),
  category: json['category'] as String?,
  timePattern: json['timePattern'] as String?,
  warningSignals:
      (json['warningSignals'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  copingStrategies:
      (json['copingStrategies'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$$EmotionalTriggerImplToJson(
  _$EmotionalTriggerImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'triggerMood': _$MoodTypeEnumMap[instance.triggerMood]!,
  'type': _$TriggerTypeEnumMap[instance.type]!,
  'description': instance.description,
  'riskLevel': instance.riskLevel,
  'avgSpendIncrease': instance.avgSpendIncrease,
  'category': instance.category,
  'timePattern': instance.timePattern,
  'warningSignals': instance.warningSignals,
  'copingStrategies': instance.copingStrategies,
};

const _$TriggerTypeEnumMap = {
  TriggerType.timeOfDay: 'timeOfDay',
  TriggerType.dayOfWeek: 'dayOfWeek',
  TriggerType.payDay: 'payDay',
  TriggerType.weatherRelated: 'weatherRelated',
  TriggerType.socialEvent: 'socialEvent',
  TriggerType.workStress: 'workStress',
  TriggerType.relationship: 'relationship',
  TriggerType.health: 'health',
  TriggerType.seasonal: 'seasonal',
};

_$MoodEntryImpl _$$MoodEntryImplFromJson(Map<String, dynamic> json) =>
    _$MoodEntryImpl(
      id: json['id'] as String,
      transactionId: json['transactionId'] as String,
      mood: $enumDecode(_$MoodTypeEnumMap, json['mood']),
      stressLevel: (json['stressLevel'] as num?)?.toInt(),
      note: json['note'] as String?,
      recordedAt: json['recordedAt'] == null
          ? null
          : DateTime.parse(json['recordedAt'] as String),
    );

Map<String, dynamic> _$$MoodEntryImplToJson(_$MoodEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transactionId': instance.transactionId,
      'mood': _$MoodTypeEnumMap[instance.mood]!,
      'stressLevel': instance.stressLevel,
      'note': instance.note,
      'recordedAt': instance.recordedAt?.toIso8601String(),
    };
