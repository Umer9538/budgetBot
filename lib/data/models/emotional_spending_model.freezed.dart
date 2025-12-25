// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emotional_spending_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EmotionalSpendingAnalysis _$EmotionalSpendingAnalysisFromJson(
  Map<String, dynamic> json,
) {
  return _EmotionalSpendingAnalysis.fromJson(json);
}

/// @nodoc
mixin _$EmotionalSpendingAnalysis {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get analysisDate => throw _privateConstructorUsedError;
  EmotionalSpendingProfile get profile => throw _privateConstructorUsedError;
  List<EmotionalPattern> get patterns => throw _privateConstructorUsedError;
  List<EmotionalTrigger> get triggers => throw _privateConstructorUsedError;
  List<String> get recommendations => throw _privateConstructorUsedError;
  double? get totalEmotionalSpending => throw _privateConstructorUsedError;
  double? get percentageOfTotal => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this EmotionalSpendingAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmotionalSpendingAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmotionalSpendingAnalysisCopyWith<EmotionalSpendingAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmotionalSpendingAnalysisCopyWith<$Res> {
  factory $EmotionalSpendingAnalysisCopyWith(
    EmotionalSpendingAnalysis value,
    $Res Function(EmotionalSpendingAnalysis) then,
  ) = _$EmotionalSpendingAnalysisCopyWithImpl<$Res, EmotionalSpendingAnalysis>;
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime analysisDate,
    EmotionalSpendingProfile profile,
    List<EmotionalPattern> patterns,
    List<EmotionalTrigger> triggers,
    List<String> recommendations,
    double? totalEmotionalSpending,
    double? percentageOfTotal,
    DateTime? createdAt,
  });

  $EmotionalSpendingProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$EmotionalSpendingAnalysisCopyWithImpl<
  $Res,
  $Val extends EmotionalSpendingAnalysis
>
    implements $EmotionalSpendingAnalysisCopyWith<$Res> {
  _$EmotionalSpendingAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmotionalSpendingAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? analysisDate = null,
    Object? profile = null,
    Object? patterns = null,
    Object? triggers = null,
    Object? recommendations = null,
    Object? totalEmotionalSpending = freezed,
    Object? percentageOfTotal = freezed,
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
            profile: null == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                      as EmotionalSpendingProfile,
            patterns: null == patterns
                ? _value.patterns
                : patterns // ignore: cast_nullable_to_non_nullable
                      as List<EmotionalPattern>,
            triggers: null == triggers
                ? _value.triggers
                : triggers // ignore: cast_nullable_to_non_nullable
                      as List<EmotionalTrigger>,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            totalEmotionalSpending: freezed == totalEmotionalSpending
                ? _value.totalEmotionalSpending
                : totalEmotionalSpending // ignore: cast_nullable_to_non_nullable
                      as double?,
            percentageOfTotal: freezed == percentageOfTotal
                ? _value.percentageOfTotal
                : percentageOfTotal // ignore: cast_nullable_to_non_nullable
                      as double?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of EmotionalSpendingAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmotionalSpendingProfileCopyWith<$Res> get profile {
    return $EmotionalSpendingProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EmotionalSpendingAnalysisImplCopyWith<$Res>
    implements $EmotionalSpendingAnalysisCopyWith<$Res> {
  factory _$$EmotionalSpendingAnalysisImplCopyWith(
    _$EmotionalSpendingAnalysisImpl value,
    $Res Function(_$EmotionalSpendingAnalysisImpl) then,
  ) = __$$EmotionalSpendingAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime analysisDate,
    EmotionalSpendingProfile profile,
    List<EmotionalPattern> patterns,
    List<EmotionalTrigger> triggers,
    List<String> recommendations,
    double? totalEmotionalSpending,
    double? percentageOfTotal,
    DateTime? createdAt,
  });

  @override
  $EmotionalSpendingProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$EmotionalSpendingAnalysisImplCopyWithImpl<$Res>
    extends
        _$EmotionalSpendingAnalysisCopyWithImpl<
          $Res,
          _$EmotionalSpendingAnalysisImpl
        >
    implements _$$EmotionalSpendingAnalysisImplCopyWith<$Res> {
  __$$EmotionalSpendingAnalysisImplCopyWithImpl(
    _$EmotionalSpendingAnalysisImpl _value,
    $Res Function(_$EmotionalSpendingAnalysisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmotionalSpendingAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? analysisDate = null,
    Object? profile = null,
    Object? patterns = null,
    Object? triggers = null,
    Object? recommendations = null,
    Object? totalEmotionalSpending = freezed,
    Object? percentageOfTotal = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$EmotionalSpendingAnalysisImpl(
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
        profile: null == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as EmotionalSpendingProfile,
        patterns: null == patterns
            ? _value._patterns
            : patterns // ignore: cast_nullable_to_non_nullable
                  as List<EmotionalPattern>,
        triggers: null == triggers
            ? _value._triggers
            : triggers // ignore: cast_nullable_to_non_nullable
                  as List<EmotionalTrigger>,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        totalEmotionalSpending: freezed == totalEmotionalSpending
            ? _value.totalEmotionalSpending
            : totalEmotionalSpending // ignore: cast_nullable_to_non_nullable
                  as double?,
        percentageOfTotal: freezed == percentageOfTotal
            ? _value.percentageOfTotal
            : percentageOfTotal // ignore: cast_nullable_to_non_nullable
                  as double?,
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
class _$EmotionalSpendingAnalysisImpl implements _EmotionalSpendingAnalysis {
  const _$EmotionalSpendingAnalysisImpl({
    required this.id,
    required this.userId,
    required this.analysisDate,
    required this.profile,
    final List<EmotionalPattern> patterns = const [],
    final List<EmotionalTrigger> triggers = const [],
    final List<String> recommendations = const [],
    this.totalEmotionalSpending,
    this.percentageOfTotal,
    this.createdAt,
  }) : _patterns = patterns,
       _triggers = triggers,
       _recommendations = recommendations;

  factory _$EmotionalSpendingAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmotionalSpendingAnalysisImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime analysisDate;
  @override
  final EmotionalSpendingProfile profile;
  final List<EmotionalPattern> _patterns;
  @override
  @JsonKey()
  List<EmotionalPattern> get patterns {
    if (_patterns is EqualUnmodifiableListView) return _patterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_patterns);
  }

  final List<EmotionalTrigger> _triggers;
  @override
  @JsonKey()
  List<EmotionalTrigger> get triggers {
    if (_triggers is EqualUnmodifiableListView) return _triggers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_triggers);
  }

  final List<String> _recommendations;
  @override
  @JsonKey()
  List<String> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  final double? totalEmotionalSpending;
  @override
  final double? percentageOfTotal;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'EmotionalSpendingAnalysis(id: $id, userId: $userId, analysisDate: $analysisDate, profile: $profile, patterns: $patterns, triggers: $triggers, recommendations: $recommendations, totalEmotionalSpending: $totalEmotionalSpending, percentageOfTotal: $percentageOfTotal, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmotionalSpendingAnalysisImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.analysisDate, analysisDate) ||
                other.analysisDate == analysisDate) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(other._patterns, _patterns) &&
            const DeepCollectionEquality().equals(other._triggers, _triggers) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            (identical(other.totalEmotionalSpending, totalEmotionalSpending) ||
                other.totalEmotionalSpending == totalEmotionalSpending) &&
            (identical(other.percentageOfTotal, percentageOfTotal) ||
                other.percentageOfTotal == percentageOfTotal) &&
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
    profile,
    const DeepCollectionEquality().hash(_patterns),
    const DeepCollectionEquality().hash(_triggers),
    const DeepCollectionEquality().hash(_recommendations),
    totalEmotionalSpending,
    percentageOfTotal,
    createdAt,
  );

  /// Create a copy of EmotionalSpendingAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmotionalSpendingAnalysisImplCopyWith<_$EmotionalSpendingAnalysisImpl>
  get copyWith =>
      __$$EmotionalSpendingAnalysisImplCopyWithImpl<
        _$EmotionalSpendingAnalysisImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmotionalSpendingAnalysisImplToJson(this);
  }
}

