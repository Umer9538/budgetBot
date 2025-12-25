// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'carbon_wallet_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CarbonWallet _$CarbonWalletFromJson(Map<String, dynamic> json) {
  return _CarbonWallet.fromJson(json);
}

/// @nodoc
mixin _$CarbonWallet {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get periodStart => throw _privateConstructorUsedError;
  DateTime get periodEnd => throw _privateConstructorUsedError;
  double get totalCarbonKg => throw _privateConstructorUsedError;
  double get offsetCarbonKg => throw _privateConstructorUsedError;
  double get netCarbonKg => throw _privateConstructorUsedError;
  CarbonImpactLevel get impactLevel => throw _privateConstructorUsedError;
  Map<String, double> get categoryBreakdown =>
      throw _privateConstructorUsedError; // category -> kg CO2
  List<CarbonTransaction> get topEmitters => throw _privateConstructorUsedError;
  double get comparedToAverage =>
      throw _privateConstructorUsedError; // percentage vs average user
  List<String> get recommendations => throw _privateConstructorUsedError;
  List<CarbonGoal> get goals => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CarbonWallet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarbonWallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarbonWalletCopyWith<CarbonWallet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarbonWalletCopyWith<$Res> {
  factory $CarbonWalletCopyWith(
    CarbonWallet value,
    $Res Function(CarbonWallet) then,
  ) = _$CarbonWalletCopyWithImpl<$Res, CarbonWallet>;
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime periodStart,
    DateTime periodEnd,
    double totalCarbonKg,
    double offsetCarbonKg,
    double netCarbonKg,
    CarbonImpactLevel impactLevel,
    Map<String, double> categoryBreakdown,
    List<CarbonTransaction> topEmitters,
    double comparedToAverage,
    List<String> recommendations,
    List<CarbonGoal> goals,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$CarbonWalletCopyWithImpl<$Res, $Val extends CarbonWallet>
    implements $CarbonWalletCopyWith<$Res> {
  _$CarbonWalletCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarbonWallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? totalCarbonKg = null,
    Object? offsetCarbonKg = null,
    Object? netCarbonKg = null,
    Object? impactLevel = null,
    Object? categoryBreakdown = null,
    Object? topEmitters = null,
    Object? comparedToAverage = null,
    Object? recommendations = null,
    Object? goals = null,
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
            periodStart: null == periodStart
                ? _value.periodStart
                : periodStart // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            periodEnd: null == periodEnd
                ? _value.periodEnd
                : periodEnd // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            totalCarbonKg: null == totalCarbonKg
                ? _value.totalCarbonKg
                : totalCarbonKg // ignore: cast_nullable_to_non_nullable
                      as double,
            offsetCarbonKg: null == offsetCarbonKg
                ? _value.offsetCarbonKg
                : offsetCarbonKg // ignore: cast_nullable_to_non_nullable
                      as double,
            netCarbonKg: null == netCarbonKg
                ? _value.netCarbonKg
                : netCarbonKg // ignore: cast_nullable_to_non_nullable
                      as double,
            impactLevel: null == impactLevel
                ? _value.impactLevel
                : impactLevel // ignore: cast_nullable_to_non_nullable
                      as CarbonImpactLevel,
            categoryBreakdown: null == categoryBreakdown
                ? _value.categoryBreakdown
                : categoryBreakdown // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            topEmitters: null == topEmitters
                ? _value.topEmitters
                : topEmitters // ignore: cast_nullable_to_non_nullable
                      as List<CarbonTransaction>,
            comparedToAverage: null == comparedToAverage
                ? _value.comparedToAverage
                : comparedToAverage // ignore: cast_nullable_to_non_nullable
                      as double,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            goals: null == goals
                ? _value.goals
                : goals // ignore: cast_nullable_to_non_nullable
                      as List<CarbonGoal>,
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
abstract class _$$CarbonWalletImplCopyWith<$Res>
    implements $CarbonWalletCopyWith<$Res> {
  factory _$$CarbonWalletImplCopyWith(
    _$CarbonWalletImpl value,
    $Res Function(_$CarbonWalletImpl) then,
  ) = __$$CarbonWalletImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime periodStart,
    DateTime periodEnd,
    double totalCarbonKg,
    double offsetCarbonKg,
    double netCarbonKg,
    CarbonImpactLevel impactLevel,
    Map<String, double> categoryBreakdown,
    List<CarbonTransaction> topEmitters,
    double comparedToAverage,
    List<String> recommendations,
    List<CarbonGoal> goals,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$CarbonWalletImplCopyWithImpl<$Res>
    extends _$CarbonWalletCopyWithImpl<$Res, _$CarbonWalletImpl>
    implements _$$CarbonWalletImplCopyWith<$Res> {
  __$$CarbonWalletImplCopyWithImpl(
    _$CarbonWalletImpl _value,
    $Res Function(_$CarbonWalletImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CarbonWallet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? totalCarbonKg = null,
    Object? offsetCarbonKg = null,
    Object? netCarbonKg = null,
    Object? impactLevel = null,
    Object? categoryBreakdown = null,
    Object? topEmitters = null,
    Object? comparedToAverage = null,
    Object? recommendations = null,
    Object? goals = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$CarbonWalletImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        periodStart: null == periodStart
            ? _value.periodStart
            : periodStart // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        periodEnd: null == periodEnd
            ? _value.periodEnd
            : periodEnd // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        totalCarbonKg: null == totalCarbonKg
            ? _value.totalCarbonKg
            : totalCarbonKg // ignore: cast_nullable_to_non_nullable
                  as double,
        offsetCarbonKg: null == offsetCarbonKg
            ? _value.offsetCarbonKg
            : offsetCarbonKg // ignore: cast_nullable_to_non_nullable
                  as double,
        netCarbonKg: null == netCarbonKg
            ? _value.netCarbonKg
            : netCarbonKg // ignore: cast_nullable_to_non_nullable
                  as double,
        impactLevel: null == impactLevel
            ? _value.impactLevel
            : impactLevel // ignore: cast_nullable_to_non_nullable
                  as CarbonImpactLevel,
        categoryBreakdown: null == categoryBreakdown
            ? _value._categoryBreakdown
            : categoryBreakdown // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        topEmitters: null == topEmitters
            ? _value._topEmitters
            : topEmitters // ignore: cast_nullable_to_non_nullable
                  as List<CarbonTransaction>,
        comparedToAverage: null == comparedToAverage
            ? _value.comparedToAverage
            : comparedToAverage // ignore: cast_nullable_to_non_nullable
                  as double,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        goals: null == goals
            ? _value._goals
            : goals // ignore: cast_nullable_to_non_nullable
                  as List<CarbonGoal>,
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
class _$CarbonWalletImpl implements _CarbonWallet {
  const _$CarbonWalletImpl({
    required this.id,
    required this.userId,
    required this.periodStart,
    required this.periodEnd,
    required this.totalCarbonKg,
    required this.offsetCarbonKg,
    required this.netCarbonKg,
    required this.impactLevel,
    required final Map<String, double> categoryBreakdown,
    required final List<CarbonTransaction> topEmitters,
    required this.comparedToAverage,
    final List<String> recommendations = const [],
    final List<CarbonGoal> goals = const [],
    this.createdAt,
  }) : _categoryBreakdown = categoryBreakdown,
       _topEmitters = topEmitters,
       _recommendations = recommendations,
       _goals = goals;

  factory _$CarbonWalletImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarbonWalletImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime periodStart;
  @override
  final DateTime periodEnd;
  @override
  final double totalCarbonKg;
  @override
  final double offsetCarbonKg;
  @override
  final double netCarbonKg;
  @override
  final CarbonImpactLevel impactLevel;
  final Map<String, double> _categoryBreakdown;
  @override
  Map<String, double> get categoryBreakdown {
    if (_categoryBreakdown is EqualUnmodifiableMapView)
      return _categoryBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryBreakdown);
  }

  // category -> kg CO2
  final List<CarbonTransaction> _topEmitters;
  // category -> kg CO2
  @override
  List<CarbonTransaction> get topEmitters {
    if (_topEmitters is EqualUnmodifiableListView) return _topEmitters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topEmitters);
  }

  @override
  final double comparedToAverage;
  // percentage vs average user
  final List<String> _recommendations;
  // percentage vs average user
  @override
  @JsonKey()
  List<String> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  final List<CarbonGoal> _goals;
  @override
  @JsonKey()
  List<CarbonGoal> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'CarbonWallet(id: $id, userId: $userId, periodStart: $periodStart, periodEnd: $periodEnd, totalCarbonKg: $totalCarbonKg, offsetCarbonKg: $offsetCarbonKg, netCarbonKg: $netCarbonKg, impactLevel: $impactLevel, categoryBreakdown: $categoryBreakdown, topEmitters: $topEmitters, comparedToAverage: $comparedToAverage, recommendations: $recommendations, goals: $goals, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarbonWalletImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.totalCarbonKg, totalCarbonKg) ||
                other.totalCarbonKg == totalCarbonKg) &&
            (identical(other.offsetCarbonKg, offsetCarbonKg) ||
                other.offsetCarbonKg == offsetCarbonKg) &&
            (identical(other.netCarbonKg, netCarbonKg) ||
                other.netCarbonKg == netCarbonKg) &&
            (identical(other.impactLevel, impactLevel) ||
                other.impactLevel == impactLevel) &&
            const DeepCollectionEquality().equals(
              other._categoryBreakdown,
              _categoryBreakdown,
            ) &&
            const DeepCollectionEquality().equals(
              other._topEmitters,
              _topEmitters,
            ) &&
            (identical(other.comparedToAverage, comparedToAverage) ||
                other.comparedToAverage == comparedToAverage) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    periodStart,
    periodEnd,
    totalCarbonKg,
    offsetCarbonKg,
    netCarbonKg,
    impactLevel,
    const DeepCollectionEquality().hash(_categoryBreakdown),
    const DeepCollectionEquality().hash(_topEmitters),
    comparedToAverage,
    const DeepCollectionEquality().hash(_recommendations),
    const DeepCollectionEquality().hash(_goals),
    createdAt,
  );

  /// Create a copy of CarbonWallet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarbonWalletImplCopyWith<_$CarbonWalletImpl> get copyWith =>
      __$$CarbonWalletImplCopyWithImpl<_$CarbonWalletImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarbonWalletImplToJson(this);
  }
}

abstract class _CarbonWallet implements CarbonWallet {
  const factory _CarbonWallet({
    required final String id,
    required final String userId,
    required final DateTime periodStart,
    required final DateTime periodEnd,
    required final double totalCarbonKg,
    required final double offsetCarbonKg,
    required final double netCarbonKg,
    required final CarbonImpactLevel impactLevel,
    required final Map<String, double> categoryBreakdown,
    required final List<CarbonTransaction> topEmitters,
    required final double comparedToAverage,
    final List<String> recommendations,
    final List<CarbonGoal> goals,
    final DateTime? createdAt,
  }) = _$CarbonWalletImpl;

  factory _CarbonWallet.fromJson(Map<String, dynamic> json) =
      _$CarbonWalletImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get periodStart;
  @override
  DateTime get periodEnd;
  @override
  double get totalCarbonKg;
  @override
  double get offsetCarbonKg;
  @override
  double get netCarbonKg;
  @override
  CarbonImpactLevel get impactLevel;
  @override
  Map<String, double> get categoryBreakdown; // category -> kg CO2
  @override
  List<CarbonTransaction> get topEmitters;
  @override
  double get comparedToAverage; // percentage vs average user
  @override
  List<String> get recommendations;
  @override
  List<CarbonGoal> get goals;
  @override
  DateTime? get createdAt;

  /// Create a copy of CarbonWallet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarbonWalletImplCopyWith<_$CarbonWalletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CarbonTransaction _$CarbonTransactionFromJson(Map<String, dynamic> json) {
  return _CarbonTransaction.fromJson(json);
}

/// @nodoc
mixin _$CarbonTransaction {
  String get transactionId => throw _privateConstructorUsedError;
  String get merchantName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  double get carbonKg => throw _privateConstructorUsedError;
  CategoryType get category => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get alternativeSuggestion => throw _privateConstructorUsedError;
  double? get potentialSavingsKg => throw _privateConstructorUsedError;

  /// Serializes this CarbonTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarbonTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarbonTransactionCopyWith<CarbonTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarbonTransactionCopyWith<$Res> {
  factory $CarbonTransactionCopyWith(
    CarbonTransaction value,
    $Res Function(CarbonTransaction) then,
  ) = _$CarbonTransactionCopyWithImpl<$Res, CarbonTransaction>;
  @useResult
  $Res call({
    String transactionId,
    String merchantName,
    double amount,
    double carbonKg,
    CategoryType category,
    DateTime date,
    String? alternativeSuggestion,
    double? potentialSavingsKg,
  });
}

/// @nodoc
class _$CarbonTransactionCopyWithImpl<$Res, $Val extends CarbonTransaction>
    implements $CarbonTransactionCopyWith<$Res> {
  _$CarbonTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarbonTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? merchantName = null,
    Object? amount = null,
    Object? carbonKg = null,
    Object? category = null,
    Object? date = null,
    Object? alternativeSuggestion = freezed,
    Object? potentialSavingsKg = freezed,
  }) {
    return _then(
      _value.copyWith(
            transactionId: null == transactionId
                ? _value.transactionId
                : transactionId // ignore: cast_nullable_to_non_nullable
                      as String,
            merchantName: null == merchantName
                ? _value.merchantName
                : merchantName // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            carbonKg: null == carbonKg
                ? _value.carbonKg
                : carbonKg // ignore: cast_nullable_to_non_nullable
                      as double,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as CategoryType,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            alternativeSuggestion: freezed == alternativeSuggestion
                ? _value.alternativeSuggestion
                : alternativeSuggestion // ignore: cast_nullable_to_non_nullable
                      as String?,
            potentialSavingsKg: freezed == potentialSavingsKg
                ? _value.potentialSavingsKg
                : potentialSavingsKg // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CarbonTransactionImplCopyWith<$Res>
    implements $CarbonTransactionCopyWith<$Res> {
  factory _$$CarbonTransactionImplCopyWith(
    _$CarbonTransactionImpl value,
    $Res Function(_$CarbonTransactionImpl) then,
  ) = __$$CarbonTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String transactionId,
    String merchantName,
    double amount,
    double carbonKg,
    CategoryType category,
    DateTime date,
    String? alternativeSuggestion,
    double? potentialSavingsKg,
  });
}

/// @nodoc
class __$$CarbonTransactionImplCopyWithImpl<$Res>
    extends _$CarbonTransactionCopyWithImpl<$Res, _$CarbonTransactionImpl>
    implements _$$CarbonTransactionImplCopyWith<$Res> {
  __$$CarbonTransactionImplCopyWithImpl(
    _$CarbonTransactionImpl _value,
    $Res Function(_$CarbonTransactionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CarbonTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? merchantName = null,
    Object? amount = null,
    Object? carbonKg = null,
    Object? category = null,
    Object? date = null,
    Object? alternativeSuggestion = freezed,
    Object? potentialSavingsKg = freezed,
  }) {
    return _then(
      _$CarbonTransactionImpl(
        transactionId: null == transactionId
            ? _value.transactionId
            : transactionId // ignore: cast_nullable_to_non_nullable
                  as String,
        merchantName: null == merchantName
            ? _value.merchantName
            : merchantName // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        carbonKg: null == carbonKg
            ? _value.carbonKg
            : carbonKg // ignore: cast_nullable_to_non_nullable
                  as double,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as CategoryType,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        alternativeSuggestion: freezed == alternativeSuggestion
            ? _value.alternativeSuggestion
            : alternativeSuggestion // ignore: cast_nullable_to_non_nullable
                  as String?,
        potentialSavingsKg: freezed == potentialSavingsKg
            ? _value.potentialSavingsKg
            : potentialSavingsKg // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CarbonTransactionImpl implements _CarbonTransaction {
  const _$CarbonTransactionImpl({
    required this.transactionId,
    required this.merchantName,
    required this.amount,
    required this.carbonKg,
    required this.category,
    required this.date,
    this.alternativeSuggestion,
    this.potentialSavingsKg,
  });

  factory _$CarbonTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarbonTransactionImplFromJson(json);

  @override
  final String transactionId;
  @override
  final String merchantName;
  @override
  final double amount;
  @override
  final double carbonKg;
  @override
  final CategoryType category;
  @override
  final DateTime date;
  @override
  final String? alternativeSuggestion;
  @override
  final double? potentialSavingsKg;

  @override
  String toString() {
    return 'CarbonTransaction(transactionId: $transactionId, merchantName: $merchantName, amount: $amount, carbonKg: $carbonKg, category: $category, date: $date, alternativeSuggestion: $alternativeSuggestion, potentialSavingsKg: $potentialSavingsKg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarbonTransactionImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.carbonKg, carbonKg) ||
                other.carbonKg == carbonKg) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.alternativeSuggestion, alternativeSuggestion) ||
                other.alternativeSuggestion == alternativeSuggestion) &&
            (identical(other.potentialSavingsKg, potentialSavingsKg) ||
                other.potentialSavingsKg == potentialSavingsKg));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    transactionId,
    merchantName,
    amount,
    carbonKg,
    category,
    date,
    alternativeSuggestion,
    potentialSavingsKg,
  );

  /// Create a copy of CarbonTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarbonTransactionImplCopyWith<_$CarbonTransactionImpl> get copyWith =>
      __$$CarbonTransactionImplCopyWithImpl<_$CarbonTransactionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CarbonTransactionImplToJson(this);
  }
}

