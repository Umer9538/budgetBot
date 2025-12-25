// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_negotiator_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BillNegotiator _$BillNegotiatorFromJson(Map<String, dynamic> json) {
  return _BillNegotiator.fromJson(json);
}

/// @nodoc
mixin _$BillNegotiator {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  List<TrackedBill> get trackedBills => throw _privateConstructorUsedError;
  List<NegotiationSession> get negotiations =>
      throw _privateConstructorUsedError;
  NegotiatorStats get stats => throw _privateConstructorUsedError;
  DateTime get lastAnalyzed => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this BillNegotiator to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BillNegotiator
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BillNegotiatorCopyWith<BillNegotiator> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillNegotiatorCopyWith<$Res> {
  factory $BillNegotiatorCopyWith(
    BillNegotiator value,
    $Res Function(BillNegotiator) then,
  ) = _$BillNegotiatorCopyWithImpl<$Res, BillNegotiator>;
  @useResult
  $Res call({
    String id,
    String userId,
    List<TrackedBill> trackedBills,
    List<NegotiationSession> negotiations,
    NegotiatorStats stats,
    DateTime lastAnalyzed,
    DateTime? createdAt,
  });

  $NegotiatorStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$BillNegotiatorCopyWithImpl<$Res, $Val extends BillNegotiator>
    implements $BillNegotiatorCopyWith<$Res> {
  _$BillNegotiatorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BillNegotiator
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? trackedBills = null,
    Object? negotiations = null,
    Object? stats = null,
    Object? lastAnalyzed = null,
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
            trackedBills: null == trackedBills
                ? _value.trackedBills
                : trackedBills // ignore: cast_nullable_to_non_nullable
                      as List<TrackedBill>,
            negotiations: null == negotiations
                ? _value.negotiations
                : negotiations // ignore: cast_nullable_to_non_nullable
                      as List<NegotiationSession>,
            stats: null == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                      as NegotiatorStats,
            lastAnalyzed: null == lastAnalyzed
                ? _value.lastAnalyzed
                : lastAnalyzed // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of BillNegotiator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NegotiatorStatsCopyWith<$Res> get stats {
    return $NegotiatorStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BillNegotiatorImplCopyWith<$Res>
    implements $BillNegotiatorCopyWith<$Res> {
  factory _$$BillNegotiatorImplCopyWith(
    _$BillNegotiatorImpl value,
    $Res Function(_$BillNegotiatorImpl) then,
  ) = __$$BillNegotiatorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    List<TrackedBill> trackedBills,
    List<NegotiationSession> negotiations,
    NegotiatorStats stats,
    DateTime lastAnalyzed,
    DateTime? createdAt,
  });

  @override
  $NegotiatorStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$BillNegotiatorImplCopyWithImpl<$Res>
    extends _$BillNegotiatorCopyWithImpl<$Res, _$BillNegotiatorImpl>
    implements _$$BillNegotiatorImplCopyWith<$Res> {
  __$$BillNegotiatorImplCopyWithImpl(
    _$BillNegotiatorImpl _value,
    $Res Function(_$BillNegotiatorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BillNegotiator
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? trackedBills = null,
    Object? negotiations = null,
    Object? stats = null,
    Object? lastAnalyzed = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$BillNegotiatorImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        trackedBills: null == trackedBills
            ? _value._trackedBills
            : trackedBills // ignore: cast_nullable_to_non_nullable
                  as List<TrackedBill>,
        negotiations: null == negotiations
            ? _value._negotiations
            : negotiations // ignore: cast_nullable_to_non_nullable
                  as List<NegotiationSession>,
        stats: null == stats
            ? _value.stats
            : stats // ignore: cast_nullable_to_non_nullable
                  as NegotiatorStats,
        lastAnalyzed: null == lastAnalyzed
            ? _value.lastAnalyzed
            : lastAnalyzed // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
class _$BillNegotiatorImpl implements _BillNegotiator {
  const _$BillNegotiatorImpl({
    required this.id,
    required this.userId,
    required final List<TrackedBill> trackedBills,
    required final List<NegotiationSession> negotiations,
    required this.stats,
    required this.lastAnalyzed,
    this.createdAt,
  }) : _trackedBills = trackedBills,
       _negotiations = negotiations;

  factory _$BillNegotiatorImpl.fromJson(Map<String, dynamic> json) =>
      _$$BillNegotiatorImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  final List<TrackedBill> _trackedBills;
  @override
  List<TrackedBill> get trackedBills {
    if (_trackedBills is EqualUnmodifiableListView) return _trackedBills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trackedBills);
  }

  final List<NegotiationSession> _negotiations;
  @override
  List<NegotiationSession> get negotiations {
    if (_negotiations is EqualUnmodifiableListView) return _negotiations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_negotiations);
  }

  @override
  final NegotiatorStats stats;
  @override
  final DateTime lastAnalyzed;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'BillNegotiator(id: $id, userId: $userId, trackedBills: $trackedBills, negotiations: $negotiations, stats: $stats, lastAnalyzed: $lastAnalyzed, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillNegotiatorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(
              other._trackedBills,
              _trackedBills,
            ) &&
            const DeepCollectionEquality().equals(
              other._negotiations,
              _negotiations,
            ) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.lastAnalyzed, lastAnalyzed) ||
                other.lastAnalyzed == lastAnalyzed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    const DeepCollectionEquality().hash(_trackedBills),
    const DeepCollectionEquality().hash(_negotiations),
    stats,
    lastAnalyzed,
    createdAt,
  );

  /// Create a copy of BillNegotiator
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BillNegotiatorImplCopyWith<_$BillNegotiatorImpl> get copyWith =>
      __$$BillNegotiatorImplCopyWithImpl<_$BillNegotiatorImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BillNegotiatorImplToJson(this);
  }
}

abstract class _BillNegotiator implements BillNegotiator {
  const factory _BillNegotiator({
    required final String id,
    required final String userId,
    required final List<TrackedBill> trackedBills,
    required final List<NegotiationSession> negotiations,
    required final NegotiatorStats stats,
    required final DateTime lastAnalyzed,
    final DateTime? createdAt,
  }) = _$BillNegotiatorImpl;

  factory _BillNegotiator.fromJson(Map<String, dynamic> json) =
      _$BillNegotiatorImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  List<TrackedBill> get trackedBills;
  @override
  List<NegotiationSession> get negotiations;
  @override
  NegotiatorStats get stats;
  @override
  DateTime get lastAnalyzed;
  @override
  DateTime? get createdAt;

