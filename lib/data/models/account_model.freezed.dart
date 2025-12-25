// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) {
  return _AccountModel.fromJson(json);
}

/// @nodoc
mixin _$AccountModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get plaidAccountId => throw _privateConstructorUsedError;
  String get institutionName => throw _privateConstructorUsedError;
  AccountType get accountType => throw _privateConstructorUsedError;
  String get accountName => throw _privateConstructorUsedError;
  String? get mask => throw _privateConstructorUsedError;
  double get currentBalance => throw _privateConstructorUsedError;
  double get availableBalance => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get lastSynced => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isManual => throw _privateConstructorUsedError;
  bool get isLinked =>
      throw _privateConstructorUsedError; // Whether account is linked via bank provider
  String? get institutionLogo => throw _privateConstructorUsedError;
  String? get institutionId =>
      throw _privateConstructorUsedError; // Provider institution ID
  String? get providerAccountId =>
      throw _privateConstructorUsedError; // Account ID from provider (Plaid, etc.)
  String? get providerType =>
      throw _privateConstructorUsedError; // Provider type name (e.g., 'plaid', 'trueLayer')
  String? get accessToken =>
      throw _privateConstructorUsedError; // Access token for provider API
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this AccountModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountModelCopyWith<AccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountModelCopyWith<$Res> {
  factory $AccountModelCopyWith(
    AccountModel value,
    $Res Function(AccountModel) then,
  ) = _$AccountModelCopyWithImpl<$Res, AccountModel>;
  @useResult
  $Res call({
    String id,
    String userId,
    String? plaidAccountId,
    String institutionName,
    AccountType accountType,
    String accountName,
    String? mask,
    double currentBalance,
    double availableBalance,
    String currency,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? lastSynced,
    bool isActive,
    bool isManual,
    bool isLinked,
    String? institutionLogo,
    String? institutionId,
    String? providerAccountId,
    String? providerType,
    String? accessToken,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
  });
}