abstract class _CarbonTransaction implements CarbonTransaction {
  const factory _CarbonTransaction({
    required final String transactionId,
    required final String merchantName,
    required final double amount,
    required final double carbonKg,
    required final CategoryType category,
    required final DateTime date,
    final String? alternativeSuggestion,
    final double? potentialSavingsKg,
  }) = _$CarbonTransactionImpl;

  factory _CarbonTransaction.fromJson(Map<String, dynamic> json) =
      _$CarbonTransactionImpl.fromJson;

  @override
  String get transactionId;
  @override
  String get merchantName;
  @override
  double get amount;
  @override
  double get carbonKg;
  @override
  CategoryType get category;
  @override
  DateTime get date;
  @override
  String? get alternativeSuggestion;
  @override
  double? get potentialSavingsKg;

  /// Create a copy of CarbonTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarbonTransactionImplCopyWith<_$CarbonTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CarbonGoal _$CarbonGoalFromJson(Map<String, dynamic> json) {
  return _CarbonGoal.fromJson(json);
}

/// @nodoc
mixin _$CarbonGoal {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get targetReductionKg => throw _privateConstructorUsedError;
  double get currentReductionKg => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  CarbonGoalStatus get status => throw _privateConstructorUsedError;
  String? get category =>
      throw _privateConstructorUsedError; // optional category focus
  int? get rewardPoints => throw _privateConstructorUsedError;

  /// Serializes this CarbonGoal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarbonGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarbonGoalCopyWith<CarbonGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarbonGoalCopyWith<$Res> {
  factory $CarbonGoalCopyWith(
    CarbonGoal value,
    $Res Function(CarbonGoal) then,
  ) = _$CarbonGoalCopyWithImpl<$Res, CarbonGoal>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    double targetReductionKg,
    double currentReductionKg,
    DateTime startDate,
    DateTime endDate,
    CarbonGoalStatus status,
    String? category,
    int? rewardPoints,
  });
}