  /// Create a copy of BillNegotiator
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BillNegotiatorImplCopyWith<_$BillNegotiatorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TrackedBill _$TrackedBillFromJson(Map<String, dynamic> json) {
  return _TrackedBill.fromJson(json);
}

/// @nodoc
mixin _$TrackedBill {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  BillCategory get category => throw _privateConstructorUsedError;
  double get currentAmount => throw _privateConstructorUsedError;
  double get marketAverage =>
      throw _privateConstructorUsedError; // what others pay
  double get potentialSavings => throw _privateConstructorUsedError;
  BillPriority get negotiationPriority => throw _privateConstructorUsedError;
  NegotiationDifficulty get difficulty => throw _privateConstructorUsedError;
  DateTime get lastBillDate => throw _privateConstructorUsedError;
  DateTime? get contractEndDate => throw _privateConstructorUsedError;
  bool get hasAutoPay => throw _privateConstructorUsedError;
  int get loyaltyMonths =>
      throw _privateConstructorUsedError; // how long customer
  String? get accountNumber => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  List<String>? get previousRates => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this TrackedBill to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TrackedBill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackedBillCopyWith<TrackedBill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackedBillCopyWith<$Res> {
  factory $TrackedBillCopyWith(
    TrackedBill value,
    $Res Function(TrackedBill) then,
  ) = _$TrackedBillCopyWithImpl<$Res, TrackedBill>;
  @useResult
  $Res call({
    String id,
    String name,
    String provider,
    BillCategory category,
    double currentAmount,
    double marketAverage,
    double potentialSavings,
    BillPriority negotiationPriority,
    NegotiationDifficulty difficulty,
    DateTime lastBillDate,
    DateTime? contractEndDate,
    bool hasAutoPay,
    int loyaltyMonths,
    String? accountNumber,
    String? phoneNumber,
    List<String>? previousRates,
    String? notes,
  });
}

/// @nodoc
class _$TrackedBillCopyWithImpl<$Res, $Val extends TrackedBill>
    implements $TrackedBillCopyWith<$Res> {
  _$TrackedBillCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TrackedBill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? provider = null,
    Object? category = null,
    Object? currentAmount = null,
    Object? marketAverage = null,
    Object? potentialSavings = null,
    Object? negotiationPriority = null,
    Object? difficulty = null,
    Object? lastBillDate = null,
    Object? contractEndDate = freezed,
    Object? hasAutoPay = null,
    Object? loyaltyMonths = null,
    Object? accountNumber = freezed,
    Object? phoneNumber = freezed,
    Object? previousRates = freezed,
    Object? notes = freezed,
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
            provider: null == provider
                ? _value.provider
                : provider // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as BillCategory,
            currentAmount: null == currentAmount
                ? _value.currentAmount
                : currentAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            marketAverage: null == marketAverage
                ? _value.marketAverage
                : marketAverage // ignore: cast_nullable_to_non_nullable
                      as double,
            potentialSavings: null == potentialSavings
                ? _value.potentialSavings
                : potentialSavings // ignore: cast_nullable_to_non_nullable
                      as double,
            negotiationPriority: null == negotiationPriority
                ? _value.negotiationPriority
                : negotiationPriority // ignore: cast_nullable_to_non_nullable
                      as BillPriority,
            difficulty: null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as NegotiationDifficulty,
            lastBillDate: null == lastBillDate
                ? _value.lastBillDate
                : lastBillDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            contractEndDate: freezed == contractEndDate
                ? _value.contractEndDate
                : contractEndDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            hasAutoPay: null == hasAutoPay
                ? _value.hasAutoPay
                : hasAutoPay // ignore: cast_nullable_to_non_nullable
                      as bool,
            loyaltyMonths: null == loyaltyMonths
                ? _value.loyaltyMonths
                : loyaltyMonths // ignore: cast_nullable_to_non_nullable
                      as int,
            accountNumber: freezed == accountNumber
                ? _value.accountNumber
                : accountNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            phoneNumber: freezed == phoneNumber
                ? _value.phoneNumber
                : phoneNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            previousRates: freezed == previousRates
                ? _value.previousRates
                : previousRates // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TrackedBillImplCopyWith<$Res>
    implements $TrackedBillCopyWith<$Res> {
  factory _$$TrackedBillImplCopyWith(
    _$TrackedBillImpl value,
    $Res Function(_$TrackedBillImpl) then,
  ) = __$$TrackedBillImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String provider,
    BillCategory category,
    double currentAmount,
    double marketAverage,
    double potentialSavings,
    BillPriority negotiationPriority,
    NegotiationDifficulty difficulty,
    DateTime lastBillDate,
    DateTime? contractEndDate,
    bool hasAutoPay,
    int loyaltyMonths,
    String? accountNumber,
    String? phoneNumber,
    List<String>? previousRates,
    String? notes,
  });
}

/// @nodoc
class __$$TrackedBillImplCopyWithImpl<$Res>
    extends _$TrackedBillCopyWithImpl<$Res, _$TrackedBillImpl>
    implements _$$TrackedBillImplCopyWith<$Res> {
  __$$TrackedBillImplCopyWithImpl(
    _$TrackedBillImpl _value,
    $Res Function(_$TrackedBillImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TrackedBill
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? provider = null,
    Object? category = null,
    Object? currentAmount = null,
    Object? marketAverage = null,
    Object? potentialSavings = null,
    Object? negotiationPriority = null,
    Object? difficulty = null,
    Object? lastBillDate = null,
    Object? contractEndDate = freezed,
    Object? hasAutoPay = null,
    Object? loyaltyMonths = null,
    Object? accountNumber = freezed,
    Object? phoneNumber = freezed,
    Object? previousRates = freezed,
    Object? notes = freezed,
  }) {
    return _then(
      _$TrackedBillImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        provider: null == provider
            ? _value.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as BillCategory,
        currentAmount: null == currentAmount
            ? _value.currentAmount
            : currentAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        marketAverage: null == marketAverage
            ? _value.marketAverage
            : marketAverage // ignore: cast_nullable_to_non_nullable
                  as double,
        potentialSavings: null == potentialSavings
            ? _value.potentialSavings
            : potentialSavings // ignore: cast_nullable_to_non_nullable
                  as double,
        negotiationPriority: null == negotiationPriority
            ? _value.negotiationPriority
            : negotiationPriority // ignore: cast_nullable_to_non_nullable
                  as BillPriority,
        difficulty: null == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as NegotiationDifficulty,
        lastBillDate: null == lastBillDate
            ? _value.lastBillDate
            : lastBillDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        contractEndDate: freezed == contractEndDate
            ? _value.contractEndDate
            : contractEndDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        hasAutoPay: null == hasAutoPay
            ? _value.hasAutoPay
            : hasAutoPay // ignore: cast_nullable_to_non_nullable
                  as bool,
        loyaltyMonths: null == loyaltyMonths
            ? _value.loyaltyMonths
            : loyaltyMonths // ignore: cast_nullable_to_non_nullable
                  as int,
        accountNumber: freezed == accountNumber
            ? _value.accountNumber
            : accountNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        phoneNumber: freezed == phoneNumber
            ? _value.phoneNumber
            : phoneNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        previousRates: freezed == previousRates
            ? _value._previousRates
            : previousRates // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackedBillImpl implements _TrackedBill {
  const _$TrackedBillImpl({
    required this.id,
    required this.name,
    required this.provider,
    required this.category,
    required this.currentAmount,
    required this.marketAverage,
    required this.potentialSavings,
    required this.negotiationPriority,
    required this.difficulty,
    required this.lastBillDate,
    required this.contractEndDate,
    required this.hasAutoPay,
    required this.loyaltyMonths,
    this.accountNumber,
    this.phoneNumber,
    final List<String>? previousRates,
    this.notes,
  }) : _previousRates = previousRates;

  factory _$TrackedBillImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackedBillImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String provider;
  @override
  final BillCategory category;
  @override
  final double currentAmount;
  @override
  final double marketAverage;
  // what others pay
  @override
  final double potentialSavings;
  @override
  final BillPriority negotiationPriority;
  @override
  final NegotiationDifficulty difficulty;
  @override
  final DateTime lastBillDate;
  @override
  final DateTime? contractEndDate;
  @override
  final bool hasAutoPay;
  @override
  final int loyaltyMonths;
  // how long customer
  @override
  final String? accountNumber;
  @override
  final String? phoneNumber;
  final List<String>? _previousRates;
  @override
  List<String>? get previousRates {
    final value = _previousRates;
    if (value == null) return null;
    if (_previousRates is EqualUnmodifiableListView) return _previousRates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? notes;

  @override
  String toString() {
    return 'TrackedBill(id: $id, name: $name, provider: $provider, category: $category, currentAmount: $currentAmount, marketAverage: $marketAverage, potentialSavings: $potentialSavings, negotiationPriority: $negotiationPriority, difficulty: $difficulty, lastBillDate: $lastBillDate, contractEndDate: $contractEndDate, hasAutoPay: $hasAutoPay, loyaltyMonths: $loyaltyMonths, accountNumber: $accountNumber, phoneNumber: $phoneNumber, previousRates: $previousRates, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackedBillImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.currentAmount, currentAmount) ||
                other.currentAmount == currentAmount) &&
            (identical(other.marketAverage, marketAverage) ||
                other.marketAverage == marketAverage) &&
            (identical(other.potentialSavings, potentialSavings) ||
                other.potentialSavings == potentialSavings) &&
            (identical(other.negotiationPriority, negotiationPriority) ||
                other.negotiationPriority == negotiationPriority) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.lastBillDate, lastBillDate) ||
                other.lastBillDate == lastBillDate) &&
            (identical(other.contractEndDate, contractEndDate) ||
                other.contractEndDate == contractEndDate) &&
            (identical(other.hasAutoPay, hasAutoPay) ||
                other.hasAutoPay == hasAutoPay) &&
            (identical(other.loyaltyMonths, loyaltyMonths) ||
                other.loyaltyMonths == loyaltyMonths) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality().equals(
              other._previousRates,
              _previousRates,
            ) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    provider,
    category,
    currentAmount,
    marketAverage,
    potentialSavings,
    negotiationPriority,
    difficulty,
    lastBillDate,
    contractEndDate,
    hasAutoPay,
    loyaltyMonths,
    accountNumber,
    phoneNumber,
    const DeepCollectionEquality().hash(_previousRates),
    notes,
  );

  /// Create a copy of TrackedBill
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackedBillImplCopyWith<_$TrackedBillImpl> get copyWith =>
      __$$TrackedBillImplCopyWithImpl<_$TrackedBillImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackedBillImplToJson(this);
  }
}

