// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  UserPreferences get preferences => throw _privateConstructorUsedError;
  UserSubscription get subscription => throw _privateConstructorUsedError;
  UserGamification get gamification => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call({
    String id,
    String email,
    String? displayName,
    String? photoURL,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? updatedAt,
    UserPreferences preferences,
    UserSubscription subscription,
    UserGamification gamification,
  });

  $UserPreferencesCopyWith<$Res> get preferences;
  $UserSubscriptionCopyWith<$Res> get subscription;
  $UserGamificationCopyWith<$Res> get gamification;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? preferences = null,
    Object? subscription = null,
    Object? gamification = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: freezed == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String?,
            photoURL: freezed == photoURL
                ? _value.photoURL
                : photoURL // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            preferences: null == preferences
                ? _value.preferences
                : preferences // ignore: cast_nullable_to_non_nullable
                      as UserPreferences,
            subscription: null == subscription
                ? _value.subscription
                : subscription // ignore: cast_nullable_to_non_nullable
                      as UserSubscription,
            gamification: null == gamification
                ? _value.gamification
                : gamification // ignore: cast_nullable_to_non_nullable
                      as UserGamification,
          )
          as $Val,
    );
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesCopyWith<$Res> get preferences {
    return $UserPreferencesCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSubscriptionCopyWith<$Res> get subscription {
    return $UserSubscriptionCopyWith<$Res>(_value.subscription, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
    });
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserGamificationCopyWith<$Res> get gamification {
    return $UserGamificationCopyWith<$Res>(_value.gamification, (value) {
      return _then(_value.copyWith(gamification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
    _$UserModelImpl value,
    $Res Function(_$UserModelImpl) then,
  ) = __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String email,
    String? displayName,
    String? photoURL,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? updatedAt,
    UserPreferences preferences,
    UserSubscription subscription,
    UserGamification gamification,
  });

  @override
  $UserPreferencesCopyWith<$Res> get preferences;
  @override
  $UserSubscriptionCopyWith<$Res> get subscription;
  @override
  $UserGamificationCopyWith<$Res> get gamification;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
    _$UserModelImpl _value,
    $Res Function(_$UserModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = freezed,
    Object? photoURL = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? preferences = null,
    Object? subscription = null,
    Object? gamification = null,
  }) {
    return _then(
      _$UserModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: freezed == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String?,
        photoURL: freezed == photoURL
            ? _value.photoURL
            : photoURL // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        preferences: null == preferences
            ? _value.preferences
            : preferences // ignore: cast_nullable_to_non_nullable
                  as UserPreferences,
        subscription: null == subscription
            ? _value.subscription
            : subscription // ignore: cast_nullable_to_non_nullable
                  as UserSubscription,
        gamification: null == gamification
            ? _value.gamification
            : gamification // ignore: cast_nullable_to_non_nullable
                  as UserGamification,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl({
    required this.id,
    required this.email,
    this.displayName,
    this.photoURL,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.updatedAt,
    this.preferences = const UserPreferences(),
    this.subscription = const UserSubscription(),
    this.gamification = const UserGamification(),
  });

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String? displayName;
  @override
  final String? photoURL;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? createdAt;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final UserPreferences preferences;
  @override
  @JsonKey()
  final UserSubscription subscription;
  @override
  @JsonKey()
  final UserGamification gamification;

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, displayName: $displayName, photoURL: $photoURL, createdAt: $createdAt, updatedAt: $updatedAt, preferences: $preferences, subscription: $subscription, gamification: $gamification)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription) &&
            (identical(other.gamification, gamification) ||
                other.gamification == gamification));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    email,
    displayName,
    photoURL,
    createdAt,
    updatedAt,
    preferences,
    subscription,
    gamification,
  );

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(this);
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel({
    required final String id,
    required final String email,
    final String? displayName,
    final String? photoURL,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? updatedAt,
    final UserPreferences preferences,
    final UserSubscription subscription,
    final UserGamification gamification,
  }) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String? get displayName;
  @override
  String? get photoURL;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get updatedAt;
  @override
  UserPreferences get preferences;
  @override
  UserSubscription get subscription;
  @override
  UserGamification get gamification;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  String get currency => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  NotificationSettings get notifications => throw _privateConstructorUsedError;
  PrivacySettings get privacy => throw _privateConstructorUsedError;

  /// Serializes this UserPreferences to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
    UserPreferences value,
    $Res Function(UserPreferences) then,
  ) = _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call({
    String currency,
    String timezone,
    NotificationSettings notifications,
    PrivacySettings privacy,
  });

  $NotificationSettingsCopyWith<$Res> get notifications;
  $PrivacySettingsCopyWith<$Res> get privacy;
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? timezone = null,
    Object? notifications = null,
    Object? privacy = null,
  }) {
    return _then(
      _value.copyWith(
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            timezone: null == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                      as String,
            notifications: null == notifications
                ? _value.notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                      as NotificationSettings,
            privacy: null == privacy
                ? _value.privacy
                : privacy // ignore: cast_nullable_to_non_nullable
                      as PrivacySettings,
          )
          as $Val,
    );
  }

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationSettingsCopyWith<$Res> get notifications {
    return $NotificationSettingsCopyWith<$Res>(_value.notifications, (value) {
      return _then(_value.copyWith(notifications: value) as $Val);
    });
  }

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrivacySettingsCopyWith<$Res> get privacy {
    return $PrivacySettingsCopyWith<$Res>(_value.privacy, (value) {
      return _then(_value.copyWith(privacy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(
    _$UserPreferencesImpl value,
    $Res Function(_$UserPreferencesImpl) then,
  ) = __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String currency,
    String timezone,
    NotificationSettings notifications,
    PrivacySettings privacy,
  });

  @override
  $NotificationSettingsCopyWith<$Res> get notifications;
  @override
  $PrivacySettingsCopyWith<$Res> get privacy;
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
    _$UserPreferencesImpl _value,
    $Res Function(_$UserPreferencesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = null,
    Object? timezone = null,
    Object? notifications = null,
    Object? privacy = null,
  }) {
    return _then(
      _$UserPreferencesImpl(
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        timezone: null == timezone
            ? _value.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        notifications: null == notifications
            ? _value.notifications
            : notifications // ignore: cast_nullable_to_non_nullable
                  as NotificationSettings,
        privacy: null == privacy
            ? _value.privacy
            : privacy // ignore: cast_nullable_to_non_nullable
                  as PrivacySettings,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl({
    this.currency = 'USD',
    this.timezone = 'America/Los_Angeles',
    this.notifications = const NotificationSettings(),
    this.privacy = const PrivacySettings(),
  });

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey()
  final String timezone;
  @override
  @JsonKey()
  final NotificationSettings notifications;
  @override
  @JsonKey()
  final PrivacySettings privacy;

  @override
  String toString() {
    return 'UserPreferences(currency: $currency, timezone: $timezone, notifications: $notifications, privacy: $privacy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications) &&
            (identical(other.privacy, privacy) || other.privacy == privacy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currency, timezone, notifications, privacy);

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(this);
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences({
    final String currency,
    final String timezone,
    final NotificationSettings notifications,
    final PrivacySettings privacy,
  }) = _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  String get currency;
  @override
  String get timezone;
  @override
  NotificationSettings get notifications;
  @override
  PrivacySettings get privacy;

  /// Create a copy of UserPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationSettings _$NotificationSettingsFromJson(Map<String, dynamic> json) {
  return _NotificationSettings.fromJson(json);
}

/// @nodoc
mixin _$NotificationSettings {
  bool get budgetAlerts => throw _privateConstructorUsedError;
  bool get insightDigest => throw _privateConstructorUsedError;
  bool get crisisAlerts => throw _privateConstructorUsedError;
  bool get taskReminders => throw _privateConstructorUsedError;

  /// Serializes this NotificationSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingsCopyWith<NotificationSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingsCopyWith<$Res> {
  factory $NotificationSettingsCopyWith(
    NotificationSettings value,
    $Res Function(NotificationSettings) then,
  ) = _$NotificationSettingsCopyWithImpl<$Res, NotificationSettings>;
  @useResult
  $Res call({
    bool budgetAlerts,
    bool insightDigest,
    bool crisisAlerts,
    bool taskReminders,
  });
}

/// @nodoc
class _$NotificationSettingsCopyWithImpl<
  $Res,
  $Val extends NotificationSettings
>
    implements $NotificationSettingsCopyWith<$Res> {
  _$NotificationSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetAlerts = null,
    Object? insightDigest = null,
    Object? crisisAlerts = null,
    Object? taskReminders = null,
  }) {
    return _then(
      _value.copyWith(
            budgetAlerts: null == budgetAlerts
                ? _value.budgetAlerts
                : budgetAlerts // ignore: cast_nullable_to_non_nullable
                      as bool,
            insightDigest: null == insightDigest
                ? _value.insightDigest
                : insightDigest // ignore: cast_nullable_to_non_nullable
                      as bool,
            crisisAlerts: null == crisisAlerts
                ? _value.crisisAlerts
                : crisisAlerts // ignore: cast_nullable_to_non_nullable
                      as bool,
            taskReminders: null == taskReminders
                ? _value.taskReminders
                : taskReminders // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationSettingsImplCopyWith<$Res>
    implements $NotificationSettingsCopyWith<$Res> {
  factory _$$NotificationSettingsImplCopyWith(
    _$NotificationSettingsImpl value,
    $Res Function(_$NotificationSettingsImpl) then,
  ) = __$$NotificationSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool budgetAlerts,
    bool insightDigest,
    bool crisisAlerts,
    bool taskReminders,
  });
}

/// @nodoc
class __$$NotificationSettingsImplCopyWithImpl<$Res>
    extends _$NotificationSettingsCopyWithImpl<$Res, _$NotificationSettingsImpl>
    implements _$$NotificationSettingsImplCopyWith<$Res> {
  __$$NotificationSettingsImplCopyWithImpl(
    _$NotificationSettingsImpl _value,
    $Res Function(_$NotificationSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetAlerts = null,
    Object? insightDigest = null,
    Object? crisisAlerts = null,
    Object? taskReminders = null,
  }) {
    return _then(
      _$NotificationSettingsImpl(
        budgetAlerts: null == budgetAlerts
            ? _value.budgetAlerts
            : budgetAlerts // ignore: cast_nullable_to_non_nullable
                  as bool,
        insightDigest: null == insightDigest
            ? _value.insightDigest
            : insightDigest // ignore: cast_nullable_to_non_nullable
                  as bool,
        crisisAlerts: null == crisisAlerts
            ? _value.crisisAlerts
            : crisisAlerts // ignore: cast_nullable_to_non_nullable
                  as bool,
        taskReminders: null == taskReminders
            ? _value.taskReminders
            : taskReminders // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationSettingsImpl implements _NotificationSettings {
  const _$NotificationSettingsImpl({
    this.budgetAlerts = true,
    this.insightDigest = true,
    this.crisisAlerts = true,
    this.taskReminders = true,
  });

  factory _$NotificationSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool budgetAlerts;
  @override
  @JsonKey()
  final bool insightDigest;
  @override
  @JsonKey()
  final bool crisisAlerts;
  @override
  @JsonKey()
  final bool taskReminders;

  @override
  String toString() {
    return 'NotificationSettings(budgetAlerts: $budgetAlerts, insightDigest: $insightDigest, crisisAlerts: $crisisAlerts, taskReminders: $taskReminders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingsImpl &&
            (identical(other.budgetAlerts, budgetAlerts) ||
                other.budgetAlerts == budgetAlerts) &&
            (identical(other.insightDigest, insightDigest) ||
                other.insightDigest == insightDigest) &&
            (identical(other.crisisAlerts, crisisAlerts) ||
                other.crisisAlerts == crisisAlerts) &&
            (identical(other.taskReminders, taskReminders) ||
                other.taskReminders == taskReminders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    budgetAlerts,
    insightDigest,
    crisisAlerts,
    taskReminders,
  );

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
  get copyWith =>
      __$$NotificationSettingsImplCopyWithImpl<_$NotificationSettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingsImplToJson(this);
  }
}

abstract class _NotificationSettings implements NotificationSettings {
  const factory _NotificationSettings({
    final bool budgetAlerts,
    final bool insightDigest,
    final bool crisisAlerts,
    final bool taskReminders,
  }) = _$NotificationSettingsImpl;

  factory _NotificationSettings.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingsImpl.fromJson;

  @override
  bool get budgetAlerts;
  @override
  bool get insightDigest;
  @override
  bool get crisisAlerts;
  @override
  bool get taskReminders;

  /// Create a copy of NotificationSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingsImplCopyWith<_$NotificationSettingsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PrivacySettings _$PrivacySettingsFromJson(Map<String, dynamic> json) {
  return _PrivacySettings.fromJson(json);
}

/// @nodoc
mixin _$PrivacySettings {
  List<String> get shareWithFamily => throw _privateConstructorUsedError;
  bool get anonymousAnalytics => throw _privateConstructorUsedError;

  /// Serializes this PrivacySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacySettingsCopyWith<PrivacySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacySettingsCopyWith<$Res> {
  factory $PrivacySettingsCopyWith(
    PrivacySettings value,
    $Res Function(PrivacySettings) then,
  ) = _$PrivacySettingsCopyWithImpl<$Res, PrivacySettings>;
  @useResult
  $Res call({List<String> shareWithFamily, bool anonymousAnalytics});
}

/// @nodoc
class _$PrivacySettingsCopyWithImpl<$Res, $Val extends PrivacySettings>
    implements $PrivacySettingsCopyWith<$Res> {
  _$PrivacySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shareWithFamily = null,
    Object? anonymousAnalytics = null,
  }) {
    return _then(
      _value.copyWith(
            shareWithFamily: null == shareWithFamily
                ? _value.shareWithFamily
                : shareWithFamily // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            anonymousAnalytics: null == anonymousAnalytics
                ? _value.anonymousAnalytics
                : anonymousAnalytics // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PrivacySettingsImplCopyWith<$Res>
    implements $PrivacySettingsCopyWith<$Res> {
  factory _$$PrivacySettingsImplCopyWith(
    _$PrivacySettingsImpl value,
    $Res Function(_$PrivacySettingsImpl) then,
  ) = __$$PrivacySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> shareWithFamily, bool anonymousAnalytics});
}

/// @nodoc
class __$$PrivacySettingsImplCopyWithImpl<$Res>
    extends _$PrivacySettingsCopyWithImpl<$Res, _$PrivacySettingsImpl>
    implements _$$PrivacySettingsImplCopyWith<$Res> {
  __$$PrivacySettingsImplCopyWithImpl(
    _$PrivacySettingsImpl _value,
    $Res Function(_$PrivacySettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? shareWithFamily = null,
    Object? anonymousAnalytics = null,
  }) {
    return _then(
      _$PrivacySettingsImpl(
        shareWithFamily: null == shareWithFamily
            ? _value._shareWithFamily
            : shareWithFamily // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        anonymousAnalytics: null == anonymousAnalytics
            ? _value.anonymousAnalytics
            : anonymousAnalytics // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PrivacySettingsImpl implements _PrivacySettings {
  const _$PrivacySettingsImpl({
    final List<String> shareWithFamily = const [],
    this.anonymousAnalytics = true,
  }) : _shareWithFamily = shareWithFamily;

  factory _$PrivacySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacySettingsImplFromJson(json);

  final List<String> _shareWithFamily;
  @override
  @JsonKey()
  List<String> get shareWithFamily {
    if (_shareWithFamily is EqualUnmodifiableListView) return _shareWithFamily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shareWithFamily);
  }

  @override
  @JsonKey()
  final bool anonymousAnalytics;

  @override
  String toString() {
    return 'PrivacySettings(shareWithFamily: $shareWithFamily, anonymousAnalytics: $anonymousAnalytics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacySettingsImpl &&
            const DeepCollectionEquality().equals(
              other._shareWithFamily,
              _shareWithFamily,
            ) &&
            (identical(other.anonymousAnalytics, anonymousAnalytics) ||
                other.anonymousAnalytics == anonymousAnalytics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_shareWithFamily),
    anonymousAnalytics,
  );

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacySettingsImplCopyWith<_$PrivacySettingsImpl> get copyWith =>
      __$$PrivacySettingsImplCopyWithImpl<_$PrivacySettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacySettingsImplToJson(this);
  }
}

abstract class _PrivacySettings implements PrivacySettings {
  const factory _PrivacySettings({
    final List<String> shareWithFamily,
    final bool anonymousAnalytics,
  }) = _$PrivacySettingsImpl;

  factory _PrivacySettings.fromJson(Map<String, dynamic> json) =
      _$PrivacySettingsImpl.fromJson;

  @override
  List<String> get shareWithFamily;
  @override
  bool get anonymousAnalytics;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacySettingsImplCopyWith<_$PrivacySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserSubscription _$UserSubscriptionFromJson(Map<String, dynamic> json) {
  return _UserSubscription.fromJson(json);
}

/// @nodoc
mixin _$UserSubscription {
  String get plan => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get validUntil => throw _privateConstructorUsedError;

  /// Serializes this UserSubscription to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSubscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSubscriptionCopyWith<UserSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSubscriptionCopyWith<$Res> {
  factory $UserSubscriptionCopyWith(
    UserSubscription value,
    $Res Function(UserSubscription) then,
  ) = _$UserSubscriptionCopyWithImpl<$Res, UserSubscription>;
  @useResult
  $Res call({
    String plan,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? validUntil,
  });
}

/// @nodoc
class _$UserSubscriptionCopyWithImpl<$Res, $Val extends UserSubscription>
    implements $UserSubscriptionCopyWith<$Res> {
  _$UserSubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSubscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? plan = null, Object? validUntil = freezed}) {
    return _then(
      _value.copyWith(
            plan: null == plan
                ? _value.plan
                : plan // ignore: cast_nullable_to_non_nullable
                      as String,
            validUntil: freezed == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserSubscriptionImplCopyWith<$Res>
    implements $UserSubscriptionCopyWith<$Res> {
  factory _$$UserSubscriptionImplCopyWith(
    _$UserSubscriptionImpl value,
    $Res Function(_$UserSubscriptionImpl) then,
  ) = __$$UserSubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String plan,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? validUntil,
  });
}

/// @nodoc
class __$$UserSubscriptionImplCopyWithImpl<$Res>
    extends _$UserSubscriptionCopyWithImpl<$Res, _$UserSubscriptionImpl>
    implements _$$UserSubscriptionImplCopyWith<$Res> {
  __$$UserSubscriptionImplCopyWithImpl(
    _$UserSubscriptionImpl _value,
    $Res Function(_$UserSubscriptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserSubscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? plan = null, Object? validUntil = freezed}) {
    return _then(
      _$UserSubscriptionImpl(
        plan: null == plan
            ? _value.plan
            : plan // ignore: cast_nullable_to_non_nullable
                  as String,
        validUntil: freezed == validUntil
            ? _value.validUntil
            : validUntil // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSubscriptionImpl implements _UserSubscription {
  const _$UserSubscriptionImpl({
    this.plan = 'free',
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.validUntil,
  });

  factory _$UserSubscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSubscriptionImplFromJson(json);

  @override
  @JsonKey()
  final String plan;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? validUntil;

  @override
  String toString() {
    return 'UserSubscription(plan: $plan, validUntil: $validUntil)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSubscriptionImpl &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, plan, validUntil);

  /// Create a copy of UserSubscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSubscriptionImplCopyWith<_$UserSubscriptionImpl> get copyWith =>
      __$$UserSubscriptionImplCopyWithImpl<_$UserSubscriptionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSubscriptionImplToJson(this);
  }
}

abstract class _UserSubscription implements UserSubscription {
  const factory _UserSubscription({
    final String plan,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? validUntil,
  }) = _$UserSubscriptionImpl;

  factory _UserSubscription.fromJson(Map<String, dynamic> json) =
      _$UserSubscriptionImpl.fromJson;

  @override
  String get plan;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get validUntil;

  /// Create a copy of UserSubscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSubscriptionImplCopyWith<_$UserSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserGamification _$UserGamificationFromJson(Map<String, dynamic> json) {
  return _UserGamification.fromJson(json);
}

/// @nodoc
mixin _$UserGamification {
  int get level => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get streak => throw _privateConstructorUsedError;
  List<String> get badges => throw _privateConstructorUsedError;

  /// Serializes this UserGamification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserGamification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserGamificationCopyWith<UserGamification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserGamificationCopyWith<$Res> {
  factory $UserGamificationCopyWith(
    UserGamification value,
    $Res Function(UserGamification) then,
  ) = _$UserGamificationCopyWithImpl<$Res, UserGamification>;
  @useResult
  $Res call({int level, int points, int streak, List<String> badges});
}

/// @nodoc
class _$UserGamificationCopyWithImpl<$Res, $Val extends UserGamification>
    implements $UserGamificationCopyWith<$Res> {
  _$UserGamificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserGamification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? points = null,
    Object? streak = null,
    Object? badges = null,
  }) {
    return _then(
      _value.copyWith(
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as int,
            points: null == points
                ? _value.points
                : points // ignore: cast_nullable_to_non_nullable
                      as int,
            streak: null == streak
                ? _value.streak
                : streak // ignore: cast_nullable_to_non_nullable
                      as int,
            badges: null == badges
                ? _value.badges
                : badges // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserGamificationImplCopyWith<$Res>
    implements $UserGamificationCopyWith<$Res> {
  factory _$$UserGamificationImplCopyWith(
    _$UserGamificationImpl value,
    $Res Function(_$UserGamificationImpl) then,
  ) = __$$UserGamificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int level, int points, int streak, List<String> badges});
}

/// @nodoc
class __$$UserGamificationImplCopyWithImpl<$Res>
    extends _$UserGamificationCopyWithImpl<$Res, _$UserGamificationImpl>
    implements _$$UserGamificationImplCopyWith<$Res> {
  __$$UserGamificationImplCopyWithImpl(
    _$UserGamificationImpl _value,
    $Res Function(_$UserGamificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserGamification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? points = null,
    Object? streak = null,
    Object? badges = null,
  }) {
    return _then(
      _$UserGamificationImpl(
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as int,
        points: null == points
            ? _value.points
            : points // ignore: cast_nullable_to_non_nullable
                  as int,
        streak: null == streak
            ? _value.streak
            : streak // ignore: cast_nullable_to_non_nullable
                  as int,
        badges: null == badges
            ? _value._badges
            : badges // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserGamificationImpl implements _UserGamification {
  const _$UserGamificationImpl({
    this.level = 1,
    this.points = 0,
    this.streak = 0,
    final List<String> badges = const [],
  }) : _badges = badges;

  factory _$UserGamificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserGamificationImplFromJson(json);

  @override
  @JsonKey()
  final int level;
  @override
  @JsonKey()
  final int points;
  @override
  @JsonKey()
  final int streak;
  final List<String> _badges;
  @override
  @JsonKey()
  List<String> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  @override
  String toString() {
    return 'UserGamification(level: $level, points: $points, streak: $streak, badges: $badges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserGamificationImpl &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.streak, streak) || other.streak == streak) &&
            const DeepCollectionEquality().equals(other._badges, _badges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    level,
    points,
    streak,
    const DeepCollectionEquality().hash(_badges),
  );

  /// Create a copy of UserGamification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserGamificationImplCopyWith<_$UserGamificationImpl> get copyWith =>
      __$$UserGamificationImplCopyWithImpl<_$UserGamificationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserGamificationImplToJson(this);
  }
}

abstract class _UserGamification implements UserGamification {
  const factory _UserGamification({
    final int level,
    final int points,
    final int streak,
    final List<String> badges,
  }) = _$UserGamificationImpl;

  factory _UserGamification.fromJson(Map<String, dynamic> json) =
      _$UserGamificationImpl.fromJson;

  @override
  int get level;
  @override
  int get points;
  @override
  int get streak;
  @override
  List<String> get badges;

  /// Create a copy of UserGamification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserGamificationImplCopyWith<_$UserGamificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