/// @nodoc
class _$CarbonGoalCopyWithImpl<$Res, $Val extends CarbonGoal>
    implements $CarbonGoalCopyWith<$Res> {
  _$CarbonGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarbonGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? targetReductionKg = null,
    Object? currentReductionKg = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? category = freezed,
    Object? rewardPoints = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            targetReductionKg: null == targetReductionKg
                ? _value.targetReductionKg
                : targetReductionKg // ignore: cast_nullable_to_non_nullable
                      as double,
            currentReductionKg: null == currentReductionKg
                ? _value.currentReductionKg
                : currentReductionKg // ignore: cast_nullable_to_non_nullable
                      as double,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as CarbonGoalStatus,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            rewardPoints: freezed == rewardPoints
                ? _value.rewardPoints
                : rewardPoints // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CarbonGoalImplCopyWith<$Res>
    implements $CarbonGoalCopyWith<$Res> {
  factory _$$CarbonGoalImplCopyWith(
    _$CarbonGoalImpl value,
    $Res Function(_$CarbonGoalImpl) then,
  ) = __$$CarbonGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    double targetReductionKg,
    double currentReductionKg,
    DateTime startDate,
    DateTime endDate,
    CarbonGoalStatus status,
    String? category,
    int? rewardPoints,
  });
}