abstract class _TrackedBill implements TrackedBill {
  const factory _TrackedBill({
    required final String id,
    required final String name,
    required final String provider,
    required final BillCategory category,
    required final double currentAmount,
    required final double marketAverage,
    required final double potentialSavings,
    required final BillPriority negotiationPriority,
    required final NegotiationDifficulty difficulty,
    required final DateTime lastBillDate,
    required final DateTime? contractEndDate,
    required final bool hasAutoPay,
    required final int loyaltyMonths,
    final String? accountNumber,
    final String? phoneNumber,
    final List<String>? previousRates,
    final String? notes,
  }) = _$TrackedBillImpl;

  factory _TrackedBill.fromJson(Map<String, dynamic> json) =
      _$TrackedBillImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get provider;
  @override
  BillCategory get category;
  @override
  double get currentAmount;
  @override
  double get marketAverage; // what others pay
  @override
  double get potentialSavings;
  @override
  BillPriority get negotiationPriority;
  @override
  NegotiationDifficulty get difficulty;
  @override
  DateTime get lastBillDate;
  @override
  DateTime? get contractEndDate;
  @override
  bool get hasAutoPay;
  @override
  int get loyaltyMonths; // how long customer
  @override
  String? get accountNumber;
  @override
  String? get phoneNumber;
  @override
  List<String>? get previousRates;
  @override
  String? get notes;

  /// Create a copy of TrackedBill
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackedBillImplCopyWith<_$TrackedBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NegotiationSession _$NegotiationSessionFromJson(Map<String, dynamic> json) {
  return _NegotiationSession.fromJson(json);
}

/// @nodoc
mixin _$NegotiationSession {
  String get id => throw _privateConstructorUsedError;
  String get billId => throw _privateConstructorUsedError;
  NegotiationStatus get status => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  NegotiationScript get script => throw _privateConstructorUsedError;
  List<NegotiationStep> get steps => throw _privateConstructorUsedError;
  double get originalAmount => throw _privateConstructorUsedError;
  double? get negotiatedAmount => throw _privateConstructorUsedError;
  double? get savingsAchieved => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get outcome => throw _privateConstructorUsedError;

  /// Serializes this NegotiationSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NegotiationSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NegotiationSessionCopyWith<NegotiationSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NegotiationSessionCopyWith<$Res> {
  factory $NegotiationSessionCopyWith(
    NegotiationSession value,
    $Res Function(NegotiationSession) then,
  ) = _$NegotiationSessionCopyWithImpl<$Res, NegotiationSession>;
  @useResult
  $Res call({
    String id,
    String billId,
    NegotiationStatus status,
    DateTime startedAt,
    NegotiationScript script,
    List<NegotiationStep> steps,
    double originalAmount,
    double? negotiatedAmount,
    double? savingsAchieved,
    DateTime? completedAt,
    String? notes,
    String? outcome,
  });

  $NegotiationScriptCopyWith<$Res> get script;
}

/// @nodoc
class _$NegotiationSessionCopyWithImpl<$Res, $Val extends NegotiationSession>
    implements $NegotiationSessionCopyWith<$Res> {
  _$NegotiationSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NegotiationSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billId = null,
    Object? status = null,
    Object? startedAt = null,
    Object? script = null,
    Object? steps = null,
    Object? originalAmount = null,
    Object? negotiatedAmount = freezed,
    Object? savingsAchieved = freezed,
    Object? completedAt = freezed,
    Object? notes = freezed,
    Object? outcome = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            billId: null == billId
                ? _value.billId
                : billId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as NegotiationStatus,
            startedAt: null == startedAt
                ? _value.startedAt
                : startedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            script: null == script
                ? _value.script
                : script // ignore: cast_nullable_to_non_nullable
                      as NegotiationScript,
            steps: null == steps
                ? _value.steps
                : steps // ignore: cast_nullable_to_non_nullable
                      as List<NegotiationStep>,
            originalAmount: null == originalAmount
                ? _value.originalAmount
                : originalAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            negotiatedAmount: freezed == negotiatedAmount
                ? _value.negotiatedAmount
                : negotiatedAmount // ignore: cast_nullable_to_non_nullable
                      as double?,
            savingsAchieved: freezed == savingsAchieved
                ? _value.savingsAchieved
                : savingsAchieved // ignore: cast_nullable_to_non_nullable
                      as double?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            outcome: freezed == outcome
                ? _value.outcome
                : outcome // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of NegotiationSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NegotiationScriptCopyWith<$Res> get script {
    return $NegotiationScriptCopyWith<$Res>(_value.script, (value) {
      return _then(_value.copyWith(script: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NegotiationSessionImplCopyWith<$Res>
    implements $NegotiationSessionCopyWith<$Res> {
  factory _$$NegotiationSessionImplCopyWith(
    _$NegotiationSessionImpl value,
    $Res Function(_$NegotiationSessionImpl) then,
  ) = __$$NegotiationSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String billId,
    NegotiationStatus status,
    DateTime startedAt,
    NegotiationScript script,
    List<NegotiationStep> steps,
    double originalAmount,
    double? negotiatedAmount,
    double? savingsAchieved,
    DateTime? completedAt,
    String? notes,
    String? outcome,
  });

  @override
  $NegotiationScriptCopyWith<$Res> get script;
}

/// @nodoc
class __$$NegotiationSessionImplCopyWithImpl<$Res>
    extends _$NegotiationSessionCopyWithImpl<$Res, _$NegotiationSessionImpl>
    implements _$$NegotiationSessionImplCopyWith<$Res> {
  __$$NegotiationSessionImplCopyWithImpl(
    _$NegotiationSessionImpl _value,
    $Res Function(_$NegotiationSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NegotiationSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billId = null,
    Object? status = null,
    Object? startedAt = null,
    Object? script = null,
    Object? steps = null,
    Object? originalAmount = null,
    Object? negotiatedAmount = freezed,
    Object? savingsAchieved = freezed,
    Object? completedAt = freezed,
    Object? notes = freezed,
    Object? outcome = freezed,
  }) {
    return _then(
      _$NegotiationSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        billId: null == billId
            ? _value.billId
            : billId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as NegotiationStatus,
        startedAt: null == startedAt
            ? _value.startedAt
            : startedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        script: null == script
            ? _value.script
            : script // ignore: cast_nullable_to_non_nullable
                  as NegotiationScript,
        steps: null == steps
            ? _value._steps
            : steps // ignore: cast_nullable_to_non_nullable
                  as List<NegotiationStep>,
        originalAmount: null == originalAmount
            ? _value.originalAmount
            : originalAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        negotiatedAmount: freezed == negotiatedAmount
            ? _value.negotiatedAmount
            : negotiatedAmount // ignore: cast_nullable_to_non_nullable
                  as double?,
        savingsAchieved: freezed == savingsAchieved
            ? _value.savingsAchieved
            : savingsAchieved // ignore: cast_nullable_to_non_nullable
                  as double?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        outcome: freezed == outcome
            ? _value.outcome
            : outcome // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NegotiationSessionImpl implements _NegotiationSession {
  const _$NegotiationSessionImpl({
    required this.id,
    required this.billId,
    required this.status,
    required this.startedAt,
    required this.script,
    required final List<NegotiationStep> steps,
    required this.originalAmount,
    this.negotiatedAmount,
    this.savingsAchieved,
    this.completedAt,
    this.notes,
    this.outcome,
  }) : _steps = steps;

  factory _$NegotiationSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$NegotiationSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String billId;
  @override
  final NegotiationStatus status;
  @override
  final DateTime startedAt;
  @override
  final NegotiationScript script;
  final List<NegotiationStep> _steps;
  @override
  List<NegotiationStep> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final double originalAmount;
  @override
  final double? negotiatedAmount;
  @override
  final double? savingsAchieved;
  @override
  final DateTime? completedAt;
  @override
  final String? notes;
  @override
  final String? outcome;

  @override
  String toString() {
    return 'NegotiationSession(id: $id, billId: $billId, status: $status, startedAt: $startedAt, script: $script, steps: $steps, originalAmount: $originalAmount, negotiatedAmount: $negotiatedAmount, savingsAchieved: $savingsAchieved, completedAt: $completedAt, notes: $notes, outcome: $outcome)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NegotiationSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.billId, billId) || other.billId == billId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.script, script) || other.script == script) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.originalAmount, originalAmount) ||
                other.originalAmount == originalAmount) &&
            (identical(other.negotiatedAmount, negotiatedAmount) ||
                other.negotiatedAmount == negotiatedAmount) &&
            (identical(other.savingsAchieved, savingsAchieved) ||
                other.savingsAchieved == savingsAchieved) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.outcome, outcome) || other.outcome == outcome));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    billId,
    status,
    startedAt,
    script,
    const DeepCollectionEquality().hash(_steps),
    originalAmount,
    negotiatedAmount,
    savingsAchieved,
    completedAt,
    notes,
    outcome,
  );

  /// Create a copy of NegotiationSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NegotiationSessionImplCopyWith<_$NegotiationSessionImpl> get copyWith =>
      __$$NegotiationSessionImplCopyWithImpl<_$NegotiationSessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NegotiationSessionImplToJson(this);
  }
}

abstract class _NegotiationSession implements NegotiationSession {
  const factory _NegotiationSession({
    required final String id,
    required final String billId,
    required final NegotiationStatus status,
    required final DateTime startedAt,
    required final NegotiationScript script,
    required final List<NegotiationStep> steps,
    required final double originalAmount,
    final double? negotiatedAmount,
    final double? savingsAchieved,
    final DateTime? completedAt,
    final String? notes,
    final String? outcome,
  }) = _$NegotiationSessionImpl;

