import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    String? displayName,
    String? photoURL,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? updatedAt,
    @Default(UserPreferences()) UserPreferences preferences,
    @Default(UserSubscription()) UserSubscription subscription,
    @Default(UserGamification()) UserGamification gamification,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return UserModel.fromJson({...data, 'id': doc.id});
  }
}

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @Default('USD') String currency,
    @Default('America/Los_Angeles') String timezone,
    @Default(NotificationSettings()) NotificationSettings notifications,
    @Default(PrivacySettings()) PrivacySettings privacy,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    @Default(true) bool budgetAlerts,
    @Default(true) bool insightDigest,
    @Default(true) bool crisisAlerts,
    @Default(true) bool taskReminders,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsFromJson(json);
}

@freezed
class PrivacySettings with _$PrivacySettings {
  const factory PrivacySettings({
    @Default([]) List<String> shareWithFamily,
    @Default(true) bool anonymousAnalytics,
  }) = _PrivacySettings;

  factory PrivacySettings.fromJson(Map<String, dynamic> json) =>
      _$PrivacySettingsFromJson(json);
}

@freezed
class UserSubscription with _$UserSubscription {
  const factory UserSubscription({
    @Default('free') String plan,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? validUntil,
  }) = _UserSubscription;

  factory UserSubscription.fromJson(Map<String, dynamic> json) =>
      _$UserSubscriptionFromJson(json);
}

@freezed
class UserGamification with _$UserGamification {
  const factory UserGamification({
    @Default(1) int level,
    @Default(0) int points,
    @Default(0) int streak,
    @Default([]) List<String> badges,
  }) = _UserGamification;

  factory UserGamification.fromJson(Map<String, dynamic> json) =>
      _$UserGamificationFromJson(json);
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