/// @nodoc
class __$$CarbonGoalImplCopyWithImpl<$Res>
    extends _$CarbonGoalCopyWithImpl<$Res, _$CarbonGoalImpl>
    implements _$$CarbonGoalImplCopyWith<$Res> {
  __$$CarbonGoalImplCopyWithImpl(
    _$CarbonGoalImpl _value,
    $Res Function(_$CarbonGoalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CarbonGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? targetReductionKg = null,
    Object? currentReductionKg = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? status = null,
    Object? category = freezed,
    Object? rewardPoints = freezed,
  }) {
    return _then(
      _$CarbonGoalImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        targetReductionKg: null == targetReductionKg
            ? _value.targetReductionKg
            : targetReductionKg // ignore: cast_nullable_to_non_nullable
                  as double,
        currentReductionKg: null == currentReductionKg
            ? _value.currentReductionKg
            : currentReductionKg // ignore: cast_nullable_to_non_nullable
                  as double,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CarbonGoalStatus,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        rewardPoints: freezed == rewardPoints
            ? _value.rewardPoints
            : rewardPoints // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CarbonGoalImpl implements _CarbonGoal {
  const _$CarbonGoalImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.targetReductionKg,
    required this.currentReductionKg,
    required this.startDate,
    required this.endDate,
    required this.status,
    this.category,
    this.rewardPoints,
  });

  factory _$CarbonGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarbonGoalImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final double targetReductionKg;
  @override
  final double currentReductionKg;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final CarbonGoalStatus status;
  @override
  final String? category;
  // optional category focus
  @override
  final int? rewardPoints;

  @override
  String toString() {
    return 'CarbonGoal(id: $id, title: $title, description: $description, targetReductionKg: $targetReductionKg, currentReductionKg: $currentReductionKg, startDate: $startDate, endDate: $endDate, status: $status, category: $category, rewardPoints: $rewardPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarbonGoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.targetReductionKg, targetReductionKg) ||
                other.targetReductionKg == targetReductionKg) &&
            (identical(other.currentReductionKg, currentReductionKg) ||
                other.currentReductionKg == currentReductionKg) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.rewardPoints, rewardPoints) ||
                other.rewardPoints == rewardPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    targetReductionKg,
    currentReductionKg,
    startDate,
    endDate,
    status,
    category,
    rewardPoints,
  );

  /// Create a copy of CarbonGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarbonGoalImplCopyWith<_$CarbonGoalImpl> get copyWith =>
      __$$CarbonGoalImplCopyWithImpl<_$CarbonGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarbonGoalImplToJson(this);
  }
}