/// @nodoc
class _$AccountModelCopyWithImpl<$Res, $Val extends AccountModel>
    implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? plaidAccountId = freezed,
    Object? institutionName = null,
    Object? accountType = null,
    Object? accountName = null,
    Object? mask = freezed,
    Object? currentBalance = null,
    Object? availableBalance = null,
    Object? currency = null,
    Object? lastSynced = freezed,
    Object? isActive = null,
    Object? isManual = null,
    Object? isLinked = null,
    Object? institutionLogo = freezed,
    Object? institutionId = freezed,
    Object? providerAccountId = freezed,
    Object? providerType = freezed,
    Object? accessToken = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            plaidAccountId: freezed == plaidAccountId
                ? _value.plaidAccountId
                : plaidAccountId // ignore: cast_nullable_to_non_nullable
                      as String?,
            institutionName: null == institutionName
                ? _value.institutionName
                : institutionName // ignore: cast_nullable_to_non_nullable
                      as String,
            accountType: null == accountType
                ? _value.accountType
                : accountType // ignore: cast_nullable_to_non_nullable
                      as AccountType,
            accountName: null == accountName
                ? _value.accountName
                : accountName // ignore: cast_nullable_to_non_nullable
                      as String,
            mask: freezed == mask
                ? _value.mask
                : mask // ignore: cast_nullable_to_non_nullable
                      as String?,
            currentBalance: null == currentBalance
                ? _value.currentBalance
                : currentBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            availableBalance: null == availableBalance
                ? _value.availableBalance
                : availableBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            lastSynced: freezed == lastSynced
                ? _value.lastSynced
                : lastSynced // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            isManual: null == isManual
                ? _value.isManual
                : isManual // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLinked: null == isLinked
                ? _value.isLinked
                : isLinked // ignore: cast_nullable_to_non_nullable
                      as bool,
            institutionLogo: freezed == institutionLogo
                ? _value.institutionLogo
                : institutionLogo // ignore: cast_nullable_to_non_nullable
                      as String?,
            institutionId: freezed == institutionId
                ? _value.institutionId
                : institutionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            providerAccountId: freezed == providerAccountId
                ? _value.providerAccountId
                : providerAccountId // ignore: cast_nullable_to_non_nullable
                      as String?,
            providerType: freezed == providerType
                ? _value.providerType
                : providerType // ignore: cast_nullable_to_non_nullable
                      as String?,
            accessToken: freezed == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AccountModelImplCopyWith<$Res>
    implements $AccountModelCopyWith<$Res> {
  factory _$$AccountModelImplCopyWith(
    _$AccountModelImpl value,
    $Res Function(_$AccountModelImpl) then,
  ) = __$$AccountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String? plaidAccountId,
    String institutionName,
    AccountType accountType,
    String accountName,
    String? mask,
    double currentBalance,
    double availableBalance,
    String currency,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? lastSynced,
    bool isActive,
    bool isManual,
    bool isLinked,
    String? institutionLogo,
    String? institutionId,
    String? providerAccountId,
    String? providerType,
    String? accessToken,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$AccountModelImplCopyWithImpl<$Res>
    extends _$AccountModelCopyWithImpl<$Res, _$AccountModelImpl>
    implements _$$AccountModelImplCopyWith<$Res> {
  __$$AccountModelImplCopyWithImpl(
    _$AccountModelImpl _value,
    $Res Function(_$AccountModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AccountModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? plaidAccountId = freezed,
    Object? institutionName = null,
    Object? accountType = null,
    Object? accountName = null,
    Object? mask = freezed,
    Object? currentBalance = null,
    Object? availableBalance = null,
    Object? currency = null,
    Object? lastSynced = freezed,
    Object? isActive = null,
    Object? isManual = null,
    Object? isLinked = null,
    Object? institutionLogo = freezed,
    Object? institutionId = freezed,
    Object? providerAccountId = freezed,
    Object? providerType = freezed,
    Object? accessToken = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$AccountModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        plaidAccountId: freezed == plaidAccountId
            ? _value.plaidAccountId
            : plaidAccountId // ignore: cast_nullable_to_non_nullable
                  as String?,
        institutionName: null == institutionName
            ? _value.institutionName
            : institutionName // ignore: cast_nullable_to_non_nullable
                  as String,
        accountType: null == accountType
            ? _value.accountType
            : accountType // ignore: cast_nullable_to_non_nullable
                  as AccountType,
        accountName: null == accountName
            ? _value.accountName
            : accountName // ignore: cast_nullable_to_non_nullable
                  as String,
        mask: freezed == mask
            ? _value.mask
            : mask // ignore: cast_nullable_to_non_nullable
                  as String?,
        currentBalance: null == currentBalance
            ? _value.currentBalance
            : currentBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        availableBalance: null == availableBalance
            ? _value.availableBalance
            : availableBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        lastSynced: freezed == lastSynced
            ? _value.lastSynced
            : lastSynced // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        isManual: null == isManual
            ? _value.isManual
            : isManual // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLinked: null == isLinked
            ? _value.isLinked
            : isLinked // ignore: cast_nullable_to_non_nullable
                  as bool,
        institutionLogo: freezed == institutionLogo
            ? _value.institutionLogo
            : institutionLogo // ignore: cast_nullable_to_non_nullable
                  as String?,
        institutionId: freezed == institutionId
            ? _value.institutionId
            : institutionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        providerAccountId: freezed == providerAccountId
            ? _value.providerAccountId
            : providerAccountId // ignore: cast_nullable_to_non_nullable
                  as String?,
        providerType: freezed == providerType
            ? _value.providerType
            : providerType // ignore: cast_nullable_to_non_nullable
                  as String?,
        accessToken: freezed == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountModelImpl implements _AccountModel {
  const _$AccountModelImpl({
    required this.id,
    required this.userId,
    this.plaidAccountId,
    required this.institutionName,
    required this.accountType,
    required this.accountName,
    this.mask,
    this.currentBalance = 0.0,
    this.availableBalance = 0.0,
    this.currency = 'USD',
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.lastSynced,
    this.isActive = true,
    this.isManual = false,
    this.isLinked = false,
    this.institutionLogo,
    this.institutionId,
    this.providerAccountId,
    this.providerType,
    this.accessToken,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.createdAt,
  });

  factory _$AccountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? plaidAccountId;
  @override
  final String institutionName;
  @override
  final AccountType accountType;
  @override
  final String accountName;
  @override
  final String? mask;
  @override
  @JsonKey()
  final double currentBalance;
  @override
  @JsonKey()
  final double availableBalance;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? lastSynced;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isManual;
  @override
  @JsonKey()
  final bool isLinked;
  // Whether account is linked via bank provider
  @override
  final String? institutionLogo;
  @override
  final String? institutionId;
  // Provider institution ID
  @override
  final String? providerAccountId;
  // Account ID from provider (Plaid, etc.)
  @override
  final String? providerType;
  // Provider type name (e.g., 'plaid', 'trueLayer')
  @override
  final String? accessToken;
  // Access token for provider API
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'AccountModel(id: $id, userId: $userId, plaidAccountId: $plaidAccountId, institutionName: $institutionName, accountType: $accountType, accountName: $accountName, mask: $mask, currentBalance: $currentBalance, availableBalance: $availableBalance, currency: $currency, lastSynced: $lastSynced, isActive: $isActive, isManual: $isManual, isLinked: $isLinked, institutionLogo: $institutionLogo, institutionId: $institutionId, providerAccountId: $providerAccountId, providerType: $providerType, accessToken: $accessToken, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.plaidAccountId, plaidAccountId) ||
                other.plaidAccountId == plaidAccountId) &&
            (identical(other.institutionName, institutionName) ||
                other.institutionName == institutionName) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName) &&
            (identical(other.mask, mask) || other.mask == mask) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.availableBalance, availableBalance) ||
                other.availableBalance == availableBalance) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.lastSynced, lastSynced) ||
                other.lastSynced == lastSynced) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isManual, isManual) ||
                other.isManual == isManual) &&
            (identical(other.isLinked, isLinked) ||
                other.isLinked == isLinked) &&
            (identical(other.institutionLogo, institutionLogo) ||
                other.institutionLogo == institutionLogo) &&
            (identical(other.institutionId, institutionId) ||
                other.institutionId == institutionId) &&
            (identical(other.providerAccountId, providerAccountId) ||
                other.providerAccountId == providerAccountId) &&
            (identical(other.providerType, providerType) ||
                other.providerType == providerType) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    userId,
    plaidAccountId,
    institutionName,
    accountType,
    accountName,
    mask,
    currentBalance,
    availableBalance,
    currency,
    lastSynced,
    isActive,
    isManual,
    isLinked,
    institutionLogo,
    institutionId,
    providerAccountId,
    providerType,
    accessToken,
    createdAt,
  ]);

  /// Create a copy of AccountModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountModelImplCopyWith<_$AccountModelImpl> get copyWith =>
      __$$AccountModelImplCopyWithImpl<_$AccountModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountModelImplToJson(this);
  }
}

