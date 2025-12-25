// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cashflow_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CashflowPrediction _$CashflowPredictionFromJson(Map<String, dynamic> json) {
  return _CashflowPrediction.fromJson(json);
}

/// @nodoc
mixin _$CashflowPrediction {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  double get currentBalance => throw _privateConstructorUsedError;
  double get predictedBalance => throw _privateConstructorUsedError;
  DateTime get predictionDate => throw _privateConstructorUsedError;
  CashflowStatus get status => throw _privateConstructorUsedError;
  PredictionConfidence get confidence => throw _privateConstructorUsedError;
  List<CashflowEvent> get upcomingEvents => throw _privateConstructorUsedError;
  List<DailyBalance> get dailyProjections => throw _privateConstructorUsedError;
  DateTime? get crisisDate => throw _privateConstructorUsedError;
  double? get crisisAmount => throw _privateConstructorUsedError;
  String? get crisisReason => throw _privateConstructorUsedError;
  List<String> get recommendations => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CashflowPrediction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CashflowPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashflowPredictionCopyWith<CashflowPrediction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashflowPredictionCopyWith<$Res> {
  factory $CashflowPredictionCopyWith(
    CashflowPrediction value,
    $Res Function(CashflowPrediction) then,
  ) = _$CashflowPredictionCopyWithImpl<$Res, CashflowPrediction>;
  @useResult
  $Res call({
    String id,
    String userId,
    double currentBalance,
    double predictedBalance,
    DateTime predictionDate,
    CashflowStatus status,
    PredictionConfidence confidence,
    List<CashflowEvent> upcomingEvents,
    List<DailyBalance> dailyProjections,
    DateTime? crisisDate,
    double? crisisAmount,
    String? crisisReason,
    List<String> recommendations,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$CashflowPredictionCopyWithImpl<$Res, $Val extends CashflowPrediction>
    implements $CashflowPredictionCopyWith<$Res> {
  _$CashflowPredictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashflowPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? currentBalance = null,
    Object? predictedBalance = null,
    Object? predictionDate = null,
    Object? status = null,
    Object? confidence = null,
    Object? upcomingEvents = null,
    Object? dailyProjections = null,
    Object? crisisDate = freezed,
    Object? crisisAmount = freezed,
    Object? crisisReason = freezed,
    Object? recommendations = null,
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
            currentBalance: null == currentBalance
                ? _value.currentBalance
                : currentBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            predictedBalance: null == predictedBalance
                ? _value.predictedBalance
                : predictedBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            predictionDate: null == predictionDate
                ? _value.predictionDate
                : predictionDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as CashflowStatus,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as PredictionConfidence,
            upcomingEvents: null == upcomingEvents
                ? _value.upcomingEvents
                : upcomingEvents // ignore: cast_nullable_to_non_nullable
                      as List<CashflowEvent>,
            dailyProjections: null == dailyProjections
                ? _value.dailyProjections
                : dailyProjections // ignore: cast_nullable_to_non_nullable
                      as List<DailyBalance>,
            crisisDate: freezed == crisisDate
                ? _value.crisisDate
                : crisisDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            crisisAmount: freezed == crisisAmount
                ? _value.crisisAmount
                : crisisAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            crisisReason: freezed == crisisReason
                ? _value.crisisReason
                : crisisReason // ignore: cast_nullable_to_non_nullable
                      as String?,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<String>,
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
abstract class _$$CashflowPredictionImplCopyWith<$Res>
    implements $CashflowPredictionCopyWith<$Res> {
  factory _$$CashflowPredictionImplCopyWith(
    _$CashflowPredictionImpl value,
    $Res Function(_$CashflowPredictionImpl) then,
  ) = __$$CashflowPredictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    double currentBalance,
    double predictedBalance,
    DateTime predictionDate,
    CashflowStatus status,
    PredictionConfidence confidence,
    List<CashflowEvent> upcomingEvents,
    List<DailyBalance> dailyProjections,
    DateTime? crisisDate,
    double? crisisAmount,
    String? crisisReason,
    List<String> recommendations,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$CashflowPredictionImplCopyWithImpl<$Res>
    extends _$CashflowPredictionCopyWithImpl<$Res, _$CashflowPredictionImpl>
    implements _$$CashflowPredictionImplCopyWith<$Res> {
  __$$CashflowPredictionImplCopyWithImpl(
    _$CashflowPredictionImpl _value,
    $Res Function(_$CashflowPredictionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CashflowPrediction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? currentBalance = null,
    Object? predictedBalance = null,
    Object? predictionDate = null,
    Object? status = null,
    Object? confidence = null,
    Object? upcomingEvents = null,
    Object? dailyProjections = null,
    Object? crisisDate = freezed,
    Object? crisisAmount = freezed,
    Object? crisisReason = freezed,
    Object? recommendations = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$CashflowPredictionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        currentBalance: null == currentBalance
            ? _value.currentBalance
            : currentBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        predictedBalance: null == predictedBalance
            ? _value.predictedBalance
            : predictedBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        predictionDate: null == predictionDate
            ? _value.predictionDate
            : predictionDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CashflowStatus,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as PredictionConfidence,
        upcomingEvents: null == upcomingEvents
            ? _value._upcomingEvents
            : upcomingEvents // ignore: cast_nullable_to_non_nullable
                  as List<CashflowEvent>,
        dailyProjections: null == dailyProjections
            ? _value._dailyProjections
            : dailyProjections // ignore: cast_nullable_to_non_nullable
                  as List<DailyBalance>,
        crisisDate: freezed == crisisDate
            ? _value.crisisDate
            : crisisDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        crisisAmount: freezed == crisisAmount
            ? _value.crisisAmount
            : crisisAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        crisisReason: freezed == crisisReason
            ? _value.crisisReason
            : crisisReason // ignore: cast_nullable_to_non_nullable
                  as String?,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<String>,
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
class _$CashflowPredictionImpl extends _CashflowPrediction {
  const _$CashflowPredictionImpl({
    required this.id,
    required this.userId,
    required this.currentBalance,
    required this.predictedBalance,
    required this.predictionDate,
    required this.status,
    required this.confidence,
    final List<CashflowEvent> upcomingEvents = const [],
    final List<DailyBalance> dailyProjections = const [],
    this.crisisDate,
    this.crisisAmount,
    this.crisisReason,
    final List<String> recommendations = const [],
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.updatedAt,
  }) : _upcomingEvents = upcomingEvents,
       _dailyProjections = dailyProjections,
       _recommendations = recommendations,
       super._();

  factory _$CashflowPredictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashflowPredictionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final double currentBalance;
  @override
  final double predictedBalance;
  @override
  final DateTime predictionDate;
  @override
  final CashflowStatus status;
  @override
  final PredictionConfidence confidence;
  final List<CashflowEvent> _upcomingEvents;
  @override
  @JsonKey()
  List<CashflowEvent> get upcomingEvents {
    if (_upcomingEvents is EqualUnmodifiableListView) return _upcomingEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingEvents);
  }

  final List<DailyBalance> _dailyProjections;
  @override
  @JsonKey()
  List<DailyBalance> get dailyProjections {
    if (_dailyProjections is EqualUnmodifiableListView)
      return _dailyProjections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyProjections);
  }

  @override
  final DateTime? crisisDate;
  @override
  final double? crisisAmount;
  @override
  final String? crisisReason;
  final List<String> _recommendations;
  @override
  @JsonKey()
  List<String> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? createdAt;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CashflowPrediction(id: $id, userId: $userId, currentBalance: $currentBalance, predictedBalance: $predictedBalance, predictionDate: $predictionDate, status: $status, confidence: $confidence, upcomingEvents: $upcomingEvents, dailyProjections: $dailyProjections, crisisDate: $crisisDate, crisisAmount: $crisisAmount, crisisReason: $crisisReason, recommendations: $recommendations, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashflowPredictionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.currentBalance, currentBalance) ||
                other.currentBalance == currentBalance) &&
            (identical(other.predictedBalance, predictedBalance) ||
                other.predictedBalance == predictedBalance) &&
            (identical(other.predictionDate, predictionDate) ||
                other.predictionDate == predictionDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            const DeepCollectionEquality().equals(
              other._upcomingEvents,
              _upcomingEvents,
            ) &&
            const DeepCollectionEquality().equals(
              other._dailyProjections,
              _dailyProjections,
            ) &&
            (identical(other.crisisDate, crisisDate) ||
                other.crisisDate == crisisDate) &&
            (identical(other.crisisAmount, crisisAmount) ||
                other.crisisAmount == crisisAmount) &&
            (identical(other.crisisReason, crisisReason) ||
                other.crisisReason == crisisReason) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    currentBalance,
    predictedBalance,
    predictionDate,
    status,
    confidence,
    const DeepCollectionEquality().hash(_upcomingEvents),
    const DeepCollectionEquality().hash(_dailyProjections),
    crisisDate,
    crisisAmount,
    crisisReason,
    const DeepCollectionEquality().hash(_recommendations),
    createdAt,
    updatedAt,
  );

  /// Create a copy of CashflowPrediction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashflowPredictionImplCopyWith<_$CashflowPredictionImpl> get copyWith =>
      __$$CashflowPredictionImplCopyWithImpl<_$CashflowPredictionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CashflowPredictionImplToJson(this);
  }
}

abstract class _CashflowPrediction extends CashflowPrediction {
  const factory _CashflowPrediction({
    required final String id,
    required final String userId,
    required final double currentBalance,
    required final double predictedBalance,
    required final DateTime predictionDate,
    required final CashflowStatus status,
    required final PredictionConfidence confidence,
    final List<CashflowEvent> upcomingEvents,
    final List<DailyBalance> dailyProjections,
    final DateTime? crisisDate,
    final double? crisisAmount,
    final String? crisisReason,
    final List<String> recommendations,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? updatedAt,
  }) = _$CashflowPredictionImpl;
  const _CashflowPrediction._() : super._();

  factory _CashflowPrediction.fromJson(Map<String, dynamic> json) =
      _$CashflowPredictionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  double get currentBalance;
  @override
  double get predictedBalance;
  @override
  DateTime get predictionDate;
  @override
  CashflowStatus get status;
  @override
  PredictionConfidence get confidence;
  @override
  List<CashflowEvent> get upcomingEvents;
  @override
  List<DailyBalance> get dailyProjections;
  @override
  DateTime? get crisisDate;
  @override
  double? get crisisAmount;
  @override
  String? get crisisReason;
  @override
  List<String> get recommendations;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get updatedAt;

  /// Create a copy of CashflowPrediction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashflowPredictionImplCopyWith<_$CashflowPredictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CashflowEvent _$CashflowEventFromJson(Map<String, dynamic> json) {
  return _CashflowEvent.fromJson(json);
}

/// @nodoc
mixin _$CashflowEvent {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  CashflowEventType get type => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  String? get recurringPattern => throw _privateConstructorUsedError;
  CategoryType? get category => throw _privateConstructorUsedError;
  PredictionConfidence? get confidence => throw _privateConstructorUsedError;
  String? get merchantName => throw _privateConstructorUsedError;
  bool get isConfirmed => throw _privateConstructorUsedError;

  /// Serializes this CashflowEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashflowEventCopyWith<CashflowEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashflowEventCopyWith<$Res> {
  factory $CashflowEventCopyWith(
    CashflowEvent value,
    $Res Function(CashflowEvent) then,
  ) = _$CashflowEventCopyWithImpl<$Res, CashflowEvent>;
  @useResult
  $Res call({
    String id,
    String name,
    double amount,
    DateTime date,
    CashflowEventType type,
    bool isRecurring,
    String? recurringPattern,
    CategoryType? category,
    PredictionConfidence? confidence,
    String? merchantName,
    bool isConfirmed,
  });
}

/// @nodoc
class _$CashflowEventCopyWithImpl<$Res, $Val extends CashflowEvent>
    implements $CashflowEventCopyWith<$Res> {
  _$CashflowEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? date = null,
    Object? type = null,
    Object? isRecurring = null,
    Object? recurringPattern = freezed,
    Object? category = freezed,
    Object? confidence = freezed,
    Object? merchantName = freezed,
    Object? isConfirmed = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as CashflowEventType,
            isRecurring: null == isRecurring
                ? _value.isRecurring
                : isRecurring // ignore: cast_nullable_to_non_nullable
                      as bool,
            recurringPattern: freezed == recurringPattern
                ? _value.recurringPattern
                : recurringPattern // ignore: cast_nullable_to_non_nullable
                      as String?,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as CategoryType?,
            confidence: freezed == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as PredictionConfidence?,
            merchantName: freezed == merchantName
                ? _value.merchantName
                : merchantName // ignore: cast_nullable_to_non_nullable
                      as String?,
            isConfirmed: null == isConfirmed
                ? _value.isConfirmed
                : isConfirmed // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CashflowEventImplCopyWith<$Res>
    implements $CashflowEventCopyWith<$Res> {
  factory _$$CashflowEventImplCopyWith(
    _$CashflowEventImpl value,
    $Res Function(_$CashflowEventImpl) then,
  ) = __$$CashflowEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    double amount,
    DateTime date,
    CashflowEventType type,
    bool isRecurring,
    String? recurringPattern,
    CategoryType? category,
    PredictionConfidence? confidence,
    String? merchantName,
    bool isConfirmed,
  });
}

/// @nodoc
class __$$CashflowEventImplCopyWithImpl<$Res>
    extends _$CashflowEventCopyWithImpl<$Res, _$CashflowEventImpl>
    implements _$$CashflowEventImplCopyWith<$Res> {
  __$$CashflowEventImplCopyWithImpl(
    _$CashflowEventImpl _value,
    $Res Function(_$CashflowEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? amount = null,
    Object? date = null,
    Object? type = null,
    Object? isRecurring = null,
    Object? recurringPattern = freezed,
    Object? category = freezed,
    Object? confidence = freezed,
    Object? merchantName = freezed,
    Object? isConfirmed = null,
  }) {
    return _then(
      _$CashflowEventImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as CashflowEventType,
        isRecurring: null == isRecurring
            ? _value.isRecurring
            : isRecurring // ignore: cast_nullable_to_non_nullable
                  as bool,
        recurringPattern: freezed == recurringPattern
            ? _value.recurringPattern
            : recurringPattern // ignore: cast_nullable_to_non_nullable
                  as String?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as CategoryType?,
        confidence: freezed == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as PredictionConfidence?,
        merchantName: freezed == merchantName
            ? _value.merchantName
            : merchantName // ignore: cast_nullable_to_non_nullable
                  as String?,
        isConfirmed: null == isConfirmed
            ? _value.isConfirmed
            : isConfirmed // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CashflowEventImpl extends _CashflowEvent {
  const _$CashflowEventImpl({
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.type,
    required this.isRecurring,
    this.recurringPattern,
    this.category,
    this.confidence,
    this.merchantName,
    this.isConfirmed = false,
  }) : super._();

  factory _$CashflowEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashflowEventImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double amount;
  @override
  final DateTime date;
  @override
  final CashflowEventType type;
  @override
  final bool isRecurring;
  @override
  final String? recurringPattern;
  @override
  final CategoryType? category;
  @override
  final PredictionConfidence? confidence;
  @override
  final String? merchantName;
  @override
  @JsonKey()
  final bool isConfirmed;

  @override
  String toString() {
    return 'CashflowEvent(id: $id, name: $name, amount: $amount, date: $date, type: $type, isRecurring: $isRecurring, recurringPattern: $recurringPattern, category: $category, confidence: $confidence, merchantName: $merchantName, isConfirmed: $isConfirmed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashflowEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.recurringPattern, recurringPattern) ||
                other.recurringPattern == recurringPattern) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.isConfirmed, isConfirmed) ||
                other.isConfirmed == isConfirmed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    amount,
    date,
    type,
    isRecurring,
    recurringPattern,
    category,
    confidence,
    merchantName,
    isConfirmed,
  );

  /// Create a copy of CashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashflowEventImplCopyWith<_$CashflowEventImpl> get copyWith =>
      __$$CashflowEventImplCopyWithImpl<_$CashflowEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashflowEventImplToJson(this);
  }
}

abstract class _CashflowEvent extends CashflowEvent {
  const factory _CashflowEvent({
    required final String id,
    required final String name,
    required final double amount,
    required final DateTime date,
    required final CashflowEventType type,
    required final bool isRecurring,
    final String? recurringPattern,
    final CategoryType? category,
    final PredictionConfidence? confidence,
    final String? merchantName,
    final bool isConfirmed,
  }) = _$CashflowEventImpl;
  const _CashflowEvent._() : super._();

  factory _CashflowEvent.fromJson(Map<String, dynamic> json) =
      _$CashflowEventImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get amount;
  @override
  DateTime get date;
  @override
  CashflowEventType get type;
  @override
  bool get isRecurring;
  @override
  String? get recurringPattern;
  @override
  CategoryType? get category;
  @override
  PredictionConfidence? get confidence;
  @override
  String? get merchantName;
  @override
  bool get isConfirmed;

  /// Create a copy of CashflowEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashflowEventImplCopyWith<_$CashflowEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyBalance _$DailyBalanceFromJson(Map<String, dynamic> json) {
  return _DailyBalance.fromJson(json);
}

/// @nodoc
mixin _$DailyBalance {
  DateTime get date => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  double get inflow => throw _privateConstructorUsedError;
  double get outflow => throw _privateConstructorUsedError;
  List<String> get eventIds => throw _privateConstructorUsedError;

  /// Serializes this DailyBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyBalanceCopyWith<DailyBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyBalanceCopyWith<$Res> {
  factory $DailyBalanceCopyWith(
    DailyBalance value,
    $Res Function(DailyBalance) then,
  ) = _$DailyBalanceCopyWithImpl<$Res, DailyBalance>;
  @useResult
  $Res call({
    DateTime date,
    double balance,
    double inflow,
    double outflow,
    List<String> eventIds,
  });
}

/// @nodoc
class _$DailyBalanceCopyWithImpl<$Res, $Val extends DailyBalance>
    implements $DailyBalanceCopyWith<$Res> {
  _$DailyBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? balance = null,
    Object? inflow = null,
    Object? outflow = null,
    Object? eventIds = null,
  }) {
    return _then(
      _value.copyWith(
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            balance: null == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as double,
            inflow: null == inflow
                ? _value.inflow
                : inflow // ignore: cast_nullable_to_non_nullable
                      as double,
            outflow: null == outflow
                ? _value.outflow
                : outflow // ignore: cast_nullable_to_non_nullable
                      as double,
            eventIds: null == eventIds
                ? _value.eventIds
                : eventIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DailyBalanceImplCopyWith<$Res>
    implements $DailyBalanceCopyWith<$Res> {
  factory _$$DailyBalanceImplCopyWith(
    _$DailyBalanceImpl value,
    $Res Function(_$DailyBalanceImpl) then,
  ) = __$$DailyBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime date,
    double balance,
    double inflow,
    double outflow,
    List<String> eventIds,
  });
}

/// @nodoc
class __$$DailyBalanceImplCopyWithImpl<$Res>
    extends _$DailyBalanceCopyWithImpl<$Res, _$DailyBalanceImpl>
    implements _$$DailyBalanceImplCopyWith<$Res> {
  __$$DailyBalanceImplCopyWithImpl(
    _$DailyBalanceImpl _value,
    $Res Function(_$DailyBalanceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? balance = null,
    Object? inflow = null,
    Object? outflow = null,
    Object? eventIds = null,
  }) {
    return _then(
      _$DailyBalanceImpl(
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        balance: null == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as double,
        inflow: null == inflow
            ? _value.inflow
            : inflow // ignore: cast_nullable_to_non_nullable
                  as double,
        outflow: null == outflow
            ? _value.outflow
            : outflow // ignore: cast_nullable_to_non_nullable
                  as double,
        eventIds: null == eventIds
            ? _value._eventIds
            : eventIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyBalanceImpl implements _DailyBalance {
  const _$DailyBalanceImpl({
    required this.date,
    required this.balance,
    required this.inflow,
    required this.outflow,
    final List<String> eventIds = const [],
  }) : _eventIds = eventIds;

  factory _$DailyBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyBalanceImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double balance;
  @override
  final double inflow;
  @override
  final double outflow;
  final List<String> _eventIds;
  @override
  @JsonKey()
  List<String> get eventIds {
    if (_eventIds is EqualUnmodifiableListView) return _eventIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eventIds);
  }

  @override
  String toString() {
    return 'DailyBalance(date: $date, balance: $balance, inflow: $inflow, outflow: $outflow, eventIds: $eventIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyBalanceImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.inflow, inflow) || other.inflow == inflow) &&
            (identical(other.outflow, outflow) || other.outflow == outflow) &&
            const DeepCollectionEquality().equals(other._eventIds, _eventIds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    balance,
    inflow,
    outflow,
    const DeepCollectionEquality().hash(_eventIds),
  );

  /// Create a copy of DailyBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyBalanceImplCopyWith<_$DailyBalanceImpl> get copyWith =>
      __$$DailyBalanceImplCopyWithImpl<_$DailyBalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyBalanceImplToJson(this);
  }
}

abstract class _DailyBalance implements DailyBalance {
  const factory _DailyBalance({
    required final DateTime date,
    required final double balance,
    required final double inflow,
    required final double outflow,
    final List<String> eventIds,
  }) = _$DailyBalanceImpl;

  factory _DailyBalance.fromJson(Map<String, dynamic> json) =
      _$DailyBalanceImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get balance;
  @override
  double get inflow;
  @override
  double get outflow;
  @override
  List<String> get eventIds;

  /// Create a copy of DailyBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyBalanceImplCopyWith<_$DailyBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RecurringTransaction _$RecurringTransactionFromJson(Map<String, dynamic> json) {
  return _RecurringTransaction.fromJson(json);
}

/// @nodoc
mixin _$RecurringTransaction {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  RecurringFrequency get frequency => throw _privateConstructorUsedError;
  DateTime get nextDate => throw _privateConstructorUsedError;
  CashflowEventType get type => throw _privateConstructorUsedError;
  CategoryType? get category => throw _privateConstructorUsedError;
  String? get merchantName => throw _privateConstructorUsedError;
  List<DateTime> get history => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  PredictionConfidence? get confidence => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this RecurringTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecurringTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecurringTransactionCopyWith<RecurringTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurringTransactionCopyWith<$Res> {
  factory $RecurringTransactionCopyWith(
    RecurringTransaction value,
    $Res Function(RecurringTransaction) then,
  ) = _$RecurringTransactionCopyWithImpl<$Res, RecurringTransaction>;
  @useResult
  $Res call({
    String id,
    String userId,
    String name,
    double amount,
    RecurringFrequency frequency,
    DateTime nextDate,
    CashflowEventType type,
    CategoryType? category,
    String? merchantName,
    List<DateTime> history,
    bool isActive,
    PredictionConfidence? confidence,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
  });
}

/// @nodoc
class _$RecurringTransactionCopyWithImpl<
  $Res,
  $Val extends RecurringTransaction
>
    implements $RecurringTransactionCopyWith<$Res> {
  _$RecurringTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecurringTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? amount = null,
    Object? frequency = null,
    Object? nextDate = null,
    Object? type = null,
    Object? category = freezed,
    Object? merchantName = freezed,
    Object? history = null,
    Object? isActive = null,
    Object? confidence = freezed,
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
                      as RecurringFrequency,
            nextDate: null == nextDate
                ? _value.nextDate
                : nextDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as CashflowEventType,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as CategoryType?,
            merchantName: freezed == merchantName
                ? _value.merchantName
                : merchantName // ignore: cast_nullable_to_non_nullable
                      as String?,
            history: null == history
                ? _value.history
                : history // ignore: cast_nullable_to_non_nullable
                      as List<DateTime>,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            confidence: freezed == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as PredictionConfidence?,
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
abstract class _$$RecurringTransactionImplCopyWith<$Res>
    implements $RecurringTransactionCopyWith<$Res> {
  factory _$$RecurringTransactionImplCopyWith(
    _$RecurringTransactionImpl value,
    $Res Function(_$RecurringTransactionImpl) then,
  ) = __$$RecurringTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String name,
    double amount,
    RecurringFrequency frequency,
    DateTime nextDate,
    CashflowEventType type,
    CategoryType? category,
    String? merchantName,
    List<DateTime> history,
    bool isActive,
    PredictionConfidence? confidence,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$RecurringTransactionImplCopyWithImpl<$Res>
    extends _$RecurringTransactionCopyWithImpl<$Res, _$RecurringTransactionImpl>
    implements _$$RecurringTransactionImplCopyWith<$Res> {
  __$$RecurringTransactionImplCopyWithImpl(
    _$RecurringTransactionImpl _value,
    $Res Function(_$RecurringTransactionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecurringTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? amount = null,
    Object? frequency = null,
    Object? nextDate = null,
    Object? type = null,
    Object? category = freezed,
    Object? merchantName = freezed,
    Object? history = null,
    Object? isActive = null,
    Object? confidence = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$RecurringTransactionImpl(
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
                  as RecurringFrequency,
        nextDate: null == nextDate
            ? _value.nextDate
            : nextDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as CashflowEventType,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as CategoryType?,
        merchantName: freezed == merchantName
            ? _value.merchantName
            : merchantName // ignore: cast_nullable_to_non_nullable
                  as String?,
        history: null == history
            ? _value._history
            : history // ignore: cast_nullable_to_non_nullable
                  as List<DateTime>,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        confidence: freezed == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as PredictionConfidence?,
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
class _$RecurringTransactionImpl extends _RecurringTransaction {
  const _$RecurringTransactionImpl({
    required this.id,
    required this.userId,
    required this.name,
    required this.amount,
    required this.frequency,
    required this.nextDate,
    required this.type,
    this.category,
    this.merchantName,
    final List<DateTime> history = const [],
    this.isActive = true,
    this.confidence,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.createdAt,
  }) : _history = history,
       super._();

  factory _$RecurringTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecurringTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final double amount;
  @override
  final RecurringFrequency frequency;
  @override
  final DateTime nextDate;
  @override
  final CashflowEventType type;
  @override
  final CategoryType? category;
  @override
  final String? merchantName;
  final List<DateTime> _history;
  @override
  @JsonKey()
  List<DateTime> get history {
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_history);
  }

  @override
  @JsonKey()
  final bool isActive;
  @override
  final PredictionConfidence? confidence;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'RecurringTransaction(id: $id, userId: $userId, name: $name, amount: $amount, frequency: $frequency, nextDate: $nextDate, type: $type, category: $category, merchantName: $merchantName, history: $history, isActive: $isActive, confidence: $confidence, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurringTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.nextDate, nextDate) ||
                other.nextDate == nextDate) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    name,
    amount,
    frequency,
    nextDate,
    type,
    category,
    merchantName,
    const DeepCollectionEquality().hash(_history),
    isActive,
    confidence,
    createdAt,
  );

  /// Create a copy of RecurringTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurringTransactionImplCopyWith<_$RecurringTransactionImpl>
  get copyWith =>
      __$$RecurringTransactionImplCopyWithImpl<_$RecurringTransactionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecurringTransactionImplToJson(this);
  }
}

abstract class _RecurringTransaction extends RecurringTransaction {
  const factory _RecurringTransaction({
    required final String id,
    required final String userId,
    required final String name,
    required final double amount,
    required final RecurringFrequency frequency,
    required final DateTime nextDate,
    required final CashflowEventType type,
    final CategoryType? category,
    final String? merchantName,
    final List<DateTime> history,
    final bool isActive,
    final PredictionConfidence? confidence,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? createdAt,
  }) = _$RecurringTransactionImpl;
  const _RecurringTransaction._() : super._();

  factory _RecurringTransaction.fromJson(Map<String, dynamic> json) =
      _$RecurringTransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get name;
  @override
  double get amount;
  @override
  RecurringFrequency get frequency;
  @override
  DateTime get nextDate;
  @override
  CashflowEventType get type;
  @override
  CategoryType? get category;
  @override
  String? get merchantName;
  @override
  List<DateTime> get history;
  @override
  bool get isActive;
  @override
  PredictionConfidence? get confidence;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt;

  /// Create a copy of RecurringTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecurringTransactionImplCopyWith<_$RecurringTransactionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CashflowAlert _$CashflowAlertFromJson(Map<String, dynamic> json) {
  return _CashflowAlert.fromJson(json);
}

/// @nodoc
mixin _$CashflowAlert {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  AlertType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  CashflowStatus get severity => throw _privateConstructorUsedError;
  DateTime get alertDate => throw _privateConstructorUsedError;
  DateTime? get crisisDate => throw _privateConstructorUsedError;
  double? get projectedShortfall => throw _privateConstructorUsedError;
  List<String> get suggestedActions => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  bool get isDismissed => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CashflowAlert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CashflowAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashflowAlertCopyWith<CashflowAlert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashflowAlertCopyWith<$Res> {
  factory $CashflowAlertCopyWith(
    CashflowAlert value,
    $Res Function(CashflowAlert) then,
  ) = _$CashflowAlertCopyWithImpl<$Res, CashflowAlert>;
  @useResult
  $Res call({
    String id,
    String userId,
    AlertType type,
    String title,
    String message,
    CashflowStatus severity,
    DateTime alertDate,
    DateTime? crisisDate,
    double? projectedShortfall,
    List<String> suggestedActions,
    bool isRead,
    bool isDismissed,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
  });
}

/// @nodoc
class _$CashflowAlertCopyWithImpl<$Res, $Val extends CashflowAlert>
    implements $CashflowAlertCopyWith<$Res> {
  _$CashflowAlertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashflowAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? severity = null,
    Object? alertDate = null,
    Object? crisisDate = freezed,
    Object? projectedShortfall = freezed,
    Object? suggestedActions = null,
    Object? isRead = null,
    Object? isDismissed = null,
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
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as AlertType,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as CashflowStatus,
            alertDate: null == alertDate
                ? _value.alertDate
                : alertDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            crisisDate: freezed == crisisDate
                ? _value.crisisDate
                : crisisDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            projectedShortfall: freezed == projectedShortfall
                ? _value.projectedShortfall
                : projectedShortfall // ignore: cast_nullable_to_non_nullable
                      as double?,
            suggestedActions: null == suggestedActions
                ? _value.suggestedActions
                : suggestedActions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isRead: null == isRead
                ? _value.isRead
                : isRead // ignore: cast_nullable_to_non_nullable
                      as bool,
            isDismissed: null == isDismissed
                ? _value.isDismissed
                : isDismissed // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$CashflowAlertImplCopyWith<$Res>
    implements $CashflowAlertCopyWith<$Res> {
  factory _$$CashflowAlertImplCopyWith(
    _$CashflowAlertImpl value,
    $Res Function(_$CashflowAlertImpl) then,
  ) = __$$CashflowAlertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    AlertType type,
    String title,
    String message,
    CashflowStatus severity,
    DateTime alertDate,
    DateTime? crisisDate,
    double? projectedShortfall,
    List<String> suggestedActions,
    bool isRead,
    bool isDismissed,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$CashflowAlertImplCopyWithImpl<$Res>
    extends _$CashflowAlertCopyWithImpl<$Res, _$CashflowAlertImpl>
    implements _$$CashflowAlertImplCopyWith<$Res> {
  __$$CashflowAlertImplCopyWithImpl(
    _$CashflowAlertImpl _value,
    $Res Function(_$CashflowAlertImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CashflowAlert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? message = null,
    Object? severity = null,
    Object? alertDate = null,
    Object? crisisDate = freezed,
    Object? projectedShortfall = freezed,
    Object? suggestedActions = null,
    Object? isRead = null,
    Object? isDismissed = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$CashflowAlertImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AlertType,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as CashflowStatus,
        alertDate: null == alertDate
            ? _value.alertDate
            : alertDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        crisisDate: freezed == crisisDate
            ? _value.crisisDate
            : crisisDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        projectedShortfall: freezed == projectedShortfall
            ? _value.projectedShortfall
            : projectedShortfall // ignore: cast_nullable_to_non_nullable
                  as double?,
        suggestedActions: null == suggestedActions
            ? _value._suggestedActions
            : suggestedActions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isRead: null == isRead
            ? _value.isRead
            : isRead // ignore: cast_nullable_to_non_nullable
                  as bool,
        isDismissed: null == isDismissed
            ? _value.isDismissed
            : isDismissed // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$CashflowAlertImpl implements _CashflowAlert {
  const _$CashflowAlertImpl({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.message,
    required this.severity,
    required this.alertDate,
    this.crisisDate,
    this.projectedShortfall,
    final List<String> suggestedActions = const [],
    this.isRead = false,
    this.isDismissed = false,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.createdAt,
  }) : _suggestedActions = suggestedActions;

  factory _$CashflowAlertImpl.fromJson(Map<String, dynamic> json) =>
      _$$CashflowAlertImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final AlertType type;
  @override
  final String title;
  @override
  final String message;
  @override
  final CashflowStatus severity;
  @override
  final DateTime alertDate;
  @override
  final DateTime? crisisDate;
  @override
  final double? projectedShortfall;
  final List<String> _suggestedActions;
  @override
  @JsonKey()
  List<String> get suggestedActions {
    if (_suggestedActions is EqualUnmodifiableListView)
      return _suggestedActions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedActions);
  }

  @override
  @JsonKey()
  final bool isRead;
  @override
  @JsonKey()
  final bool isDismissed;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'CashflowAlert(id: $id, userId: $userId, type: $type, title: $title, message: $message, severity: $severity, alertDate: $alertDate, crisisDate: $crisisDate, projectedShortfall: $projectedShortfall, suggestedActions: $suggestedActions, isRead: $isRead, isDismissed: $isDismissed, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashflowAlertImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.alertDate, alertDate) ||
                other.alertDate == alertDate) &&
            (identical(other.crisisDate, crisisDate) ||
                other.crisisDate == crisisDate) &&
            (identical(other.projectedShortfall, projectedShortfall) ||
                other.projectedShortfall == projectedShortfall) &&
            const DeepCollectionEquality().equals(
              other._suggestedActions,
              _suggestedActions,
            ) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.isDismissed, isDismissed) ||
                other.isDismissed == isDismissed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    type,
    title,
    message,
    severity,
    alertDate,
    crisisDate,
    projectedShortfall,
    const DeepCollectionEquality().hash(_suggestedActions),
    isRead,
    isDismissed,
    createdAt,
  );

  /// Create a copy of CashflowAlert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashflowAlertImplCopyWith<_$CashflowAlertImpl> get copyWith =>
      __$$CashflowAlertImplCopyWithImpl<_$CashflowAlertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CashflowAlertImplToJson(this);
  }
}

abstract class _CashflowAlert implements CashflowAlert {
  const factory _CashflowAlert({
    required final String id,
    required final String userId,
    required final AlertType type,
    required final String title,
    required final String message,
    required final CashflowStatus severity,
    required final DateTime alertDate,
    final DateTime? crisisDate,
    final double? projectedShortfall,
    final List<String> suggestedActions,
    final bool isRead,
    final bool isDismissed,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? createdAt,
  }) = _$CashflowAlertImpl;

  factory _CashflowAlert.fromJson(Map<String, dynamic> json) =
      _$CashflowAlertImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  AlertType get type;
  @override
  String get title;
  @override
  String get message;
  @override
  CashflowStatus get severity;
  @override
  DateTime get alertDate;
  @override
  DateTime? get crisisDate;
  @override
  double? get projectedShortfall;
  @override
  List<String> get suggestedActions;
  @override
  bool get isRead;
  @override
  bool get isDismissed;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt;

  /// Create a copy of CashflowAlert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashflowAlertImplCopyWith<_$CashflowAlertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