abstract class _EmotionalSpendingAnalysis implements EmotionalSpendingAnalysis {
  const factory _EmotionalSpendingAnalysis({
    required final String id,
    required final String userId,
    required final DateTime analysisDate,
    required final EmotionalSpendingProfile profile,
    final List<EmotionalPattern> patterns,
    final List<EmotionalTrigger> triggers,
    final List<String> recommendations,
    final double? totalEmotionalSpending,
    final double? percentageOfTotal,
    final DateTime? createdAt,
  }) = _$EmotionalSpendingAnalysisImpl;

  factory _EmotionalSpendingAnalysis.fromJson(Map<String, dynamic> json) =
      _$EmotionalSpendingAnalysisImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get analysisDate;
  @override
  EmotionalSpendingProfile get profile;
  @override
  List<EmotionalPattern> get patterns;
  @override
  List<EmotionalTrigger> get triggers;
  @override
  List<String> get recommendations;
  @override
  double? get totalEmotionalSpending;
  @override
  double? get percentageOfTotal;
  @override
  DateTime? get createdAt;

  /// Create a copy of EmotionalSpendingAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmotionalSpendingAnalysisImplCopyWith<_$EmotionalSpendingAnalysisImpl>
  get copyWith => throw _privateConstructorUsedError;
}

EmotionalSpendingProfile _$EmotionalSpendingProfileFromJson(
  Map<String, dynamic> json,
) {
  return _EmotionalSpendingProfile.fromJson(json);
}

/// @nodoc
mixin _$EmotionalSpendingProfile {
  MoodType get dominantMood => throw _privateConstructorUsedError;
  double get emotionalSpendingScore =>
      throw _privateConstructorUsedError; // 0-100
  Map<String, double> get moodSpendingMap =>
      throw _privateConstructorUsedError; // mood -> avg spending
  Map<String, int> get moodFrequencyMap =>
      throw _privateConstructorUsedError; // mood -> count
  String? get primaryTriggerCategory => throw _privateConstructorUsedError;
  String? get primaryTriggerTime => throw _privateConstructorUsedError;
  bool get isHighRiskSpender => throw _privateConstructorUsedError;
  List<String> get vulnerableMoods => throw _privateConstructorUsedError;

  /// Serializes this EmotionalSpendingProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmotionalSpendingProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmotionalSpendingProfileCopyWith<EmotionalSpendingProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmotionalSpendingProfileCopyWith<$Res> {
  factory $EmotionalSpendingProfileCopyWith(
    EmotionalSpendingProfile value,
    $Res Function(EmotionalSpendingProfile) then,
  ) = _$EmotionalSpendingProfileCopyWithImpl<$Res, EmotionalSpendingProfile>;
  @useResult
  $Res call({
    MoodType dominantMood,
    double emotionalSpendingScore,
    Map<String, double> moodSpendingMap,
    Map<String, int> moodFrequencyMap,
    String? primaryTriggerCategory,
    String? primaryTriggerTime,
    bool isHighRiskSpender,
    List<String> vulnerableMoods,
  });
}