abstract class _CarbonGoal implements CarbonGoal {
  const factory _CarbonGoal({
    required final String id,
    required final String title,
    required final String description,
    required final double targetReductionKg,
    required final double currentReductionKg,
    required final DateTime startDate,
    required final DateTime endDate,
    required final CarbonGoalStatus status,
    final String? category,
    final int? rewardPoints,
  }) = _$CarbonGoalImpl;

  factory _CarbonGoal.fromJson(Map<String, dynamic> json) =
      _$CarbonGoalImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  double get targetReductionKg;
  @override
  double get currentReductionKg;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  CarbonGoalStatus get status;
  @override
  String? get category; // optional category focus
  @override
  int? get rewardPoints;

  /// Create a copy of CarbonGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarbonGoalImplCopyWith<_$CarbonGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CarbonOffset _$CarbonOffsetFromJson(Map<String, dynamic> json) {
  return _CarbonOffset.fromJson(json);
}

/// @nodoc
mixin _$CarbonOffset {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  double get amountKg => throw _privateConstructorUsedError;
  double get costUsd => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  String get projectName => throw _privateConstructorUsedError;
  DateTime get purchaseDate => throw _privateConstructorUsedError;
  String? get certificateUrl => throw _privateConstructorUsedError;

  /// Serializes this CarbonOffset to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarbonOffset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarbonOffsetCopyWith<CarbonOffset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarbonOffsetCopyWith<$Res> {
  factory $CarbonOffsetCopyWith(
    CarbonOffset value,
    $Res Function(CarbonOffset) then,
  ) = _$CarbonOffsetCopyWithImpl<$Res, CarbonOffset>;
  @useResult
  $Res call({
    String id,
    String userId,
    double amountKg,
    double costUsd,
    String provider,
    String projectName,
    DateTime purchaseDate,
    String? certificateUrl,
  });
}

