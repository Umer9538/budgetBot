import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insight_model.freezed.dart';
part 'insight_model.g.dart';

@freezed
class InsightModel with _$InsightModel {
  const factory InsightModel({
    required String id,
    required String userId,
    required InsightType type,
    required String title,
    required String description,
    Map<String, dynamic>? data,
    @Default(true) bool actionable,
    InsightAction? action,
    @Default(InsightPriority.medium) InsightPriority priority,
    @Default(false) bool isRead,
    @Default(false) bool isDismissed,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? expiresAt,
  }) = _InsightModel;

  factory InsightModel.fromJson(Map<String, dynamic> json) =>
      _$InsightModelFromJson(json);

  factory InsightModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return InsightModel.fromJson({...data, 'id': doc.id});
  }
}

@freezed
class InsightAction with _$InsightAction {
  const factory InsightAction({
    required String type,
    required String label,
    Map<String, dynamic>? params,
  }) = _InsightAction;

  factory InsightAction.fromJson(Map<String, dynamic> json) =>
      _$InsightActionFromJson(json);
}

enum InsightType {
  @JsonValue('pattern')
  pattern,
  @JsonValue('anomaly')
  anomaly,
  @JsonValue('recommendation')
  recommendation,
  @JsonValue('achievement')
  achievement,
  @JsonValue('warning')
  warning,
  @JsonValue('tip')
  tip,
}

extension InsightTypeExtension on InsightType {
  String get displayName {
    switch (this) {
      case InsightType.pattern:
        return 'Spending Pattern';
      case InsightType.anomaly:
        return 'Unusual Activity';
      case InsightType.recommendation:
        return 'Recommendation';
      case InsightType.achievement:
        return 'Achievement';
      case InsightType.warning:
        return 'Warning';
      case InsightType.tip:
        return 'Tip';
    }
  }

  String get icon {
    switch (this) {
      case InsightType.pattern:
        return 'trending_up';
      case InsightType.anomaly:
        return 'warning';
      case InsightType.recommendation:
        return 'lightbulb';
      case InsightType.achievement:
        return 'emoji_events';
      case InsightType.warning:
        return 'error';
      case InsightType.tip:
        return 'tips_and_updates';
    }
  }
}

enum InsightPriority {
  @JsonValue('low')
  low,
  @JsonValue('medium')
  medium,
  @JsonValue('high')
  high,
  @JsonValue('critical')
  critical,
}

extension InsightPriorityExtension on InsightPriority {
  String get displayName {
    switch (this) {
      case InsightPriority.low:
        return 'Low';
      case InsightPriority.medium:
        return 'Medium';
      case InsightPriority.high:
        return 'High';
      case InsightPriority.critical:
        return 'Critical';
    }
  }

  int get sortOrder {
    switch (this) {
      case InsightPriority.critical:
        return 0;
      case InsightPriority.high:
        return 1;
      case InsightPriority.medium:
        return 2;
      case InsightPriority.low:
        return 3;
    }
  }
}

// Helper functions for Timestamp conversion
DateTime? _timestampFromJson(dynamic value) {
  if (value == null) return null;
  if (value is Timestamp) return value.toDate();
  if (value is String) return DateTime.parse(value);
  return null;
}

dynamic _timestampToJson(DateTime? dateTime) {
  return dateTime?.toIso8601String();
}