/// @nodoc
class _$EmotionalSpendingProfileCopyWithImpl<
  $Res,
  $Val extends EmotionalSpendingProfile
>
    implements $EmotionalSpendingProfileCopyWith<$Res> {
  _$EmotionalSpendingProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmotionalSpendingProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dominantMood = null,
    Object? emotionalSpendingScore = null,
    Object? moodSpendingMap = null,
    Object? moodFrequencyMap = null,
    Object? primaryTriggerCategory = freezed,
    Object? primaryTriggerTime = freezed,
    Object? isHighRiskSpender = null,
    Object? vulnerableMoods = null,
  }) {
    return _then(
      _value.copyWith(
            dominantMood: null == dominantMood
                ? _value.dominantMood
                : dominantMood // ignore: cast_nullable_to_non_nullable
                      as MoodType,
            emotionalSpendingScore: null == emotionalSpendingScore
                ? _value.emotionalSpendingScore
                : emotionalSpendingScore // ignore: cast_nullable_to_non_nullable
                      as double,
            moodSpendingMap: null == moodSpendingMap
                ? _value.moodSpendingMap
                : moodSpendingMap // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            moodFrequencyMap: null == moodFrequencyMap
                ? _value.moodFrequencyMap
                : moodFrequencyMap // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
            primaryTriggerCategory: freezed == primaryTriggerCategory
                ? _value.primaryTriggerCategory
                : primaryTriggerCategory // ignore: cast_nullable_to_non_nullable
                      as String?,
            primaryTriggerTime: freezed == primaryTriggerTime
                ? _value.primaryTriggerTime
                : primaryTriggerTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            isHighRiskSpender: null == isHighRiskSpender
                ? _value.isHighRiskSpender
                : isHighRiskSpender // ignore: cast_nullable_to_non_nullable
                      as bool,
            vulnerableMoods: null == vulnerableMoods
                ? _value.vulnerableMoods
                : vulnerableMoods // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmotionalSpendingProfileImplCopyWith<$Res>
    implements $EmotionalSpendingProfileCopyWith<$Res> {
  factory _$$EmotionalSpendingProfileImplCopyWith(
    _$EmotionalSpendingProfileImpl value,
    $Res Function(_$EmotionalSpendingProfileImpl) then,
  ) = __$$EmotionalSpendingProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    MoodType dominantMood,
    double emotionalSpendingScore,
    Map<String, double> moodSpendingMap,
    Map<String, int> moodFrequencyMap,
    String? primaryTriggerCategory,
    String? primaryTriggerTime,
    bool isHighRiskSpender,
    List<String> vulnerableMoods,
  });
}

/// @nodoc
class __$$EmotionalSpendingProfileImplCopyWithImpl<$Res>
    extends
        _$EmotionalSpendingProfileCopyWithImpl<
          $Res,
          _$EmotionalSpendingProfileImpl
        >
    implements _$$EmotionalSpendingProfileImplCopyWith<$Res> {
  __$$EmotionalSpendingProfileImplCopyWithImpl(
    _$EmotionalSpendingProfileImpl _value,
    $Res Function(_$EmotionalSpendingProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmotionalSpendingProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dominantMood = null,
    Object? emotionalSpendingScore = null,
    Object? moodSpendingMap = null,
    Object? moodFrequencyMap = null,
    Object? primaryTriggerCategory = freezed,
    Object? primaryTriggerTime = freezed,
    Object? isHighRiskSpender = null,
    Object? vulnerableMoods = null,
  }) {
    return _then(
      _$EmotionalSpendingProfileImpl(
        dominantMood: null == dominantMood
            ? _value.dominantMood
            : dominantMood // ignore: cast_nullable_to_non_nullable
                  as MoodType,
        emotionalSpendingScore: null == emotionalSpendingScore
            ? _value.emotionalSpendingScore
            : emotionalSpendingScore // ignore: cast_nullable_to_non_nullable
                  as double,
        moodSpendingMap: null == moodSpendingMap
            ? _value._moodSpendingMap
            : moodSpendingMap // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        moodFrequencyMap: null == moodFrequencyMap
            ? _value._moodFrequencyMap
            : moodFrequencyMap // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
        primaryTriggerCategory: freezed == primaryTriggerCategory
            ? _value.primaryTriggerCategory
            : primaryTriggerCategory // ignore: cast_nullable_to_non_nullable
                  as String?,
        primaryTriggerTime: freezed == primaryTriggerTime
            ? _value.primaryTriggerTime
            : primaryTriggerTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        isHighRiskSpender: null == isHighRiskSpender
            ? _value.isHighRiskSpender
            : isHighRiskSpender // ignore: cast_nullable_to_non_nullable
                  as bool,
        vulnerableMoods: null == vulnerableMoods
            ? _value._vulnerableMoods
            : vulnerableMoods // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmotionalSpendingProfileImpl implements _EmotionalSpendingProfile {
  const _$EmotionalSpendingProfileImpl({
    required this.dominantMood,
    required this.emotionalSpendingScore,
    required final Map<String, double> moodSpendingMap,
    required final Map<String, int> moodFrequencyMap,
    this.primaryTriggerCategory,
    this.primaryTriggerTime,
    this.isHighRiskSpender = false,
    final List<String> vulnerableMoods = const [],
  }) : _moodSpendingMap = moodSpendingMap,
       _moodFrequencyMap = moodFrequencyMap,
       _vulnerableMoods = vulnerableMoods;

  factory _$EmotionalSpendingProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmotionalSpendingProfileImplFromJson(json);

  @override
  final MoodType dominantMood;
  @override
  final double emotionalSpendingScore;
  // 0-100
  final Map<String, double> _moodSpendingMap;
  // 0-100
  @override
  Map<String, double> get moodSpendingMap {
    if (_moodSpendingMap is EqualUnmodifiableMapView) return _moodSpendingMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_moodSpendingMap);
  }

  // mood -> avg spending
  final Map<String, int> _moodFrequencyMap;
  // mood -> avg spending
  @override
  Map<String, int> get moodFrequencyMap {
    if (_moodFrequencyMap is EqualUnmodifiableMapView) return _moodFrequencyMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_moodFrequencyMap);
  }

  // mood -> count
  @override
  final String? primaryTriggerCategory;
  @override
  final String? primaryTriggerTime;
  @override
  @JsonKey()
  final bool isHighRiskSpender;
  final List<String> _vulnerableMoods;
  @override
  @JsonKey()
  List<String> get vulnerableMoods {
    if (_vulnerableMoods is EqualUnmodifiableListView) return _vulnerableMoods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vulnerableMoods);
  }

  @override
  String toString() {
    return 'EmotionalSpendingProfile(dominantMood: $dominantMood, emotionalSpendingScore: $emotionalSpendingScore, moodSpendingMap: $moodSpendingMap, moodFrequencyMap: $moodFrequencyMap, primaryTriggerCategory: $primaryTriggerCategory, primaryTriggerTime: $primaryTriggerTime, isHighRiskSpender: $isHighRiskSpender, vulnerableMoods: $vulnerableMoods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmotionalSpendingProfileImpl &&
            (identical(other.dominantMood, dominantMood) ||
                other.dominantMood == dominantMood) &&
            (identical(other.emotionalSpendingScore, emotionalSpendingScore) ||
                other.emotionalSpendingScore == emotionalSpendingScore) &&
            const DeepCollectionEquality().equals(
              other._moodSpendingMap,
              _moodSpendingMap,
            ) &&
            const DeepCollectionEquality().equals(
              other._moodFrequencyMap,
              _moodFrequencyMap,
            ) &&
            (identical(other.primaryTriggerCategory, primaryTriggerCategory) ||
                other.primaryTriggerCategory == primaryTriggerCategory) &&
            (identical(other.primaryTriggerTime, primaryTriggerTime) ||
                other.primaryTriggerTime == primaryTriggerTime) &&
            (identical(other.isHighRiskSpender, isHighRiskSpender) ||
                other.isHighRiskSpender == isHighRiskSpender) &&
            const DeepCollectionEquality().equals(
              other._vulnerableMoods,
              _vulnerableMoods,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    dominantMood,
    emotionalSpendingScore,
    const DeepCollectionEquality().hash(_moodSpendingMap),
    const DeepCollectionEquality().hash(_moodFrequencyMap),
    primaryTriggerCategory,
    primaryTriggerTime,
    isHighRiskSpender,
    const DeepCollectionEquality().hash(_vulnerableMoods),
  );

  /// Create a copy of EmotionalSpendingProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmotionalSpendingProfileImplCopyWith<_$EmotionalSpendingProfileImpl>
  get copyWith =>
      __$$EmotionalSpendingProfileImplCopyWithImpl<
        _$EmotionalSpendingProfileImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmotionalSpendingProfileImplToJson(this);
  }
}

abstract class _EmotionalSpendingProfile implements EmotionalSpendingProfile {
  const factory _EmotionalSpendingProfile({
    required final MoodType dominantMood,
    required final double emotionalSpendingScore,
    required final Map<String, double> moodSpendingMap,
    required final Map<String, int> moodFrequencyMap,
    final String? primaryTriggerCategory,
    final String? primaryTriggerTime,
    final bool isHighRiskSpender,
    final List<String> vulnerableMoods,
  }) = _$EmotionalSpendingProfileImpl;

  factory _EmotionalSpendingProfile.fromJson(Map<String, dynamic> json) =
      _$EmotionalSpendingProfileImpl.fromJson;

  @override
  MoodType get dominantMood;
  @override
  double get emotionalSpendingScore; // 0-100
  @override
  Map<String, double> get moodSpendingMap; // mood -> avg spending
  @override
  Map<String, int> get moodFrequencyMap; // mood -> count
  @override
  String? get primaryTriggerCategory;
  @override
  String? get primaryTriggerTime;
  @override
  bool get isHighRiskSpender;
  @override
  List<String> get vulnerableMoods;

  /// Create a copy of EmotionalSpendingProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmotionalSpendingProfileImplCopyWith<_$EmotionalSpendingProfileImpl>
  get copyWith => throw _privateConstructorUsedError;
}

EmotionalPattern _$EmotionalPatternFromJson(Map<String, dynamic> json) {
  return _EmotionalPattern.fromJson(json);
}

/// @nodoc
mixin _$EmotionalPattern {
  String get id => throw _privateConstructorUsedError;
  MoodType get mood => throw _privateConstructorUsedError;
  PatternType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get avgAmount => throw _privateConstructorUsedError;
  int get occurrences => throw _privateConstructorUsedError;
  double get confidence => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get timeOfDay =>
      throw _privateConstructorUsedError; // morning, afternoon, evening, night
  String? get dayOfWeek => throw _privateConstructorUsedError;
  List<String> get associatedMerchants => throw _privateConstructorUsedError;

  /// Serializes this EmotionalPattern to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmotionalPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmotionalPatternCopyWith<EmotionalPattern> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmotionalPatternCopyWith<$Res> {
  factory $EmotionalPatternCopyWith(
    EmotionalPattern value,
    $Res Function(EmotionalPattern) then,
  ) = _$EmotionalPatternCopyWithImpl<$Res, EmotionalPattern>;
  @useResult
  $Res call({
    String id,
    MoodType mood,
    PatternType type,
    String description,
    double avgAmount,
    int occurrences,
    double confidence,
    String? category,
    String? timeOfDay,
    String? dayOfWeek,
    List<String> associatedMerchants,
  });
}

/// @nodoc
class _$EmotionalPatternCopyWithImpl<$Res, $Val extends EmotionalPattern>
    implements $EmotionalPatternCopyWith<$Res> {
  _$EmotionalPatternCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmotionalPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mood = null,
    Object? type = null,
    Object? description = null,
    Object? avgAmount = null,
    Object? occurrences = null,
    Object? confidence = null,
    Object? category = freezed,
    Object? timeOfDay = freezed,
    Object? dayOfWeek = freezed,
    Object? associatedMerchants = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            mood: null == mood
                ? _value.mood
                : mood // ignore: cast_nullable_to_non_nullable
                      as MoodType,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as PatternType,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            avgAmount: null == avgAmount
                ? _value.avgAmount
                : avgAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            occurrences: null == occurrences
                ? _value.occurrences
                : occurrences // ignore: cast_nullable_to_non_nullable
                      as int,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as double,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            timeOfDay: freezed == timeOfDay
                ? _value.timeOfDay
                : timeOfDay // ignore: cast_nullable_to_non_nullable
                      as String?,
            dayOfWeek: freezed == dayOfWeek
                ? _value.dayOfWeek
                : dayOfWeek // ignore: cast_nullable_to_non_nullable
                      as String?,
            associatedMerchants: null == associatedMerchants
                ? _value.associatedMerchants
                : associatedMerchants // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmotionalPatternImplCopyWith<$Res>
    implements $EmotionalPatternCopyWith<$Res> {
  factory _$$EmotionalPatternImplCopyWith(
    _$EmotionalPatternImpl value,
    $Res Function(_$EmotionalPatternImpl) then,
  ) = __$$EmotionalPatternImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    MoodType mood,
    PatternType type,
    String description,
    double avgAmount,
    int occurrences,
    double confidence,
    String? category,
    String? timeOfDay,
    String? dayOfWeek,
    List<String> associatedMerchants,
  });
}