  factory _NegotiationSession.fromJson(Map<String, dynamic> json) =
      _$NegotiationSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get billId;
  @override
  NegotiationStatus get status;
  @override
  DateTime get startedAt;
  @override
  NegotiationScript get script;
  @override
  List<NegotiationStep> get steps;
  @override
  double get originalAmount;
  @override
  double? get negotiatedAmount;
  @override
  double? get savingsAchieved;
  @override
  DateTime? get completedAt;
  @override
  String? get notes;
  @override
  String? get outcome;

  /// Create a copy of NegotiationSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NegotiationSessionImplCopyWith<_$NegotiationSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NegotiationScript _$NegotiationScriptFromJson(Map<String, dynamic> json) {
  return _NegotiationScript.fromJson(json);
}

/// @nodoc
mixin _$NegotiationScript {
  String get id => throw _privateConstructorUsedError;
  String get opening =>
      throw _privateConstructorUsedError; // how to start the call
  List<String> get keyPoints =>
      throw _privateConstructorUsedError; // main negotiation points
  List<String> get competitorMentions =>
      throw _privateConstructorUsedError; // competitor offers to mention
  List<String> get responseHandlers =>
      throw _privateConstructorUsedError; // how to handle objections
  String get closingLine =>
      throw _privateConstructorUsedError; // how to close the deal
  List<String> get escalationPhrases =>
      throw _privateConstructorUsedError; // if first rep can't help
  double get targetSavings => throw _privateConstructorUsedError;
  double get minimumAcceptable => throw _privateConstructorUsedError;

  /// Serializes this NegotiationScript to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NegotiationScript
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NegotiationScriptCopyWith<NegotiationScript> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NegotiationScriptCopyWith<$Res> {
  factory $NegotiationScriptCopyWith(
    NegotiationScript value,
    $Res Function(NegotiationScript) then,
  ) = _$NegotiationScriptCopyWithImpl<$Res, NegotiationScript>;
  @useResult
  $Res call({
    String id,
    String opening,
    List<String> keyPoints,
    List<String> competitorMentions,
    List<String> responseHandlers,
    String closingLine,
    List<String> escalationPhrases,
    double targetSavings,
    double minimumAcceptable,
  });
}

/// @nodoc
class _$NegotiationScriptCopyWithImpl<$Res, $Val extends NegotiationScript>
    implements $NegotiationScriptCopyWith<$Res> {
  _$NegotiationScriptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NegotiationScript
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? opening = null,
    Object? keyPoints = null,
    Object? competitorMentions = null,
    Object? responseHandlers = null,
    Object? closingLine = null,
    Object? escalationPhrases = null,
    Object? targetSavings = null,
    Object? minimumAcceptable = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            opening: null == opening
                ? _value.opening
                : opening // ignore: cast_nullable_to_non_nullable
                      as String,
            keyPoints: null == keyPoints
                ? _value.keyPoints
                : keyPoints // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            competitorMentions: null == competitorMentions
                ? _value.competitorMentions
                : competitorMentions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            responseHandlers: null == responseHandlers
                ? _value.responseHandlers
                : responseHandlers // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            closingLine: null == closingLine
                ? _value.closingLine
                : closingLine // ignore: cast_nullable_to_non_nullable
                      as String,
            escalationPhrases: null == escalationPhrases
                ? _value.escalationPhrases
                : escalationPhrases // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            targetSavings: null == targetSavings
                ? _value.targetSavings
                : targetSavings // ignore: cast_nullable_to_non_nullable
                      as double,
            minimumAcceptable: null == minimumAcceptable
                ? _value.minimumAcceptable
                : minimumAcceptable // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NegotiationScriptImplCopyWith<$Res>
    implements $NegotiationScriptCopyWith<$Res> {
  factory _$$NegotiationScriptImplCopyWith(
    _$NegotiationScriptImpl value,
    $Res Function(_$NegotiationScriptImpl) then,
  ) = __$$NegotiationScriptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String opening,
    List<String> keyPoints,
    List<String> competitorMentions,
    List<String> responseHandlers,
    String closingLine,
    List<String> escalationPhrases,
    double targetSavings,
    double minimumAcceptable,
  });
}

/// @nodoc
class __$$NegotiationScriptImplCopyWithImpl<$Res>
    extends _$NegotiationScriptCopyWithImpl<$Res, _$NegotiationScriptImpl>
    implements _$$NegotiationScriptImplCopyWith<$Res> {
  __$$NegotiationScriptImplCopyWithImpl(
    _$NegotiationScriptImpl _value,
    $Res Function(_$NegotiationScriptImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NegotiationScript
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? opening = null,
    Object? keyPoints = null,
    Object? competitorMentions = null,
    Object? responseHandlers = null,
    Object? closingLine = null,
    Object? escalationPhrases = null,
    Object? targetSavings = null,
    Object? minimumAcceptable = null,
  }) {
    return _then(
      _$NegotiationScriptImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        opening: null == opening
            ? _value.opening
            : opening // ignore: cast_nullable_to_non_nullable
                  as String,
        keyPoints: null == keyPoints
            ? _value._keyPoints
            : keyPoints // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        competitorMentions: null == competitorMentions
            ? _value._competitorMentions
            : competitorMentions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        responseHandlers: null == responseHandlers
            ? _value._responseHandlers
            : responseHandlers // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        closingLine: null == closingLine
            ? _value.closingLine
            : closingLine // ignore: cast_nullable_to_non_nullable
                  as String,
        escalationPhrases: null == escalationPhrases
            ? _value._escalationPhrases
            : escalationPhrases // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        targetSavings: null == targetSavings
            ? _value.targetSavings
            : targetSavings // ignore: cast_nullable_to_non_nullable
                  as double,
        minimumAcceptable: null == minimumAcceptable
            ? _value.minimumAcceptable
            : minimumAcceptable // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NegotiationScriptImpl implements _NegotiationScript {
  const _$NegotiationScriptImpl({
    required this.id,
    required this.opening,
    required final List<String> keyPoints,
    required final List<String> competitorMentions,
    required final List<String> responseHandlers,
    required this.closingLine,
    required final List<String> escalationPhrases,
    required this.targetSavings,
    required this.minimumAcceptable,
  }) : _keyPoints = keyPoints,
       _competitorMentions = competitorMentions,
       _responseHandlers = responseHandlers,
       _escalationPhrases = escalationPhrases;

  factory _$NegotiationScriptImpl.fromJson(Map<String, dynamic> json) =>
      _$$NegotiationScriptImplFromJson(json);

  @override
  final String id;
  @override
  final String opening;
  // how to start the call
  final List<String> _keyPoints;
  // how to start the call
  @override
  List<String> get keyPoints {
    if (_keyPoints is EqualUnmodifiableListView) return _keyPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyPoints);
  }

  // main negotiation points
  final List<String> _competitorMentions;
  // main negotiation points
  @override
  List<String> get competitorMentions {
    if (_competitorMentions is EqualUnmodifiableListView)
      return _competitorMentions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_competitorMentions);
  }

  // competitor offers to mention
  final List<String> _responseHandlers;
  // competitor offers to mention
  @override
  List<String> get responseHandlers {
    if (_responseHandlers is EqualUnmodifiableListView)
      return _responseHandlers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_responseHandlers);
  }