/// @nodoc
class _$CarbonOffsetCopyWithImpl<$Res, $Val extends CarbonOffset>
    implements $CarbonOffsetCopyWith<$Res> {
  _$CarbonOffsetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarbonOffset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amountKg = null,
    Object? costUsd = null,
    Object? provider = null,
    Object? projectName = null,
    Object? purchaseDate = null,
    Object? certificateUrl = freezed,
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
            amountKg: null == amountKg
                ? _value.amountKg
                : amountKg // ignore: cast_nullable_to_non_nullable
                      as double,
            costUsd: null == costUsd
                ? _value.costUsd
                : costUsd // ignore: cast_nullable_to_non_nullable
                      as double,
            provider: null == provider
                ? _value.provider
                : provider // ignore: cast_nullable_to_non_nullable
                      as String,
            projectName: null == projectName
                ? _value.projectName
                : projectName // ignore: cast_nullable_to_non_nullable
                      as String,
            purchaseDate: null == purchaseDate
                ? _value.purchaseDate
                : purchaseDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            certificateUrl: freezed == certificateUrl
                ? _value.certificateUrl
                : certificateUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CarbonOffsetImplCopyWith<$Res>
    implements $CarbonOffsetCopyWith<$Res> {
  factory _$$CarbonOffsetImplCopyWith(
    _$CarbonOffsetImpl value,
    $Res Function(_$CarbonOffsetImpl) then,
  ) = __$$CarbonOffsetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    double amountKg,
    double costUsd,
    String provider,
    String projectName,
    DateTime purchaseDate,
    String? certificateUrl,
  });
}

