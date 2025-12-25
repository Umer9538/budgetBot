// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digital_twin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FinancialDigitalTwin _$FinancialDigitalTwinFromJson(Map<String, dynamic> json) {
  return _FinancialDigitalTwin.fromJson(json);
}

/// @nodoc
mixin _$FinancialDigitalTwin {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  FinancialSnapshot get currentSnapshot => throw _privateConstructorUsedError;
  List<SimulationScenario> get scenarios => throw _privateConstructorUsedError;
  List<LifeEvent> get projectedLifeEvents => throw _privateConstructorUsedError;
  TwinProjection get baseProjection => throw _privateConstructorUsedError;
  DateTime get lastSimulated => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this FinancialDigitalTwin to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinancialDigitalTwin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinancialDigitalTwinCopyWith<FinancialDigitalTwin> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialDigitalTwinCopyWith<$Res> {
  factory $FinancialDigitalTwinCopyWith(
    FinancialDigitalTwin value,
    $Res Function(FinancialDigitalTwin) then,
  ) = _$FinancialDigitalTwinCopyWithImpl<$Res, FinancialDigitalTwin>;
  @useResult
  $Res call({
    String id,
    String userId,
    FinancialSnapshot currentSnapshot,
    List<SimulationScenario> scenarios,
    List<LifeEvent> projectedLifeEvents,
    TwinProjection baseProjection,
    DateTime lastSimulated,
    DateTime? createdAt,
  });

  $FinancialSnapshotCopyWith<$Res> get currentSnapshot;
  $TwinProjectionCopyWith<$Res> get baseProjection;
}

/// @nodoc
class _$FinancialDigitalTwinCopyWithImpl<
  $Res,
  $Val extends FinancialDigitalTwin
>
    implements $FinancialDigitalTwinCopyWith<$Res> {
  _$FinancialDigitalTwinCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinancialDigitalTwin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? currentSnapshot = null,
    Object? scenarios = null,
    Object? projectedLifeEvents = null,
    Object? baseProjection = null,
    Object? lastSimulated = null,
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
            currentSnapshot: null == currentSnapshot
                ? _value.currentSnapshot
                : currentSnapshot // ignore: cast_nullable_to_non_nullable
                      as FinancialSnapshot,
            scenarios: null == scenarios
                ? _value.scenarios
                : scenarios // ignore: cast_nullable_to_non_nullable
                      as List<SimulationScenario>,
            projectedLifeEvents: null == projectedLifeEvents
                ? _value.projectedLifeEvents
                : projectedLifeEvents // ignore: cast_nullable_to_non_nullable
                      as List<LifeEvent>,
            baseProjection: null == baseProjection
                ? _value.baseProjection
                : baseProjection // ignore: cast_nullable_to_non_nullable
                      as TwinProjection,
            lastSimulated: null == lastSimulated
                ? _value.lastSimulated
                : lastSimulated // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of FinancialDigitalTwin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FinancialSnapshotCopyWith<$Res> get currentSnapshot {
    return $FinancialSnapshotCopyWith<$Res>(_value.currentSnapshot, (value) {
      return _then(_value.copyWith(currentSnapshot: value) as $Val);
    });
  }

  /// Create a copy of FinancialDigitalTwin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TwinProjectionCopyWith<$Res> get baseProjection {
    return $TwinProjectionCopyWith<$Res>(_value.baseProjection, (value) {
      return _then(_value.copyWith(baseProjection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FinancialDigitalTwinImplCopyWith<$Res>
    implements $FinancialDigitalTwinCopyWith<$Res> {
  factory _$$FinancialDigitalTwinImplCopyWith(
    _$FinancialDigitalTwinImpl value,
    $Res Function(_$FinancialDigitalTwinImpl) then,
  ) = __$$FinancialDigitalTwinImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    FinancialSnapshot currentSnapshot,
    List<SimulationScenario> scenarios,
    List<LifeEvent> projectedLifeEvents,
    TwinProjection baseProjection,
    DateTime lastSimulated,
    DateTime? createdAt,
  });

  @override
  $FinancialSnapshotCopyWith<$Res> get currentSnapshot;
  @override
  $TwinProjectionCopyWith<$Res> get baseProjection;
}

/// @nodoc
class __$$FinancialDigitalTwinImplCopyWithImpl<$Res>
    extends _$FinancialDigitalTwinCopyWithImpl<$Res, _$FinancialDigitalTwinImpl>
    implements _$$FinancialDigitalTwinImplCopyWith<$Res> {
  __$$FinancialDigitalTwinImplCopyWithImpl(
    _$FinancialDigitalTwinImpl _value,
    $Res Function(_$FinancialDigitalTwinImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FinancialDigitalTwin
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? currentSnapshot = null,
    Object? scenarios = null,
    Object? projectedLifeEvents = null,
    Object? baseProjection = null,
    Object? lastSimulated = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$FinancialDigitalTwinImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        currentSnapshot: null == currentSnapshot
            ? _value.currentSnapshot
            : currentSnapshot // ignore: cast_nullable_to_non_nullable
                  as FinancialSnapshot,
        scenarios: null == scenarios
            ? _value._scenarios
            : scenarios // ignore: cast_nullable_to_non_nullable
                  as List<SimulationScenario>,
        projectedLifeEvents: null == projectedLifeEvents
            ? _value._projectedLifeEvents
            : projectedLifeEvents // ignore: cast_nullable_to_non_nullable
                  as List<LifeEvent>,
        baseProjection: null == baseProjection
            ? _value.baseProjection
            : baseProjection // ignore: cast_nullable_to_non_nullable
                  as TwinProjection,
        lastSimulated: null == lastSimulated
            ? _value.lastSimulated
            : lastSimulated // ignore: cast_nullable_to_non_nullable
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
class _$FinancialDigitalTwinImpl implements _FinancialDigitalTwin {
  const _$FinancialDigitalTwinImpl({
    required this.id,
    required this.userId,
    required this.currentSnapshot,
    required final List<SimulationScenario> scenarios,
    required final List<LifeEvent> projectedLifeEvents,
    required this.baseProjection,
    required this.lastSimulated,
    this.createdAt,
  }) : _scenarios = scenarios,
       _projectedLifeEvents = projectedLifeEvents;

  factory _$FinancialDigitalTwinImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinancialDigitalTwinImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final FinancialSnapshot currentSnapshot;
  final List<SimulationScenario> _scenarios;
  @override
  List<SimulationScenario> get scenarios {
    if (_scenarios is EqualUnmodifiableListView) return _scenarios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scenarios);
  }

  final List<LifeEvent> _projectedLifeEvents;
  @override
  List<LifeEvent> get projectedLifeEvents {
    if (_projectedLifeEvents is EqualUnmodifiableListView)
      return _projectedLifeEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectedLifeEvents);
  }

  @override
  final TwinProjection baseProjection;
  @override
  final DateTime lastSimulated;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'FinancialDigitalTwin(id: $id, userId: $userId, currentSnapshot: $currentSnapshot, scenarios: $scenarios, projectedLifeEvents: $projectedLifeEvents, baseProjection: $baseProjection, lastSimulated: $lastSimulated, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancialDigitalTwinImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.currentSnapshot, currentSnapshot) ||
                other.currentSnapshot == currentSnapshot) &&
            const DeepCollectionEquality().equals(
              other._scenarios,
              _scenarios,
            ) &&
            const DeepCollectionEquality().equals(
              other._projectedLifeEvents,
              _projectedLifeEvents,
            ) &&
            (identical(other.baseProjection, baseProjection) ||
                other.baseProjection == baseProjection) &&
            (identical(other.lastSimulated, lastSimulated) ||
                other.lastSimulated == lastSimulated) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    currentSnapshot,
    const DeepCollectionEquality().hash(_scenarios),
    const DeepCollectionEquality().hash(_projectedLifeEvents),
    baseProjection,
    lastSimulated,
    createdAt,
  );

  /// Create a copy of FinancialDigitalTwin
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancialDigitalTwinImplCopyWith<_$FinancialDigitalTwinImpl>
  get copyWith =>
      __$$FinancialDigitalTwinImplCopyWithImpl<_$FinancialDigitalTwinImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FinancialDigitalTwinImplToJson(this);
  }
}

abstract class _FinancialDigitalTwin implements FinancialDigitalTwin {
  const factory _FinancialDigitalTwin({
    required final String id,
    required final String userId,
    required final FinancialSnapshot currentSnapshot,
    required final List<SimulationScenario> scenarios,
    required final List<LifeEvent> projectedLifeEvents,
    required final TwinProjection baseProjection,
    required final DateTime lastSimulated,
    final DateTime? createdAt,
  }) = _$FinancialDigitalTwinImpl;

  factory _FinancialDigitalTwin.fromJson(Map<String, dynamic> json) =
      _$FinancialDigitalTwinImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  FinancialSnapshot get currentSnapshot;
  @override
  List<SimulationScenario> get scenarios;
  @override
  List<LifeEvent> get projectedLifeEvents;
  @override
  TwinProjection get baseProjection;
  @override
  DateTime get lastSimulated;
  @override
  DateTime? get createdAt;

  /// Create a copy of FinancialDigitalTwin
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinancialDigitalTwinImplCopyWith<_$FinancialDigitalTwinImpl>
  get copyWith => throw _privateConstructorUsedError;
}

FinancialSnapshot _$FinancialSnapshotFromJson(Map<String, dynamic> json) {
  return _FinancialSnapshot.fromJson(json);
}

/// @nodoc
mixin _$FinancialSnapshot {
  double get currentNetWorth => throw _privateConstructorUsedError;
  double get monthlyIncome => throw _privateConstructorUsedError;
  double get monthlyExpenses => throw _privateConstructorUsedError;
  double get savingsRate => throw _privateConstructorUsedError;
  double get emergencyFundMonths => throw _privateConstructorUsedError;
  double get debtToIncomeRatio => throw _privateConstructorUsedError;
  double get investmentBalance => throw _privateConstructorUsedError;
  double get retirementBalance => throw _privateConstructorUsedError;
  Map<String, double> get assetAllocation =>
      throw _privateConstructorUsedError; // asset type -> value
  Map<String, double> get liabilities =>
      throw _privateConstructorUsedError; // liability type -> value
  DateTime get snapshotDate => throw _privateConstructorUsedError;

  /// Serializes this FinancialSnapshot to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FinancialSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinancialSnapshotCopyWith<FinancialSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialSnapshotCopyWith<$Res> {
  factory $FinancialSnapshotCopyWith(
    FinancialSnapshot value,
    $Res Function(FinancialSnapshot) then,
  ) = _$FinancialSnapshotCopyWithImpl<$Res, FinancialSnapshot>;
  @useResult
  $Res call({
    double currentNetWorth,
    double monthlyIncome,
    double monthlyExpenses,
    double savingsRate,
    double emergencyFundMonths,
    double debtToIncomeRatio,
    double investmentBalance,
    double retirementBalance,
    Map<String, double> assetAllocation,
    Map<String, double> liabilities,
    DateTime snapshotDate,
  });
}

/// @nodoc
class _$FinancialSnapshotCopyWithImpl<$Res, $Val extends FinancialSnapshot>
    implements $FinancialSnapshotCopyWith<$Res> {
  _$FinancialSnapshotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinancialSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentNetWorth = null,
    Object? monthlyIncome = null,
    Object? monthlyExpenses = null,
    Object? savingsRate = null,
    Object? emergencyFundMonths = null,
    Object? debtToIncomeRatio = null,
    Object? investmentBalance = null,
    Object? retirementBalance = null,
    Object? assetAllocation = null,
    Object? liabilities = null,
    Object? snapshotDate = null,
  }) {
    return _then(
      _value.copyWith(
            currentNetWorth: null == currentNetWorth
                ? _value.currentNetWorth
                : currentNetWorth // ignore: cast_nullable_to_non_nullable
                      as double,
            monthlyIncome: null == monthlyIncome
                ? _value.monthlyIncome
                : monthlyIncome // ignore: cast_nullable_to_non_nullable
                      as double,
            monthlyExpenses: null == monthlyExpenses
                ? _value.monthlyExpenses
                : monthlyExpenses // ignore: cast_nullable_to_non_nullable
                      as double,
            savingsRate: null == savingsRate
                ? _value.savingsRate
                : savingsRate // ignore: cast_nullable_to_non_nullable
                      as double,
            emergencyFundMonths: null == emergencyFundMonths
                ? _value.emergencyFundMonths
                : emergencyFundMonths // ignore: cast_nullable_to_non_nullable
                      as double,
            debtToIncomeRatio: null == debtToIncomeRatio
                ? _value.debtToIncomeRatio
                : debtToIncomeRatio // ignore: cast_nullable_to_non_nullable
                      as double,
            investmentBalance: null == investmentBalance
                ? _value.investmentBalance
                : investmentBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            retirementBalance: null == retirementBalance
                ? _value.retirementBalance
                : retirementBalance // ignore: cast_nullable_to_non_nullable
                      as double,
            assetAllocation: null == assetAllocation
                ? _value.assetAllocation
                : assetAllocation // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            liabilities: null == liabilities
                ? _value.liabilities
                : liabilities // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            snapshotDate: null == snapshotDate
                ? _value.snapshotDate
                : snapshotDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FinancialSnapshotImplCopyWith<$Res>
    implements $FinancialSnapshotCopyWith<$Res> {
  factory _$$FinancialSnapshotImplCopyWith(
    _$FinancialSnapshotImpl value,
    $Res Function(_$FinancialSnapshotImpl) then,
  ) = __$$FinancialSnapshotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double currentNetWorth,
    double monthlyIncome,
    double monthlyExpenses,
    double savingsRate,
    double emergencyFundMonths,
    double debtToIncomeRatio,
    double investmentBalance,
    double retirementBalance,
    Map<String, double> assetAllocation,
    Map<String, double> liabilities,
    DateTime snapshotDate,
  });
}

/// @nodoc
class __$$FinancialSnapshotImplCopyWithImpl<$Res>
    extends _$FinancialSnapshotCopyWithImpl<$Res, _$FinancialSnapshotImpl>
    implements _$$FinancialSnapshotImplCopyWith<$Res> {
  __$$FinancialSnapshotImplCopyWithImpl(
    _$FinancialSnapshotImpl _value,
    $Res Function(_$FinancialSnapshotImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FinancialSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentNetWorth = null,
    Object? monthlyIncome = null,
    Object? monthlyExpenses = null,
    Object? savingsRate = null,
    Object? emergencyFundMonths = null,
    Object? debtToIncomeRatio = null,
    Object? investmentBalance = null,
    Object? retirementBalance = null,
    Object? assetAllocation = null,
    Object? liabilities = null,
    Object? snapshotDate = null,
  }) {
    return _then(
      _$FinancialSnapshotImpl(
        currentNetWorth: null == currentNetWorth
            ? _value.currentNetWorth
            : currentNetWorth // ignore: cast_nullable_to_non_nullable
                  as double,
        monthlyIncome: null == monthlyIncome
            ? _value.monthlyIncome
            : monthlyIncome // ignore: cast_nullable_to_non_nullable
                  as double,
        monthlyExpenses: null == monthlyExpenses
            ? _value.monthlyExpenses
            : monthlyExpenses // ignore: cast_nullable_to_non_nullable
                  as double,
        savingsRate: null == savingsRate
            ? _value.savingsRate
            : savingsRate // ignore: cast_nullable_to_non_nullable
                  as double,
        emergencyFundMonths: null == emergencyFundMonths
            ? _value.emergencyFundMonths
            : emergencyFundMonths // ignore: cast_nullable_to_non_nullable
                  as double,
        debtToIncomeRatio: null == debtToIncomeRatio
            ? _value.debtToIncomeRatio
            : debtToIncomeRatio // ignore: cast_nullable_to_non_nullable
                  as double,
        investmentBalance: null == investmentBalance
            ? _value.investmentBalance
            : investmentBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        retirementBalance: null == retirementBalance
            ? _value.retirementBalance
            : retirementBalance // ignore: cast_nullable_to_non_nullable
                  as double,
        assetAllocation: null == assetAllocation
            ? _value._assetAllocation
            : assetAllocation // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        liabilities: null == liabilities
            ? _value._liabilities
            : liabilities // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        snapshotDate: null == snapshotDate
            ? _value.snapshotDate
            : snapshotDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FinancialSnapshotImpl implements _FinancialSnapshot {
  const _$FinancialSnapshotImpl({
    required this.currentNetWorth,
    required this.monthlyIncome,
    required this.monthlyExpenses,
    required this.savingsRate,
    required this.emergencyFundMonths,
    required this.debtToIncomeRatio,
    required this.investmentBalance,
    required this.retirementBalance,
    required final Map<String, double> assetAllocation,
    required final Map<String, double> liabilities,
    required this.snapshotDate,
  }) : _assetAllocation = assetAllocation,
       _liabilities = liabilities;

  factory _$FinancialSnapshotImpl.fromJson(Map<String, dynamic> json) =>
      _$$FinancialSnapshotImplFromJson(json);

  @override
  final double currentNetWorth;
  @override
  final double monthlyIncome;
  @override
  final double monthlyExpenses;
  @override
  final double savingsRate;
  @override
  final double emergencyFundMonths;
  @override
  final double debtToIncomeRatio;
  @override
  final double investmentBalance;
  @override
  final double retirementBalance;
  final Map<String, double> _assetAllocation;
  @override
  Map<String, double> get assetAllocation {
    if (_assetAllocation is EqualUnmodifiableMapView) return _assetAllocation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_assetAllocation);
  }

  // asset type -> value
  final Map<String, double> _liabilities;
  // asset type -> value
  @override
  Map<String, double> get liabilities {
    if (_liabilities is EqualUnmodifiableMapView) return _liabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_liabilities);
  }

  // liability type -> value
  @override
  final DateTime snapshotDate;

  @override
  String toString() {
    return 'FinancialSnapshot(currentNetWorth: $currentNetWorth, monthlyIncome: $monthlyIncome, monthlyExpenses: $monthlyExpenses, savingsRate: $savingsRate, emergencyFundMonths: $emergencyFundMonths, debtToIncomeRatio: $debtToIncomeRatio, investmentBalance: $investmentBalance, retirementBalance: $retirementBalance, assetAllocation: $assetAllocation, liabilities: $liabilities, snapshotDate: $snapshotDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancialSnapshotImpl &&
            (identical(other.currentNetWorth, currentNetWorth) ||
                other.currentNetWorth == currentNetWorth) &&
            (identical(other.monthlyIncome, monthlyIncome) ||
                other.monthlyIncome == monthlyIncome) &&
            (identical(other.monthlyExpenses, monthlyExpenses) ||
                other.monthlyExpenses == monthlyExpenses) &&
            (identical(other.savingsRate, savingsRate) ||
                other.savingsRate == savingsRate) &&
            (identical(other.emergencyFundMonths, emergencyFundMonths) ||
                other.emergencyFundMonths == emergencyFundMonths) &&
            (identical(other.debtToIncomeRatio, debtToIncomeRatio) ||
                other.debtToIncomeRatio == debtToIncomeRatio) &&
            (identical(other.investmentBalance, investmentBalance) ||
                other.investmentBalance == investmentBalance) &&
            (identical(other.retirementBalance, retirementBalance) ||
                other.retirementBalance == retirementBalance) &&
            const DeepCollectionEquality().equals(
              other._assetAllocation,
              _assetAllocation,
            ) &&
            const DeepCollectionEquality().equals(
              other._liabilities,
              _liabilities,
            ) &&
            (identical(other.snapshotDate, snapshotDate) ||
                other.snapshotDate == snapshotDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    currentNetWorth,
    monthlyIncome,
    monthlyExpenses,
    savingsRate,
    emergencyFundMonths,
    debtToIncomeRatio,
    investmentBalance,
    retirementBalance,
    const DeepCollectionEquality().hash(_assetAllocation),
    const DeepCollectionEquality().hash(_liabilities),
    snapshotDate,
  );

  /// Create a copy of FinancialSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancialSnapshotImplCopyWith<_$FinancialSnapshotImpl> get copyWith =>
      __$$FinancialSnapshotImplCopyWithImpl<_$FinancialSnapshotImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FinancialSnapshotImplToJson(this);
  }
}

abstract class _FinancialSnapshot implements FinancialSnapshot {
  const factory _FinancialSnapshot({
    required final double currentNetWorth,
    required final double monthlyIncome,
    required final double monthlyExpenses,
    required final double savingsRate,
    required final double emergencyFundMonths,
    required final double debtToIncomeRatio,
    required final double investmentBalance,
    required final double retirementBalance,
    required final Map<String, double> assetAllocation,
    required final Map<String, double> liabilities,
    required final DateTime snapshotDate,
  }) = _$FinancialSnapshotImpl;

  factory _FinancialSnapshot.fromJson(Map<String, dynamic> json) =
      _$FinancialSnapshotImpl.fromJson;

  @override
  double get currentNetWorth;
  @override
  double get monthlyIncome;
  @override
  double get monthlyExpenses;
  @override
  double get savingsRate;
  @override
  double get emergencyFundMonths;
  @override
  double get debtToIncomeRatio;
  @override
  double get investmentBalance;
  @override
  double get retirementBalance;
  @override
  Map<String, double> get assetAllocation; // asset type -> value
  @override
  Map<String, double> get liabilities; // liability type -> value
  @override
  DateTime get snapshotDate;

  /// Create a copy of FinancialSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinancialSnapshotImplCopyWith<_$FinancialSnapshotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SimulationScenario _$SimulationScenarioFromJson(Map<String, dynamic> json) {
  return _SimulationScenario.fromJson(json);
}

/// @nodoc
mixin _$SimulationScenario {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ScenarioType get type => throw _privateConstructorUsedError;
  List<ScenarioParameter> get parameters => throw _privateConstructorUsedError;
  TwinProjection get projection => throw _privateConstructorUsedError;
  double get probability =>
      throw _privateConstructorUsedError; // 0-100 likelihood
  bool get isUserCreated => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this SimulationScenario to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SimulationScenario
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SimulationScenarioCopyWith<SimulationScenario> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimulationScenarioCopyWith<$Res> {
  factory $SimulationScenarioCopyWith(
    SimulationScenario value,
    $Res Function(SimulationScenario) then,
  ) = _$SimulationScenarioCopyWithImpl<$Res, SimulationScenario>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    ScenarioType type,
    List<ScenarioParameter> parameters,
    TwinProjection projection,
    double probability,
    bool isUserCreated,
    DateTime? createdAt,
  });

  $TwinProjectionCopyWith<$Res> get projection;
}

/// @nodoc
class _$SimulationScenarioCopyWithImpl<$Res, $Val extends SimulationScenario>
    implements $SimulationScenarioCopyWith<$Res> {
  _$SimulationScenarioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SimulationScenario
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? parameters = null,
    Object? projection = null,
    Object? probability = null,
    Object? isUserCreated = null,
    Object? createdAt = freezed,
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
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as ScenarioType,
            parameters: null == parameters
                ? _value.parameters
                : parameters // ignore: cast_nullable_to_non_nullable
                      as List<ScenarioParameter>,
            projection: null == projection
                ? _value.projection
                : projection // ignore: cast_nullable_to_non_nullable
                      as TwinProjection,
            probability: null == probability
                ? _value.probability
                : probability // ignore: cast_nullable_to_non_nullable
                      as double,
            isUserCreated: null == isUserCreated
                ? _value.isUserCreated
                : isUserCreated // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of SimulationScenario
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TwinProjectionCopyWith<$Res> get projection {
    return $TwinProjectionCopyWith<$Res>(_value.projection, (value) {
      return _then(_value.copyWith(projection: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SimulationScenarioImplCopyWith<$Res>
    implements $SimulationScenarioCopyWith<$Res> {
  factory _$$SimulationScenarioImplCopyWith(
    _$SimulationScenarioImpl value,
    $Res Function(_$SimulationScenarioImpl) then,
  ) = __$$SimulationScenarioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    ScenarioType type,
    List<ScenarioParameter> parameters,
    TwinProjection projection,
    double probability,
    bool isUserCreated,
    DateTime? createdAt,
  });

  @override
  $TwinProjectionCopyWith<$Res> get projection;
}

/// @nodoc
class __$$SimulationScenarioImplCopyWithImpl<$Res>
    extends _$SimulationScenarioCopyWithImpl<$Res, _$SimulationScenarioImpl>
    implements _$$SimulationScenarioImplCopyWith<$Res> {
  __$$SimulationScenarioImplCopyWithImpl(
    _$SimulationScenarioImpl _value,
    $Res Function(_$SimulationScenarioImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SimulationScenario
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? parameters = null,
    Object? projection = null,
    Object? probability = null,
    Object? isUserCreated = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$SimulationScenarioImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ScenarioType,
        parameters: null == parameters
            ? _value._parameters
            : parameters // ignore: cast_nullable_to_non_nullable
                  as List<ScenarioParameter>,
        projection: null == projection
            ? _value.projection
            : projection // ignore: cast_nullable_to_non_nullable
                  as TwinProjection,
        probability: null == probability
            ? _value.probability
            : probability // ignore: cast_nullable_to_non_nullable
                  as double,
        isUserCreated: null == isUserCreated
            ? _value.isUserCreated
            : isUserCreated // ignore: cast_nullable_to_non_nullable
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
class _$SimulationScenarioImpl implements _SimulationScenario {
  const _$SimulationScenarioImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required final List<ScenarioParameter> parameters,
    required this.projection,
    required this.probability,
    required this.isUserCreated,
    this.createdAt,
  }) : _parameters = parameters;

  factory _$SimulationScenarioImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimulationScenarioImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final ScenarioType type;
  final List<ScenarioParameter> _parameters;
  @override
  List<ScenarioParameter> get parameters {
    if (_parameters is EqualUnmodifiableListView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parameters);
  }

  @override
  final TwinProjection projection;
  @override
  final double probability;
  // 0-100 likelihood
  @override
  final bool isUserCreated;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'SimulationScenario(id: $id, name: $name, description: $description, type: $type, parameters: $parameters, projection: $projection, probability: $probability, isUserCreated: $isUserCreated, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimulationScenarioImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._parameters,
              _parameters,
            ) &&
            (identical(other.projection, projection) ||
                other.projection == projection) &&
            (identical(other.probability, probability) ||
                other.probability == probability) &&
            (identical(other.isUserCreated, isUserCreated) ||
                other.isUserCreated == isUserCreated) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    type,
    const DeepCollectionEquality().hash(_parameters),
    projection,
    probability,
    isUserCreated,
    createdAt,
  );

  /// Create a copy of SimulationScenario
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SimulationScenarioImplCopyWith<_$SimulationScenarioImpl> get copyWith =>
      __$$SimulationScenarioImplCopyWithImpl<_$SimulationScenarioImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SimulationScenarioImplToJson(this);
  }
}

abstract class _SimulationScenario implements SimulationScenario {
  const factory _SimulationScenario({
    required final String id,
    required final String name,
    required final String description,
    required final ScenarioType type,
    required final List<ScenarioParameter> parameters,
    required final TwinProjection projection,
    required final double probability,
    required final bool isUserCreated,
    final DateTime? createdAt,
  }) = _$SimulationScenarioImpl;

  factory _SimulationScenario.fromJson(Map<String, dynamic> json) =
      _$SimulationScenarioImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  ScenarioType get type;
  @override
  List<ScenarioParameter> get parameters;
  @override
  TwinProjection get projection;
  @override
  double get probability; // 0-100 likelihood
  @override
  bool get isUserCreated;
  @override
  DateTime? get createdAt;

  /// Create a copy of SimulationScenario
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SimulationScenarioImplCopyWith<_$SimulationScenarioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScenarioParameter _$ScenarioParameterFromJson(Map<String, dynamic> json) {
  return _ScenarioParameter.fromJson(json);
}

/// @nodoc
mixin _$ScenarioParameter {
  String get name => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  ParameterType get type => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  dynamic get minValue => throw _privateConstructorUsedError;
  dynamic get maxValue => throw _privateConstructorUsedError;
  List<String>? get options => throw _privateConstructorUsedError;
  String? get unit => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this ScenarioParameter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScenarioParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScenarioParameterCopyWith<ScenarioParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioParameterCopyWith<$Res> {
  factory $ScenarioParameterCopyWith(
    ScenarioParameter value,
    $Res Function(ScenarioParameter) then,
  ) = _$ScenarioParameterCopyWithImpl<$Res, ScenarioParameter>;
  @useResult
  $Res call({
    String name,
    String label,
    ParameterType type,
    dynamic value,
    dynamic minValue,
    dynamic maxValue,
    List<String>? options,
    String? unit,
    String? description,
  });
}

/// @nodoc
class _$ScenarioParameterCopyWithImpl<$Res, $Val extends ScenarioParameter>
    implements $ScenarioParameterCopyWith<$Res> {
  _$ScenarioParameterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScenarioParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? label = null,
    Object? type = null,
    Object? value = freezed,
    Object? minValue = freezed,
    Object? maxValue = freezed,
    Object? options = freezed,
    Object? unit = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as ParameterType,
            value: freezed == value
                ? _value.value
                : value // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            minValue: freezed == minValue
                ? _value.minValue
                : minValue // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            maxValue: freezed == maxValue
                ? _value.maxValue
                : maxValue // ignore: cast_nullable_to_non_nullable
                      as dynamic,
            options: freezed == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
            unit: freezed == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScenarioParameterImplCopyWith<$Res>
    implements $ScenarioParameterCopyWith<$Res> {
  factory _$$ScenarioParameterImplCopyWith(
    _$ScenarioParameterImpl value,
    $Res Function(_$ScenarioParameterImpl) then,
  ) = __$$ScenarioParameterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String label,
    ParameterType type,
    dynamic value,
    dynamic minValue,
    dynamic maxValue,
    List<String>? options,
    String? unit,
    String? description,
  });
}

/// @nodoc
class __$$ScenarioParameterImplCopyWithImpl<$Res>
    extends _$ScenarioParameterCopyWithImpl<$Res, _$ScenarioParameterImpl>
    implements _$$ScenarioParameterImplCopyWith<$Res> {
  __$$ScenarioParameterImplCopyWithImpl(
    _$ScenarioParameterImpl _value,
    $Res Function(_$ScenarioParameterImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScenarioParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? label = null,
    Object? type = null,
    Object? value = freezed,
    Object? minValue = freezed,
    Object? maxValue = freezed,
    Object? options = freezed,
    Object? unit = freezed,
    Object? description = freezed,
  }) {
    return _then(
      _$ScenarioParameterImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ParameterType,
        value: freezed == value
            ? _value.value
            : value // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        minValue: freezed == minValue
            ? _value.minValue
            : minValue // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        maxValue: freezed == maxValue
            ? _value.maxValue
            : maxValue // ignore: cast_nullable_to_non_nullable
                  as dynamic,
        options: freezed == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        unit: freezed == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScenarioParameterImpl implements _ScenarioParameter {
  const _$ScenarioParameterImpl({
    required this.name,
    required this.label,
    required this.type,
    required this.value,
    this.minValue,
    this.maxValue,
    final List<String>? options,
    this.unit,
    this.description,
  }) : _options = options;

  factory _$ScenarioParameterImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScenarioParameterImplFromJson(json);

  @override
  final String name;
  @override
  final String label;
  @override
  final ParameterType type;
  @override
  final dynamic value;
  @override
  final dynamic minValue;
  @override
  final dynamic maxValue;
  final List<String>? _options;
  @override
  List<String>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? unit;
  @override
  final String? description;

  @override
  String toString() {
    return 'ScenarioParameter(name: $name, label: $label, type: $type, value: $value, minValue: $minValue, maxValue: $maxValue, options: $options, unit: $unit, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScenarioParameterImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other.minValue, minValue) &&
            const DeepCollectionEquality().equals(other.maxValue, maxValue) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    label,
    type,
    const DeepCollectionEquality().hash(value),
    const DeepCollectionEquality().hash(minValue),
    const DeepCollectionEquality().hash(maxValue),
    const DeepCollectionEquality().hash(_options),
    unit,
    description,
  );

  /// Create a copy of ScenarioParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScenarioParameterImplCopyWith<_$ScenarioParameterImpl> get copyWith =>
      __$$ScenarioParameterImplCopyWithImpl<_$ScenarioParameterImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ScenarioParameterImplToJson(this);
  }
}

abstract class _ScenarioParameter implements ScenarioParameter {
  const factory _ScenarioParameter({
    required final String name,
    required final String label,
    required final ParameterType type,
    required final dynamic value,
    final dynamic minValue,
    final dynamic maxValue,
    final List<String>? options,
    final String? unit,
    final String? description,
  }) = _$ScenarioParameterImpl;

  factory _ScenarioParameter.fromJson(Map<String, dynamic> json) =
      _$ScenarioParameterImpl.fromJson;

  @override
  String get name;
  @override
  String get label;
  @override
  ParameterType get type;
  @override
  dynamic get value;
  @override
  dynamic get minValue;
  @override
  dynamic get maxValue;
  @override
  List<String>? get options;
  @override
  String? get unit;
  @override
  String? get description;

  /// Create a copy of ScenarioParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScenarioParameterImplCopyWith<_$ScenarioParameterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LifeEvent _$LifeEventFromJson(Map<String, dynamic> json) {
  return _LifeEvent.fromJson(json);
}

/// @nodoc
mixin _$LifeEvent {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ScenarioType get type => throw _privateConstructorUsedError;
  DateTime get projectedDate => throw _privateConstructorUsedError;
  double get financialImpact =>
      throw _privateConstructorUsedError; // positive or negative
  double get monthlyImpact =>
      throw _privateConstructorUsedError; // ongoing monthly change
  int get durationMonths =>
      throw _privateConstructorUsedError; // 0 for one-time
  double get confidence =>
      throw _privateConstructorUsedError; // 0-100 how likely
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this LifeEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LifeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LifeEventCopyWith<LifeEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LifeEventCopyWith<$Res> {
  factory $LifeEventCopyWith(LifeEvent value, $Res Function(LifeEvent) then) =
      _$LifeEventCopyWithImpl<$Res, LifeEvent>;
  @useResult
  $Res call({
    String id,
    String name,
    ScenarioType type,
    DateTime projectedDate,
    double financialImpact,
    double monthlyImpact,
    int durationMonths,
    double confidence,
    String? notes,
  });
}

/// @nodoc
class _$LifeEventCopyWithImpl<$Res, $Val extends LifeEvent>
    implements $LifeEventCopyWith<$Res> {
  _$LifeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LifeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? projectedDate = null,
    Object? financialImpact = null,
    Object? monthlyImpact = null,
    Object? durationMonths = null,
    Object? confidence = null,
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
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as ScenarioType,
            projectedDate: null == projectedDate
                ? _value.projectedDate
                : projectedDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            financialImpact: null == financialImpact
                ? _value.financialImpact
                : financialImpact // ignore: cast_nullable_to_non_nullable
                      as double,
            monthlyImpact: null == monthlyImpact
                ? _value.monthlyImpact
                : monthlyImpact // ignore: cast_nullable_to_non_nullable
                      as double,
            durationMonths: null == durationMonths
                ? _value.durationMonths
                : durationMonths // ignore: cast_nullable_to_non_nullable
                      as int,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
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
abstract class _$$LifeEventImplCopyWith<$Res>
    implements $LifeEventCopyWith<$Res> {
  factory _$$LifeEventImplCopyWith(
    _$LifeEventImpl value,
    $Res Function(_$LifeEventImpl) then,
  ) = __$$LifeEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    ScenarioType type,
    DateTime projectedDate,
    double financialImpact,
    double monthlyImpact,
    int durationMonths,
    double confidence,
    String? notes,
  });
}

/// @nodoc
class __$$LifeEventImplCopyWithImpl<$Res>
    extends _$LifeEventCopyWithImpl<$Res, _$LifeEventImpl>
    implements _$$LifeEventImplCopyWith<$Res> {
  __$$LifeEventImplCopyWithImpl(
    _$LifeEventImpl _value,
    $Res Function(_$LifeEventImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LifeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? projectedDate = null,
    Object? financialImpact = null,
    Object? monthlyImpact = null,
    Object? durationMonths = null,
    Object? confidence = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$LifeEventImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as ScenarioType,
        projectedDate: null == projectedDate
            ? _value.projectedDate
            : projectedDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        financialImpact: null == financialImpact
            ? _value.financialImpact
            : financialImpact // ignore: cast_nullable_to_non_nullable
                  as double,
        monthlyImpact: null == monthlyImpact
            ? _value.monthlyImpact
            : monthlyImpact // ignore: cast_nullable_to_non_nullable
                  as double,
        durationMonths: null == durationMonths
            ? _value.durationMonths
            : durationMonths // ignore: cast_nullable_to_non_nullable
                  as int,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
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
class _$LifeEventImpl implements _LifeEvent {
  const _$LifeEventImpl({
    required this.id,
    required this.name,
    required this.type,
    required this.projectedDate,
    required this.financialImpact,
    required this.monthlyImpact,
    required this.durationMonths,
    required this.confidence,
    this.notes,
  });

  factory _$LifeEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$LifeEventImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final ScenarioType type;
  @override
  final DateTime projectedDate;
  @override
  final double financialImpact;
  // positive or negative
  @override
  final double monthlyImpact;
  // ongoing monthly change
  @override
  final int durationMonths;
  // 0 for one-time
  @override
  final double confidence;
  // 0-100 how likely
  @override
  final String? notes;

  @override
  String toString() {
    return 'LifeEvent(id: $id, name: $name, type: $type, projectedDate: $projectedDate, financialImpact: $financialImpact, monthlyImpact: $monthlyImpact, durationMonths: $durationMonths, confidence: $confidence, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LifeEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.projectedDate, projectedDate) ||
                other.projectedDate == projectedDate) &&
            (identical(other.financialImpact, financialImpact) ||
                other.financialImpact == financialImpact) &&
            (identical(other.monthlyImpact, monthlyImpact) ||
                other.monthlyImpact == monthlyImpact) &&
            (identical(other.durationMonths, durationMonths) ||
                other.durationMonths == durationMonths) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    type,
    projectedDate,
    financialImpact,
    monthlyImpact,
    durationMonths,
    confidence,
    notes,
  );

  /// Create a copy of LifeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LifeEventImplCopyWith<_$LifeEventImpl> get copyWith =>
      __$$LifeEventImplCopyWithImpl<_$LifeEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LifeEventImplToJson(this);
  }
}

abstract class _LifeEvent implements LifeEvent {
  const factory _LifeEvent({
    required final String id,
    required final String name,
    required final ScenarioType type,
    required final DateTime projectedDate,
    required final double financialImpact,
    required final double monthlyImpact,
    required final int durationMonths,
    required final double confidence,
    final String? notes,
  }) = _$LifeEventImpl;

  factory _LifeEvent.fromJson(Map<String, dynamic> json) =
      _$LifeEventImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  ScenarioType get type;
  @override
  DateTime get projectedDate;
  @override
  double get financialImpact; // positive or negative
  @override
  double get monthlyImpact; // ongoing monthly change
  @override
  int get durationMonths; // 0 for one-time
  @override
  double get confidence; // 0-100 how likely
  @override
  String? get notes;

  /// Create a copy of LifeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LifeEventImplCopyWith<_$LifeEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TwinProjection _$TwinProjectionFromJson(Map<String, dynamic> json) {
  return _TwinProjection.fromJson(json);
}

/// @nodoc
mixin _$TwinProjection {
  String get id => throw _privateConstructorUsedError;
  int get yearsProjected => throw _privateConstructorUsedError;
  int get simulationRuns =>
      throw _privateConstructorUsedError; // typically 1000+
  List<ProjectionYear> get yearlyProjections =>
      throw _privateConstructorUsedError;
  ProjectionOutcome get bestCase =>
      throw _privateConstructorUsedError; // 95th percentile
  ProjectionOutcome get medianCase =>
      throw _privateConstructorUsedError; // 50th percentile
  ProjectionOutcome get worstCase =>
      throw _privateConstructorUsedError; // 5th percentile
  double get successProbability =>
      throw _privateConstructorUsedError; // % of simulations meeting goals
  double get ruinProbability =>
      throw _privateConstructorUsedError; // % of simulations going broke
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Serializes this TwinProjection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TwinProjection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TwinProjectionCopyWith<TwinProjection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TwinProjectionCopyWith<$Res> {
  factory $TwinProjectionCopyWith(
    TwinProjection value,
    $Res Function(TwinProjection) then,
  ) = _$TwinProjectionCopyWithImpl<$Res, TwinProjection>;
  @useResult
  $Res call({
    String id,
    int yearsProjected,
    int simulationRuns,
    List<ProjectionYear> yearlyProjections,
    ProjectionOutcome bestCase,
    ProjectionOutcome medianCase,
    ProjectionOutcome worstCase,
    double successProbability,
    double ruinProbability,
    DateTime generatedAt,
  });

  $ProjectionOutcomeCopyWith<$Res> get bestCase;
  $ProjectionOutcomeCopyWith<$Res> get medianCase;
  $ProjectionOutcomeCopyWith<$Res> get worstCase;
}

/// @nodoc
class _$TwinProjectionCopyWithImpl<$Res, $Val extends TwinProjection>
    implements $TwinProjectionCopyWith<$Res> {
  _$TwinProjectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TwinProjection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? yearsProjected = null,
    Object? simulationRuns = null,
    Object? yearlyProjections = null,
    Object? bestCase = null,
    Object? medianCase = null,
    Object? worstCase = null,
    Object? successProbability = null,
    Object? ruinProbability = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            yearsProjected: null == yearsProjected
                ? _value.yearsProjected
                : yearsProjected // ignore: cast_nullable_to_non_nullable
                      as int,
            simulationRuns: null == simulationRuns
                ? _value.simulationRuns
                : simulationRuns // ignore: cast_nullable_to_non_nullable
                      as int,
            yearlyProjections: null == yearlyProjections
                ? _value.yearlyProjections
                : yearlyProjections // ignore: cast_nullable_to_non_nullable
                      as List<ProjectionYear>,
            bestCase: null == bestCase
                ? _value.bestCase
                : bestCase // ignore: cast_nullable_to_non_nullable
                      as ProjectionOutcome,
            medianCase: null == medianCase
                ? _value.medianCase
                : medianCase // ignore: cast_nullable_to_non_nullable
                      as ProjectionOutcome,
            worstCase: null == worstCase
                ? _value.worstCase
                : worstCase // ignore: cast_nullable_to_non_nullable
                      as ProjectionOutcome,
            successProbability: null == successProbability
                ? _value.successProbability
                : successProbability // ignore: cast_nullable_to_non_nullable
                      as double,
            ruinProbability: null == ruinProbability
                ? _value.ruinProbability
                : ruinProbability // ignore: cast_nullable_to_non_nullable
                      as double,
            generatedAt: null == generatedAt
                ? _value.generatedAt
                : generatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of TwinProjection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectionOutcomeCopyWith<$Res> get bestCase {
    return $ProjectionOutcomeCopyWith<$Res>(_value.bestCase, (value) {
      return _then(_value.copyWith(bestCase: value) as $Val);
    });
  }

  /// Create a copy of TwinProjection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectionOutcomeCopyWith<$Res> get medianCase {
    return $ProjectionOutcomeCopyWith<$Res>(_value.medianCase, (value) {
      return _then(_value.copyWith(medianCase: value) as $Val);
    });
  }

  /// Create a copy of TwinProjection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectionOutcomeCopyWith<$Res> get worstCase {
    return $ProjectionOutcomeCopyWith<$Res>(_value.worstCase, (value) {
      return _then(_value.copyWith(worstCase: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TwinProjectionImplCopyWith<$Res>
    implements $TwinProjectionCopyWith<$Res> {
  factory _$$TwinProjectionImplCopyWith(
    _$TwinProjectionImpl value,
    $Res Function(_$TwinProjectionImpl) then,
  ) = __$$TwinProjectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    int yearsProjected,
    int simulationRuns,
    List<ProjectionYear> yearlyProjections,
    ProjectionOutcome bestCase,
    ProjectionOutcome medianCase,
    ProjectionOutcome worstCase,
    double successProbability,
    double ruinProbability,
    DateTime generatedAt,
  });

  @override
  $ProjectionOutcomeCopyWith<$Res> get bestCase;
  @override
  $ProjectionOutcomeCopyWith<$Res> get medianCase;
  @override
  $ProjectionOutcomeCopyWith<$Res> get worstCase;
}

/// @nodoc
class __$$TwinProjectionImplCopyWithImpl<$Res>
    extends _$TwinProjectionCopyWithImpl<$Res, _$TwinProjectionImpl>
    implements _$$TwinProjectionImplCopyWith<$Res> {
  __$$TwinProjectionImplCopyWithImpl(
    _$TwinProjectionImpl _value,
    $Res Function(_$TwinProjectionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TwinProjection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? yearsProjected = null,
    Object? simulationRuns = null,
    Object? yearlyProjections = null,
    Object? bestCase = null,
    Object? medianCase = null,
    Object? worstCase = null,
    Object? successProbability = null,
    Object? ruinProbability = null,
    Object? generatedAt = null,
  }) {
    return _then(
      _$TwinProjectionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        yearsProjected: null == yearsProjected
            ? _value.yearsProjected
            : yearsProjected // ignore: cast_nullable_to_non_nullable
                  as int,
        simulationRuns: null == simulationRuns
            ? _value.simulationRuns
            : simulationRuns // ignore: cast_nullable_to_non_nullable
                  as int,
        yearlyProjections: null == yearlyProjections
            ? _value._yearlyProjections
            : yearlyProjections // ignore: cast_nullable_to_non_nullable
                  as List<ProjectionYear>,
        bestCase: null == bestCase
            ? _value.bestCase
            : bestCase // ignore: cast_nullable_to_non_nullable
                  as ProjectionOutcome,
        medianCase: null == medianCase
            ? _value.medianCase
            : medianCase // ignore: cast_nullable_to_non_nullable
                  as ProjectionOutcome,
        worstCase: null == worstCase
            ? _value.worstCase
            : worstCase // ignore: cast_nullable_to_non_nullable
                  as ProjectionOutcome,
        successProbability: null == successProbability
            ? _value.successProbability
            : successProbability // ignore: cast_nullable_to_non_nullable
                  as double,
        ruinProbability: null == ruinProbability
            ? _value.ruinProbability
            : ruinProbability // ignore: cast_nullable_to_non_nullable
                  as double,
        generatedAt: null == generatedAt
            ? _value.generatedAt
            : generatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TwinProjectionImpl implements _TwinProjection {
  const _$TwinProjectionImpl({
    required this.id,
    required this.yearsProjected,
    required this.simulationRuns,
    required final List<ProjectionYear> yearlyProjections,
    required this.bestCase,
    required this.medianCase,
    required this.worstCase,
    required this.successProbability,
    required this.ruinProbability,
    required this.generatedAt,
  }) : _yearlyProjections = yearlyProjections;

  factory _$TwinProjectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TwinProjectionImplFromJson(json);

  @override
  final String id;
  @override
  final int yearsProjected;
  @override
  final int simulationRuns;
  // typically 1000+
  final List<ProjectionYear> _yearlyProjections;
  // typically 1000+
  @override
  List<ProjectionYear> get yearlyProjections {
    if (_yearlyProjections is EqualUnmodifiableListView)
      return _yearlyProjections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_yearlyProjections);
  }

  @override
  final ProjectionOutcome bestCase;
  // 95th percentile
  @override
  final ProjectionOutcome medianCase;
  // 50th percentile
  @override
  final ProjectionOutcome worstCase;
  // 5th percentile
  @override
  final double successProbability;
  // % of simulations meeting goals
  @override
  final double ruinProbability;
  // % of simulations going broke
  @override
  final DateTime generatedAt;

  @override
  String toString() {
    return 'TwinProjection(id: $id, yearsProjected: $yearsProjected, simulationRuns: $simulationRuns, yearlyProjections: $yearlyProjections, bestCase: $bestCase, medianCase: $medianCase, worstCase: $worstCase, successProbability: $successProbability, ruinProbability: $ruinProbability, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TwinProjectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.yearsProjected, yearsProjected) ||
                other.yearsProjected == yearsProjected) &&
            (identical(other.simulationRuns, simulationRuns) ||
                other.simulationRuns == simulationRuns) &&
            const DeepCollectionEquality().equals(
              other._yearlyProjections,
              _yearlyProjections,
            ) &&
            (identical(other.bestCase, bestCase) ||
                other.bestCase == bestCase) &&
            (identical(other.medianCase, medianCase) ||
                other.medianCase == medianCase) &&
            (identical(other.worstCase, worstCase) ||
                other.worstCase == worstCase) &&
            (identical(other.successProbability, successProbability) ||
                other.successProbability == successProbability) &&
            (identical(other.ruinProbability, ruinProbability) ||
                other.ruinProbability == ruinProbability) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    yearsProjected,
    simulationRuns,
    const DeepCollectionEquality().hash(_yearlyProjections),
    bestCase,
    medianCase,
    worstCase,
    successProbability,
    ruinProbability,
    generatedAt,
  );

  /// Create a copy of TwinProjection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TwinProjectionImplCopyWith<_$TwinProjectionImpl> get copyWith =>
      __$$TwinProjectionImplCopyWithImpl<_$TwinProjectionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TwinProjectionImplToJson(this);
  }
}

abstract class _TwinProjection implements TwinProjection {
  const factory _TwinProjection({
    required final String id,
    required final int yearsProjected,
    required final int simulationRuns,
    required final List<ProjectionYear> yearlyProjections,
    required final ProjectionOutcome bestCase,
    required final ProjectionOutcome medianCase,
    required final ProjectionOutcome worstCase,
    required final double successProbability,
    required final double ruinProbability,
    required final DateTime generatedAt,
  }) = _$TwinProjectionImpl;

  factory _TwinProjection.fromJson(Map<String, dynamic> json) =
      _$TwinProjectionImpl.fromJson;

  @override
  String get id;
  @override
  int get yearsProjected;
  @override
  int get simulationRuns; // typically 1000+
  @override
  List<ProjectionYear> get yearlyProjections;
  @override
  ProjectionOutcome get bestCase; // 95th percentile
  @override
  ProjectionOutcome get medianCase; // 50th percentile
  @override
  ProjectionOutcome get worstCase; // 5th percentile
  @override
  double get successProbability; // % of simulations meeting goals
  @override
  double get ruinProbability; // % of simulations going broke
  @override
  DateTime get generatedAt;

  /// Create a copy of TwinProjection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TwinProjectionImplCopyWith<_$TwinProjectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectionYear _$ProjectionYearFromJson(Map<String, dynamic> json) {
  return _ProjectionYear.fromJson(json);
}

/// @nodoc
mixin _$ProjectionYear {
  int get year => throw _privateConstructorUsedError;
  double get medianNetWorth => throw _privateConstructorUsedError;
  double get lowNetWorth =>
      throw _privateConstructorUsedError; // 10th percentile
  double get highNetWorth =>
      throw _privateConstructorUsedError; // 90th percentile
  double get medianIncome => throw _privateConstructorUsedError;
  double get medianExpenses => throw _privateConstructorUsedError;
  double get medianSavings => throw _privateConstructorUsedError;
  List<String> get projectedEvents => throw _privateConstructorUsedError;

  /// Serializes this ProjectionYear to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectionYear
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectionYearCopyWith<ProjectionYear> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectionYearCopyWith<$Res> {
  factory $ProjectionYearCopyWith(
    ProjectionYear value,
    $Res Function(ProjectionYear) then,
  ) = _$ProjectionYearCopyWithImpl<$Res, ProjectionYear>;
  @useResult
  $Res call({
    int year,
    double medianNetWorth,
    double lowNetWorth,
    double highNetWorth,
    double medianIncome,
    double medianExpenses,
    double medianSavings,
    List<String> projectedEvents,
  });
}

/// @nodoc
class _$ProjectionYearCopyWithImpl<$Res, $Val extends ProjectionYear>
    implements $ProjectionYearCopyWith<$Res> {
  _$ProjectionYearCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectionYear
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? medianNetWorth = null,
    Object? lowNetWorth = null,
    Object? highNetWorth = null,
    Object? medianIncome = null,
    Object? medianExpenses = null,
    Object? medianSavings = null,
    Object? projectedEvents = null,
  }) {
    return _then(
      _value.copyWith(
            year: null == year
                ? _value.year
                : year // ignore: cast_nullable_to_non_nullable
                      as int,
            medianNetWorth: null == medianNetWorth
                ? _value.medianNetWorth
                : medianNetWorth // ignore: cast_nullable_to_non_nullable
                      as double,
            lowNetWorth: null == lowNetWorth
                ? _value.lowNetWorth
                : lowNetWorth // ignore: cast_nullable_to_non_nullable
                      as double,
            highNetWorth: null == highNetWorth
                ? _value.highNetWorth
                : highNetWorth // ignore: cast_nullable_to_non_nullable
                      as double,
            medianIncome: null == medianIncome
                ? _value.medianIncome
                : medianIncome // ignore: cast_nullable_to_non_nullable
                      as double,
            medianExpenses: null == medianExpenses
                ? _value.medianExpenses
                : medianExpenses // ignore: cast_nullable_to_non_nullable
                      as double,
            medianSavings: null == medianSavings
                ? _value.medianSavings
                : medianSavings // ignore: cast_nullable_to_non_nullable
                      as double,
            projectedEvents: null == projectedEvents
                ? _value.projectedEvents
                : projectedEvents // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectionYearImplCopyWith<$Res>
    implements $ProjectionYearCopyWith<$Res> {
  factory _$$ProjectionYearImplCopyWith(
    _$ProjectionYearImpl value,
    $Res Function(_$ProjectionYearImpl) then,
  ) = __$$ProjectionYearImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int year,
    double medianNetWorth,
    double lowNetWorth,
    double highNetWorth,
    double medianIncome,
    double medianExpenses,
    double medianSavings,
    List<String> projectedEvents,
  });
}

/// @nodoc
class __$$ProjectionYearImplCopyWithImpl<$Res>
    extends _$ProjectionYearCopyWithImpl<$Res, _$ProjectionYearImpl>
    implements _$$ProjectionYearImplCopyWith<$Res> {
  __$$ProjectionYearImplCopyWithImpl(
    _$ProjectionYearImpl _value,
    $Res Function(_$ProjectionYearImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectionYear
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? medianNetWorth = null,
    Object? lowNetWorth = null,
    Object? highNetWorth = null,
    Object? medianIncome = null,
    Object? medianExpenses = null,
    Object? medianSavings = null,
    Object? projectedEvents = null,
  }) {
    return _then(
      _$ProjectionYearImpl(
        year: null == year
            ? _value.year
            : year // ignore: cast_nullable_to_non_nullable
                  as int,
        medianNetWorth: null == medianNetWorth
            ? _value.medianNetWorth
            : medianNetWorth // ignore: cast_nullable_to_non_nullable
                  as double,
        lowNetWorth: null == lowNetWorth
            ? _value.lowNetWorth
            : lowNetWorth // ignore: cast_nullable_to_non_nullable
                  as double,
        highNetWorth: null == highNetWorth
            ? _value.highNetWorth
            : highNetWorth // ignore: cast_nullable_to_non_nullable
                  as double,
        medianIncome: null == medianIncome
            ? _value.medianIncome
            : medianIncome // ignore: cast_nullable_to_non_nullable
                  as double,
        medianExpenses: null == medianExpenses
            ? _value.medianExpenses
            : medianExpenses // ignore: cast_nullable_to_non_nullable
                  as double,
        medianSavings: null == medianSavings
            ? _value.medianSavings
            : medianSavings // ignore: cast_nullable_to_non_nullable
                  as double,
        projectedEvents: null == projectedEvents
            ? _value._projectedEvents
            : projectedEvents // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectionYearImpl implements _ProjectionYear {
  const _$ProjectionYearImpl({
    required this.year,
    required this.medianNetWorth,
    required this.lowNetWorth,
    required this.highNetWorth,
    required this.medianIncome,
    required this.medianExpenses,
    required this.medianSavings,
    required final List<String> projectedEvents,
  }) : _projectedEvents = projectedEvents;

  factory _$ProjectionYearImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectionYearImplFromJson(json);

  @override
  final int year;
  @override
  final double medianNetWorth;
  @override
  final double lowNetWorth;
  // 10th percentile
  @override
  final double highNetWorth;
  // 90th percentile
  @override
  final double medianIncome;
  @override
  final double medianExpenses;
  @override
  final double medianSavings;
  final List<String> _projectedEvents;
  @override
  List<String> get projectedEvents {
    if (_projectedEvents is EqualUnmodifiableListView) return _projectedEvents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectedEvents);
  }

  @override
  String toString() {
    return 'ProjectionYear(year: $year, medianNetWorth: $medianNetWorth, lowNetWorth: $lowNetWorth, highNetWorth: $highNetWorth, medianIncome: $medianIncome, medianExpenses: $medianExpenses, medianSavings: $medianSavings, projectedEvents: $projectedEvents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectionYearImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.medianNetWorth, medianNetWorth) ||
                other.medianNetWorth == medianNetWorth) &&
            (identical(other.lowNetWorth, lowNetWorth) ||
                other.lowNetWorth == lowNetWorth) &&
            (identical(other.highNetWorth, highNetWorth) ||
                other.highNetWorth == highNetWorth) &&
            (identical(other.medianIncome, medianIncome) ||
                other.medianIncome == medianIncome) &&
            (identical(other.medianExpenses, medianExpenses) ||
                other.medianExpenses == medianExpenses) &&
            (identical(other.medianSavings, medianSavings) ||
                other.medianSavings == medianSavings) &&
            const DeepCollectionEquality().equals(
              other._projectedEvents,
              _projectedEvents,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    year,
    medianNetWorth,
    lowNetWorth,
    highNetWorth,
    medianIncome,
    medianExpenses,
    medianSavings,
    const DeepCollectionEquality().hash(_projectedEvents),
  );

  /// Create a copy of ProjectionYear
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectionYearImplCopyWith<_$ProjectionYearImpl> get copyWith =>
      __$$ProjectionYearImplCopyWithImpl<_$ProjectionYearImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectionYearImplToJson(this);
  }
}

abstract class _ProjectionYear implements ProjectionYear {
  const factory _ProjectionYear({
    required final int year,
    required final double medianNetWorth,
    required final double lowNetWorth,
    required final double highNetWorth,
    required final double medianIncome,
    required final double medianExpenses,
    required final double medianSavings,
    required final List<String> projectedEvents,
  }) = _$ProjectionYearImpl;

  factory _ProjectionYear.fromJson(Map<String, dynamic> json) =
      _$ProjectionYearImpl.fromJson;

  @override
  int get year;
  @override
  double get medianNetWorth;
  @override
  double get lowNetWorth; // 10th percentile
  @override
  double get highNetWorth; // 90th percentile
  @override
  double get medianIncome;
  @override
  double get medianExpenses;
  @override
  double get medianSavings;
  @override
  List<String> get projectedEvents;

  /// Create a copy of ProjectionYear
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectionYearImplCopyWith<_$ProjectionYearImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProjectionOutcome _$ProjectionOutcomeFromJson(Map<String, dynamic> json) {
  return _ProjectionOutcome.fromJson(json);
}

/// @nodoc
mixin _$ProjectionOutcome {
  double get finalNetWorth => throw _privateConstructorUsedError;
  double get totalEarnings => throw _privateConstructorUsedError;
  double get totalSpending => throw _privateConstructorUsedError;
  double get totalSaved => throw _privateConstructorUsedError;
  double get investmentReturns => throw _privateConstructorUsedError;
  int get retirementAge => throw _privateConstructorUsedError;
  bool get achievedGoals => throw _privateConstructorUsedError;
  List<String> get keyMilestones => throw _privateConstructorUsedError;

  /// Serializes this ProjectionOutcome to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectionOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectionOutcomeCopyWith<ProjectionOutcome> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectionOutcomeCopyWith<$Res> {
  factory $ProjectionOutcomeCopyWith(
    ProjectionOutcome value,
    $Res Function(ProjectionOutcome) then,
  ) = _$ProjectionOutcomeCopyWithImpl<$Res, ProjectionOutcome>;
  @useResult
  $Res call({
    double finalNetWorth,
    double totalEarnings,
    double totalSpending,
    double totalSaved,
    double investmentReturns,
    int retirementAge,
    bool achievedGoals,
    List<String> keyMilestones,
  });
}

/// @nodoc
class _$ProjectionOutcomeCopyWithImpl<$Res, $Val extends ProjectionOutcome>
    implements $ProjectionOutcomeCopyWith<$Res> {
  _$ProjectionOutcomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectionOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? finalNetWorth = null,
    Object? totalEarnings = null,
    Object? totalSpending = null,
    Object? totalSaved = null,
    Object? investmentReturns = null,
    Object? retirementAge = null,
    Object? achievedGoals = null,
    Object? keyMilestones = null,
  }) {
    return _then(
      _value.copyWith(
            finalNetWorth: null == finalNetWorth
                ? _value.finalNetWorth
                : finalNetWorth // ignore: cast_nullable_to_non_nullable
                      as double,
            totalEarnings: null == totalEarnings
                ? _value.totalEarnings
                : totalEarnings // ignore: cast_nullable_to_non_nullable
                      as double,
            totalSpending: null == totalSpending
                ? _value.totalSpending
                : totalSpending // ignore: cast_nullable_to_non_nullable
                      as double,
            totalSaved: null == totalSaved
                ? _value.totalSaved
                : totalSaved // ignore: cast_nullable_to_non_nullable
                      as double,
            investmentReturns: null == investmentReturns
                ? _value.investmentReturns
                : investmentReturns // ignore: cast_nullable_to_non_nullable
                      as double,
            retirementAge: null == retirementAge
                ? _value.retirementAge
                : retirementAge // ignore: cast_nullable_to_non_nullable
                      as int,
            achievedGoals: null == achievedGoals
                ? _value.achievedGoals
                : achievedGoals // ignore: cast_nullable_to_non_nullable
                      as bool,
            keyMilestones: null == keyMilestones
                ? _value.keyMilestones
                : keyMilestones // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectionOutcomeImplCopyWith<$Res>
    implements $ProjectionOutcomeCopyWith<$Res> {
  factory _$$ProjectionOutcomeImplCopyWith(
    _$ProjectionOutcomeImpl value,
    $Res Function(_$ProjectionOutcomeImpl) then,
  ) = __$$ProjectionOutcomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double finalNetWorth,
    double totalEarnings,
    double totalSpending,
    double totalSaved,
    double investmentReturns,
    int retirementAge,
    bool achievedGoals,
    List<String> keyMilestones,
  });
}

/// @nodoc
class __$$ProjectionOutcomeImplCopyWithImpl<$Res>
    extends _$ProjectionOutcomeCopyWithImpl<$Res, _$ProjectionOutcomeImpl>
    implements _$$ProjectionOutcomeImplCopyWith<$Res> {
  __$$ProjectionOutcomeImplCopyWithImpl(
    _$ProjectionOutcomeImpl _value,
    $Res Function(_$ProjectionOutcomeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectionOutcome
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? finalNetWorth = null,
    Object? totalEarnings = null,
    Object? totalSpending = null,
    Object? totalSaved = null,
    Object? investmentReturns = null,
    Object? retirementAge = null,
    Object? achievedGoals = null,
    Object? keyMilestones = null,
  }) {
    return _then(
      _$ProjectionOutcomeImpl(
        finalNetWorth: null == finalNetWorth
            ? _value.finalNetWorth
            : finalNetWorth // ignore: cast_nullable_to_non_nullable
                  as double,
        totalEarnings: null == totalEarnings
            ? _value.totalEarnings
            : totalEarnings // ignore: cast_nullable_to_non_nullable
                  as double,
        totalSpending: null == totalSpending
            ? _value.totalSpending
            : totalSpending // ignore: cast_nullable_to_non_nullable
                  as double,
        totalSaved: null == totalSaved
            ? _value.totalSaved
            : totalSaved // ignore: cast_nullable_to_non_nullable
                  as double,
        investmentReturns: null == investmentReturns
            ? _value.investmentReturns
            : investmentReturns // ignore: cast_nullable_to_non_nullable
                  as double,
        retirementAge: null == retirementAge
            ? _value.retirementAge
            : retirementAge // ignore: cast_nullable_to_non_nullable
                  as int,
        achievedGoals: null == achievedGoals
            ? _value.achievedGoals
            : achievedGoals // ignore: cast_nullable_to_non_nullable
                  as bool,
        keyMilestones: null == keyMilestones
            ? _value._keyMilestones
            : keyMilestones // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectionOutcomeImpl implements _ProjectionOutcome {
  const _$ProjectionOutcomeImpl({
    required this.finalNetWorth,
    required this.totalEarnings,
    required this.totalSpending,
    required this.totalSaved,
    required this.investmentReturns,
    required this.retirementAge,
    required this.achievedGoals,
    required final List<String> keyMilestones,
  }) : _keyMilestones = keyMilestones;

  factory _$ProjectionOutcomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectionOutcomeImplFromJson(json);

  @override
  final double finalNetWorth;
  @override
  final double totalEarnings;
  @override
  final double totalSpending;
  @override
  final double totalSaved;
  @override
  final double investmentReturns;
  @override
  final int retirementAge;
  @override
  final bool achievedGoals;
  final List<String> _keyMilestones;
  @override
  List<String> get keyMilestones {
    if (_keyMilestones is EqualUnmodifiableListView) return _keyMilestones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyMilestones);
  }

  @override
  String toString() {
    return 'ProjectionOutcome(finalNetWorth: $finalNetWorth, totalEarnings: $totalEarnings, totalSpending: $totalSpending, totalSaved: $totalSaved, investmentReturns: $investmentReturns, retirementAge: $retirementAge, achievedGoals: $achievedGoals, keyMilestones: $keyMilestones)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectionOutcomeImpl &&
            (identical(other.finalNetWorth, finalNetWorth) ||
                other.finalNetWorth == finalNetWorth) &&
            (identical(other.totalEarnings, totalEarnings) ||
                other.totalEarnings == totalEarnings) &&
            (identical(other.totalSpending, totalSpending) ||
                other.totalSpending == totalSpending) &&
            (identical(other.totalSaved, totalSaved) ||
                other.totalSaved == totalSaved) &&
            (identical(other.investmentReturns, investmentReturns) ||
                other.investmentReturns == investmentReturns) &&
            (identical(other.retirementAge, retirementAge) ||
                other.retirementAge == retirementAge) &&
            (identical(other.achievedGoals, achievedGoals) ||
                other.achievedGoals == achievedGoals) &&
            const DeepCollectionEquality().equals(
              other._keyMilestones,
              _keyMilestones,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    finalNetWorth,
    totalEarnings,
    totalSpending,
    totalSaved,
    investmentReturns,
    retirementAge,
    achievedGoals,
    const DeepCollectionEquality().hash(_keyMilestones),
  );

  /// Create a copy of ProjectionOutcome
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectionOutcomeImplCopyWith<_$ProjectionOutcomeImpl> get copyWith =>
      __$$ProjectionOutcomeImplCopyWithImpl<_$ProjectionOutcomeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectionOutcomeImplToJson(this);
  }
}

abstract class _ProjectionOutcome implements ProjectionOutcome {
  const factory _ProjectionOutcome({
    required final double finalNetWorth,
    required final double totalEarnings,
    required final double totalSpending,
    required final double totalSaved,
    required final double investmentReturns,
    required final int retirementAge,
    required final bool achievedGoals,
    required final List<String> keyMilestones,
  }) = _$ProjectionOutcomeImpl;

  factory _ProjectionOutcome.fromJson(Map<String, dynamic> json) =
      _$ProjectionOutcomeImpl.fromJson;

  @override
  double get finalNetWorth;
  @override
  double get totalEarnings;
  @override
  double get totalSpending;
  @override
  double get totalSaved;
  @override
  double get investmentReturns;
  @override
  int get retirementAge;
  @override
  bool get achievedGoals;
  @override
  List<String> get keyMilestones;

  /// Create a copy of ProjectionOutcome
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectionOutcomeImplCopyWith<_$ProjectionOutcomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ScenarioComparison _$ScenarioComparisonFromJson(Map<String, dynamic> json) {
  return _ScenarioComparison.fromJson(json);
}

/// @nodoc
mixin _$ScenarioComparison {
  String get scenario1Id => throw _privateConstructorUsedError;
  String get scenario2Id => throw _privateConstructorUsedError;
  double get netWorthDifference => throw _privateConstructorUsedError;
  double get retirementAgeDifference => throw _privateConstructorUsedError;
  double get successProbabilityDifference => throw _privateConstructorUsedError;
  List<String> get keyDifferences => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;

  /// Serializes this ScenarioComparison to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScenarioComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScenarioComparisonCopyWith<ScenarioComparison> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScenarioComparisonCopyWith<$Res> {
  factory $ScenarioComparisonCopyWith(
    ScenarioComparison value,
    $Res Function(ScenarioComparison) then,
  ) = _$ScenarioComparisonCopyWithImpl<$Res, ScenarioComparison>;
  @useResult
  $Res call({
    String scenario1Id,
    String scenario2Id,
    double netWorthDifference,
    double retirementAgeDifference,
    double successProbabilityDifference,
    List<String> keyDifferences,
    String recommendation,
  });
}

/// @nodoc
class _$ScenarioComparisonCopyWithImpl<$Res, $Val extends ScenarioComparison>
    implements $ScenarioComparisonCopyWith<$Res> {
  _$ScenarioComparisonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScenarioComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scenario1Id = null,
    Object? scenario2Id = null,
    Object? netWorthDifference = null,
    Object? retirementAgeDifference = null,
    Object? successProbabilityDifference = null,
    Object? keyDifferences = null,
    Object? recommendation = null,
  }) {
    return _then(
      _value.copyWith(
            scenario1Id: null == scenario1Id
                ? _value.scenario1Id
                : scenario1Id // ignore: cast_nullable_to_non_nullable
                      as String,
            scenario2Id: null == scenario2Id
                ? _value.scenario2Id
                : scenario2Id // ignore: cast_nullable_to_non_nullable
                      as String,
            netWorthDifference: null == netWorthDifference
                ? _value.netWorthDifference
                : netWorthDifference // ignore: cast_nullable_to_non_nullable
                      as double,
            retirementAgeDifference: null == retirementAgeDifference
                ? _value.retirementAgeDifference
                : retirementAgeDifference // ignore: cast_nullable_to_non_nullable
                      as double,
            successProbabilityDifference: null == successProbabilityDifference
                ? _value.successProbabilityDifference
                : successProbabilityDifference // ignore: cast_nullable_to_non_nullable
                      as double,
            keyDifferences: null == keyDifferences
                ? _value.keyDifferences
                : keyDifferences // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            recommendation: null == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScenarioComparisonImplCopyWith<$Res>
    implements $ScenarioComparisonCopyWith<$Res> {
  factory _$$ScenarioComparisonImplCopyWith(
    _$ScenarioComparisonImpl value,
    $Res Function(_$ScenarioComparisonImpl) then,
  ) = __$$ScenarioComparisonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String scenario1Id,
    String scenario2Id,
    double netWorthDifference,
    double retirementAgeDifference,
    double successProbabilityDifference,
    List<String> keyDifferences,
    String recommendation,
  });
}

/// @nodoc
class __$$ScenarioComparisonImplCopyWithImpl<$Res>
    extends _$ScenarioComparisonCopyWithImpl<$Res, _$ScenarioComparisonImpl>
    implements _$$ScenarioComparisonImplCopyWith<$Res> {
  __$$ScenarioComparisonImplCopyWithImpl(
    _$ScenarioComparisonImpl _value,
    $Res Function(_$ScenarioComparisonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScenarioComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scenario1Id = null,
    Object? scenario2Id = null,
    Object? netWorthDifference = null,
    Object? retirementAgeDifference = null,
    Object? successProbabilityDifference = null,
    Object? keyDifferences = null,
    Object? recommendation = null,
  }) {
    return _then(
      _$ScenarioComparisonImpl(
        scenario1Id: null == scenario1Id
            ? _value.scenario1Id
            : scenario1Id // ignore: cast_nullable_to_non_nullable
                  as String,
        scenario2Id: null == scenario2Id
            ? _value.scenario2Id
            : scenario2Id // ignore: cast_nullable_to_non_nullable
                  as String,
        netWorthDifference: null == netWorthDifference
            ? _value.netWorthDifference
            : netWorthDifference // ignore: cast_nullable_to_non_nullable
                  as double,
        retirementAgeDifference: null == retirementAgeDifference
            ? _value.retirementAgeDifference
            : retirementAgeDifference // ignore: cast_nullable_to_non_nullable
                  as double,
        successProbabilityDifference: null == successProbabilityDifference
            ? _value.successProbabilityDifference
            : successProbabilityDifference // ignore: cast_nullable_to_non_nullable
                  as double,
        keyDifferences: null == keyDifferences
            ? _value._keyDifferences
            : keyDifferences // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        recommendation: null == recommendation
            ? _value.recommendation
            : recommendation // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScenarioComparisonImpl implements _ScenarioComparison {
  const _$ScenarioComparisonImpl({
    required this.scenario1Id,
    required this.scenario2Id,
    required this.netWorthDifference,
    required this.retirementAgeDifference,
    required this.successProbabilityDifference,
    required final List<String> keyDifferences,
    required this.recommendation,
  }) : _keyDifferences = keyDifferences;

  factory _$ScenarioComparisonImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScenarioComparisonImplFromJson(json);

  @override
  final String scenario1Id;
  @override
  final String scenario2Id;
  @override
  final double netWorthDifference;
  @override
  final double retirementAgeDifference;
  @override
  final double successProbabilityDifference;
  final List<String> _keyDifferences;
  @override
  List<String> get keyDifferences {
    if (_keyDifferences is EqualUnmodifiableListView) return _keyDifferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyDifferences);
  }

  @override
  final String recommendation;

  @override
  String toString() {
    return 'ScenarioComparison(scenario1Id: $scenario1Id, scenario2Id: $scenario2Id, netWorthDifference: $netWorthDifference, retirementAgeDifference: $retirementAgeDifference, successProbabilityDifference: $successProbabilityDifference, keyDifferences: $keyDifferences, recommendation: $recommendation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScenarioComparisonImpl &&
            (identical(other.scenario1Id, scenario1Id) ||
                other.scenario1Id == scenario1Id) &&
            (identical(other.scenario2Id, scenario2Id) ||
                other.scenario2Id == scenario2Id) &&
            (identical(other.netWorthDifference, netWorthDifference) ||
                other.netWorthDifference == netWorthDifference) &&
            (identical(
                  other.retirementAgeDifference,
                  retirementAgeDifference,
                ) ||
                other.retirementAgeDifference == retirementAgeDifference) &&
            (identical(
                  other.successProbabilityDifference,
                  successProbabilityDifference,
                ) ||
                other.successProbabilityDifference ==
                    successProbabilityDifference) &&
            const DeepCollectionEquality().equals(
              other._keyDifferences,
              _keyDifferences,
            ) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    scenario1Id,
    scenario2Id,
    netWorthDifference,
    retirementAgeDifference,
    successProbabilityDifference,
    const DeepCollectionEquality().hash(_keyDifferences),
    recommendation,
  );

  /// Create a copy of ScenarioComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScenarioComparisonImplCopyWith<_$ScenarioComparisonImpl> get copyWith =>
      __$$ScenarioComparisonImplCopyWithImpl<_$ScenarioComparisonImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ScenarioComparisonImplToJson(this);
  }
}

abstract class _ScenarioComparison implements ScenarioComparison {
  const factory _ScenarioComparison({
    required final String scenario1Id,
    required final String scenario2Id,
    required final double netWorthDifference,
    required final double retirementAgeDifference,
    required final double successProbabilityDifference,
    required final List<String> keyDifferences,
    required final String recommendation,
  }) = _$ScenarioComparisonImpl;

  factory _ScenarioComparison.fromJson(Map<String, dynamic> json) =
      _$ScenarioComparisonImpl.fromJson;

  @override
  String get scenario1Id;
  @override
  String get scenario2Id;
  @override
  double get netWorthDifference;
  @override
  double get retirementAgeDifference;
  @override
  double get successProbabilityDifference;
  @override
  List<String> get keyDifferences;
  @override
  String get recommendation;

  /// Create a copy of ScenarioComparison
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScenarioComparisonImplCopyWith<_$ScenarioComparisonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
