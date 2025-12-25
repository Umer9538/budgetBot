// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSecurityQuestionImpl _$$UserSecurityQuestionImplFromJson(
  Map<String, dynamic> json,
) => _$UserSecurityQuestionImpl(
  question: json['question'] as String,
  answerHash: json['answerHash'] as String,
);

Map<String, dynamic> _$$UserSecurityQuestionImplToJson(
  _$UserSecurityQuestionImpl instance,
) => <String, dynamic>{
  'question': instance.question,
  'answerHash': instance.answerHash,
};

_$UserSecurityDataImpl _$$UserSecurityDataImplFromJson(
  Map<String, dynamic> json,
) => _$UserSecurityDataImpl(
  userId: json['userId'] as String,
  questions: (json['questions'] as List<dynamic>)
      .map((e) => UserSecurityQuestion.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$UserSecurityDataImplToJson(
  _$UserSecurityDataImpl instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'questions': instance.questions,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};
