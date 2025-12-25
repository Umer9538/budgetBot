// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(
  Map<String, dynamic> json,
) => _$UserModelImpl(
  id: json['id'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String?,
  photoURL: json['photoURL'] as String?,
  createdAt: _timestampFromJson(json['createdAt']),
  updatedAt: _timestampFromJson(json['updatedAt']),
  preferences: json['preferences'] == null
      ? const UserPreferences()
      : UserPreferences.fromJson(json['preferences'] as Map<String, dynamic>),
  subscription: json['subscription'] == null
      ? const UserSubscription()
      : UserSubscription.fromJson(json['subscription'] as Map<String, dynamic>),
  gamification: json['gamification'] == null
      ? const UserGamification()
      : UserGamification.fromJson(json['gamification'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'createdAt': _timestampToJson(instance.createdAt),
      'updatedAt': _timestampToJson(instance.updatedAt),
      'preferences': instance.preferences,
      'subscription': instance.subscription,
      'gamification': instance.gamification,
    };

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
  Map<String, dynamic> json,
) => _$UserPreferencesImpl(
  currency: json['currency'] as String? ?? 'USD',
  timezone: json['timezone'] as String? ?? 'America/Los_Angeles',
  notifications: json['notifications'] == null
      ? const NotificationSettings()
      : NotificationSettings.fromJson(
          json['notifications'] as Map<String, dynamic>,
        ),
  privacy: json['privacy'] == null
      ? const PrivacySettings()
      : PrivacySettings.fromJson(json['privacy'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UserPreferencesImplToJson(
  _$UserPreferencesImpl instance,
) => <String, dynamic>{
  'currency': instance.currency,
  'timezone': instance.timezone,
  'notifications': instance.notifications,
  'privacy': instance.privacy,
};

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationSettingsImpl(
  budgetAlerts: json['budgetAlerts'] as bool? ?? true,
  insightDigest: json['insightDigest'] as bool? ?? true,
  crisisAlerts: json['crisisAlerts'] as bool? ?? true,
  taskReminders: json['taskReminders'] as bool? ?? true,
);

Map<String, dynamic> _$$NotificationSettingsImplToJson(
  _$NotificationSettingsImpl instance,
) => <String, dynamic>{
  'budgetAlerts': instance.budgetAlerts,
  'insightDigest': instance.insightDigest,
  'crisisAlerts': instance.crisisAlerts,
  'taskReminders': instance.taskReminders,
};

_$PrivacySettingsImpl _$$PrivacySettingsImplFromJson(
  Map<String, dynamic> json,
) => _$PrivacySettingsImpl(
  shareWithFamily:
      (json['shareWithFamily'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  anonymousAnalytics: json['anonymousAnalytics'] as bool? ?? true,
);

Map<String, dynamic> _$$PrivacySettingsImplToJson(
  _$PrivacySettingsImpl instance,
) => <String, dynamic>{
  'shareWithFamily': instance.shareWithFamily,
  'anonymousAnalytics': instance.anonymousAnalytics,
};

_$UserSubscriptionImpl _$$UserSubscriptionImplFromJson(
  Map<String, dynamic> json,
) => _$UserSubscriptionImpl(
  plan: json['plan'] as String? ?? 'free',
  validUntil: _timestampFromJson(json['validUntil']),
);

Map<String, dynamic> _$$UserSubscriptionImplToJson(
  _$UserSubscriptionImpl instance,
) => <String, dynamic>{
  'plan': instance.plan,
  'validUntil': _timestampToJson(instance.validUntil),
};

_$UserGamificationImpl _$$UserGamificationImplFromJson(
  Map<String, dynamic> json,
) => _$UserGamificationImpl(
  level: (json['level'] as num?)?.toInt() ?? 1,
  points: (json['points'] as num?)?.toInt() ?? 0,
  streak: (json['streak'] as num?)?.toInt() ?? 0,
  badges:
      (json['badges'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$$UserGamificationImplToJson(
  _$UserGamificationImpl instance,
) => <String, dynamic>{
  'level': instance.level,
  'points': instance.points,
  'streak': instance.streak,
  'badges': instance.badges,
};