abstract class _AccountModel implements AccountModel {
  const factory _AccountModel({
    required final String id,
    required final String userId,
    final String? plaidAccountId,
    required final String institutionName,
    required final AccountType accountType,
    required final String accountName,
    final String? mask,
    final double currentBalance,
    final double availableBalance,
    final String currency,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? lastSynced,
    final bool isActive,
    final bool isManual,
    final bool isLinked,
    final String? institutionLogo,
    final String? institutionId,
    final String? providerAccountId,
    final String? providerType,
    final String? accessToken,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? createdAt,
  }) = _$AccountModelImpl;

  factory _AccountModel.fromJson(Map<String, dynamic> json) =
      _$AccountModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String? get plaidAccountId;
  @override
  String get institutionName;
  @override
  AccountType get accountType;
  @override
  String get accountName;
  @override
  String? get mask;
  @override
  double get currentBalance;
  @override
  double get availableBalance;
  @override
  String get currency;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get lastSynced;
  @override
  bool get isActive;
  @override
  bool get isManual;
  @override
  bool get isLinked; // Whether account is linked via bank provider
  @override
  String? get institutionLogo;
  @override
  String? get institutionId; // Provider institution ID
  @override
  String? get providerAccountId; // Account ID from provider (Plaid, etc.)
  @override
  String? get providerType; // Provider type name (e.g., 'plaid', 'trueLayer')
  @override
  String? get accessToken; // Access token for provider API
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt;

  /// Create a copy of AccountModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountModelImplCopyWith<_$AccountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