  // how to handle objections
  @override
  final String closingLine;
  // how to close the deal
  final List<String> _escalationPhrases;
  // how to close the deal
  @override
  List<String> get escalationPhrases {
    if (_escalationPhrases is EqualUnmodifiableListView)
      return _escalationPhrases;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_escalationPhrases);
  }

  // if first rep can't help
  @override
  final double targetSavings;
  @override
  final double minimumAcceptable;

  @override
  String toString() {
    return 'NegotiationScript(id: $id, opening: $opening, keyPoints: $keyPoints, competitorMentions: $competitorMentions, responseHandlers: $responseHandlers, closingLine: $closingLine, escalationPhrases: $escalationPhrases, targetSavings: $targetSavings, minimumAcceptable: $minimumAcceptable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NegotiationScriptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.opening, opening) || other.opening == opening) &&
            const DeepCollectionEquality().equals(
              other._keyPoints,
              _keyPoints,
            ) &&
            const DeepCollectionEquality().equals(
              other._competitorMentions,
              _competitorMentions,
            ) &&
            const DeepCollectionEquality().equals(
              other._responseHandlers,
              _responseHandlers,
            ) &&
            (identical(other.closingLine, closingLine) ||
                other.closingLine == closingLine) &&
            const DeepCollectionEquality().equals(
              other._escalationPhrases,
              _escalationPhrases,
            ) &&
            (identical(other.targetSavings, targetSavings) ||
                other.targetSavings == targetSavings) &&
            (identical(other.minimumAcceptable, minimumAcceptable) ||
                other.minimumAcceptable == minimumAcceptable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    opening,
    const DeepCollectionEquality().hash(_keyPoints),
    const DeepCollectionEquality().hash(_competitorMentions),
    const DeepCollectionEquality().hash(_responseHandlers),
    closingLine,
    const DeepCollectionEquality().hash(_escalationPhrases),
    targetSavings,
    minimumAcceptable,
  );

  /// Create a copy of NegotiationScript
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NegotiationScriptImplCopyWith<_$NegotiationScriptImpl> get copyWith =>
      __$$NegotiationScriptImplCopyWithImpl<_$NegotiationScriptImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NegotiationScriptImplToJson(this);
  }
}

abstract class _NegotiationScript implements NegotiationScript {
  const factory _NegotiationScript({
    required final String id,
    required final String opening,
    required final List<String> keyPoints,
    required final List<String> competitorMentions,
    required final List<String> responseHandlers,
    required final String closingLine,
    required final List<String> escalationPhrases,
    required final double targetSavings,
    required final double minimumAcceptable,
  }) = _$NegotiationScriptImpl;

  factory _NegotiationScript.fromJson(Map<String, dynamic> json) =
      _$NegotiationScriptImpl.fromJson;

  @override
  String get id;
  @override
  String get opening; // how to start the call
  @override
  List<String> get keyPoints; // main negotiation points
  @override
  List<String> get competitorMentions; // competitor offers to mention
  @override
  List<String> get responseHandlers; // how to handle objections
  @override
  String get closingLine; // how to close the deal
  @override
  List<String> get escalationPhrases; // if first rep can't help
  @override
  double get targetSavings;
  @override
  double get minimumAcceptable;

  /// Create a copy of NegotiationScript
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NegotiationScriptImplCopyWith<_$NegotiationScriptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NegotiationStep _$NegotiationStepFromJson(Map<String, dynamic> json) {
  return _NegotiationStep.fromJson(json);
}

/// @nodoc
mixin _$NegotiationStep {
  int get stepNumber => throw _privateConstructorUsedError;
  String get instruction => throw _privateConstructorUsedError;
  String get expectedResponse => throw _privateConstructorUsedError;
  String get suggestedReply => throw _privateConstructorUsedError;
  bool? get completed => throw _privateConstructorUsedError;
  String? get actualOutcome => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this NegotiationStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NegotiationStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NegotiationStepCopyWith<NegotiationStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NegotiationStepCopyWith<$Res> {
  factory $NegotiationStepCopyWith(
    NegotiationStep value,
    $Res Function(NegotiationStep) then,
  ) = _$NegotiationStepCopyWithImpl<$Res, NegotiationStep>;
  @useResult
  $Res call({
    int stepNumber,
    String instruction,
    String expectedResponse,
    String suggestedReply,
    bool? completed,
    String? actualOutcome,
    DateTime? completedAt,
  });
}

/// @nodoc
class _$NegotiationStepCopyWithImpl<$Res, $Val extends NegotiationStep>
    implements $NegotiationStepCopyWith<$Res> {
  _$NegotiationStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NegotiationStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepNumber = null,
    Object? instruction = null,
    Object? expectedResponse = null,
    Object? suggestedReply = null,
    Object? completed = freezed,
    Object? actualOutcome = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            stepNumber: null == stepNumber
                ? _value.stepNumber
                : stepNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            instruction: null == instruction
                ? _value.instruction
                : instruction // ignore: cast_nullable_to_non_nullable
                      as String,
            expectedResponse: null == expectedResponse
                ? _value.expectedResponse
                : expectedResponse // ignore: cast_nullable_to_non_nullable
                      as String,
            suggestedReply: null == suggestedReply
                ? _value.suggestedReply
                : suggestedReply // ignore: cast_nullable_to_non_nullable
                      as String,
            completed: freezed == completed
                ? _value.completed
                : completed // ignore: cast_nullable_to_non_nullable
                      as bool?,
            actualOutcome: freezed == actualOutcome
                ? _value.actualOutcome
                : actualOutcome // ignore: cast_nullable_to_non_nullable
                      as String?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NegotiationStepImplCopyWith<$Res>
    implements $NegotiationStepCopyWith<$Res> {
  factory _$$NegotiationStepImplCopyWith(
    _$NegotiationStepImpl value,
    $Res Function(_$NegotiationStepImpl) then,
  ) = __$$NegotiationStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int stepNumber,
    String instruction,
    String expectedResponse,
    String suggestedReply,
    bool? completed,
    String? actualOutcome,
    DateTime? completedAt,
  });
}

/// @nodoc
class __$$NegotiationStepImplCopyWithImpl<$Res>
    extends _$NegotiationStepCopyWithImpl<$Res, _$NegotiationStepImpl>
    implements _$$NegotiationStepImplCopyWith<$Res> {
  __$$NegotiationStepImplCopyWithImpl(
    _$NegotiationStepImpl _value,
    $Res Function(_$NegotiationStepImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NegotiationStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stepNumber = null,
    Object? instruction = null,
    Object? expectedResponse = null,
    Object? suggestedReply = null,
    Object? completed = freezed,
    Object? actualOutcome = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(
      _$NegotiationStepImpl(
        stepNumber: null == stepNumber
            ? _value.stepNumber
            : stepNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        instruction: null == instruction
            ? _value.instruction
            : instruction // ignore: cast_nullable_to_non_nullable
                  as String,
        expectedResponse: null == expectedResponse
            ? _value.expectedResponse
            : expectedResponse // ignore: cast_nullable_to_non_nullable
                  as String,
        suggestedReply: null == suggestedReply
            ? _value.suggestedReply
            : suggestedReply // ignore: cast_nullable_to_non_nullable
                  as String,
        completed: freezed == completed
            ? _value.completed
            : completed // ignore: cast_nullable_to_non_nullable
                  as bool?,
        actualOutcome: freezed == actualOutcome
            ? _value.actualOutcome
            : actualOutcome // ignore: cast_nullable_to_non_nullable
                  as String?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NegotiationStepImpl implements _NegotiationStep {
  const _$NegotiationStepImpl({
    required this.stepNumber,
    required this.instruction,
    required this.expectedResponse,
    required this.suggestedReply,
    this.completed,
    this.actualOutcome,
    this.completedAt,
  });

  factory _$NegotiationStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$NegotiationStepImplFromJson(json);

  @override
  final int stepNumber;
  @override
  final String instruction;
  @override
  final String expectedResponse;
  @override
  final String suggestedReply;
  @override
  final bool? completed;
  @override
  final String? actualOutcome;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'NegotiationStep(stepNumber: $stepNumber, instruction: $instruction, expectedResponse: $expectedResponse, suggestedReply: $suggestedReply, completed: $completed, actualOutcome: $actualOutcome, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NegotiationStepImpl &&
            (identical(other.stepNumber, stepNumber) ||
                other.stepNumber == stepNumber) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.expectedResponse, expectedResponse) ||
                other.expectedResponse == expectedResponse) &&
            (identical(other.suggestedReply, suggestedReply) ||
                other.suggestedReply == suggestedReply) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.actualOutcome, actualOutcome) ||
                other.actualOutcome == actualOutcome) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    stepNumber,
    instruction,
    expectedResponse,
    suggestedReply,
    completed,
    actualOutcome,
    completedAt,
  );

  /// Create a copy of NegotiationStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NegotiationStepImplCopyWith<_$NegotiationStepImpl> get copyWith =>
      __$$NegotiationStepImplCopyWithImpl<_$NegotiationStepImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NegotiationStepImplToJson(this);
  }
}