/// @nodoc
class __$$EmotionalPatternImplCopyWithImpl<$Res>
    extends _$EmotionalPatternCopyWithImpl<$Res, _$EmotionalPatternImpl>
    implements _$$EmotionalPatternImplCopyWith<$Res> {
  __$$EmotionalPatternImplCopyWithImpl(
    _$EmotionalPatternImpl _value,
    $Res Function(_$EmotionalPatternImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmotionalPattern
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mood = null,
    Object? type = null,
    Object? description = null,
    Object? avgAmount = null,
    Object? occurrences = null,
    Object? confidence = null,
    Object? category = freezed,
    Object? timeOfDay = freezed,
    Object? dayOfWeek = freezed,
    Object? associatedMerchants = null,
  }) {
    return _then(
      _$EmotionalPatternImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        mood: null == mood
            ? _value.mood
            : mood // ignore: cast_nullable_to_non_nullable
                  as MoodType,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as PatternType,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        avgAmount: null == avgAmount
            ? _value.avgAmount
            : avgAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        occurrences: null == occurrences
            ? _value.occurrences
            : occurrences // ignore: cast_nullable_to_non_nullable
                  as int,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as double,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        timeOfDay: freezed == timeOfDay
            ? _value.timeOfDay
            : timeOfDay // ignore: cast_nullable_to_non_nullable
                  as String?,
        dayOfWeek: freezed == dayOfWeek
            ? _value.dayOfWeek
            : dayOfWeek // ignore: cast_nullable_to_non_nullable
                  as String?,
        associatedMerchants: null == associatedMerchants
            ? _value._associatedMerchants
            : associatedMerchants // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmotionalPatternImpl implements _EmotionalPattern {
  const _$EmotionalPatternImpl({
    required this.id,
    required this.mood,
    required this.type,
    required this.description,
    required this.avgAmount,
    required this.occurrences,
    required this.confidence,
    this.category,
    this.timeOfDay,
    this.dayOfWeek,
    final List<String> associatedMerchants = const [],
  }) : _associatedMerchants = associatedMerchants;

  factory _$EmotionalPatternImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmotionalPatternImplFromJson(json);

  @override
  final String id;
  @override
  final MoodType mood;
  @override
  final PatternType type;
  @override
  final String description;
  @override
  final double avgAmount;
  @override
  final int occurrences;
  @override
  final double confidence;
  @override
  final String? category;
  @override
  final String? timeOfDay;
  // morning, afternoon, evening, night
  @override
  final String? dayOfWeek;
  final List<String> _associatedMerchants;
  @override
  @JsonKey()
  List<String> get associatedMerchants {
    if (_associatedMerchants is EqualUnmodifiableListView)
      return _associatedMerchants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_associatedMerchants);
  }

  @override
  String toString() {
    return 'EmotionalPattern(id: $id, mood: $mood, type: $type, description: $description, avgAmount: $avgAmount, occurrences: $occurrences, confidence: $confidence, category: $category, timeOfDay: $timeOfDay, dayOfWeek: $dayOfWeek, associatedMerchants: $associatedMerchants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmotionalPatternImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.avgAmount, avgAmount) ||
                other.avgAmount == avgAmount) &&
            (identical(other.occurrences, occurrences) ||
                other.occurrences == occurrences) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.timeOfDay, timeOfDay) ||
                other.timeOfDay == timeOfDay) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            const DeepCollectionEquality().equals(
              other._associatedMerchants,
              _associatedMerchants,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    mood,
    type,
    description,
    avgAmount,
    occurrences,
    confidence,
    category,
    timeOfDay,
    dayOfWeek,
    const DeepCollectionEquality().hash(_associatedMerchants),
  );

  /// Create a copy of EmotionalPattern
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmotionalPatternImplCopyWith<_$EmotionalPatternImpl> get copyWith =>
      __$$EmotionalPatternImplCopyWithImpl<_$EmotionalPatternImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EmotionalPatternImplToJson(this);
  }
}

