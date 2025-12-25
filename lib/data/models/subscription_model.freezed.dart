// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) {
  return _Subscription.fromJson(json);
}

/// @nodoc
mixin _$Subscription {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  BillingFrequency get frequency => throw _privateConstructorUsedError;
  SubscriptionStatus get status => throw _privateConstructorUsedError;
  CategoryType get category => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get nextBillingDate => throw _privateConstructorUsedError;
  DateTime? get lastUsedDate => throw _privateConstructorUsedError;
  String? get merchantName => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DecayStatus get decayStatus => throw _privateConstructorUsedError;
  double? get usageScore => throw _privateConstructorUsedError; // 0-100
  int? get usageCount =>
      throw _privateConstructorUsedError; // times used in billing period
  bool? get autoDetected => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Subscription to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionCopyWith<Subscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionCopyWith<$Res> {
  factory $SubscriptionCopyWith(
    Subscription value,
    $Res Function(Subscription) then,
  ) = _$SubscriptionCopyWithImpl<$Res, Subscription>;
  @useResult
  $Res call({
    String id,
    String userId,
    String name,
    double amount,
    BillingFrequency frequency,
    SubscriptionStatus status,
    CategoryType category,
    DateTime? startDate,
    DateTime? nextBillingDate,
    DateTime? lastUsedDate,
    String? merchantName,
    String? logoUrl,
    String? description,
    DecayStatus decayStatus,
    double? usageScore,
    int? usageCount,
    bool? autoDetected,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$SubscriptionCopyWithImpl<$Res, $Val extends Subscription>
    implements $SubscriptionCopyWith<$Res> {
  _$SubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? amount = null,
    Object? frequency = null,
    Object? status = null,
    Object? category = null,
    Object? startDate = freezed,
    Object? nextBillingDate = freezed,
    Object? lastUsedDate = freezed,
    Object? merchantName = freezed,
    Object? logoUrl = freezed,
    Object? description = freezed,
    Object? decayStatus = null,
    Object? usageScore = freezed,
    Object? usageCount = freezed,
    Object? autoDetected = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            frequency: null == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
                      as BillingFrequency,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as SubscriptionStatus,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as CategoryType,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            nextBillingDate: freezed == nextBillingDate
                ? _value.nextBillingDate
                : nextBillingDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            lastUsedDate: freezed == lastUsedDate
                ? _value.lastUsedDate
                : lastUsedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            merchantName: freezed == merchantName
                ? _value.merchantName
                : merchantName // ignore: cast_nullable_to_non_nullable
                      as String?,
            logoUrl: freezed == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            decayStatus: null == decayStatus
                ? _value.decayStatus
                : decayStatus // ignore: cast_nullable_to_non_nullable
                      as DecayStatus,
            usageScore: freezed == usageScore
                ? _value.usageScore
                : usageScore // ignore: cast_nullable_to_non_nullable
                      as double?,
            usageCount: freezed == usageCount
                ? _value.usageCount
                : usageCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            autoDetected: freezed == autoDetected
                ? _value.autoDetected
                : autoDetected // ignore: cast_nullable_to_non_nullable
                      as bool?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscriptionImplCopyWith<$Res>
    implements $SubscriptionCopyWith<$Res> {
  factory _$$SubscriptionImplCopyWith(
    _$SubscriptionImpl value,
    $Res Function(_$SubscriptionImpl) then,
  ) = __$$SubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String name,
    double amount,
    BillingFrequency frequency,
    SubscriptionStatus status,
    CategoryType category,
    DateTime? startDate,
    DateTime? nextBillingDate,
    DateTime? lastUsedDate,
    String? merchantName,
    String? logoUrl,
    String? description,
    DecayStatus decayStatus,
    double? usageScore,
    int? usageCount,
    bool? autoDetected,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$SubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionCopyWithImpl<$Res, _$SubscriptionImpl>
    implements _$$SubscriptionImplCopyWith<$Res> {
  __$$SubscriptionImplCopyWithImpl(
    _$SubscriptionImpl _value,
    $Res Function(_$SubscriptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? amount = null,
    Object? frequency = null,
    Object? status = null,
    Object? category = null,
    Object? startDate = freezed,
    Object? nextBillingDate = freezed,
    Object? lastUsedDate = freezed,
    Object? merchantName = freezed,
    Object? logoUrl = freezed,
    Object? description = freezed,
    Object? decayStatus = null,
    Object? usageScore = freezed,
    Object? usageCount = freezed,
    Object? autoDetected = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$SubscriptionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        frequency: null == frequency
            ? _value.frequency
            : frequency // ignore: cast_nullable_to_non_nullable
                  as BillingFrequency,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as SubscriptionStatus,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as CategoryType,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        nextBillingDate: freezed == nextBillingDate
            ? _value.nextBillingDate
            : nextBillingDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        lastUsedDate: freezed == lastUsedDate
            ? _value.lastUsedDate
            : lastUsedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        merchantName: freezed == merchantName
            ? _value.merchantName
            : merchantName // ignore: cast_nullable_to_non_nullable
                  as String?,
        logoUrl: freezed == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        decayStatus: null == decayStatus
            ? _value.decayStatus
            : decayStatus // ignore: cast_nullable_to_non_nullable
                  as DecayStatus,
        usageScore: freezed == usageScore
            ? _value.usageScore
            : usageScore // ignore: cast_nullable_to_non_nullable
                  as double?,
        usageCount: freezed == usageCount
            ? _value.usageCount
            : usageCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        autoDetected: freezed == autoDetected
            ? _value.autoDetected
            : autoDetected // ignore: cast_nullable_to_non_nullable
                  as bool?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionImpl implements _Subscription {
  const _$SubscriptionImpl({
    required this.id,
    required this.userId,
    required this.name,
    required this.amount,
    required this.frequency,
    required this.status,
    required this.category,
    this.startDate,
    this.nextBillingDate,
    this.lastUsedDate,
    this.merchantName,
    this.logoUrl,
    this.description,
    this.decayStatus = DecayStatus.active,
    this.usageScore,
    this.usageCount,
    this.autoDetected,
    this.createdAt,
    this.updatedAt,
  });

  factory _$SubscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final double amount;
  @override
  final BillingFrequency frequency;
  @override
  final SubscriptionStatus status;
  @override
  final CategoryType category;
  @override
  final DateTime? startDate;
  @override
  final DateTime? nextBillingDate;
  @override
  final DateTime? lastUsedDate;
  @override
  final String? merchantName;
  @override
  final String? logoUrl;
  @override
  final String? description;
  @override
  @JsonKey()
  final DecayStatus decayStatus;
  @override
  final double? usageScore;
  // 0-100
  @override
  final int? usageCount;
  // times used in billing period
  @override
  final bool? autoDetected;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Subscription(id: $id, userId: $userId, name: $name, amount: $amount, frequency: $frequency, status: $status, category: $category, startDate: $startDate, nextBillingDate: $nextBillingDate, lastUsedDate: $lastUsedDate, merchantName: $merchantName, logoUrl: $logoUrl, description: $description, decayStatus: $decayStatus, usageScore: $usageScore, usageCount: $usageCount, autoDetected: $autoDetected, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.nextBillingDate, nextBillingDate) ||
                other.nextBillingDate == nextBillingDate) &&
            (identical(other.lastUsedDate, lastUsedDate) ||
                other.lastUsedDate == lastUsedDate) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.decayStatus, decayStatus) ||
                other.decayStatus == decayStatus) &&
            (identical(other.usageScore, usageScore) ||
                other.usageScore == usageScore) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            (identical(other.autoDetected, autoDetected) ||
                other.autoDetected == autoDetected) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    userId,
    name,
    amount,
    frequency,
    status,
    category,
    startDate,
    nextBillingDate,
    lastUsedDate,
    merchantName,
    logoUrl,
    description,
    decayStatus,
    usageScore,
    usageCount,
    autoDetected,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      __$$SubscriptionImplCopyWithImpl<_$SubscriptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionImplToJson(this);
  }
}

abstract class _Subscription implements Subscription {
  const factory _Subscription({
    required final String id,
    required final String userId,
    required final String name,
    required final double amount,
    required final BillingFrequency frequency,
    required final SubscriptionStatus status,
    required final CategoryType category,
    final DateTime? startDate,
    final DateTime? nextBillingDate,
    final DateTime? lastUsedDate,
    final String? merchantName,
    final String? logoUrl,
    final String? description,
    final DecayStatus decayStatus,
    final double? usageScore,
    final int? usageCount,
    final bool? autoDetected,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$SubscriptionImpl;

  factory _Subscription.fromJson(Map<String, dynamic> json) =
      _$SubscriptionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get name;
  @override
  double get amount;
  @override
  BillingFrequency get frequency;
  @override
  SubscriptionStatus get status;
  @override
  CategoryType get category;
  @override
  DateTime? get startDate;
  @override
  DateTime? get nextBillingDate;
  @override
  DateTime? get lastUsedDate;
  @override
  String? get merchantName;
  @override
  String? get logoUrl;
  @override
  String? get description;
  @override
  DecayStatus get decayStatus;
  @override
  double? get usageScore; // 0-100
  @override
  int? get usageCount; // times used in billing period
  @override
  bool? get autoDetected;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Subscription
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionImplCopyWith<_$SubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscriptionDecayAnalysis _$SubscriptionDecayAnalysisFromJson(
  Map<String, dynamic> json,
) {
  return _SubscriptionDecayAnalysis.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionDecayAnalysis {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get analysisDate => throw _privateConstructorUsedError;
  List<SubscriptionDecayItem> get items => throw _privateConstructorUsedError;
  double get totalMonthlySpend => throw _privateConstructorUsedError;
  double get wastedMonthlySpend => throw _privateConstructorUsedError;
  double get potentialSavings => throw _privateConstructorUsedError;
  int get totalSubscriptions => throw _privateConstructorUsedError;
  int get atRiskSubscriptions => throw _privateConstructorUsedError;
  int get abandonedSubscriptions => throw _privateConstructorUsedError;
  List<String> get recommendations => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionDecayAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionDecayAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionDecayAnalysisCopyWith<SubscriptionDecayAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionDecayAnalysisCopyWith<$Res> {
  factory $SubscriptionDecayAnalysisCopyWith(
    SubscriptionDecayAnalysis value,
    $Res Function(SubscriptionDecayAnalysis) then,
  ) = _$SubscriptionDecayAnalysisCopyWithImpl<$Res, SubscriptionDecayAnalysis>;
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime analysisDate,
    List<SubscriptionDecayItem> items,
    double totalMonthlySpend,
    double wastedMonthlySpend,
    double potentialSavings,
    int totalSubscriptions,
    int atRiskSubscriptions,
    int abandonedSubscriptions,
    List<String> recommendations,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$SubscriptionDecayAnalysisCopyWithImpl<
  $Res,
  $Val extends SubscriptionDecayAnalysis
>
    implements $SubscriptionDecayAnalysisCopyWith<$Res> {
  _$SubscriptionDecayAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionDecayAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? analysisDate = null,
    Object? items = null,
    Object? totalMonthlySpend = null,
    Object? wastedMonthlySpend = null,
    Object? potentialSavings = null,
    Object? totalSubscriptions = null,
    Object? atRiskSubscriptions = null,
    Object? abandonedSubscriptions = null,
    Object? recommendations = null,
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
            analysisDate: null == analysisDate
                ? _value.analysisDate
                : analysisDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<SubscriptionDecayItem>,
            totalMonthlySpend: null == totalMonthlySpend
                ? _value.totalMonthlySpend
                : totalMonthlySpend // ignore: cast_nullable_to_non_nullable
                      as double,
            wastedMonthlySpend: null == wastedMonthlySpend
                ? _value.wastedMonthlySpend
                : wastedMonthlySpend // ignore: cast_nullable_to_non_nullable
                      as double,
            potentialSavings: null == potentialSavings
                ? _value.potentialSavings
                : potentialSavings // ignore: cast_nullable_to_non_nullable
                      as double,
            totalSubscriptions: null == totalSubscriptions
                ? _value.totalSubscriptions
                : totalSubscriptions // ignore: cast_nullable_to_non_nullable
                      as int,
            atRiskSubscriptions: null == atRiskSubscriptions
                ? _value.atRiskSubscriptions
                : atRiskSubscriptions // ignore: cast_nullable_to_non_nullable
                      as int,
            abandonedSubscriptions: null == abandonedSubscriptions
                ? _value.abandonedSubscriptions
                : abandonedSubscriptions // ignore: cast_nullable_to_non_nullable
                      as int,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<String>,
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
abstract class _$$SubscriptionDecayAnalysisImplCopyWith<$Res>
    implements $SubscriptionDecayAnalysisCopyWith<$Res> {
  factory _$$SubscriptionDecayAnalysisImplCopyWith(
    _$SubscriptionDecayAnalysisImpl value,
    $Res Function(_$SubscriptionDecayAnalysisImpl) then,
  ) = __$$SubscriptionDecayAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime analysisDate,
    List<SubscriptionDecayItem> items,
    double totalMonthlySpend,
    double wastedMonthlySpend,
    double potentialSavings,
    int totalSubscriptions,
    int atRiskSubscriptions,
    int abandonedSubscriptions,
    List<String> recommendations,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$SubscriptionDecayAnalysisImplCopyWithImpl<$Res>
    extends
        _$SubscriptionDecayAnalysisCopyWithImpl<
          $Res,
          _$SubscriptionDecayAnalysisImpl
        >
    implements _$$SubscriptionDecayAnalysisImplCopyWith<$Res> {
  __$$SubscriptionDecayAnalysisImplCopyWithImpl(
    _$SubscriptionDecayAnalysisImpl _value,
    $Res Function(_$SubscriptionDecayAnalysisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionDecayAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? analysisDate = null,
    Object? items = null,
    Object? totalMonthlySpend = null,
    Object? wastedMonthlySpend = null,
    Object? potentialSavings = null,
    Object? totalSubscriptions = null,
    Object? atRiskSubscriptions = null,
    Object? abandonedSubscriptions = null,
    Object? recommendations = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$SubscriptionDecayAnalysisImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        analysisDate: null == analysisDate
            ? _value.analysisDate
            : analysisDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<SubscriptionDecayItem>,
        totalMonthlySpend: null == totalMonthlySpend
            ? _value.totalMonthlySpend
            : totalMonthlySpend // ignore: cast_nullable_to_non_nullable
                  as double,
        wastedMonthlySpend: null == wastedMonthlySpend
            ? _value.wastedMonthlySpend
            : wastedMonthlySpend // ignore: cast_nullable_to_non_nullable
                  as double,
        potentialSavings: null == potentialSavings
            ? _value.potentialSavings
            : potentialSavings // ignore: cast_nullable_to_non_nullable
                  as double,
        totalSubscriptions: null == totalSubscriptions
            ? _value.totalSubscriptions
            : totalSubscriptions // ignore: cast_nullable_to_non_nullable
                  as int,
        atRiskSubscriptions: null == atRiskSubscriptions
            ? _value.atRiskSubscriptions
            : atRiskSubscriptions // ignore: cast_nullable_to_non_nullable
                  as int,
        abandonedSubscriptions: null == abandonedSubscriptions
            ? _value.abandonedSubscriptions
            : abandonedSubscriptions // ignore: cast_nullable_to_non_nullable
                  as int,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<String>,
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
class _$SubscriptionDecayAnalysisImpl implements _SubscriptionDecayAnalysis {
  const _$SubscriptionDecayAnalysisImpl({
    required this.id,
    required this.userId,
    required this.analysisDate,
    required final List<SubscriptionDecayItem> items,
    required this.totalMonthlySpend,
    required this.wastedMonthlySpend,
    required this.potentialSavings,
    required this.totalSubscriptions,
    required this.atRiskSubscriptions,
    required this.abandonedSubscriptions,
    final List<String> recommendations = const [],
    this.createdAt,
  }) : _items = items,
       _recommendations = recommendations;

  factory _$SubscriptionDecayAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionDecayAnalysisImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime analysisDate;
  final List<SubscriptionDecayItem> _items;
  @override
  List<SubscriptionDecayItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final double totalMonthlySpend;
  @override
  final double wastedMonthlySpend;
  @override
  final double potentialSavings;
  @override
  final int totalSubscriptions;
  @override
  final int atRiskSubscriptions;
  @override
  final int abandonedSubscriptions;
  final List<String> _recommendations;
  @override
  @JsonKey()
  List<String> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'SubscriptionDecayAnalysis(id: $id, userId: $userId, analysisDate: $analysisDate, items: $items, totalMonthlySpend: $totalMonthlySpend, wastedMonthlySpend: $wastedMonthlySpend, potentialSavings: $potentialSavings, totalSubscriptions: $totalSubscriptions, atRiskSubscriptions: $atRiskSubscriptions, abandonedSubscriptions: $abandonedSubscriptions, recommendations: $recommendations, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionDecayAnalysisImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.analysisDate, analysisDate) ||
                other.analysisDate == analysisDate) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalMonthlySpend, totalMonthlySpend) ||
                other.totalMonthlySpend == totalMonthlySpend) &&
            (identical(other.wastedMonthlySpend, wastedMonthlySpend) ||
                other.wastedMonthlySpend == wastedMonthlySpend) &&
            (identical(other.potentialSavings, potentialSavings) ||
                other.potentialSavings == potentialSavings) &&
            (identical(other.totalSubscriptions, totalSubscriptions) ||
                other.totalSubscriptions == totalSubscriptions) &&
            (identical(other.atRiskSubscriptions, atRiskSubscriptions) ||
                other.atRiskSubscriptions == atRiskSubscriptions) &&
            (identical(other.abandonedSubscriptions, abandonedSubscriptions) ||
                other.abandonedSubscriptions == abandonedSubscriptions) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    analysisDate,
    const DeepCollectionEquality().hash(_items),
    totalMonthlySpend,
    wastedMonthlySpend,
    potentialSavings,
    totalSubscriptions,
    atRiskSubscriptions,
    abandonedSubscriptions,
    const DeepCollectionEquality().hash(_recommendations),
    createdAt,
  );

  /// Create a copy of SubscriptionDecayAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionDecayAnalysisImplCopyWith<_$SubscriptionDecayAnalysisImpl>
  get copyWith =>
      __$$SubscriptionDecayAnalysisImplCopyWithImpl<
        _$SubscriptionDecayAnalysisImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionDecayAnalysisImplToJson(this);
  }
}

abstract class _SubscriptionDecayAnalysis implements SubscriptionDecayAnalysis {
  const factory _SubscriptionDecayAnalysis({
    required final String id,
    required final String userId,
    required final DateTime analysisDate,
    required final List<SubscriptionDecayItem> items,
    required final double totalMonthlySpend,
    required final double wastedMonthlySpend,
    required final double potentialSavings,
    required final int totalSubscriptions,
    required final int atRiskSubscriptions,
    required final int abandonedSubscriptions,
    final List<String> recommendations,
    final DateTime? createdAt,
  }) = _$SubscriptionDecayAnalysisImpl;

  factory _SubscriptionDecayAnalysis.fromJson(Map<String, dynamic> json) =
      _$SubscriptionDecayAnalysisImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get analysisDate;
  @override
  List<SubscriptionDecayItem> get items;
  @override
  double get totalMonthlySpend;
  @override
  double get wastedMonthlySpend;
  @override
  double get potentialSavings;
  @override
  int get totalSubscriptions;
  @override
  int get atRiskSubscriptions;
  @override
  int get abandonedSubscriptions;
  @override
  List<String> get recommendations;
  @override
  DateTime? get createdAt;

  /// Create a copy of SubscriptionDecayAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionDecayAnalysisImplCopyWith<_$SubscriptionDecayAnalysisImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SubscriptionDecayItem _$SubscriptionDecayItemFromJson(
  Map<String, dynamic> json,
) {
  return _SubscriptionDecayItem.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionDecayItem {
  Subscription get subscription => throw _privateConstructorUsedError;
  DecayStatus get decayStatus => throw _privateConstructorUsedError;
  double get usageScore => throw _privateConstructorUsedError;
  double get valueScore =>
      throw _privateConstructorUsedError; // cost vs usage ratio
  int get daysSinceLastUse => throw _privateConstructorUsedError;
  double get monthlyEquivalent => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;
  List<String> get alternatives => throw _privateConstructorUsedError;
  bool? get shouldCancel => throw _privateConstructorUsedError;
  bool? get shouldDowngrade => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionDecayItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionDecayItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionDecayItemCopyWith<SubscriptionDecayItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionDecayItemCopyWith<$Res> {
  factory $SubscriptionDecayItemCopyWith(
    SubscriptionDecayItem value,
    $Res Function(SubscriptionDecayItem) then,
  ) = _$SubscriptionDecayItemCopyWithImpl<$Res, SubscriptionDecayItem>;
  @useResult
  $Res call({
    Subscription subscription,
    DecayStatus decayStatus,
    double usageScore,
    double valueScore,
    int daysSinceLastUse,
    double monthlyEquivalent,
    String recommendation,
    List<String> alternatives,
    bool? shouldCancel,
    bool? shouldDowngrade,
  });

  $SubscriptionCopyWith<$Res> get subscription;
}

/// @nodoc
class _$SubscriptionDecayItemCopyWithImpl<
  $Res,
  $Val extends SubscriptionDecayItem
>
    implements $SubscriptionDecayItemCopyWith<$Res> {
  _$SubscriptionDecayItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionDecayItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = null,
    Object? decayStatus = null,
    Object? usageScore = null,
    Object? valueScore = null,
    Object? daysSinceLastUse = null,
    Object? monthlyEquivalent = null,
    Object? recommendation = null,
    Object? alternatives = null,
    Object? shouldCancel = freezed,
    Object? shouldDowngrade = freezed,
  }) {
    return _then(
      _value.copyWith(
            subscription: null == subscription
                ? _value.subscription
                : subscription // ignore: cast_nullable_to_non_nullable
                      as Subscription,
            decayStatus: null == decayStatus
                ? _value.decayStatus
                : decayStatus // ignore: cast_nullable_to_non_nullable
                      as DecayStatus,
            usageScore: null == usageScore
                ? _value.usageScore
                : usageScore // ignore: cast_nullable_to_non_nullable
                      as double,
            valueScore: null == valueScore
                ? _value.valueScore
                : valueScore // ignore: cast_nullable_to_non_nullable
                      as double,
            daysSinceLastUse: null == daysSinceLastUse
                ? _value.daysSinceLastUse
                : daysSinceLastUse // ignore: cast_nullable_to_non_nullable
                      as int,
            monthlyEquivalent: null == monthlyEquivalent
                ? _value.monthlyEquivalent
                : monthlyEquivalent // ignore: cast_nullable_to_non_nullable
                      as double,
            recommendation: null == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                      as String,
            alternatives: null == alternatives
                ? _value.alternatives
                : alternatives // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            shouldCancel: freezed == shouldCancel
                ? _value.shouldCancel
                : shouldCancel // ignore: cast_nullable_to_non_nullable
                      as bool?,
            shouldDowngrade: freezed == shouldDowngrade
                ? _value.shouldDowngrade
                : shouldDowngrade // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }

  /// Create a copy of SubscriptionDecayItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionCopyWith<$Res> get subscription {
    return $SubscriptionCopyWith<$Res>(_value.subscription, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubscriptionDecayItemImplCopyWith<$Res>
    implements $SubscriptionDecayItemCopyWith<$Res> {
  factory _$$SubscriptionDecayItemImplCopyWith(
    _$SubscriptionDecayItemImpl value,
    $Res Function(_$SubscriptionDecayItemImpl) then,
  ) = __$$SubscriptionDecayItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Subscription subscription,
    DecayStatus decayStatus,
    double usageScore,
    double valueScore,
    int daysSinceLastUse,
    double monthlyEquivalent,
    String recommendation,
    List<String> alternatives,
    bool? shouldCancel,
    bool? shouldDowngrade,
  });

  @override
  $SubscriptionCopyWith<$Res> get subscription;
}

/// @nodoc
class __$$SubscriptionDecayItemImplCopyWithImpl<$Res>
    extends
        _$SubscriptionDecayItemCopyWithImpl<$Res, _$SubscriptionDecayItemImpl>
    implements _$$SubscriptionDecayItemImplCopyWith<$Res> {
  __$$SubscriptionDecayItemImplCopyWithImpl(
    _$SubscriptionDecayItemImpl _value,
    $Res Function(_$SubscriptionDecayItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionDecayItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = null,
    Object? decayStatus = null,
    Object? usageScore = null,
    Object? valueScore = null,
    Object? daysSinceLastUse = null,
    Object? monthlyEquivalent = null,
    Object? recommendation = null,
    Object? alternatives = null,
    Object? shouldCancel = freezed,
    Object? shouldDowngrade = freezed,
  }) {
    return _then(
      _$SubscriptionDecayItemImpl(
        subscription: null == subscription
            ? _value.subscription
            : subscription // ignore: cast_nullable_to_non_nullable
                  as Subscription,
        decayStatus: null == decayStatus
            ? _value.decayStatus
            : decayStatus // ignore: cast_nullable_to_non_nullable
                  as DecayStatus,
        usageScore: null == usageScore
            ? _value.usageScore
            : usageScore // ignore: cast_nullable_to_non_nullable
                  as double,
        valueScore: null == valueScore
            ? _value.valueScore
            : valueScore // ignore: cast_nullable_to_non_nullable
                  as double,
        daysSinceLastUse: null == daysSinceLastUse
            ? _value.daysSinceLastUse
            : daysSinceLastUse // ignore: cast_nullable_to_non_nullable
                  as int,
        monthlyEquivalent: null == monthlyEquivalent
            ? _value.monthlyEquivalent
            : monthlyEquivalent // ignore: cast_nullable_to_non_nullable
                  as double,
        recommendation: null == recommendation
            ? _value.recommendation
            : recommendation // ignore: cast_nullable_to_non_nullable
                  as String,
        alternatives: null == alternatives
            ? _value._alternatives
            : alternatives // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        shouldCancel: freezed == shouldCancel
            ? _value.shouldCancel
            : shouldCancel // ignore: cast_nullable_to_non_nullable
                  as bool?,
        shouldDowngrade: freezed == shouldDowngrade
            ? _value.shouldDowngrade
            : shouldDowngrade // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionDecayItemImpl implements _SubscriptionDecayItem {
  const _$SubscriptionDecayItemImpl({
    required this.subscription,
    required this.decayStatus,
    required this.usageScore,
    required this.valueScore,
    required this.daysSinceLastUse,
    required this.monthlyEquivalent,
    required this.recommendation,
    final List<String> alternatives = const [],
    this.shouldCancel,
    this.shouldDowngrade,
  }) : _alternatives = alternatives;

  factory _$SubscriptionDecayItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionDecayItemImplFromJson(json);

  @override
  final Subscription subscription;
  @override
  final DecayStatus decayStatus;
  @override
  final double usageScore;
  @override
  final double valueScore;
  // cost vs usage ratio
  @override
  final int daysSinceLastUse;
  @override
  final double monthlyEquivalent;
  @override
  final String recommendation;
  final List<String> _alternatives;
  @override
  @JsonKey()
  List<String> get alternatives {
    if (_alternatives is EqualUnmodifiableListView) return _alternatives;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alternatives);
  }

  @override
  final bool? shouldCancel;
  @override
  final bool? shouldDowngrade;

  @override
  String toString() {
    return 'SubscriptionDecayItem(subscription: $subscription, decayStatus: $decayStatus, usageScore: $usageScore, valueScore: $valueScore, daysSinceLastUse: $daysSinceLastUse, monthlyEquivalent: $monthlyEquivalent, recommendation: $recommendation, alternatives: $alternatives, shouldCancel: $shouldCancel, shouldDowngrade: $shouldDowngrade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionDecayItemImpl &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription) &&
            (identical(other.decayStatus, decayStatus) ||
                other.decayStatus == decayStatus) &&
            (identical(other.usageScore, usageScore) ||
                other.usageScore == usageScore) &&
            (identical(other.valueScore, valueScore) ||
                other.valueScore == valueScore) &&
            (identical(other.daysSinceLastUse, daysSinceLastUse) ||
                other.daysSinceLastUse == daysSinceLastUse) &&
            (identical(other.monthlyEquivalent, monthlyEquivalent) ||
                other.monthlyEquivalent == monthlyEquivalent) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            const DeepCollectionEquality().equals(
              other._alternatives,
              _alternatives,
            ) &&
            (identical(other.shouldCancel, shouldCancel) ||
                other.shouldCancel == shouldCancel) &&
            (identical(other.shouldDowngrade, shouldDowngrade) ||
                other.shouldDowngrade == shouldDowngrade));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    subscription,
    decayStatus,
    usageScore,
    valueScore,
    daysSinceLastUse,
    monthlyEquivalent,
    recommendation,
    const DeepCollectionEquality().hash(_alternatives),
    shouldCancel,
    shouldDowngrade,
  );

  /// Create a copy of SubscriptionDecayItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionDecayItemImplCopyWith<_$SubscriptionDecayItemImpl>
  get copyWith =>
      __$$SubscriptionDecayItemImplCopyWithImpl<_$SubscriptionDecayItemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionDecayItemImplToJson(this);
  }
}

abstract class _SubscriptionDecayItem implements SubscriptionDecayItem {
  const factory _SubscriptionDecayItem({
    required final Subscription subscription,
    required final DecayStatus decayStatus,
    required final double usageScore,
    required final double valueScore,
    required final int daysSinceLastUse,
    required final double monthlyEquivalent,
    required final String recommendation,
    final List<String> alternatives,
    final bool? shouldCancel,
    final bool? shouldDowngrade,
  }) = _$SubscriptionDecayItemImpl;

  factory _SubscriptionDecayItem.fromJson(Map<String, dynamic> json) =
      _$SubscriptionDecayItemImpl.fromJson;

  @override
  Subscription get subscription;
  @override
  DecayStatus get decayStatus;
  @override
  double get usageScore;
  @override
  double get valueScore; // cost vs usage ratio
  @override
  int get daysSinceLastUse;
  @override
  double get monthlyEquivalent;
  @override
  String get recommendation;
  @override
  List<String> get alternatives;
  @override
  bool? get shouldCancel;
  @override
  bool? get shouldDowngrade;

  /// Create a copy of SubscriptionDecayItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionDecayItemImplCopyWith<_$SubscriptionDecayItemImpl>
  get copyWith => throw _privateConstructorUsedError;
}

SubscriptionTemplate _$SubscriptionTemplateFromJson(Map<String, dynamic> json) {
  return _SubscriptionTemplate.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionTemplate {
  String get name => throw _privateConstructorUsedError;
  List<String> get merchantPatterns => throw _privateConstructorUsedError;
  CategoryType get category => throw _privateConstructorUsedError;
  BillingFrequency get typicalFrequency => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  double? get typicalPrice => throw _privateConstructorUsedError;

  /// Serializes this SubscriptionTemplate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubscriptionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscriptionTemplateCopyWith<SubscriptionTemplate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionTemplateCopyWith<$Res> {
  factory $SubscriptionTemplateCopyWith(
    SubscriptionTemplate value,
    $Res Function(SubscriptionTemplate) then,
  ) = _$SubscriptionTemplateCopyWithImpl<$Res, SubscriptionTemplate>;
  @useResult
  $Res call({
    String name,
    List<String> merchantPatterns,
    CategoryType category,
    BillingFrequency typicalFrequency,
    String? logoUrl,
    double? typicalPrice,
  });
}

/// @nodoc
class _$SubscriptionTemplateCopyWithImpl<
  $Res,
  $Val extends SubscriptionTemplate
>
    implements $SubscriptionTemplateCopyWith<$Res> {
  _$SubscriptionTemplateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? merchantPatterns = null,
    Object? category = null,
    Object? typicalFrequency = null,
    Object? logoUrl = freezed,
    Object? typicalPrice = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            merchantPatterns: null == merchantPatterns
                ? _value.merchantPatterns
                : merchantPatterns // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as CategoryType,
            typicalFrequency: null == typicalFrequency
                ? _value.typicalFrequency
                : typicalFrequency // ignore: cast_nullable_to_non_nullable
                      as BillingFrequency,
            logoUrl: freezed == logoUrl
                ? _value.logoUrl
                : logoUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            typicalPrice: freezed == typicalPrice
                ? _value.typicalPrice
                : typicalPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubscriptionTemplateImplCopyWith<$Res>
    implements $SubscriptionTemplateCopyWith<$Res> {
  factory _$$SubscriptionTemplateImplCopyWith(
    _$SubscriptionTemplateImpl value,
    $Res Function(_$SubscriptionTemplateImpl) then,
  ) = __$$SubscriptionTemplateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    List<String> merchantPatterns,
    CategoryType category,
    BillingFrequency typicalFrequency,
    String? logoUrl,
    double? typicalPrice,
  });
}

/// @nodoc
class __$$SubscriptionTemplateImplCopyWithImpl<$Res>
    extends _$SubscriptionTemplateCopyWithImpl<$Res, _$SubscriptionTemplateImpl>
    implements _$$SubscriptionTemplateImplCopyWith<$Res> {
  __$$SubscriptionTemplateImplCopyWithImpl(
    _$SubscriptionTemplateImpl _value,
    $Res Function(_$SubscriptionTemplateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubscriptionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? merchantPatterns = null,
    Object? category = null,
    Object? typicalFrequency = null,
    Object? logoUrl = freezed,
    Object? typicalPrice = freezed,
  }) {
    return _then(
      _$SubscriptionTemplateImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        merchantPatterns: null == merchantPatterns
            ? _value._merchantPatterns
            : merchantPatterns // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as CategoryType,
        typicalFrequency: null == typicalFrequency
            ? _value.typicalFrequency
            : typicalFrequency // ignore: cast_nullable_to_non_nullable
                  as BillingFrequency,
        logoUrl: freezed == logoUrl
            ? _value.logoUrl
            : logoUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        typicalPrice: freezed == typicalPrice
            ? _value.typicalPrice
            : typicalPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubscriptionTemplateImpl implements _SubscriptionTemplate {
  const _$SubscriptionTemplateImpl({
    required this.name,
    required final List<String> merchantPatterns,
    required this.category,
    required this.typicalFrequency,
    this.logoUrl,
    this.typicalPrice,
  }) : _merchantPatterns = merchantPatterns;

  factory _$SubscriptionTemplateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionTemplateImplFromJson(json);

  @override
  final String name;
  final List<String> _merchantPatterns;
  @override
  List<String> get merchantPatterns {
    if (_merchantPatterns is EqualUnmodifiableListView)
      return _merchantPatterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_merchantPatterns);
  }

  @override
  final CategoryType category;
  @override
  final BillingFrequency typicalFrequency;
  @override
  final String? logoUrl;
  @override
  final double? typicalPrice;

  @override
  String toString() {
    return 'SubscriptionTemplate(name: $name, merchantPatterns: $merchantPatterns, category: $category, typicalFrequency: $typicalFrequency, logoUrl: $logoUrl, typicalPrice: $typicalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionTemplateImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(
              other._merchantPatterns,
              _merchantPatterns,
            ) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.typicalFrequency, typicalFrequency) ||
                other.typicalFrequency == typicalFrequency) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.typicalPrice, typicalPrice) ||
                other.typicalPrice == typicalPrice));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    const DeepCollectionEquality().hash(_merchantPatterns),
    category,
    typicalFrequency,
    logoUrl,
    typicalPrice,
  );

  /// Create a copy of SubscriptionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionTemplateImplCopyWith<_$SubscriptionTemplateImpl>
  get copyWith =>
      __$$SubscriptionTemplateImplCopyWithImpl<_$SubscriptionTemplateImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionTemplateImplToJson(this);
  }
}

abstract class _SubscriptionTemplate implements SubscriptionTemplate {
  const factory _SubscriptionTemplate({
    required final String name,
    required final List<String> merchantPatterns,
    required final CategoryType category,
    required final BillingFrequency typicalFrequency,
    final String? logoUrl,
    final double? typicalPrice,
  }) = _$SubscriptionTemplateImpl;

  factory _SubscriptionTemplate.fromJson(Map<String, dynamic> json) =
      _$SubscriptionTemplateImpl.fromJson;

  @override
  String get name;
  @override
  List<String> get merchantPatterns;
  @override
  CategoryType get category;
  @override
  BillingFrequency get typicalFrequency;
  @override
  String? get logoUrl;
  @override
  double? get typicalPrice;

  /// Create a copy of SubscriptionTemplate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscriptionTemplateImplCopyWith<_$SubscriptionTemplateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