abstract class _NegotiationStep implements NegotiationStep {
  const factory _NegotiationStep({
    required final int stepNumber,
    required final String instruction,
    required final String expectedResponse,
    required final String suggestedReply,
    final bool? completed,
    final String? actualOutcome,
    final DateTime? completedAt,
  }) = _$NegotiationStepImpl;

  factory _NegotiationStep.fromJson(Map<String, dynamic> json) =
      _$NegotiationStepImpl.fromJson;

  @override
  int get stepNumber;
  @override
  String get instruction;
  @override
  String get expectedResponse;
  @override
  String get suggestedReply;
  @override
  bool? get completed;
  @override
  String? get actualOutcome;
  @override
  DateTime? get completedAt;

  /// Create a copy of NegotiationStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NegotiationStepImplCopyWith<_$NegotiationStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NegotiatorStats _$NegotiatorStatsFromJson(Map<String, dynamic> json) {
  return _NegotiatorStats.fromJson(json);
}

/// @nodoc
mixin _$NegotiatorStats {
  int get totalNegotiations => throw _privateConstructorUsedError;
  int get successfulNegotiations => throw _privateConstructorUsedError;
  double get totalSavings => throw _privateConstructorUsedError;
  double get averageSavingsPerBill => throw _privateConstructorUsedError;
  double get successRate => throw _privateConstructorUsedError;
  Map<BillCategory, double> get savingsByCategory =>
      throw _privateConstructorUsedError;
  List<NegotiationWin> get recentWins => throw _privateConstructorUsedError;

  /// Serializes this NegotiatorStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NegotiatorStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NegotiatorStatsCopyWith<NegotiatorStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NegotiatorStatsCopyWith<$Res> {
  factory $NegotiatorStatsCopyWith(
    NegotiatorStats value,
    $Res Function(NegotiatorStats) then,
  ) = _$NegotiatorStatsCopyWithImpl<$Res, NegotiatorStats>;
  @useResult
  $Res call({
    int totalNegotiations,
    int successfulNegotiations,
    double totalSavings,
    double averageSavingsPerBill,
    double successRate,
    Map<BillCategory, double> savingsByCategory,
    List<NegotiationWin> recentWins,
  });
}