abstract class _EmotionalPattern implements EmotionalPattern {
  const factory _EmotionalPattern({
    required final String id,
    required final MoodType mood,
    required final PatternType type,
    required final String description,
    required final double avgAmount,
    required final int occurrences,
    required final double confidence,
    final String? category,
    final String? timeOfDay,
    final String? dayOfWeek,
    final List<String> associatedMerchants,
  }) = _$EmotionalPatternImpl;

  factory _EmotionalPattern.fromJson(Map<String, dynamic> json) =
      _$EmotionalPatternImpl.fromJson;

  @override
  String get id;
  @override
  MoodType get mood;
  @override
  PatternType get type;
  @override
  String get description;
  @override
  double get avgAmount;
  @override
  int get occurrences;
  @override
  double get confidence;
  @override
  String? get category;
  @override
  String? get timeOfDay; // morning, afternoon, evening, night
  @override
  String? get dayOfWeek;
  @override
  List<String> get associatedMerchants;

  /// Create a copy of EmotionalPattern
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmotionalPatternImplCopyWith<_$EmotionalPatternImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmotionalTrigger _$EmotionalTriggerFromJson(Map<String, dynamic> json) {
  return _EmotionalTrigger.fromJson(json);
}

/// @nodoc
mixin _$EmotionalTrigger {
  String get id => throw _privateConstructorUsedError;
  MoodType get triggerMood => throw _privateConstructorUsedError;
  TriggerType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get riskLevel => throw _privateConstructorUsedError; // 0-10
  double get avgSpendIncrease =>
      throw _privateConstructorUsedError; // percentage
  String? get category => throw _privateConstructorUsedError;
  String? get timePattern => throw _privateConstructorUsedError;
  List<String> get warningSignals => throw _privateConstructorUsedError;
  List<String> get copingStrategies => throw _privateConstructorUsedError;

  /// Serializes this EmotionalTrigger to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmotionalTrigger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmotionalTriggerCopyWith<EmotionalTrigger> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmotionalTriggerCopyWith<$Res> {
  factory $EmotionalTriggerCopyWith(
    EmotionalTrigger value,
    $Res Function(EmotionalTrigger) then,
  ) = _$EmotionalTriggerCopyWithImpl<$Res, EmotionalTrigger>;
  @useResult
  $Res call({
    String id,
    MoodType triggerMood,
    TriggerType type,
    String description,
    double riskLevel,
    double avgSpendIncrease,
    String? category,
    String? timePattern,
    List<String> warningSignals,
    List<String> copingStrategies,
  });
}

/// @nodoc
class _$EmotionalTriggerCopyWithImpl<$Res, $Val extends EmotionalTrigger>
    implements $EmotionalTriggerCopyWith<$Res> {
  _$EmotionalTriggerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmotionalTrigger
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? triggerMood = null,
    Object? type = null,
    Object? description = null,
    Object? riskLevel = null,
    Object? avgSpendIncrease = null,
    Object? category = freezed,
    Object? timePattern = freezed,
    Object? warningSignals = null,
    Object? copingStrategies = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            triggerMood: null == triggerMood
                ? _value.triggerMood
                : triggerMood // ignore: cast_nullable_to_non_nullable
                      as MoodType,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as TriggerType,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            riskLevel: null == riskLevel
                ? _value.riskLevel
                : riskLevel // ignore: cast_nullable_to_non_nullable
                      as double,
            avgSpendIncrease: null == avgSpendIncrease
                ? _value.avgSpendIncrease
                : avgSpendIncrease // ignore: cast_nullable_to_non_nullable
                      as double,
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
            timePattern: freezed == timePattern
                ? _value.timePattern
                : timePattern // ignore: cast_nullable_to_non_nullable
                      as String?,
            warningSignals: null == warningSignals
                ? _value.warningSignals
                : warningSignals // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            copingStrategies: null == copingStrategies
                ? _value.copingStrategies
                : copingStrategies // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EmotionalTriggerImplCopyWith<$Res>
    implements $EmotionalTriggerCopyWith<$Res> {
  factory _$$EmotionalTriggerImplCopyWith(
    _$EmotionalTriggerImpl value,
    $Res Function(_$EmotionalTriggerImpl) then,
  ) = __$$EmotionalTriggerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    MoodType triggerMood,
    TriggerType type,
    String description,
    double riskLevel,
    double avgSpendIncrease,
    String? category,
    String? timePattern,
    List<String> warningSignals,
    List<String> copingStrategies,
  });
}

