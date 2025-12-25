// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InsightModelImpl _$$InsightModelImplFromJson(Map<String, dynamic> json) =>
    _$InsightModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$InsightTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String,
      data: json['data'] as Map<String, dynamic>?,
      actionable: json['actionable'] as bool? ?? true,
      action: json['action'] == null
          ? null
          : InsightAction.fromJson(json['action'] as Map<String, dynamic>),
      priority:
          $enumDecodeNullable(_$InsightPriorityEnumMap, json['priority']) ??
          InsightPriority.medium,
      isRead: json['isRead'] as bool? ?? false,
      isDismissed: json['isDismissed'] as bool? ?? false,
      createdAt: _timestampFromJson(json['createdAt']),
      expiresAt: _timestampFromJson(json['expiresAt']),
    );

Map<String, dynamic> _$$InsightModelImplToJson(_$InsightModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$InsightTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'data': instance.data,
      'actionable': instance.actionable,
      'action': instance.action,
      'priority': _$InsightPriorityEnumMap[instance.priority]!,
      'isRead': instance.isRead,
      'isDismissed': instance.isDismissed,
      'createdAt': _timestampToJson(instance.createdAt),
      'expiresAt': _timestampToJson(instance.expiresAt),
    };

const _$InsightTypeEnumMap = {
  InsightType.pattern: 'pattern',
  InsightType.anomaly: 'anomaly',
  InsightType.recommendation: 'recommendation',
  InsightType.achievement: 'achievement',
  InsightType.warning: 'warning',
  InsightType.tip: 'tip',
};

const _$InsightPriorityEnumMap = {
  InsightPriority.low: 'low',
  InsightPriority.medium: 'medium',
  InsightPriority.high: 'high',
  InsightPriority.critical: 'critical',
};

_$InsightActionImpl _$$InsightActionImplFromJson(Map<String, dynamic> json) =>
    _$InsightActionImpl(
      type: json['type'] as String,
      label: json['label'] as String,
      params: json['params'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$InsightActionImplToJson(_$InsightActionImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'label': instance.label,
      'params': instance.params,
    };