/// @nodoc
class _$NegotiatorStatsCopyWithImpl<$Res, $Val extends NegotiatorStats>
    implements $NegotiatorStatsCopyWith<$Res> {
  _$NegotiatorStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NegotiatorStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalNegotiations = null,
    Object? successfulNegotiations = null,
    Object? totalSavings = null,
    Object? averageSavingsPerBill = null,
    Object? successRate = null,
    Object? savingsByCategory = null,
    Object? recentWins = null,
  }) {
    return _then(
      _value.copyWith(
            totalNegotiations: null == totalNegotiations
                ? _value.totalNegotiations
                : totalNegotiations // ignore: cast_nullable_to_non_nullable
                      as int,
            successfulNegotiations: null == successfulNegotiations
                ? _value.successfulNegotiations
                : successfulNegotiations // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSavings: null == totalSavings
                ? _value.totalSavings
                : totalSavings // ignore: cast_nullable_to_non_nullable
                      as double,
            averageSavingsPerBill: null == averageSavingsPerBill
                ? _value.averageSavingsPerBill
                : averageSavingsPerBill // ignore: cast_nullable_to_non_nullable
                      as double,
            successRate: null == successRate
                ? _value.successRate
                : successRate // ignore: cast_nullable_to_non_nullable
                      as double,
            savingsByCategory: null == savingsByCategory
                ? _value.savingsByCategory
                : savingsByCategory // ignore: cast_nullable_to_non_nullable
                      as Map<BillCategory, double>,
            recentWins: null == recentWins
                ? _value.recentWins
                : recentWins // ignore: cast_nullable_to_non_nullable
                      as List<NegotiationWin>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NegotiatorStatsImplCopyWith<$Res>
    implements $NegotiatorStatsCopyWith<$Res> {
  factory _$$NegotiatorStatsImplCopyWith(
    _$NegotiatorStatsImpl value,
    $Res Function(_$NegotiatorStatsImpl) then,
  ) = __$$NegotiatorStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalNegotiations,
    int successfulNegotiations,
    double totalSavings,
    double averageSavingsPerBill,
    double successRate,
    Map<BillCategory, double> savingsByCategory,
    List<NegotiationWin> recentWins,
  });
}

/// @nodoc
class __$$NegotiatorStatsImplCopyWithImpl<$Res>
    extends _$NegotiatorStatsCopyWithImpl<$Res, _$NegotiatorStatsImpl>
    implements _$$NegotiatorStatsImplCopyWith<$Res> {
  __$$NegotiatorStatsImplCopyWithImpl(
    _$NegotiatorStatsImpl _value,
    $Res Function(_$NegotiatorStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NegotiatorStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalNegotiations = null,
    Object? successfulNegotiations = null,
    Object? totalSavings = null,
    Object? averageSavingsPerBill = null,
    Object? successRate = null,
    Object? savingsByCategory = null,
    Object? recentWins = null,
  }) {
    return _then(
      _$NegotiatorStatsImpl(
        totalNegotiations: null == totalNegotiations
            ? _value.totalNegotiations
            : totalNegotiations // ignore: cast_nullable_to_non_nullable
                  as int,
        successfulNegotiations: null == successfulNegotiations
            ? _value.successfulNegotiations
            : successfulNegotiations // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSavings: null == totalSavings
            ? _value.totalSavings
            : totalSavings // ignore: cast_nullable_to_non_nullable
                  as double,
        averageSavingsPerBill: null == averageSavingsPerBill
            ? _value.averageSavingsPerBill
            : averageSavingsPerBill // ignore: cast_nullable_to_non_nullable
                  as double,
        successRate: null == successRate
            ? _value.successRate
            : successRate // ignore: cast_nullable_to_non_nullable
                  as double,
        savingsByCategory: null == savingsByCategory
            ? _value._savingsByCategory
            : savingsByCategory // ignore: cast_nullable_to_non_nullable
                  as Map<BillCategory, double>,
        recentWins: null == recentWins
            ? _value._recentWins
            : recentWins // ignore: cast_nullable_to_non_nullable
                  as List<NegotiationWin>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NegotiatorStatsImpl implements _NegotiatorStats {
  const _$NegotiatorStatsImpl({
    required this.totalNegotiations,
    required this.successfulNegotiations,
    required this.totalSavings,
    required this.averageSavingsPerBill,
    required this.successRate,
    required final Map<BillCategory, double> savingsByCategory,
    required final List<NegotiationWin> recentWins,
  }) : _savingsByCategory = savingsByCategory,
       _recentWins = recentWins;

  factory _$NegotiatorStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NegotiatorStatsImplFromJson(json);

  @override
  final int totalNegotiations;
  @override
  final int successfulNegotiations;
  @override
  final double totalSavings;
  @override
  final double averageSavingsPerBill;
  @override
  final double successRate;
  final Map<BillCategory, double> _savingsByCategory;
  @override
  Map<BillCategory, double> get savingsByCategory {
    if (_savingsByCategory is EqualUnmodifiableMapView)
      return _savingsByCategory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_savingsByCategory);
  }

  final List<NegotiationWin> _recentWins;
  @override
  List<NegotiationWin> get recentWins {
    if (_recentWins is EqualUnmodifiableListView) return _recentWins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentWins);
  }

  @override
  String toString() {
    return 'NegotiatorStats(totalNegotiations: $totalNegotiations, successfulNegotiations: $successfulNegotiations, totalSavings: $totalSavings, averageSavingsPerBill: $averageSavingsPerBill, successRate: $successRate, savingsByCategory: $savingsByCategory, recentWins: $recentWins)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NegotiatorStatsImpl &&
            (identical(other.totalNegotiations, totalNegotiations) ||
                other.totalNegotiations == totalNegotiations) &&
            (identical(other.successfulNegotiations, successfulNegotiations) ||
                other.successfulNegotiations == successfulNegotiations) &&
            (identical(other.totalSavings, totalSavings) ||
                other.totalSavings == totalSavings) &&
            (identical(other.averageSavingsPerBill, averageSavingsPerBill) ||
                other.averageSavingsPerBill == averageSavingsPerBill) &&
            (identical(other.successRate, successRate) ||
                other.successRate == successRate) &&
            const DeepCollectionEquality().equals(
              other._savingsByCategory,
              _savingsByCategory,
            ) &&
            const DeepCollectionEquality().equals(
              other._recentWins,
              _recentWins,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalNegotiations,
    successfulNegotiations,
    totalSavings,
    averageSavingsPerBill,
    successRate,
    const DeepCollectionEquality().hash(_savingsByCategory),
    const DeepCollectionEquality().hash(_recentWins),
  );

  /// Create a copy of NegotiatorStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NegotiatorStatsImplCopyWith<_$NegotiatorStatsImpl> get copyWith =>
      __$$NegotiatorStatsImplCopyWithImpl<_$NegotiatorStatsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NegotiatorStatsImplToJson(this);
  }
}

abstract class _NegotiatorStats implements NegotiatorStats {
  const factory _NegotiatorStats({
    required final int totalNegotiations,
    required final int successfulNegotiations,
    required final double totalSavings,
    required final double averageSavingsPerBill,
    required final double successRate,
    required final Map<BillCategory, double> savingsByCategory,
    required final List<NegotiationWin> recentWins,
  }) = _$NegotiatorStatsImpl;

  factory _NegotiatorStats.fromJson(Map<String, dynamic> json) =
      _$NegotiatorStatsImpl.fromJson;

  @override
  int get totalNegotiations;
  @override
  int get successfulNegotiations;
  @override
  double get totalSavings;
  @override
  double get averageSavingsPerBill;
  @override
  double get successRate;
  @override
  Map<BillCategory, double> get savingsByCategory;
  @override
  List<NegotiationWin> get recentWins;

  /// Create a copy of NegotiatorStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NegotiatorStatsImplCopyWith<_$NegotiatorStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NegotiationWin _$NegotiationWinFromJson(Map<String, dynamic> json) {
  return _NegotiationWin.fromJson(json);
}

/// @nodoc
mixin _$NegotiationWin {
  String get billName => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  double get savings => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this NegotiationWin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NegotiationWin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NegotiationWinCopyWith<NegotiationWin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NegotiationWinCopyWith<$Res> {
  factory $NegotiationWinCopyWith(
    NegotiationWin value,
    $Res Function(NegotiationWin) then,
  ) = _$NegotiationWinCopyWithImpl<$Res, NegotiationWin>;
  @useResult
  $Res call({
    String billName,
    String provider,
    double savings,
    DateTime date,
    String description,
  });
}

/// @nodoc
class _$NegotiationWinCopyWithImpl<$Res, $Val extends NegotiationWin>
    implements $NegotiationWinCopyWith<$Res> {
  _$NegotiationWinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NegotiationWin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billName = null,
    Object? provider = null,
    Object? savings = null,
    Object? date = null,
    Object? description = null,
  }) {
    return _then(
      _value.copyWith(
            billName: null == billName
                ? _value.billName
                : billName // ignore: cast_nullable_to_non_nullable
                      as String,
            provider: null == provider
                ? _value.provider
                : provider // ignore: cast_nullable_to_non_nullable
                      as String,
            savings: null == savings
                ? _value.savings
                : savings // ignore: cast_nullable_to_non_nullable
                      as double,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NegotiationWinImplCopyWith<$Res>
    implements $NegotiationWinCopyWith<$Res> {
  factory _$$NegotiationWinImplCopyWith(
    _$NegotiationWinImpl value,
    $Res Function(_$NegotiationWinImpl) then,
  ) = __$$NegotiationWinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String billName,
    String provider,
    double savings,
    DateTime date,
    String description,
  });
}

/// @nodoc
class __$$NegotiationWinImplCopyWithImpl<$Res>
    extends _$NegotiationWinCopyWithImpl<$Res, _$NegotiationWinImpl>
    implements _$$NegotiationWinImplCopyWith<$Res> {
  __$$NegotiationWinImplCopyWithImpl(
    _$NegotiationWinImpl _value,
    $Res Function(_$NegotiationWinImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NegotiationWin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? billName = null,
    Object? provider = null,
    Object? savings = null,
    Object? date = null,
    Object? description = null,
  }) {
    return _then(
      _$NegotiationWinImpl(
        billName: null == billName
            ? _value.billName
            : billName // ignore: cast_nullable_to_non_nullable
                  as String,
        provider: null == provider
            ? _value.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String,
        savings: null == savings
            ? _value.savings
            : savings // ignore: cast_nullable_to_non_nullable
                  as double,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NegotiationWinImpl implements _NegotiationWin {
  const _$NegotiationWinImpl({
    required this.billName,
    required this.provider,
    required this.savings,
    required this.date,
    required this.description,
  });

  factory _$NegotiationWinImpl.fromJson(Map<String, dynamic> json) =>
      _$$NegotiationWinImplFromJson(json);

  @override
  final String billName;
  @override
  final String provider;
  @override
  final double savings;
  @override
  final DateTime date;
  @override
  final String description;

  @override
  String toString() {
    return 'NegotiationWin(billName: $billName, provider: $provider, savings: $savings, date: $date, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NegotiationWinImpl &&
            (identical(other.billName, billName) ||
                other.billName == billName) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.savings, savings) || other.savings == savings) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, billName, provider, savings, date, description);

  /// Create a copy of NegotiationWin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NegotiationWinImplCopyWith<_$NegotiationWinImpl> get copyWith =>
      __$$NegotiationWinImplCopyWithImpl<_$NegotiationWinImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NegotiationWinImplToJson(this);
  }
}

abstract class _NegotiationWin implements NegotiationWin {
  const factory _NegotiationWin({
    required final String billName,
    required final String provider,
    required final double savings,
    required final DateTime date,
    required final String description,
  }) = _$NegotiationWinImpl;

  factory _NegotiationWin.fromJson(Map<String, dynamic> json) =
      _$NegotiationWinImpl.fromJson;

  @override
  String get billName;
  @override
  String get provider;
  @override
  double get savings;
  @override
  DateTime get date;
  @override
  String get description;

  /// Create a copy of NegotiationWin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NegotiationWinImplCopyWith<_$NegotiationWinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceProvider _$ServiceProviderFromJson(Map<String, dynamic> json) {
  return _ServiceProvider.fromJson(json);
}

/// @nodoc
mixin _$ServiceProvider {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  BillCategory get category => throw _privateConstructorUsedError;
  String get retentionPhone =>
      throw _privateConstructorUsedError; // specific phone for better service
  List<String> get bestTimesToCall => throw _privateConstructorUsedError;
  double get averageDiscount => throw _privateConstructorUsedError;
  double get successRate =>
      throw _privateConstructorUsedError; // based on community data
  List<String> get knownPromotions => throw _privateConstructorUsedError;
  List<String> get negotiationTips => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this ServiceProvider to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceProviderCopyWith<ServiceProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceProviderCopyWith<$Res> {
  factory $ServiceProviderCopyWith(
    ServiceProvider value,
    $Res Function(ServiceProvider) then,
  ) = _$ServiceProviderCopyWithImpl<$Res, ServiceProvider>;
  @useResult
  $Res call({
    String id,
    String name,
    BillCategory category,
    String retentionPhone,
    List<String> bestTimesToCall,
    double averageDiscount,
    double successRate,
    List<String> knownPromotions,
    List<String> negotiationTips,
    DateTime lastUpdated,
  });
}

/// @nodoc
class _$ServiceProviderCopyWithImpl<$Res, $Val extends ServiceProvider>
    implements $ServiceProviderCopyWith<$Res> {
  _$ServiceProviderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? retentionPhone = null,
    Object? bestTimesToCall = null,
    Object? averageDiscount = null,
    Object? successRate = null,
    Object? knownPromotions = null,
    Object? negotiationTips = null,
    Object? lastUpdated = null,
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
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as BillCategory,
            retentionPhone: null == retentionPhone
                ? _value.retentionPhone
                : retentionPhone // ignore: cast_nullable_to_non_nullable
                      as String,
            bestTimesToCall: null == bestTimesToCall
                ? _value.bestTimesToCall
                : bestTimesToCall // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            averageDiscount: null == averageDiscount
                ? _value.averageDiscount
                : averageDiscount // ignore: cast_nullable_to_non_nullable
                      as double,
            successRate: null == successRate
                ? _value.successRate
                : successRate // ignore: cast_nullable_to_non_nullable
                      as double,
            knownPromotions: null == knownPromotions
                ? _value.knownPromotions
                : knownPromotions // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            negotiationTips: null == negotiationTips
                ? _value.negotiationTips
                : negotiationTips // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            lastUpdated: null == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServiceProviderImplCopyWith<$Res>
    implements $ServiceProviderCopyWith<$Res> {
  factory _$$ServiceProviderImplCopyWith(
    _$ServiceProviderImpl value,
    $Res Function(_$ServiceProviderImpl) then,
  ) = __$$ServiceProviderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    BillCategory category,
    String retentionPhone,
    List<String> bestTimesToCall,
    double averageDiscount,
    double successRate,
    List<String> knownPromotions,
    List<String> negotiationTips,
    DateTime lastUpdated,
  });
}

/// @nodoc
class __$$ServiceProviderImplCopyWithImpl<$Res>
    extends _$ServiceProviderCopyWithImpl<$Res, _$ServiceProviderImpl>
    implements _$$ServiceProviderImplCopyWith<$Res> {
  __$$ServiceProviderImplCopyWithImpl(
    _$ServiceProviderImpl _value,
    $Res Function(_$ServiceProviderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ServiceProvider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? retentionPhone = null,
    Object? bestTimesToCall = null,
    Object? averageDiscount = null,
    Object? successRate = null,
    Object? knownPromotions = null,
    Object? negotiationTips = null,
    Object? lastUpdated = null,
  }) {
    return _then(
      _$ServiceProviderImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as BillCategory,
        retentionPhone: null == retentionPhone
            ? _value.retentionPhone
            : retentionPhone // ignore: cast_nullable_to_non_nullable
                  as String,
        bestTimesToCall: null == bestTimesToCall
            ? _value._bestTimesToCall
            : bestTimesToCall // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        averageDiscount: null == averageDiscount
            ? _value.averageDiscount
            : averageDiscount // ignore: cast_nullable_to_non_nullable
                  as double,
        successRate: null == successRate
            ? _value.successRate
            : successRate // ignore: cast_nullable_to_non_nullable
                  as double,
        knownPromotions: null == knownPromotions
            ? _value._knownPromotions
            : knownPromotions // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        negotiationTips: null == negotiationTips
            ? _value._negotiationTips
            : negotiationTips // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        lastUpdated: null == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceProviderImpl implements _ServiceProvider {
  const _$ServiceProviderImpl({
    required this.id,
    required this.name,
    required this.category,
    required this.retentionPhone,
    required final List<String> bestTimesToCall,
    required this.averageDiscount,
    required this.successRate,
    required final List<String> knownPromotions,
    required final List<String> negotiationTips,
    required this.lastUpdated,
  }) : _bestTimesToCall = bestTimesToCall,
       _knownPromotions = knownPromotions,
       _negotiationTips = negotiationTips;

  factory _$ServiceProviderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceProviderImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final BillCategory category;
  @override
  final String retentionPhone;
  // specific phone for better service
  final List<String> _bestTimesToCall;
  // specific phone for better service
  @override
  List<String> get bestTimesToCall {
    if (_bestTimesToCall is EqualUnmodifiableListView) return _bestTimesToCall;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bestTimesToCall);
  }

  @override
  final double averageDiscount;
  @override
  final double successRate;
  // based on community data
  final List<String> _knownPromotions;
  // based on community data
  @override
  List<String> get knownPromotions {
    if (_knownPromotions is EqualUnmodifiableListView) return _knownPromotions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_knownPromotions);
  }

  final List<String> _negotiationTips;
  @override
  List<String> get negotiationTips {
    if (_negotiationTips is EqualUnmodifiableListView) return _negotiationTips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_negotiationTips);
  }

  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'ServiceProvider(id: $id, name: $name, category: $category, retentionPhone: $retentionPhone, bestTimesToCall: $bestTimesToCall, averageDiscount: $averageDiscount, successRate: $successRate, knownPromotions: $knownPromotions, negotiationTips: $negotiationTips, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceProviderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.retentionPhone, retentionPhone) ||
                other.retentionPhone == retentionPhone) &&
            const DeepCollectionEquality().equals(
              other._bestTimesToCall,
              _bestTimesToCall,
            ) &&
            (identical(other.averageDiscount, averageDiscount) ||
                other.averageDiscount == averageDiscount) &&
            (identical(other.successRate, successRate) ||
                other.successRate == successRate) &&
            const DeepCollectionEquality().equals(
              other._knownPromotions,
              _knownPromotions,
            ) &&
            const DeepCollectionEquality().equals(
              other._negotiationTips,
              _negotiationTips,
            ) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    category,
    retentionPhone,
    const DeepCollectionEquality().hash(_bestTimesToCall),
    averageDiscount,
    successRate,
    const DeepCollectionEquality().hash(_knownPromotions),
    const DeepCollectionEquality().hash(_negotiationTips),
    lastUpdated,
  );

  /// Create a copy of ServiceProvider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceProviderImplCopyWith<_$ServiceProviderImpl> get copyWith =>
      __$$ServiceProviderImplCopyWithImpl<_$ServiceProviderImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceProviderImplToJson(this);
  }
}

abstract class _ServiceProvider implements ServiceProvider {
  const factory _ServiceProvider({
    required final String id,
    required final String name,
    required final BillCategory category,
    required final String retentionPhone,
    required final List<String> bestTimesToCall,
    required final double averageDiscount,
    required final double successRate,
    required final List<String> knownPromotions,
    required final List<String> negotiationTips,
    required final DateTime lastUpdated,
  }) = _$ServiceProviderImpl;

  factory _ServiceProvider.fromJson(Map<String, dynamic> json) =
      _$ServiceProviderImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  BillCategory get category;
  @override
  String get retentionPhone; // specific phone for better service
  @override
  List<String> get bestTimesToCall;
  @override
  double get averageDiscount;
  @override
  double get successRate; // based on community data
  @override
  List<String> get knownPromotions;
  @override
  List<String> get negotiationTips;
  @override
  DateTime get lastUpdated;

  /// Create a copy of ServiceProvider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceProviderImplCopyWith<_$ServiceProviderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