/// @nodoc
class __$$EmotionalTriggerImplCopyWithImpl<$Res>
    extends _$EmotionalTriggerCopyWithImpl<$Res, _$EmotionalTriggerImpl>
    implements _$$EmotionalTriggerImplCopyWith<$Res> {
  __$$EmotionalTriggerImplCopyWithImpl(
    _$EmotionalTriggerImpl _value,
    $Res Function(_$EmotionalTriggerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmotionalTrigger
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? triggerMood = null,
    Object? type = null,
    Object? description = null,
    Object? riskLevel = null,
    Object? avgSpendIncrease = null,
    Object? category = freezed,
    Object? timePattern = freezed,
    Object? warningSignals = null,
    Object? copingStrategies = null,
  }) {
    return _then(
      _$EmotionalTriggerImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        triggerMood: null == triggerMood
            ? _value.triggerMood
            : triggerMood // ignore: cast_nullable_to_non_nullable
                  as MoodType,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as TriggerType,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        riskLevel: null == riskLevel
            ? _value.riskLevel
            : riskLevel // ignore: cast_nullable_to_non_nullable
                  as double,
        avgSpendIncrease: null == avgSpendIncrease
            ? _value.avgSpendIncrease
            : avgSpendIncrease // ignore: cast_nullable_to_non_nullable
                  as double,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
        timePattern: freezed == timePattern
            ? _value.timePattern
            : timePattern // ignore: cast_nullable_to_non_nullable
                  as String?,
        warningSignals: null == warningSignals
            ? _value._warningSignals
            : warningSignals // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        copingStrategies: null == copingStrategies
            ? _value._copingStrategies
            : copingStrategies // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EmotionalTriggerImpl implements _EmotionalTrigger {
  const _$EmotionalTriggerImpl({
    required this.id,
    required this.triggerMood,
    required this.type,
    required this.description,
    required this.riskLevel,
    required this.avgSpendIncrease,
    this.category,
    this.timePattern,
    final List<String> warningSignals = const [],
    final List<String> copingStrategies = const [],
  }) : _warningSignals = warningSignals,
       _copingStrategies = copingStrategies;

  factory _$EmotionalTriggerImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmotionalTriggerImplFromJson(json);

  @override
  final String id;
  @override
  final MoodType triggerMood;
  @override
  final TriggerType type;
  @override
  final String description;
  @override
  final double riskLevel;
  // 0-10
  @override
  final double avgSpendIncrease;
  // percentage
  @override
  final String? category;
  @override
  final String? timePattern;
  final List<String> _warningSignals;
  @override
  @JsonKey()
  List<String> get warningSignals {
    if (_warningSignals is EqualUnmodifiableListView) return _warningSignals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warningSignals);
  }

  final List<String> _copingStrategies;
  @override
  @JsonKey()
  List<String> get copingStrategies {
    if (_copingStrategies is EqualUnmodifiableListView)
      return _copingStrategies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_copingStrategies);
  }

  @override
  String toString() {
    return 'EmotionalTrigger(id: $id, triggerMood: $triggerMood, type: $type, description: $description, riskLevel: $riskLevel, avgSpendIncrease: $avgSpendIncrease, category: $category, timePattern: $timePattern, warningSignals: $warningSignals, copingStrategies: $copingStrategies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmotionalTriggerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.triggerMood, triggerMood) ||
                other.triggerMood == triggerMood) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            (identical(other.avgSpendIncrease, avgSpendIncrease) ||
                other.avgSpendIncrease == avgSpendIncrease) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.timePattern, timePattern) ||
                other.timePattern == timePattern) &&
            const DeepCollectionEquality().equals(
              other._warningSignals,
              _warningSignals,
            ) &&
            const DeepCollectionEquality().equals(
              other._copingStrategies,
              _copingStrategies,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    triggerMood,
    type,
    description,
    riskLevel,
    avgSpendIncrease,
    category,
    timePattern,
    const DeepCollectionEquality().hash(_warningSignals),
    const DeepCollectionEquality().hash(_copingStrategies),
  );

  /// Create a copy of EmotionalTrigger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmotionalTriggerImplCopyWith<_$EmotionalTriggerImpl> get copyWith =>
      __$$EmotionalTriggerImplCopyWithImpl<_$EmotionalTriggerImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EmotionalTriggerImplToJson(this);
  }
}

