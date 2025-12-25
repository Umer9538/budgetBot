// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spending_dna_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SpendingDNA _$SpendingDNAFromJson(Map<String, dynamic> json) {
  return _SpendingDNA.fromJson(json);
}

/// @nodoc
mixin _$SpendingDNA {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  MoneyPersonality get personality => throw _privateConstructorUsedError;
  PaydayBehavior get paydayBehavior => throw _privateConstructorUsedError;
  EndOfMonthPattern get endOfMonthPattern => throw _privateConstructorUsedError;
  SpendingPatternProfile get patternProfile =>
      throw _privateConstructorUsedError;
  List<BehavioralTrait> get traits => throw _privateConstructorUsedError;
  Map<String, double> get categoryAffinities =>
      throw _privateConstructorUsedError; // category -> score 0-100
  double get financialHealthScore =>
      throw _privateConstructorUsedError; // 0-100
  double get consistencyScore => throw _privateConstructorUsedError; // 0-100
  double get savingsRate => throw _privateConstructorUsedError; // percentage
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this SpendingDNA to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpendingDNA
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpendingDNACopyWith<SpendingDNA> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingDNACopyWith<$Res> {
  factory $SpendingDNACopyWith(
    SpendingDNA value,
    $Res Function(SpendingDNA) then,
  ) = _$SpendingDNACopyWithImpl<$Res, SpendingDNA>;
  @useResult
  $Res call({
    String id,
    String userId,
    MoneyPersonality personality,
    PaydayBehavior paydayBehavior,
    EndOfMonthPattern endOfMonthPattern,
    SpendingPatternProfile patternProfile,
    List<BehavioralTrait> traits,
    Map<String, double> categoryAffinities,
    double financialHealthScore,
    double consistencyScore,
    double savingsRate,
    DateTime? lastUpdated,
    DateTime? createdAt,
  });

  $SpendingPatternProfileCopyWith<$Res> get patternProfile;
}

/// @nodoc
class _$SpendingDNACopyWithImpl<$Res, $Val extends SpendingDNA>
    implements $SpendingDNACopyWith<$Res> {
  _$SpendingDNACopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpendingDNA
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? personality = null,
    Object? paydayBehavior = null,
    Object? endOfMonthPattern = null,
    Object? patternProfile = null,
    Object? traits = null,
    Object? categoryAffinities = null,
    Object? financialHealthScore = null,
    Object? consistencyScore = null,
    Object? savingsRate = null,
    Object? lastUpdated = freezed,
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
            personality: null == personality
                ? _value.personality
                : personality // ignore: cast_nullable_to_non_nullable
                      as MoneyPersonality,
            paydayBehavior: null == paydayBehavior
                ? _value.paydayBehavior
                : paydayBehavior // ignore: cast_nullable_to_non_nullable
                      as PaydayBehavior,
            endOfMonthPattern: null == endOfMonthPattern
                ? _value.endOfMonthPattern
                : endOfMonthPattern // ignore: cast_nullable_to_non_nullable
                      as EndOfMonthPattern,
            patternProfile: null == patternProfile
                ? _value.patternProfile
                : patternProfile // ignore: cast_nullable_to_non_nullable
                      as SpendingPatternProfile,
            traits: null == traits
                ? _value.traits
                : traits // ignore: cast_nullable_to_non_nullable
                      as List<BehavioralTrait>,
            categoryAffinities: null == categoryAffinities
                ? _value.categoryAffinities
                : categoryAffinities // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            financialHealthScore: null == financialHealthScore
                ? _value.financialHealthScore
                : financialHealthScore // ignore: cast_nullable_to_non_nullable
                      as double,
            consistencyScore: null == consistencyScore
                ? _value.consistencyScore
                : consistencyScore // ignore: cast_nullable_to_non_nullable
                      as double,
            savingsRate: null == savingsRate
                ? _value.savingsRate
                : savingsRate // ignore: cast_nullable_to_non_nullable
                      as double,
            lastUpdated: freezed == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of SpendingDNA
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SpendingPatternProfileCopyWith<$Res> get patternProfile {
    return $SpendingPatternProfileCopyWith<$Res>(_value.patternProfile, (
      value,
    ) {
      return _then(_value.copyWith(patternProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SpendingDNAImplCopyWith<$Res>
    implements $SpendingDNACopyWith<$Res> {
  factory _$$SpendingDNAImplCopyWith(
    _$SpendingDNAImpl value,
    $Res Function(_$SpendingDNAImpl) then,
  ) = __$$SpendingDNAImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    MoneyPersonality personality,
    PaydayBehavior paydayBehavior,
    EndOfMonthPattern endOfMonthPattern,
    SpendingPatternProfile patternProfile,
    List<BehavioralTrait> traits,
    Map<String, double> categoryAffinities,
    double financialHealthScore,
    double consistencyScore,
    double savingsRate,
    DateTime? lastUpdated,
    DateTime? createdAt,
  });

  @override
  $SpendingPatternProfileCopyWith<$Res> get patternProfile;
}

/// @nodoc
class __$$SpendingDNAImplCopyWithImpl<$Res>
    extends _$SpendingDNACopyWithImpl<$Res, _$SpendingDNAImpl>
    implements _$$SpendingDNAImplCopyWith<$Res> {
  __$$SpendingDNAImplCopyWithImpl(
    _$SpendingDNAImpl _value,
    $Res Function(_$SpendingDNAImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpendingDNA
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? personality = null,
    Object? paydayBehavior = null,
    Object? endOfMonthPattern = null,
    Object? patternProfile = null,
    Object? traits = null,
    Object? categoryAffinities = null,
    Object? financialHealthScore = null,
    Object? consistencyScore = null,
    Object? savingsRate = null,
    Object? lastUpdated = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$SpendingDNAImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        personality: null == personality
            ? _value.personality
            : personality // ignore: cast_nullable_to_non_nullable
                  as MoneyPersonality,
        paydayBehavior: null == paydayBehavior
            ? _value.paydayBehavior
            : paydayBehavior // ignore: cast_nullable_to_non_nullable
                  as PaydayBehavior,
        endOfMonthPattern: null == endOfMonthPattern
            ? _value.endOfMonthPattern
            : endOfMonthPattern // ignore: cast_nullable_to_non_nullable
                  as EndOfMonthPattern,
        patternProfile: null == patternProfile
            ? _value.patternProfile
            : patternProfile // ignore: cast_nullable_to_non_nullable
                  as SpendingPatternProfile,
        traits: null == traits
            ? _value._traits
            : traits // ignore: cast_nullable_to_non_nullable
                  as List<BehavioralTrait>,
        categoryAffinities: null == categoryAffinities
            ? _value._categoryAffinities
            : categoryAffinities // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        financialHealthScore: null == financialHealthScore
            ? _value.financialHealthScore
            : financialHealthScore // ignore: cast_nullable_to_non_nullable
                  as double,
        consistencyScore: null == consistencyScore
            ? _value.consistencyScore
            : consistencyScore // ignore: cast_nullable_to_non_nullable
                  as double,
        savingsRate: null == savingsRate
            ? _value.savingsRate
            : savingsRate // ignore: cast_nullable_to_non_nullable
                  as double,
        lastUpdated: freezed == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
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
class _$SpendingDNAImpl implements _SpendingDNA {
  const _$SpendingDNAImpl({
    required this.id,
    required this.userId,
    required this.personality,
    required this.paydayBehavior,
    required this.endOfMonthPattern,
    required this.patternProfile,
    required final List<BehavioralTrait> traits,
    required final Map<String, double> categoryAffinities,
    required this.financialHealthScore,
    required this.consistencyScore,
    required this.savingsRate,
    this.lastUpdated,
    this.createdAt,
  }) : _traits = traits,
       _categoryAffinities = categoryAffinities;

  factory _$SpendingDNAImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendingDNAImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final MoneyPersonality personality;
  @override
  final PaydayBehavior paydayBehavior;
  @override
  final EndOfMonthPattern endOfMonthPattern;
  @override
  final SpendingPatternProfile patternProfile;
  final List<BehavioralTrait> _traits;
  @override
  List<BehavioralTrait> get traits {
    if (_traits is EqualUnmodifiableListView) return _traits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_traits);
  }

  final Map<String, double> _categoryAffinities;
  @override
  Map<String, double> get categoryAffinities {
    if (_categoryAffinities is EqualUnmodifiableMapView)
      return _categoryAffinities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryAffinities);
  }

  // category -> score 0-100
  @override
  final double financialHealthScore;
  // 0-100
  @override
  final double consistencyScore;
  // 0-100
  @override
  final double savingsRate;
  // percentage
  @override
  final DateTime? lastUpdated;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'SpendingDNA(id: $id, userId: $userId, personality: $personality, paydayBehavior: $paydayBehavior, endOfMonthPattern: $endOfMonthPattern, patternProfile: $patternProfile, traits: $traits, categoryAffinities: $categoryAffinities, financialHealthScore: $financialHealthScore, consistencyScore: $consistencyScore, savingsRate: $savingsRate, lastUpdated: $lastUpdated, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingDNAImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.personality, personality) ||
                other.personality == personality) &&
            (identical(other.paydayBehavior, paydayBehavior) ||
                other.paydayBehavior == paydayBehavior) &&
            (identical(other.endOfMonthPattern, endOfMonthPattern) ||
                other.endOfMonthPattern == endOfMonthPattern) &&
            (identical(other.patternProfile, patternProfile) ||
                other.patternProfile == patternProfile) &&
            const DeepCollectionEquality().equals(other._traits, _traits) &&
            const DeepCollectionEquality().equals(
              other._categoryAffinities,
              _categoryAffinities,
            ) &&
            (identical(other.financialHealthScore, financialHealthScore) ||
                other.financialHealthScore == financialHealthScore) &&
            (identical(other.consistencyScore, consistencyScore) ||
                other.consistencyScore == consistencyScore) &&
            (identical(other.savingsRate, savingsRate) ||
                other.savingsRate == savingsRate) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    personality,
    paydayBehavior,
    endOfMonthPattern,
    patternProfile,
    const DeepCollectionEquality().hash(_traits),
    const DeepCollectionEquality().hash(_categoryAffinities),
    financialHealthScore,
    consistencyScore,
    savingsRate,
    lastUpdated,
    createdAt,
  );

  /// Create a copy of SpendingDNA
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingDNAImplCopyWith<_$SpendingDNAImpl> get copyWith =>
      __$$SpendingDNAImplCopyWithImpl<_$SpendingDNAImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingDNAImplToJson(this);
  }
}

abstract class _SpendingDNA implements SpendingDNA {
  const factory _SpendingDNA({
    required final String id,
    required final String userId,
    required final MoneyPersonality personality,
    required final PaydayBehavior paydayBehavior,
    required final EndOfMonthPattern endOfMonthPattern,
    required final SpendingPatternProfile patternProfile,
    required final List<BehavioralTrait> traits,
    required final Map<String, double> categoryAffinities,
    required final double financialHealthScore,
    required final double consistencyScore,
    required final double savingsRate,
    final DateTime? lastUpdated,
    final DateTime? createdAt,
  }) = _$SpendingDNAImpl;

  factory _SpendingDNA.fromJson(Map<String, dynamic> json) =
      _$SpendingDNAImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  MoneyPersonality get personality;
  @override
  PaydayBehavior get paydayBehavior;
  @override
  EndOfMonthPattern get endOfMonthPattern;
  @override
  SpendingPatternProfile get patternProfile;
  @override
  List<BehavioralTrait> get traits;
  @override
  Map<String, double> get categoryAffinities; // category -> score 0-100
  @override
  double get financialHealthScore; // 0-100
  @override
  double get consistencyScore; // 0-100
  @override
  double get savingsRate; // percentage
  @override
  DateTime? get lastUpdated;
  @override
  DateTime? get createdAt;

  /// Create a copy of SpendingDNA
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpendingDNAImplCopyWith<_$SpendingDNAImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SpendingPatternProfile _$SpendingPatternProfileFromJson(
  Map<String, dynamic> json,
) {
  return _SpendingPatternProfile.fromJson(json);
}

/// @nodoc
mixin _$SpendingPatternProfile {
  double get avgDailySpend => throw _privateConstructorUsedError;
  double get avgWeekendSpend => throw _privateConstructorUsedError;
  double get avgWeekdaySpend => throw _privateConstructorUsedError;
  double get spendingVariance => throw _privateConstructorUsedError;
  String get peakSpendingDay =>
      throw _privateConstructorUsedError; // day of week
  String get peakSpendingTime =>
      throw _privateConstructorUsedError; // time of day
  double get impulseSpendingRatio => throw _privateConstructorUsedError; // 0-1
  double get plannedSpendingRatio => throw _privateConstructorUsedError; // 0-1
  Map<String, double> get hourlySpendingPattern =>
      throw _privateConstructorUsedError; // hour -> avg spend
  Map<String, double> get weeklySpendingPattern =>
      throw _privateConstructorUsedError; // day -> avg spend
  Map<String, double> get monthlySpendingPattern =>
      throw _privateConstructorUsedError;

  /// Serializes this SpendingPatternProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SpendingPatternProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SpendingPatternProfileCopyWith<SpendingPatternProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpendingPatternProfileCopyWith<$Res> {
  factory $SpendingPatternProfileCopyWith(
    SpendingPatternProfile value,
    $Res Function(SpendingPatternProfile) then,
  ) = _$SpendingPatternProfileCopyWithImpl<$Res, SpendingPatternProfile>;
  @useResult
  $Res call({
    double avgDailySpend,
    double avgWeekendSpend,
    double avgWeekdaySpend,
    double spendingVariance,
    String peakSpendingDay,
    String peakSpendingTime,
    double impulseSpendingRatio,
    double plannedSpendingRatio,
    Map<String, double> hourlySpendingPattern,
    Map<String, double> weeklySpendingPattern,
    Map<String, double> monthlySpendingPattern,
  });
}

/// @nodoc
class _$SpendingPatternProfileCopyWithImpl<
  $Res,
  $Val extends SpendingPatternProfile
>
    implements $SpendingPatternProfileCopyWith<$Res> {
  _$SpendingPatternProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SpendingPatternProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgDailySpend = null,
    Object? avgWeekendSpend = null,
    Object? avgWeekdaySpend = null,
    Object? spendingVariance = null,
    Object? peakSpendingDay = null,
    Object? peakSpendingTime = null,
    Object? impulseSpendingRatio = null,
    Object? plannedSpendingRatio = null,
    Object? hourlySpendingPattern = null,
    Object? weeklySpendingPattern = null,
    Object? monthlySpendingPattern = null,
  }) {
    return _then(
      _value.copyWith(
            avgDailySpend: null == avgDailySpend
                ? _value.avgDailySpend
                : avgDailySpend // ignore: cast_nullable_to_non_nullable
                      as double,
            avgWeekendSpend: null == avgWeekendSpend
                ? _value.avgWeekendSpend
                : avgWeekendSpend // ignore: cast_nullable_to_non_nullable
                      as double,
            avgWeekdaySpend: null == avgWeekdaySpend
                ? _value.avgWeekdaySpend
                : avgWeekdaySpend // ignore: cast_nullable_to_non_nullable
                      as double,
            spendingVariance: null == spendingVariance
                ? _value.spendingVariance
                : spendingVariance // ignore: cast_nullable_to_non_nullable
                      as double,
            peakSpendingDay: null == peakSpendingDay
                ? _value.peakSpendingDay
                : peakSpendingDay // ignore: cast_nullable_to_non_nullable
                      as String,
            peakSpendingTime: null == peakSpendingTime
                ? _value.peakSpendingTime
                : peakSpendingTime // ignore: cast_nullable_to_non_nullable
                      as String,
            impulseSpendingRatio: null == impulseSpendingRatio
                ? _value.impulseSpendingRatio
                : impulseSpendingRatio // ignore: cast_nullable_to_non_nullable
                      as double,
            plannedSpendingRatio: null == plannedSpendingRatio
                ? _value.plannedSpendingRatio
                : plannedSpendingRatio // ignore: cast_nullable_to_non_nullable
                      as double,
            hourlySpendingPattern: null == hourlySpendingPattern
                ? _value.hourlySpendingPattern
                : hourlySpendingPattern // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            weeklySpendingPattern: null == weeklySpendingPattern
                ? _value.weeklySpendingPattern
                : weeklySpendingPattern // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            monthlySpendingPattern: null == monthlySpendingPattern
                ? _value.monthlySpendingPattern
                : monthlySpendingPattern // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SpendingPatternProfileImplCopyWith<$Res>
    implements $SpendingPatternProfileCopyWith<$Res> {
  factory _$$SpendingPatternProfileImplCopyWith(
    _$SpendingPatternProfileImpl value,
    $Res Function(_$SpendingPatternProfileImpl) then,
  ) = __$$SpendingPatternProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double avgDailySpend,
    double avgWeekendSpend,
    double avgWeekdaySpend,
    double spendingVariance,
    String peakSpendingDay,
    String peakSpendingTime,
    double impulseSpendingRatio,
    double plannedSpendingRatio,
    Map<String, double> hourlySpendingPattern,
    Map<String, double> weeklySpendingPattern,
    Map<String, double> monthlySpendingPattern,
  });
}

/// @nodoc
class __$$SpendingPatternProfileImplCopyWithImpl<$Res>
    extends
        _$SpendingPatternProfileCopyWithImpl<$Res, _$SpendingPatternProfileImpl>
    implements _$$SpendingPatternProfileImplCopyWith<$Res> {
  __$$SpendingPatternProfileImplCopyWithImpl(
    _$SpendingPatternProfileImpl _value,
    $Res Function(_$SpendingPatternProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SpendingPatternProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? avgDailySpend = null,
    Object? avgWeekendSpend = null,
    Object? avgWeekdaySpend = null,
    Object? spendingVariance = null,
    Object? peakSpendingDay = null,
    Object? peakSpendingTime = null,
    Object? impulseSpendingRatio = null,
    Object? plannedSpendingRatio = null,
    Object? hourlySpendingPattern = null,
    Object? weeklySpendingPattern = null,
    Object? monthlySpendingPattern = null,
  }) {
    return _then(
      _$SpendingPatternProfileImpl(
        avgDailySpend: null == avgDailySpend
            ? _value.avgDailySpend
            : avgDailySpend // ignore: cast_nullable_to_non_nullable
                  as double,
        avgWeekendSpend: null == avgWeekendSpend
            ? _value.avgWeekendSpend
            : avgWeekendSpend // ignore: cast_nullable_to_non_nullable
                  as double,
        avgWeekdaySpend: null == avgWeekdaySpend
            ? _value.avgWeekdaySpend
            : avgWeekdaySpend // ignore: cast_nullable_to_non_nullable
                  as double,
        spendingVariance: null == spendingVariance
            ? _value.spendingVariance
            : spendingVariance // ignore: cast_nullable_to_non_nullable
                  as double,
        peakSpendingDay: null == peakSpendingDay
            ? _value.peakSpendingDay
            : peakSpendingDay // ignore: cast_nullable_to_non_nullable
                  as String,
        peakSpendingTime: null == peakSpendingTime
            ? _value.peakSpendingTime
            : peakSpendingTime // ignore: cast_nullable_to_non_nullable
                  as String,
        impulseSpendingRatio: null == impulseSpendingRatio
            ? _value.impulseSpendingRatio
            : impulseSpendingRatio // ignore: cast_nullable_to_non_nullable
                  as double,
        plannedSpendingRatio: null == plannedSpendingRatio
            ? _value.plannedSpendingRatio
            : plannedSpendingRatio // ignore: cast_nullable_to_non_nullable
                  as double,
        hourlySpendingPattern: null == hourlySpendingPattern
            ? _value._hourlySpendingPattern
            : hourlySpendingPattern // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        weeklySpendingPattern: null == weeklySpendingPattern
            ? _value._weeklySpendingPattern
            : weeklySpendingPattern // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        monthlySpendingPattern: null == monthlySpendingPattern
            ? _value._monthlySpendingPattern
            : monthlySpendingPattern // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SpendingPatternProfileImpl implements _SpendingPatternProfile {
  const _$SpendingPatternProfileImpl({
    required this.avgDailySpend,
    required this.avgWeekendSpend,
    required this.avgWeekdaySpend,
    required this.spendingVariance,
    required this.peakSpendingDay,
    required this.peakSpendingTime,
    required this.impulseSpendingRatio,
    required this.plannedSpendingRatio,
    required final Map<String, double> hourlySpendingPattern,
    required final Map<String, double> weeklySpendingPattern,
    required final Map<String, double> monthlySpendingPattern,
  }) : _hourlySpendingPattern = hourlySpendingPattern,
       _weeklySpendingPattern = weeklySpendingPattern,
       _monthlySpendingPattern = monthlySpendingPattern;

  factory _$SpendingPatternProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$SpendingPatternProfileImplFromJson(json);

  @override
  final double avgDailySpend;
  @override
  final double avgWeekendSpend;
  @override
  final double avgWeekdaySpend;
  @override
  final double spendingVariance;
  @override
  final String peakSpendingDay;
  // day of week
  @override
  final String peakSpendingTime;
  // time of day
  @override
  final double impulseSpendingRatio;
  // 0-1
  @override
  final double plannedSpendingRatio;
  // 0-1
  final Map<String, double> _hourlySpendingPattern;
  // 0-1
  @override
  Map<String, double> get hourlySpendingPattern {
    if (_hourlySpendingPattern is EqualUnmodifiableMapView)
      return _hourlySpendingPattern;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_hourlySpendingPattern);
  }

  // hour -> avg spend
  final Map<String, double> _weeklySpendingPattern;
  // hour -> avg spend
  @override
  Map<String, double> get weeklySpendingPattern {
    if (_weeklySpendingPattern is EqualUnmodifiableMapView)
      return _weeklySpendingPattern;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_weeklySpendingPattern);
  }

  // day -> avg spend
  final Map<String, double> _monthlySpendingPattern;
  // day -> avg spend
  @override
  Map<String, double> get monthlySpendingPattern {
    if (_monthlySpendingPattern is EqualUnmodifiableMapView)
      return _monthlySpendingPattern;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_monthlySpendingPattern);
  }

  @override
  String toString() {
    return 'SpendingPatternProfile(avgDailySpend: $avgDailySpend, avgWeekendSpend: $avgWeekendSpend, avgWeekdaySpend: $avgWeekdaySpend, spendingVariance: $spendingVariance, peakSpendingDay: $peakSpendingDay, peakSpendingTime: $peakSpendingTime, impulseSpendingRatio: $impulseSpendingRatio, plannedSpendingRatio: $plannedSpendingRatio, hourlySpendingPattern: $hourlySpendingPattern, weeklySpendingPattern: $weeklySpendingPattern, monthlySpendingPattern: $monthlySpendingPattern)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpendingPatternProfileImpl &&
            (identical(other.avgDailySpend, avgDailySpend) ||
                other.avgDailySpend == avgDailySpend) &&
            (identical(other.avgWeekendSpend, avgWeekendSpend) ||
                other.avgWeekendSpend == avgWeekendSpend) &&
            (identical(other.avgWeekdaySpend, avgWeekdaySpend) ||
                other.avgWeekdaySpend == avgWeekdaySpend) &&
            (identical(other.spendingVariance, spendingVariance) ||
                other.spendingVariance == spendingVariance) &&
            (identical(other.peakSpendingDay, peakSpendingDay) ||
                other.peakSpendingDay == peakSpendingDay) &&
            (identical(other.peakSpendingTime, peakSpendingTime) ||
                other.peakSpendingTime == peakSpendingTime) &&
            (identical(other.impulseSpendingRatio, impulseSpendingRatio) ||
                other.impulseSpendingRatio == impulseSpendingRatio) &&
            (identical(other.plannedSpendingRatio, plannedSpendingRatio) ||
                other.plannedSpendingRatio == plannedSpendingRatio) &&
            const DeepCollectionEquality().equals(
              other._hourlySpendingPattern,
              _hourlySpendingPattern,
            ) &&
            const DeepCollectionEquality().equals(
              other._weeklySpendingPattern,
              _weeklySpendingPattern,
            ) &&
            const DeepCollectionEquality().equals(
              other._monthlySpendingPattern,
              _monthlySpendingPattern,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    avgDailySpend,
    avgWeekendSpend,
    avgWeekdaySpend,
    spendingVariance,
    peakSpendingDay,
    peakSpendingTime,
    impulseSpendingRatio,
    plannedSpendingRatio,
    const DeepCollectionEquality().hash(_hourlySpendingPattern),
    const DeepCollectionEquality().hash(_weeklySpendingPattern),
    const DeepCollectionEquality().hash(_monthlySpendingPattern),
  );

  /// Create a copy of SpendingPatternProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SpendingPatternProfileImplCopyWith<_$SpendingPatternProfileImpl>
  get copyWith =>
      __$$SpendingPatternProfileImplCopyWithImpl<_$SpendingPatternProfileImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SpendingPatternProfileImplToJson(this);
  }
}

abstract class _SpendingPatternProfile implements SpendingPatternProfile {
  const factory _SpendingPatternProfile({
    required final double avgDailySpend,
    required final double avgWeekendSpend,
    required final double avgWeekdaySpend,
    required final double spendingVariance,
    required final String peakSpendingDay,
    required final String peakSpendingTime,
    required final double impulseSpendingRatio,
    required final double plannedSpendingRatio,
    required final Map<String, double> hourlySpendingPattern,
    required final Map<String, double> weeklySpendingPattern,
    required final Map<String, double> monthlySpendingPattern,
  }) = _$SpendingPatternProfileImpl;

  factory _SpendingPatternProfile.fromJson(Map<String, dynamic> json) =
      _$SpendingPatternProfileImpl.fromJson;

  @override
  double get avgDailySpend;
  @override
  double get avgWeekendSpend;
  @override
  double get avgWeekdaySpend;
  @override
  double get spendingVariance;
  @override
  String get peakSpendingDay; // day of week
  @override
  String get peakSpendingTime; // time of day
  @override
  double get impulseSpendingRatio; // 0-1
  @override
  double get plannedSpendingRatio; // 0-1
  @override
  Map<String, double> get hourlySpendingPattern; // hour -> avg spend
  @override
  Map<String, double> get weeklySpendingPattern; // day -> avg spend
  @override
  Map<String, double> get monthlySpendingPattern;

  /// Create a copy of SpendingPatternProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SpendingPatternProfileImplCopyWith<_$SpendingPatternProfileImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BehavioralTrait _$BehavioralTraitFromJson(Map<String, dynamic> json) {
  return _BehavioralTrait.fromJson(json);
}

/// @nodoc
mixin _$BehavioralTrait {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  TraitCategory get category => throw _privateConstructorUsedError;
  double get score => throw _privateConstructorUsedError; // 0-100
  TraitImpact get impact =>
      throw _privateConstructorUsedError; // positive, negative, neutral
  String? get recommendation => throw _privateConstructorUsedError;

  /// Serializes this BehavioralTrait to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BehavioralTrait
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BehavioralTraitCopyWith<BehavioralTrait> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BehavioralTraitCopyWith<$Res> {
  factory $BehavioralTraitCopyWith(
    BehavioralTrait value,
    $Res Function(BehavioralTrait) then,
  ) = _$BehavioralTraitCopyWithImpl<$Res, BehavioralTrait>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    TraitCategory category,
    double score,
    TraitImpact impact,
    String? recommendation,
  });
}

/// @nodoc
class _$BehavioralTraitCopyWithImpl<$Res, $Val extends BehavioralTrait>
    implements $BehavioralTraitCopyWith<$Res> {
  _$BehavioralTraitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BehavioralTrait
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? score = null,
    Object? impact = null,
    Object? recommendation = freezed,
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
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as TraitCategory,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as double,
            impact: null == impact
                ? _value.impact
                : impact // ignore: cast_nullable_to_non_nullable
                      as TraitImpact,
            recommendation: freezed == recommendation
                ? _value.recommendation
                : recommendation // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BehavioralTraitImplCopyWith<$Res>
    implements $BehavioralTraitCopyWith<$Res> {
  factory _$$BehavioralTraitImplCopyWith(
    _$BehavioralTraitImpl value,
    $Res Function(_$BehavioralTraitImpl) then,
  ) = __$$BehavioralTraitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    TraitCategory category,
    double score,
    TraitImpact impact,
    String? recommendation,
  });
}

/// @nodoc
class __$$BehavioralTraitImplCopyWithImpl<$Res>
    extends _$BehavioralTraitCopyWithImpl<$Res, _$BehavioralTraitImpl>
    implements _$$BehavioralTraitImplCopyWith<$Res> {
  __$$BehavioralTraitImplCopyWithImpl(
    _$BehavioralTraitImpl _value,
    $Res Function(_$BehavioralTraitImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BehavioralTrait
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? score = null,
    Object? impact = null,
    Object? recommendation = freezed,
  }) {
    return _then(
      _$BehavioralTraitImpl(
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
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as TraitCategory,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as double,
        impact: null == impact
            ? _value.impact
            : impact // ignore: cast_nullable_to_non_nullable
                  as TraitImpact,
        recommendation: freezed == recommendation
            ? _value.recommendation
            : recommendation // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BehavioralTraitImpl implements _BehavioralTrait {
  const _$BehavioralTraitImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.score,
    required this.impact,
    this.recommendation,
  });

  factory _$BehavioralTraitImpl.fromJson(Map<String, dynamic> json) =>
      _$$BehavioralTraitImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final TraitCategory category;
  @override
  final double score;
  // 0-100
  @override
  final TraitImpact impact;
  // positive, negative, neutral
  @override
  final String? recommendation;

  @override
  String toString() {
    return 'BehavioralTrait(id: $id, name: $name, description: $description, category: $category, score: $score, impact: $impact, recommendation: $recommendation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BehavioralTraitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.impact, impact) || other.impact == impact) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    category,
    score,
    impact,
    recommendation,
  );

  /// Create a copy of BehavioralTrait
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BehavioralTraitImplCopyWith<_$BehavioralTraitImpl> get copyWith =>
      __$$BehavioralTraitImplCopyWithImpl<_$BehavioralTraitImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BehavioralTraitImplToJson(this);
  }
}

abstract class _BehavioralTrait implements BehavioralTrait {
  const factory _BehavioralTrait({
    required final String id,
    required final String name,
    required final String description,
    required final TraitCategory category,
    required final double score,
    required final TraitImpact impact,
    final String? recommendation,
  }) = _$BehavioralTraitImpl;

  factory _BehavioralTrait.fromJson(Map<String, dynamic> json) =
      _$BehavioralTraitImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  TraitCategory get category;
  @override
  double get score; // 0-100
  @override
  TraitImpact get impact; // positive, negative, neutral
  @override
  String? get recommendation;

  /// Create a copy of BehavioralTrait
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BehavioralTraitImplCopyWith<_$BehavioralTraitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DNAComparison _$DNAComparisonFromJson(Map<String, dynamic> json) {
  return _DNAComparison.fromJson(json);
}

/// @nodoc
mixin _$DNAComparison {
  double get similarityScore => throw _privateConstructorUsedError; // 0-100
  List<String> get anomalies => throw _privateConstructorUsedError;
  bool get isSuspicious => throw _privateConstructorUsedError;
  String get comparisonPeriod => throw _privateConstructorUsedError;
  Map<String, double>? get categoryDeviations =>
      throw _privateConstructorUsedError;
  Map<String, double>? get timeDeviations => throw _privateConstructorUsedError;

  /// Serializes this DNAComparison to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DNAComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DNAComparisonCopyWith<DNAComparison> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DNAComparisonCopyWith<$Res> {
  factory $DNAComparisonCopyWith(
    DNAComparison value,
    $Res Function(DNAComparison) then,
  ) = _$DNAComparisonCopyWithImpl<$Res, DNAComparison>;
  @useResult
  $Res call({
    double similarityScore,
    List<String> anomalies,
    bool isSuspicious,
    String comparisonPeriod,
    Map<String, double>? categoryDeviations,
    Map<String, double>? timeDeviations,
  });
}

/// @nodoc
class _$DNAComparisonCopyWithImpl<$Res, $Val extends DNAComparison>
    implements $DNAComparisonCopyWith<$Res> {
  _$DNAComparisonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DNAComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? similarityScore = null,
    Object? anomalies = null,
    Object? isSuspicious = null,
    Object? comparisonPeriod = null,
    Object? categoryDeviations = freezed,
    Object? timeDeviations = freezed,
  }) {
    return _then(
      _value.copyWith(
            similarityScore: null == similarityScore
                ? _value.similarityScore
                : similarityScore // ignore: cast_nullable_to_non_nullable
                      as double,
            anomalies: null == anomalies
                ? _value.anomalies
                : anomalies // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isSuspicious: null == isSuspicious
                ? _value.isSuspicious
                : isSuspicious // ignore: cast_nullable_to_non_nullable
                      as bool,
            comparisonPeriod: null == comparisonPeriod
                ? _value.comparisonPeriod
                : comparisonPeriod // ignore: cast_nullable_to_non_nullable
                      as String,
            categoryDeviations: freezed == categoryDeviations
                ? _value.categoryDeviations
                : categoryDeviations // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>?,
            timeDeviations: freezed == timeDeviations
                ? _value.timeDeviations
                : timeDeviations // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DNAComparisonImplCopyWith<$Res>
    implements $DNAComparisonCopyWith<$Res> {
  factory _$$DNAComparisonImplCopyWith(
    _$DNAComparisonImpl value,
    $Res Function(_$DNAComparisonImpl) then,
  ) = __$$DNAComparisonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double similarityScore,
    List<String> anomalies,
    bool isSuspicious,
    String comparisonPeriod,
    Map<String, double>? categoryDeviations,
    Map<String, double>? timeDeviations,
  });
}

/// @nodoc
class __$$DNAComparisonImplCopyWithImpl<$Res>
    extends _$DNAComparisonCopyWithImpl<$Res, _$DNAComparisonImpl>
    implements _$$DNAComparisonImplCopyWith<$Res> {
  __$$DNAComparisonImplCopyWithImpl(
    _$DNAComparisonImpl _value,
    $Res Function(_$DNAComparisonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DNAComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? similarityScore = null,
    Object? anomalies = null,
    Object? isSuspicious = null,
    Object? comparisonPeriod = null,
    Object? categoryDeviations = freezed,
    Object? timeDeviations = freezed,
  }) {
    return _then(
      _$DNAComparisonImpl(
        similarityScore: null == similarityScore
            ? _value.similarityScore
            : similarityScore // ignore: cast_nullable_to_non_nullable
                  as double,
        anomalies: null == anomalies
            ? _value._anomalies
            : anomalies // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isSuspicious: null == isSuspicious
            ? _value.isSuspicious
            : isSuspicious // ignore: cast_nullable_to_non_nullable
                  as bool,
        comparisonPeriod: null == comparisonPeriod
            ? _value.comparisonPeriod
            : comparisonPeriod // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryDeviations: freezed == categoryDeviations
            ? _value._categoryDeviations
            : categoryDeviations // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>?,
        timeDeviations: freezed == timeDeviations
            ? _value._timeDeviations
            : timeDeviations // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DNAComparisonImpl implements _DNAComparison {
  const _$DNAComparisonImpl({
    required this.similarityScore,
    required final List<String> anomalies,
    required this.isSuspicious,
    required this.comparisonPeriod,
    final Map<String, double>? categoryDeviations,
    final Map<String, double>? timeDeviations,
  }) : _anomalies = anomalies,
       _categoryDeviations = categoryDeviations,
       _timeDeviations = timeDeviations;

  factory _$DNAComparisonImpl.fromJson(Map<String, dynamic> json) =>
      _$$DNAComparisonImplFromJson(json);

  @override
  final double similarityScore;
  // 0-100
  final List<String> _anomalies;
  // 0-100
  @override
  List<String> get anomalies {
    if (_anomalies is EqualUnmodifiableListView) return _anomalies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_anomalies);
  }

  @override
  final bool isSuspicious;
  @override
  final String comparisonPeriod;
  final Map<String, double>? _categoryDeviations;
  @override
  Map<String, double>? get categoryDeviations {
    final value = _categoryDeviations;
    if (value == null) return null;
    if (_categoryDeviations is EqualUnmodifiableMapView)
      return _categoryDeviations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, double>? _timeDeviations;
  @override
  Map<String, double>? get timeDeviations {
    final value = _timeDeviations;
    if (value == null) return null;
    if (_timeDeviations is EqualUnmodifiableMapView) return _timeDeviations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'DNAComparison(similarityScore: $similarityScore, anomalies: $anomalies, isSuspicious: $isSuspicious, comparisonPeriod: $comparisonPeriod, categoryDeviations: $categoryDeviations, timeDeviations: $timeDeviations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DNAComparisonImpl &&
            (identical(other.similarityScore, similarityScore) ||
                other.similarityScore == similarityScore) &&
            const DeepCollectionEquality().equals(
              other._anomalies,
              _anomalies,
            ) &&
            (identical(other.isSuspicious, isSuspicious) ||
                other.isSuspicious == isSuspicious) &&
            (identical(other.comparisonPeriod, comparisonPeriod) ||
                other.comparisonPeriod == comparisonPeriod) &&
            const DeepCollectionEquality().equals(
              other._categoryDeviations,
              _categoryDeviations,
            ) &&
            const DeepCollectionEquality().equals(
              other._timeDeviations,
              _timeDeviations,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    similarityScore,
    const DeepCollectionEquality().hash(_anomalies),
    isSuspicious,
    comparisonPeriod,
    const DeepCollectionEquality().hash(_categoryDeviations),
    const DeepCollectionEquality().hash(_timeDeviations),
  );

  /// Create a copy of DNAComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DNAComparisonImplCopyWith<_$DNAComparisonImpl> get copyWith =>
      __$$DNAComparisonImplCopyWithImpl<_$DNAComparisonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DNAComparisonImplToJson(this);
  }
}

abstract class _DNAComparison implements DNAComparison {
  const factory _DNAComparison({
    required final double similarityScore,
    required final List<String> anomalies,
    required final bool isSuspicious,
    required final String comparisonPeriod,
    final Map<String, double>? categoryDeviations,
    final Map<String, double>? timeDeviations,
  }) = _$DNAComparisonImpl;

  factory _DNAComparison.fromJson(Map<String, dynamic> json) =
      _$DNAComparisonImpl.fromJson;

  @override
  double get similarityScore; // 0-100
  @override
  List<String> get anomalies;
  @override
  bool get isSuspicious;
  @override
  String get comparisonPeriod;
  @override
  Map<String, double>? get categoryDeviations;
  @override
  Map<String, double>? get timeDeviations;

  /// Create a copy of DNAComparison
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DNAComparisonImplCopyWith<_$DNAComparisonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