/// @nodoc
class __$$CarbonOffsetImplCopyWithImpl<$Res>
    extends _$CarbonOffsetCopyWithImpl<$Res, _$CarbonOffsetImpl>
    implements _$$CarbonOffsetImplCopyWith<$Res> {
  __$$CarbonOffsetImplCopyWithImpl(
    _$CarbonOffsetImpl _value,
    $Res Function(_$CarbonOffsetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CarbonOffset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amountKg = null,
    Object? costUsd = null,
    Object? provider = null,
    Object? projectName = null,
    Object? purchaseDate = null,
    Object? certificateUrl = freezed,
  }) {
    return _then(
      _$CarbonOffsetImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        amountKg: null == amountKg
            ? _value.amountKg
            : amountKg // ignore: cast_nullable_to_non_nullable
                  as double,
        costUsd: null == costUsd
            ? _value.costUsd
            : costUsd // ignore: cast_nullable_to_non_nullable
                  as double,
        provider: null == provider
            ? _value.provider
            : provider // ignore: cast_nullable_to_non_nullable
                  as String,
        projectName: null == projectName
            ? _value.projectName
            : projectName // ignore: cast_nullable_to_non_nullable
                  as String,
        purchaseDate: null == purchaseDate
            ? _value.purchaseDate
            : purchaseDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        certificateUrl: freezed == certificateUrl
            ? _value.certificateUrl
            : certificateUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CarbonOffsetImpl implements _CarbonOffset {
  const _$CarbonOffsetImpl({
    required this.id,
    required this.userId,
    required this.amountKg,
    required this.costUsd,
    required this.provider,
    required this.projectName,
    required this.purchaseDate,
    this.certificateUrl,
  });

  factory _$CarbonOffsetImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarbonOffsetImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final double amountKg;
  @override
  final double costUsd;
  @override
  final String provider;
  @override
  final String projectName;
  @override
  final DateTime purchaseDate;
  @override
  final String? certificateUrl;

  @override
  String toString() {
    return 'CarbonOffset(id: $id, userId: $userId, amountKg: $amountKg, costUsd: $costUsd, provider: $provider, projectName: $projectName, purchaseDate: $purchaseDate, certificateUrl: $certificateUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarbonOffsetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amountKg, amountKg) ||
                other.amountKg == amountKg) &&
            (identical(other.costUsd, costUsd) || other.costUsd == costUsd) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.certificateUrl, certificateUrl) ||
                other.certificateUrl == certificateUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    amountKg,
    costUsd,
    provider,
    projectName,
    purchaseDate,
    certificateUrl,
  );

  /// Create a copy of CarbonOffset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarbonOffsetImplCopyWith<_$CarbonOffsetImpl> get copyWith =>
      __$$CarbonOffsetImplCopyWithImpl<_$CarbonOffsetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarbonOffsetImplToJson(this);
  }
}

abstract class _CarbonOffset implements CarbonOffset {
  const factory _CarbonOffset({
    required final String id,
    required final String userId,
    required final double amountKg,
    required final double costUsd,
    required final String provider,
    required final String projectName,
    required final DateTime purchaseDate,
    final String? certificateUrl,
  }) = _$CarbonOffsetImpl;

  factory _CarbonOffset.fromJson(Map<String, dynamic> json) =
      _$CarbonOffsetImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  double get amountKg;
  @override
  double get costUsd;
  @override
  String get provider;
  @override
  String get projectName;
  @override
  DateTime get purchaseDate;
  @override
  String? get certificateUrl;

  /// Create a copy of CarbonOffset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarbonOffsetImplCopyWith<_$CarbonOffsetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