abstract class _EmotionalTrigger implements EmotionalTrigger {
  const factory _EmotionalTrigger({
    required final String id,
    required final MoodType triggerMood,
    required final TriggerType type,
    required final String description,
    required final double riskLevel,
    required final double avgSpendIncrease,
    final String? category,
    final String? timePattern,
    final List<String> warningSignals,
    final List<String> copingStrategies,
  }) = _$EmotionalTriggerImpl;

  factory _EmotionalTrigger.fromJson(Map<String, dynamic> json) =
      _$EmotionalTriggerImpl.fromJson;

  @override
  String get id;
  @override
  MoodType get triggerMood;
  @override
  TriggerType get type;
  @override
  String get description;
  @override
  double get riskLevel; // 0-10
  @override
  double get avgSpendIncrease; // percentage
  @override
  String? get category;
  @override
  String? get timePattern;
  @override
  List<String> get warningSignals;
  @override
  List<String> get copingStrategies;

  /// Create a copy of EmotionalTrigger
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmotionalTriggerImplCopyWith<_$EmotionalTriggerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MoodEntry _$MoodEntryFromJson(Map<String, dynamic> json) {
  return _MoodEntry.fromJson(json);
}

/// @nodoc
mixin _$MoodEntry {
  String get id => throw _privateConstructorUsedError;
  String get transactionId => throw _privateConstructorUsedError;
  MoodType get mood => throw _privateConstructorUsedError;
  int? get stressLevel => throw _privateConstructorUsedError; // 0-10
  String? get note => throw _privateConstructorUsedError;
  DateTime? get recordedAt => throw _privateConstructorUsedError;

  /// Serializes this MoodEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MoodEntryCopyWith<MoodEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoodEntryCopyWith<$Res> {
  factory $MoodEntryCopyWith(MoodEntry value, $Res Function(MoodEntry) then) =
      _$MoodEntryCopyWithImpl<$Res, MoodEntry>;
  @useResult
  $Res call({
    String id,
    String transactionId,
    MoodType mood,
    int? stressLevel,
    String? note,
    DateTime? recordedAt,
  });
}

/// @nodoc
class _$MoodEntryCopyWithImpl<$Res, $Val extends MoodEntry>
    implements $MoodEntryCopyWith<$Res> {
  _$MoodEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transactionId = null,
    Object? mood = null,
    Object? stressLevel = freezed,
    Object? note = freezed,
    Object? recordedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            transactionId: null == transactionId
                ? _value.transactionId
                : transactionId // ignore: cast_nullable_to_non_nullable
                      as String,
            mood: null == mood
                ? _value.mood
                : mood // ignore: cast_nullable_to_non_nullable
                      as MoodType,
            stressLevel: freezed == stressLevel
                ? _value.stressLevel
                : stressLevel // ignore: cast_nullable_to_non_nullable
                      as int?,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
            recordedAt: freezed == recordedAt
                ? _value.recordedAt
                : recordedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MoodEntryImplCopyWith<$Res>
    implements $MoodEntryCopyWith<$Res> {
  factory _$$MoodEntryImplCopyWith(
    _$MoodEntryImpl value,
    $Res Function(_$MoodEntryImpl) then,
  ) = __$$MoodEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String transactionId,
    MoodType mood,
    int? stressLevel,
    String? note,
    DateTime? recordedAt,
  });
}

/// @nodoc
class __$$MoodEntryImplCopyWithImpl<$Res>
    extends _$MoodEntryCopyWithImpl<$Res, _$MoodEntryImpl>
    implements _$$MoodEntryImplCopyWith<$Res> {
  __$$MoodEntryImplCopyWithImpl(
    _$MoodEntryImpl _value,
    $Res Function(_$MoodEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? transactionId = null,
    Object? mood = null,
    Object? stressLevel = freezed,
    Object? note = freezed,
    Object? recordedAt = freezed,
  }) {
    return _then(
      _$MoodEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        transactionId: null == transactionId
            ? _value.transactionId
            : transactionId // ignore: cast_nullable_to_non_nullable
                  as String,
        mood: null == mood
            ? _value.mood
            : mood // ignore: cast_nullable_to_non_nullable
                  as MoodType,
        stressLevel: freezed == stressLevel
            ? _value.stressLevel
            : stressLevel // ignore: cast_nullable_to_non_nullable
                  as int?,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
        recordedAt: freezed == recordedAt
            ? _value.recordedAt
            : recordedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MoodEntryImpl implements _MoodEntry {
  const _$MoodEntryImpl({
    required this.id,
    required this.transactionId,
    required this.mood,
    this.stressLevel,
    this.note,
    this.recordedAt,
  });

  factory _$MoodEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoodEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String transactionId;
  @override
  final MoodType mood;
  @override
  final int? stressLevel;
  // 0-10
  @override
  final String? note;
  @override
  final DateTime? recordedAt;

  @override
  String toString() {
    return 'MoodEntry(id: $id, transactionId: $transactionId, mood: $mood, stressLevel: $stressLevel, note: $note, recordedAt: $recordedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoodEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.stressLevel, stressLevel) ||
                other.stressLevel == stressLevel) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.recordedAt, recordedAt) ||
                other.recordedAt == recordedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    transactionId,
    mood,
    stressLevel,
    note,
    recordedAt,
  );

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MoodEntryImplCopyWith<_$MoodEntryImpl> get copyWith =>
      __$$MoodEntryImplCopyWithImpl<_$MoodEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoodEntryImplToJson(this);
  }
}

abstract class _MoodEntry implements MoodEntry {
  const factory _MoodEntry({
    required final String id,
    required final String transactionId,
    required final MoodType mood,
    final int? stressLevel,
    final String? note,
    final DateTime? recordedAt,
  }) = _$MoodEntryImpl;

  factory _MoodEntry.fromJson(Map<String, dynamic> json) =
      _$MoodEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get transactionId;
  @override
  MoodType get mood;
  @override
  int? get stressLevel; // 0-10
  @override
  String? get note;
  @override
  DateTime? get recordedAt;

  /// Create a copy of MoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MoodEntryImplCopyWith<_$MoodEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
