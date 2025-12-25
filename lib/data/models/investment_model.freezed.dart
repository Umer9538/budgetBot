// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'investment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InvestmentProfile _$InvestmentProfileFromJson(Map<String, dynamic> json) {
  return _InvestmentProfile.fromJson(json);
}

/// @nodoc
mixin _$InvestmentProfile {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  RiskAssessment get assessment => throw _privateConstructorUsedError;
  InvestmentRisk get riskProfile => throw _privateConstructorUsedError;
  int get riskScore => throw _privateConstructorUsedError; // 1-10
  List<InvestmentGoal> get goals => throw _privateConstructorUsedError;
  PortfolioAnalysis? get currentPortfolio => throw _privateConstructorUsedError;
  List<InvestmentRecommendation> get recommendations =>
      throw _privateConstructorUsedError;
  DateTime get assessedAt => throw _privateConstructorUsedError;
  DateTime? get nextReassessmentDate => throw _privateConstructorUsedError;

  /// Serializes this InvestmentProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvestmentProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvestmentProfileCopyWith<InvestmentProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentProfileCopyWith<$Res> {
  factory $InvestmentProfileCopyWith(
    InvestmentProfile value,
    $Res Function(InvestmentProfile) then,
  ) = _$InvestmentProfileCopyWithImpl<$Res, InvestmentProfile>;
  @useResult
  $Res call({
    String id,
    String userId,
    RiskAssessment assessment,
    InvestmentRisk riskProfile,
    int riskScore,
    List<InvestmentGoal> goals,
    PortfolioAnalysis? currentPortfolio,
    List<InvestmentRecommendation> recommendations,
    DateTime assessedAt,
    DateTime? nextReassessmentDate,
  });

  $RiskAssessmentCopyWith<$Res> get assessment;
  $PortfolioAnalysisCopyWith<$Res>? get currentPortfolio;
}

/// @nodoc
class _$InvestmentProfileCopyWithImpl<$Res, $Val extends InvestmentProfile>
    implements $InvestmentProfileCopyWith<$Res> {
  _$InvestmentProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvestmentProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? assessment = null,
    Object? riskProfile = null,
    Object? riskScore = null,
    Object? goals = null,
    Object? currentPortfolio = freezed,
    Object? recommendations = null,
    Object? assessedAt = null,
    Object? nextReassessmentDate = freezed,
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
            assessment: null == assessment
                ? _value.assessment
                : assessment // ignore: cast_nullable_to_non_nullable
                      as RiskAssessment,
            riskProfile: null == riskProfile
                ? _value.riskProfile
                : riskProfile // ignore: cast_nullable_to_non_nullable
                      as InvestmentRisk,
            riskScore: null == riskScore
                ? _value.riskScore
                : riskScore // ignore: cast_nullable_to_non_nullable
                      as int,
            goals: null == goals
                ? _value.goals
                : goals // ignore: cast_nullable_to_non_nullable
                      as List<InvestmentGoal>,
            currentPortfolio: freezed == currentPortfolio
                ? _value.currentPortfolio
                : currentPortfolio // ignore: cast_nullable_to_non_nullable
                      as PortfolioAnalysis?,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<InvestmentRecommendation>,
            assessedAt: null == assessedAt
                ? _value.assessedAt
                : assessedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            nextReassessmentDate: freezed == nextReassessmentDate
                ? _value.nextReassessmentDate
                : nextReassessmentDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of InvestmentProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RiskAssessmentCopyWith<$Res> get assessment {
    return $RiskAssessmentCopyWith<$Res>(_value.assessment, (value) {
      return _then(_value.copyWith(assessment: value) as $Val);
    });
  }

  /// Create a copy of InvestmentProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PortfolioAnalysisCopyWith<$Res>? get currentPortfolio {
    if (_value.currentPortfolio == null) {
      return null;
    }

    return $PortfolioAnalysisCopyWith<$Res>(_value.currentPortfolio!, (value) {
      return _then(_value.copyWith(currentPortfolio: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvestmentProfileImplCopyWith<$Res>
    implements $InvestmentProfileCopyWith<$Res> {
  factory _$$InvestmentProfileImplCopyWith(
    _$InvestmentProfileImpl value,
    $Res Function(_$InvestmentProfileImpl) then,
  ) = __$$InvestmentProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    RiskAssessment assessment,
    InvestmentRisk riskProfile,
    int riskScore,
    List<InvestmentGoal> goals,
    PortfolioAnalysis? currentPortfolio,
    List<InvestmentRecommendation> recommendations,
    DateTime assessedAt,
    DateTime? nextReassessmentDate,
  });

  @override
  $RiskAssessmentCopyWith<$Res> get assessment;
  @override
  $PortfolioAnalysisCopyWith<$Res>? get currentPortfolio;
}

/// @nodoc
class __$$InvestmentProfileImplCopyWithImpl<$Res>
    extends _$InvestmentProfileCopyWithImpl<$Res, _$InvestmentProfileImpl>
    implements _$$InvestmentProfileImplCopyWith<$Res> {
  __$$InvestmentProfileImplCopyWithImpl(
    _$InvestmentProfileImpl _value,
    $Res Function(_$InvestmentProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvestmentProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? assessment = null,
    Object? riskProfile = null,
    Object? riskScore = null,
    Object? goals = null,
    Object? currentPortfolio = freezed,
    Object? recommendations = null,
    Object? assessedAt = null,
    Object? nextReassessmentDate = freezed,
  }) {
    return _then(
      _$InvestmentProfileImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        assessment: null == assessment
            ? _value.assessment
            : assessment // ignore: cast_nullable_to_non_nullable
                  as RiskAssessment,
        riskProfile: null == riskProfile
            ? _value.riskProfile
            : riskProfile // ignore: cast_nullable_to_non_nullable
                  as InvestmentRisk,
        riskScore: null == riskScore
            ? _value.riskScore
            : riskScore // ignore: cast_nullable_to_non_nullable
                  as int,
        goals: null == goals
            ? _value._goals
            : goals // ignore: cast_nullable_to_non_nullable
                  as List<InvestmentGoal>,
        currentPortfolio: freezed == currentPortfolio
            ? _value.currentPortfolio
            : currentPortfolio // ignore: cast_nullable_to_non_nullable
                  as PortfolioAnalysis?,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<InvestmentRecommendation>,
        assessedAt: null == assessedAt
            ? _value.assessedAt
            : assessedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        nextReassessmentDate: freezed == nextReassessmentDate
            ? _value.nextReassessmentDate
            : nextReassessmentDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestmentProfileImpl implements _InvestmentProfile {
  const _$InvestmentProfileImpl({
    required this.id,
    required this.userId,
    required this.assessment,
    required this.riskProfile,
    required this.riskScore,
    required final List<InvestmentGoal> goals,
    required this.currentPortfolio,
    required final List<InvestmentRecommendation> recommendations,
    required this.assessedAt,
    required this.nextReassessmentDate,
  }) : _goals = goals,
       _recommendations = recommendations;

  factory _$InvestmentProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final RiskAssessment assessment;
  @override
  final InvestmentRisk riskProfile;
  @override
  final int riskScore;
  // 1-10
  final List<InvestmentGoal> _goals;
  // 1-10
  @override
  List<InvestmentGoal> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  final PortfolioAnalysis? currentPortfolio;
  final List<InvestmentRecommendation> _recommendations;
  @override
  List<InvestmentRecommendation> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  final DateTime assessedAt;
  @override
  final DateTime? nextReassessmentDate;

  @override
  String toString() {
    return 'InvestmentProfile(id: $id, userId: $userId, assessment: $assessment, riskProfile: $riskProfile, riskScore: $riskScore, goals: $goals, currentPortfolio: $currentPortfolio, recommendations: $recommendations, assessedAt: $assessedAt, nextReassessmentDate: $nextReassessmentDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.assessment, assessment) ||
                other.assessment == assessment) &&
            (identical(other.riskProfile, riskProfile) ||
                other.riskProfile == riskProfile) &&
            (identical(other.riskScore, riskScore) ||
                other.riskScore == riskScore) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            (identical(other.currentPortfolio, currentPortfolio) ||
                other.currentPortfolio == currentPortfolio) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ) &&
            (identical(other.assessedAt, assessedAt) ||
                other.assessedAt == assessedAt) &&
            (identical(other.nextReassessmentDate, nextReassessmentDate) ||
                other.nextReassessmentDate == nextReassessmentDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    assessment,
    riskProfile,
    riskScore,
    const DeepCollectionEquality().hash(_goals),
    currentPortfolio,
    const DeepCollectionEquality().hash(_recommendations),
    assessedAt,
    nextReassessmentDate,
  );

  /// Create a copy of InvestmentProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentProfileImplCopyWith<_$InvestmentProfileImpl> get copyWith =>
      __$$InvestmentProfileImplCopyWithImpl<_$InvestmentProfileImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentProfileImplToJson(this);
  }
}

abstract class _InvestmentProfile implements InvestmentProfile {
  const factory _InvestmentProfile({
    required final String id,
    required final String userId,
    required final RiskAssessment assessment,
    required final InvestmentRisk riskProfile,
    required final int riskScore,
    required final List<InvestmentGoal> goals,
    required final PortfolioAnalysis? currentPortfolio,
    required final List<InvestmentRecommendation> recommendations,
    required final DateTime assessedAt,
    required final DateTime? nextReassessmentDate,
  }) = _$InvestmentProfileImpl;

  factory _InvestmentProfile.fromJson(Map<String, dynamic> json) =
      _$InvestmentProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  RiskAssessment get assessment;
  @override
  InvestmentRisk get riskProfile;
  @override
  int get riskScore; // 1-10
  @override
  List<InvestmentGoal> get goals;
  @override
  PortfolioAnalysis? get currentPortfolio;
  @override
  List<InvestmentRecommendation> get recommendations;
  @override
  DateTime get assessedAt;
  @override
  DateTime? get nextReassessmentDate;

  /// Create a copy of InvestmentProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvestmentProfileImplCopyWith<_$InvestmentProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RiskAssessment _$RiskAssessmentFromJson(Map<String, dynamic> json) {
  return _RiskAssessment.fromJson(json);
}

/// @nodoc
mixin _$RiskAssessment {
  List<RiskAnswer> get answers => throw _privateConstructorUsedError;
  int get totalScore => throw _privateConstructorUsedError;
  BehavioralRiskFactors get behavioralFactors =>
      throw _privateConstructorUsedError;
  DateTime get completedAt => throw _privateConstructorUsedError;

  /// Serializes this RiskAssessment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RiskAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RiskAssessmentCopyWith<RiskAssessment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskAssessmentCopyWith<$Res> {
  factory $RiskAssessmentCopyWith(
    RiskAssessment value,
    $Res Function(RiskAssessment) then,
  ) = _$RiskAssessmentCopyWithImpl<$Res, RiskAssessment>;
  @useResult
  $Res call({
    List<RiskAnswer> answers,
    int totalScore,
    BehavioralRiskFactors behavioralFactors,
    DateTime completedAt,
  });

  $BehavioralRiskFactorsCopyWith<$Res> get behavioralFactors;
}

/// @nodoc
class _$RiskAssessmentCopyWithImpl<$Res, $Val extends RiskAssessment>
    implements $RiskAssessmentCopyWith<$Res> {
  _$RiskAssessmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RiskAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answers = null,
    Object? totalScore = null,
    Object? behavioralFactors = null,
    Object? completedAt = null,
  }) {
    return _then(
      _value.copyWith(
            answers: null == answers
                ? _value.answers
                : answers // ignore: cast_nullable_to_non_nullable
                      as List<RiskAnswer>,
            totalScore: null == totalScore
                ? _value.totalScore
                : totalScore // ignore: cast_nullable_to_non_nullable
                      as int,
            behavioralFactors: null == behavioralFactors
                ? _value.behavioralFactors
                : behavioralFactors // ignore: cast_nullable_to_non_nullable
                      as BehavioralRiskFactors,
            completedAt: null == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of RiskAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BehavioralRiskFactorsCopyWith<$Res> get behavioralFactors {
    return $BehavioralRiskFactorsCopyWith<$Res>(_value.behavioralFactors, (
      value,
    ) {
      return _then(_value.copyWith(behavioralFactors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RiskAssessmentImplCopyWith<$Res>
    implements $RiskAssessmentCopyWith<$Res> {
  factory _$$RiskAssessmentImplCopyWith(
    _$RiskAssessmentImpl value,
    $Res Function(_$RiskAssessmentImpl) then,
  ) = __$$RiskAssessmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<RiskAnswer> answers,
    int totalScore,
    BehavioralRiskFactors behavioralFactors,
    DateTime completedAt,
  });

  @override
  $BehavioralRiskFactorsCopyWith<$Res> get behavioralFactors;
}

/// @nodoc
class __$$RiskAssessmentImplCopyWithImpl<$Res>
    extends _$RiskAssessmentCopyWithImpl<$Res, _$RiskAssessmentImpl>
    implements _$$RiskAssessmentImplCopyWith<$Res> {
  __$$RiskAssessmentImplCopyWithImpl(
    _$RiskAssessmentImpl _value,
    $Res Function(_$RiskAssessmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RiskAssessment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? answers = null,
    Object? totalScore = null,
    Object? behavioralFactors = null,
    Object? completedAt = null,
  }) {
    return _then(
      _$RiskAssessmentImpl(
        answers: null == answers
            ? _value._answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as List<RiskAnswer>,
        totalScore: null == totalScore
            ? _value.totalScore
            : totalScore // ignore: cast_nullable_to_non_nullable
                  as int,
        behavioralFactors: null == behavioralFactors
            ? _value.behavioralFactors
            : behavioralFactors // ignore: cast_nullable_to_non_nullable
                  as BehavioralRiskFactors,
        completedAt: null == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RiskAssessmentImpl implements _RiskAssessment {
  const _$RiskAssessmentImpl({
    required final List<RiskAnswer> answers,
    required this.totalScore,
    required this.behavioralFactors,
    required this.completedAt,
  }) : _answers = answers;

  factory _$RiskAssessmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskAssessmentImplFromJson(json);

  final List<RiskAnswer> _answers;
  @override
  List<RiskAnswer> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final int totalScore;
  @override
  final BehavioralRiskFactors behavioralFactors;
  @override
  final DateTime completedAt;

  @override
  String toString() {
    return 'RiskAssessment(answers: $answers, totalScore: $totalScore, behavioralFactors: $behavioralFactors, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskAssessmentImpl &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.behavioralFactors, behavioralFactors) ||
                other.behavioralFactors == behavioralFactors) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_answers),
    totalScore,
    behavioralFactors,
    completedAt,
  );

  /// Create a copy of RiskAssessment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskAssessmentImplCopyWith<_$RiskAssessmentImpl> get copyWith =>
      __$$RiskAssessmentImplCopyWithImpl<_$RiskAssessmentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskAssessmentImplToJson(this);
  }
}

abstract class _RiskAssessment implements RiskAssessment {
  const factory _RiskAssessment({
    required final List<RiskAnswer> answers,
    required final int totalScore,
    required final BehavioralRiskFactors behavioralFactors,
    required final DateTime completedAt,
  }) = _$RiskAssessmentImpl;

  factory _RiskAssessment.fromJson(Map<String, dynamic> json) =
      _$RiskAssessmentImpl.fromJson;

  @override
  List<RiskAnswer> get answers;
  @override
  int get totalScore;
  @override
  BehavioralRiskFactors get behavioralFactors;
  @override
  DateTime get completedAt;

  /// Create a copy of RiskAssessment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RiskAssessmentImplCopyWith<_$RiskAssessmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RiskAnswer _$RiskAnswerFromJson(Map<String, dynamic> json) {
  return _RiskAnswer.fromJson(json);
}

/// @nodoc
mixin _$RiskAnswer {
  String get questionId => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  int get selectedOption => throw _privateConstructorUsedError; // 0-indexed
  int get score => throw _privateConstructorUsedError;

  /// Serializes this RiskAnswer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RiskAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RiskAnswerCopyWith<RiskAnswer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskAnswerCopyWith<$Res> {
  factory $RiskAnswerCopyWith(
    RiskAnswer value,
    $Res Function(RiskAnswer) then,
  ) = _$RiskAnswerCopyWithImpl<$Res, RiskAnswer>;
  @useResult
  $Res call({
    String questionId,
    String question,
    int selectedOption,
    int score,
  });
}

/// @nodoc
class _$RiskAnswerCopyWithImpl<$Res, $Val extends RiskAnswer>
    implements $RiskAnswerCopyWith<$Res> {
  _$RiskAnswerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RiskAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? question = null,
    Object? selectedOption = null,
    Object? score = null,
  }) {
    return _then(
      _value.copyWith(
            questionId: null == questionId
                ? _value.questionId
                : questionId // ignore: cast_nullable_to_non_nullable
                      as String,
            question: null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedOption: null == selectedOption
                ? _value.selectedOption
                : selectedOption // ignore: cast_nullable_to_non_nullable
                      as int,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RiskAnswerImplCopyWith<$Res>
    implements $RiskAnswerCopyWith<$Res> {
  factory _$$RiskAnswerImplCopyWith(
    _$RiskAnswerImpl value,
    $Res Function(_$RiskAnswerImpl) then,
  ) = __$$RiskAnswerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String questionId,
    String question,
    int selectedOption,
    int score,
  });
}

/// @nodoc
class __$$RiskAnswerImplCopyWithImpl<$Res>
    extends _$RiskAnswerCopyWithImpl<$Res, _$RiskAnswerImpl>
    implements _$$RiskAnswerImplCopyWith<$Res> {
  __$$RiskAnswerImplCopyWithImpl(
    _$RiskAnswerImpl _value,
    $Res Function(_$RiskAnswerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RiskAnswer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionId = null,
    Object? question = null,
    Object? selectedOption = null,
    Object? score = null,
  }) {
    return _then(
      _$RiskAnswerImpl(
        questionId: null == questionId
            ? _value.questionId
            : questionId // ignore: cast_nullable_to_non_nullable
                  as String,
        question: null == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedOption: null == selectedOption
            ? _value.selectedOption
            : selectedOption // ignore: cast_nullable_to_non_nullable
                  as int,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RiskAnswerImpl implements _RiskAnswer {
  const _$RiskAnswerImpl({
    required this.questionId,
    required this.question,
    required this.selectedOption,
    required this.score,
  });

  factory _$RiskAnswerImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskAnswerImplFromJson(json);

  @override
  final String questionId;
  @override
  final String question;
  @override
  final int selectedOption;
  // 0-indexed
  @override
  final int score;

  @override
  String toString() {
    return 'RiskAnswer(questionId: $questionId, question: $question, selectedOption: $selectedOption, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskAnswerImpl &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.selectedOption, selectedOption) ||
                other.selectedOption == selectedOption) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, questionId, question, selectedOption, score);

  /// Create a copy of RiskAnswer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskAnswerImplCopyWith<_$RiskAnswerImpl> get copyWith =>
      __$$RiskAnswerImplCopyWithImpl<_$RiskAnswerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskAnswerImplToJson(this);
  }
}

abstract class _RiskAnswer implements RiskAnswer {
  const factory _RiskAnswer({
    required final String questionId,
    required final String question,
    required final int selectedOption,
    required final int score,
  }) = _$RiskAnswerImpl;

  factory _RiskAnswer.fromJson(Map<String, dynamic> json) =
      _$RiskAnswerImpl.fromJson;

  @override
  String get questionId;
  @override
  String get question;
  @override
  int get selectedOption; // 0-indexed
  @override
  int get score;

  /// Create a copy of RiskAnswer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RiskAnswerImplCopyWith<_$RiskAnswerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RiskQuestion _$RiskQuestionFromJson(Map<String, dynamic> json) {
  return _RiskQuestion.fromJson(json);
}

/// @nodoc
mixin _$RiskQuestion {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  List<RiskOption> get options => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  /// Serializes this RiskQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RiskQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RiskQuestionCopyWith<RiskQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskQuestionCopyWith<$Res> {
  factory $RiskQuestionCopyWith(
    RiskQuestion value,
    $Res Function(RiskQuestion) then,
  ) = _$RiskQuestionCopyWithImpl<$Res, RiskQuestion>;
  @useResult
  $Res call({
    String id,
    String question,
    List<RiskOption> options,
    String category,
  });
}

/// @nodoc
class _$RiskQuestionCopyWithImpl<$Res, $Val extends RiskQuestion>
    implements $RiskQuestionCopyWith<$Res> {
  _$RiskQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RiskQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? options = null,
    Object? category = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            question: null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as String,
            options: null == options
                ? _value.options
                : options // ignore: cast_nullable_to_non_nullable
                      as List<RiskOption>,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RiskQuestionImplCopyWith<$Res>
    implements $RiskQuestionCopyWith<$Res> {
  factory _$$RiskQuestionImplCopyWith(
    _$RiskQuestionImpl value,
    $Res Function(_$RiskQuestionImpl) then,
  ) = __$$RiskQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String question,
    List<RiskOption> options,
    String category,
  });
}

/// @nodoc
class __$$RiskQuestionImplCopyWithImpl<$Res>
    extends _$RiskQuestionCopyWithImpl<$Res, _$RiskQuestionImpl>
    implements _$$RiskQuestionImplCopyWith<$Res> {
  __$$RiskQuestionImplCopyWithImpl(
    _$RiskQuestionImpl _value,
    $Res Function(_$RiskQuestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RiskQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? options = null,
    Object? category = null,
  }) {
    return _then(
      _$RiskQuestionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        question: null == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as String,
        options: null == options
            ? _value._options
            : options // ignore: cast_nullable_to_non_nullable
                  as List<RiskOption>,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RiskQuestionImpl implements _RiskQuestion {
  const _$RiskQuestionImpl({
    required this.id,
    required this.question,
    required final List<RiskOption> options,
    required this.category,
  }) : _options = options;

  factory _$RiskQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskQuestionImplFromJson(json);

  @override
  final String id;
  @override
  final String question;
  final List<RiskOption> _options;
  @override
  List<RiskOption> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final String category;

  @override
  String toString() {
    return 'RiskQuestion(id: $id, question: $question, options: $options, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskQuestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    question,
    const DeepCollectionEquality().hash(_options),
    category,
  );

  /// Create a copy of RiskQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskQuestionImplCopyWith<_$RiskQuestionImpl> get copyWith =>
      __$$RiskQuestionImplCopyWithImpl<_$RiskQuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskQuestionImplToJson(this);
  }
}

abstract class _RiskQuestion implements RiskQuestion {
  const factory _RiskQuestion({
    required final String id,
    required final String question,
    required final List<RiskOption> options,
    required final String category,
  }) = _$RiskQuestionImpl;

  factory _RiskQuestion.fromJson(Map<String, dynamic> json) =
      _$RiskQuestionImpl.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  List<RiskOption> get options;
  @override
  String get category;

  /// Create a copy of RiskQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RiskQuestionImplCopyWith<_$RiskQuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RiskOption _$RiskOptionFromJson(Map<String, dynamic> json) {
  return _RiskOption.fromJson(json);
}

/// @nodoc
mixin _$RiskOption {
  String get text => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;

  /// Serializes this RiskOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RiskOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RiskOptionCopyWith<RiskOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RiskOptionCopyWith<$Res> {
  factory $RiskOptionCopyWith(
    RiskOption value,
    $Res Function(RiskOption) then,
  ) = _$RiskOptionCopyWithImpl<$Res, RiskOption>;
  @useResult
  $Res call({String text, int score});
}

/// @nodoc
class _$RiskOptionCopyWithImpl<$Res, $Val extends RiskOption>
    implements $RiskOptionCopyWith<$Res> {
  _$RiskOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RiskOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? score = null}) {
    return _then(
      _value.copyWith(
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            score: null == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RiskOptionImplCopyWith<$Res>
    implements $RiskOptionCopyWith<$Res> {
  factory _$$RiskOptionImplCopyWith(
    _$RiskOptionImpl value,
    $Res Function(_$RiskOptionImpl) then,
  ) = __$$RiskOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, int score});
}

/// @nodoc
class __$$RiskOptionImplCopyWithImpl<$Res>
    extends _$RiskOptionCopyWithImpl<$Res, _$RiskOptionImpl>
    implements _$$RiskOptionImplCopyWith<$Res> {
  __$$RiskOptionImplCopyWithImpl(
    _$RiskOptionImpl _value,
    $Res Function(_$RiskOptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RiskOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null, Object? score = null}) {
    return _then(
      _$RiskOptionImpl(
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        score: null == score
            ? _value.score
            : score // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RiskOptionImpl implements _RiskOption {
  const _$RiskOptionImpl({required this.text, required this.score});

  factory _$RiskOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RiskOptionImplFromJson(json);

  @override
  final String text;
  @override
  final int score;

  @override
  String toString() {
    return 'RiskOption(text: $text, score: $score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RiskOptionImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.score, score) || other.score == score));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text, score);

  /// Create a copy of RiskOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RiskOptionImplCopyWith<_$RiskOptionImpl> get copyWith =>
      __$$RiskOptionImplCopyWithImpl<_$RiskOptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RiskOptionImplToJson(this);
  }
}

abstract class _RiskOption implements RiskOption {
  const factory _RiskOption({
    required final String text,
    required final int score,
  }) = _$RiskOptionImpl;

  factory _RiskOption.fromJson(Map<String, dynamic> json) =
      _$RiskOptionImpl.fromJson;

  @override
  String get text;
  @override
  int get score;

  /// Create a copy of RiskOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RiskOptionImplCopyWith<_$RiskOptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BehavioralRiskFactors _$BehavioralRiskFactorsFromJson(
  Map<String, dynamic> json,
) {
  return _BehavioralRiskFactors.fromJson(json);
}

/// @nodoc
mixin _$BehavioralRiskFactors {
  double get incomeStability => throw _privateConstructorUsedError; // 0-1
  double get savingsConsistency => throw _privateConstructorUsedError; // 0-1
  double get spendingVolatility => throw _privateConstructorUsedError; // 0-1
  double get emergencyFundMonths =>
      throw _privateConstructorUsedError; // months of expenses saved
  double get debtToIncomeRatio => throw _privateConstructorUsedError;
  bool get hasHighInterestDebt => throw _privateConstructorUsedError;
  String? get adjustmentReason => throw _privateConstructorUsedError;

  /// Serializes this BehavioralRiskFactors to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BehavioralRiskFactors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BehavioralRiskFactorsCopyWith<BehavioralRiskFactors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BehavioralRiskFactorsCopyWith<$Res> {
  factory $BehavioralRiskFactorsCopyWith(
    BehavioralRiskFactors value,
    $Res Function(BehavioralRiskFactors) then,
  ) = _$BehavioralRiskFactorsCopyWithImpl<$Res, BehavioralRiskFactors>;
  @useResult
  $Res call({
    double incomeStability,
    double savingsConsistency,
    double spendingVolatility,
    double emergencyFundMonths,
    double debtToIncomeRatio,
    bool hasHighInterestDebt,
    String? adjustmentReason,
  });
}

/// @nodoc
class _$BehavioralRiskFactorsCopyWithImpl<
  $Res,
  $Val extends BehavioralRiskFactors
>
    implements $BehavioralRiskFactorsCopyWith<$Res> {
  _$BehavioralRiskFactorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BehavioralRiskFactors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomeStability = null,
    Object? savingsConsistency = null,
    Object? spendingVolatility = null,
    Object? emergencyFundMonths = null,
    Object? debtToIncomeRatio = null,
    Object? hasHighInterestDebt = null,
    Object? adjustmentReason = freezed,
  }) {
    return _then(
      _value.copyWith(
            incomeStability: null == incomeStability
                ? _value.incomeStability
                : incomeStability // ignore: cast_nullable_to_non_nullable
                      as double,
            savingsConsistency: null == savingsConsistency
                ? _value.savingsConsistency
                : savingsConsistency // ignore: cast_nullable_to_non_nullable
                      as double,
            spendingVolatility: null == spendingVolatility
                ? _value.spendingVolatility
                : spendingVolatility // ignore: cast_nullable_to_non_nullable
                      as double,
            emergencyFundMonths: null == emergencyFundMonths
                ? _value.emergencyFundMonths
                : emergencyFundMonths // ignore: cast_nullable_to_non_nullable
                      as double,
            debtToIncomeRatio: null == debtToIncomeRatio
                ? _value.debtToIncomeRatio
                : debtToIncomeRatio // ignore: cast_nullable_to_non_nullable
                      as double,
            hasHighInterestDebt: null == hasHighInterestDebt
                ? _value.hasHighInterestDebt
                : hasHighInterestDebt // ignore: cast_nullable_to_non_nullable
                      as bool,
            adjustmentReason: freezed == adjustmentReason
                ? _value.adjustmentReason
                : adjustmentReason // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BehavioralRiskFactorsImplCopyWith<$Res>
    implements $BehavioralRiskFactorsCopyWith<$Res> {
  factory _$$BehavioralRiskFactorsImplCopyWith(
    _$BehavioralRiskFactorsImpl value,
    $Res Function(_$BehavioralRiskFactorsImpl) then,
  ) = __$$BehavioralRiskFactorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double incomeStability,
    double savingsConsistency,
    double spendingVolatility,
    double emergencyFundMonths,
    double debtToIncomeRatio,
    bool hasHighInterestDebt,
    String? adjustmentReason,
  });
}

/// @nodoc
class __$$BehavioralRiskFactorsImplCopyWithImpl<$Res>
    extends
        _$BehavioralRiskFactorsCopyWithImpl<$Res, _$BehavioralRiskFactorsImpl>
    implements _$$BehavioralRiskFactorsImplCopyWith<$Res> {
  __$$BehavioralRiskFactorsImplCopyWithImpl(
    _$BehavioralRiskFactorsImpl _value,
    $Res Function(_$BehavioralRiskFactorsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BehavioralRiskFactors
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomeStability = null,
    Object? savingsConsistency = null,
    Object? spendingVolatility = null,
    Object? emergencyFundMonths = null,
    Object? debtToIncomeRatio = null,
    Object? hasHighInterestDebt = null,
    Object? adjustmentReason = freezed,
  }) {
    return _then(
      _$BehavioralRiskFactorsImpl(
        incomeStability: null == incomeStability
            ? _value.incomeStability
            : incomeStability // ignore: cast_nullable_to_non_nullable
                  as double,
        savingsConsistency: null == savingsConsistency
            ? _value.savingsConsistency
            : savingsConsistency // ignore: cast_nullable_to_non_nullable
                  as double,
        spendingVolatility: null == spendingVolatility
            ? _value.spendingVolatility
            : spendingVolatility // ignore: cast_nullable_to_non_nullable
                  as double,
        emergencyFundMonths: null == emergencyFundMonths
            ? _value.emergencyFundMonths
            : emergencyFundMonths // ignore: cast_nullable_to_non_nullable
                  as double,
        debtToIncomeRatio: null == debtToIncomeRatio
            ? _value.debtToIncomeRatio
            : debtToIncomeRatio // ignore: cast_nullable_to_non_nullable
                  as double,
        hasHighInterestDebt: null == hasHighInterestDebt
            ? _value.hasHighInterestDebt
            : hasHighInterestDebt // ignore: cast_nullable_to_non_nullable
                  as bool,
        adjustmentReason: freezed == adjustmentReason
            ? _value.adjustmentReason
            : adjustmentReason // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BehavioralRiskFactorsImpl implements _BehavioralRiskFactors {
  const _$BehavioralRiskFactorsImpl({
    required this.incomeStability,
    required this.savingsConsistency,
    required this.spendingVolatility,
    required this.emergencyFundMonths,
    required this.debtToIncomeRatio,
    required this.hasHighInterestDebt,
    this.adjustmentReason,
  });

  factory _$BehavioralRiskFactorsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BehavioralRiskFactorsImplFromJson(json);

  @override
  final double incomeStability;
  // 0-1
  @override
  final double savingsConsistency;
  // 0-1
  @override
  final double spendingVolatility;
  // 0-1
  @override
  final double emergencyFundMonths;
  // months of expenses saved
  @override
  final double debtToIncomeRatio;
  @override
  final bool hasHighInterestDebt;
  @override
  final String? adjustmentReason;

  @override
  String toString() {
    return 'BehavioralRiskFactors(incomeStability: $incomeStability, savingsConsistency: $savingsConsistency, spendingVolatility: $spendingVolatility, emergencyFundMonths: $emergencyFundMonths, debtToIncomeRatio: $debtToIncomeRatio, hasHighInterestDebt: $hasHighInterestDebt, adjustmentReason: $adjustmentReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BehavioralRiskFactorsImpl &&
            (identical(other.incomeStability, incomeStability) ||
                other.incomeStability == incomeStability) &&
            (identical(other.savingsConsistency, savingsConsistency) ||
                other.savingsConsistency == savingsConsistency) &&
            (identical(other.spendingVolatility, spendingVolatility) ||
                other.spendingVolatility == spendingVolatility) &&
            (identical(other.emergencyFundMonths, emergencyFundMonths) ||
                other.emergencyFundMonths == emergencyFundMonths) &&
            (identical(other.debtToIncomeRatio, debtToIncomeRatio) ||
                other.debtToIncomeRatio == debtToIncomeRatio) &&
            (identical(other.hasHighInterestDebt, hasHighInterestDebt) ||
                other.hasHighInterestDebt == hasHighInterestDebt) &&
            (identical(other.adjustmentReason, adjustmentReason) ||
                other.adjustmentReason == adjustmentReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    incomeStability,
    savingsConsistency,
    spendingVolatility,
    emergencyFundMonths,
    debtToIncomeRatio,
    hasHighInterestDebt,
    adjustmentReason,
  );

  /// Create a copy of BehavioralRiskFactors
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BehavioralRiskFactorsImplCopyWith<_$BehavioralRiskFactorsImpl>
  get copyWith =>
      __$$BehavioralRiskFactorsImplCopyWithImpl<_$BehavioralRiskFactorsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BehavioralRiskFactorsImplToJson(this);
  }
}

abstract class _BehavioralRiskFactors implements BehavioralRiskFactors {
  const factory _BehavioralRiskFactors({
    required final double incomeStability,
    required final double savingsConsistency,
    required final double spendingVolatility,
    required final double emergencyFundMonths,
    required final double debtToIncomeRatio,
    required final bool hasHighInterestDebt,
    final String? adjustmentReason,
  }) = _$BehavioralRiskFactorsImpl;

  factory _BehavioralRiskFactors.fromJson(Map<String, dynamic> json) =
      _$BehavioralRiskFactorsImpl.fromJson;

  @override
  double get incomeStability; // 0-1
  @override
  double get savingsConsistency; // 0-1
  @override
  double get spendingVolatility; // 0-1
  @override
  double get emergencyFundMonths; // months of expenses saved
  @override
  double get debtToIncomeRatio;
  @override
  bool get hasHighInterestDebt;
  @override
  String? get adjustmentReason;

  /// Create a copy of BehavioralRiskFactors
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BehavioralRiskFactorsImplCopyWith<_$BehavioralRiskFactorsImpl>
  get copyWith => throw _privateConstructorUsedError;
}

InvestmentGoal _$InvestmentGoalFromJson(Map<String, dynamic> json) {
  return _InvestmentGoal.fromJson(json);
}

/// @nodoc
mixin _$InvestmentGoal {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get targetAmount => throw _privateConstructorUsedError;
  double get currentAmount => throw _privateConstructorUsedError;
  int get timeHorizonYears => throw _privateConstructorUsedError;
  GoalPriority get priority => throw _privateConstructorUsedError;
  GoalType get type => throw _privateConstructorUsedError;
  DateTime get targetDate => throw _privateConstructorUsedError;
  double get requiredMonthlyContribution => throw _privateConstructorUsedError;
  double get projectedValue => throw _privateConstructorUsedError;
  bool get isOnTrack => throw _privateConstructorUsedError;

  /// Serializes this InvestmentGoal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvestmentGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvestmentGoalCopyWith<InvestmentGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentGoalCopyWith<$Res> {
  factory $InvestmentGoalCopyWith(
    InvestmentGoal value,
    $Res Function(InvestmentGoal) then,
  ) = _$InvestmentGoalCopyWithImpl<$Res, InvestmentGoal>;
  @useResult
  $Res call({
    String id,
    String name,
    double targetAmount,
    double currentAmount,
    int timeHorizonYears,
    GoalPriority priority,
    GoalType type,
    DateTime targetDate,
    double requiredMonthlyContribution,
    double projectedValue,
    bool isOnTrack,
  });
}

/// @nodoc
class _$InvestmentGoalCopyWithImpl<$Res, $Val extends InvestmentGoal>
    implements $InvestmentGoalCopyWith<$Res> {
  _$InvestmentGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvestmentGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? targetAmount = null,
    Object? currentAmount = null,
    Object? timeHorizonYears = null,
    Object? priority = null,
    Object? type = null,
    Object? targetDate = null,
    Object? requiredMonthlyContribution = null,
    Object? projectedValue = null,
    Object? isOnTrack = null,
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
            targetAmount: null == targetAmount
                ? _value.targetAmount
                : targetAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            currentAmount: null == currentAmount
                ? _value.currentAmount
                : currentAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            timeHorizonYears: null == timeHorizonYears
                ? _value.timeHorizonYears
                : timeHorizonYears // ignore: cast_nullable_to_non_nullable
                      as int,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as GoalPriority,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as GoalType,
            targetDate: null == targetDate
                ? _value.targetDate
                : targetDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            requiredMonthlyContribution: null == requiredMonthlyContribution
                ? _value.requiredMonthlyContribution
                : requiredMonthlyContribution // ignore: cast_nullable_to_non_nullable
                      as double,
            projectedValue: null == projectedValue
                ? _value.projectedValue
                : projectedValue // ignore: cast_nullable_to_non_nullable
                      as double,
            isOnTrack: null == isOnTrack
                ? _value.isOnTrack
                : isOnTrack // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvestmentGoalImplCopyWith<$Res>
    implements $InvestmentGoalCopyWith<$Res> {
  factory _$$InvestmentGoalImplCopyWith(
    _$InvestmentGoalImpl value,
    $Res Function(_$InvestmentGoalImpl) then,
  ) = __$$InvestmentGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    double targetAmount,
    double currentAmount,
    int timeHorizonYears,
    GoalPriority priority,
    GoalType type,
    DateTime targetDate,
    double requiredMonthlyContribution,
    double projectedValue,
    bool isOnTrack,
  });
}

/// @nodoc
class __$$InvestmentGoalImplCopyWithImpl<$Res>
    extends _$InvestmentGoalCopyWithImpl<$Res, _$InvestmentGoalImpl>
    implements _$$InvestmentGoalImplCopyWith<$Res> {
  __$$InvestmentGoalImplCopyWithImpl(
    _$InvestmentGoalImpl _value,
    $Res Function(_$InvestmentGoalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvestmentGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? targetAmount = null,
    Object? currentAmount = null,
    Object? timeHorizonYears = null,
    Object? priority = null,
    Object? type = null,
    Object? targetDate = null,
    Object? requiredMonthlyContribution = null,
    Object? projectedValue = null,
    Object? isOnTrack = null,
  }) {
    return _then(
      _$InvestmentGoalImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        targetAmount: null == targetAmount
            ? _value.targetAmount
            : targetAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        currentAmount: null == currentAmount
            ? _value.currentAmount
            : currentAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        timeHorizonYears: null == timeHorizonYears
            ? _value.timeHorizonYears
            : timeHorizonYears // ignore: cast_nullable_to_non_nullable
                  as int,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as GoalPriority,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as GoalType,
        targetDate: null == targetDate
            ? _value.targetDate
            : targetDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        requiredMonthlyContribution: null == requiredMonthlyContribution
            ? _value.requiredMonthlyContribution
            : requiredMonthlyContribution // ignore: cast_nullable_to_non_nullable
                  as double,
        projectedValue: null == projectedValue
            ? _value.projectedValue
            : projectedValue // ignore: cast_nullable_to_non_nullable
                  as double,
        isOnTrack: null == isOnTrack
            ? _value.isOnTrack
            : isOnTrack // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestmentGoalImpl implements _InvestmentGoal {
  const _$InvestmentGoalImpl({
    required this.id,
    required this.name,
    required this.targetAmount,
    required this.currentAmount,
    required this.timeHorizonYears,
    required this.priority,
    required this.type,
    required this.targetDate,
    required this.requiredMonthlyContribution,
    required this.projectedValue,
    required this.isOnTrack,
  });

  factory _$InvestmentGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentGoalImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final double targetAmount;
  @override
  final double currentAmount;
  @override
  final int timeHorizonYears;
  @override
  final GoalPriority priority;
  @override
  final GoalType type;
  @override
  final DateTime targetDate;
  @override
  final double requiredMonthlyContribution;
  @override
  final double projectedValue;
  @override
  final bool isOnTrack;

  @override
  String toString() {
    return 'InvestmentGoal(id: $id, name: $name, targetAmount: $targetAmount, currentAmount: $currentAmount, timeHorizonYears: $timeHorizonYears, priority: $priority, type: $type, targetDate: $targetDate, requiredMonthlyContribution: $requiredMonthlyContribution, projectedValue: $projectedValue, isOnTrack: $isOnTrack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentGoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.targetAmount, targetAmount) ||
                other.targetAmount == targetAmount) &&
            (identical(other.currentAmount, currentAmount) ||
                other.currentAmount == currentAmount) &&
            (identical(other.timeHorizonYears, timeHorizonYears) ||
                other.timeHorizonYears == timeHorizonYears) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            (identical(
                  other.requiredMonthlyContribution,
                  requiredMonthlyContribution,
                ) ||
                other.requiredMonthlyContribution ==
                    requiredMonthlyContribution) &&
            (identical(other.projectedValue, projectedValue) ||
                other.projectedValue == projectedValue) &&
            (identical(other.isOnTrack, isOnTrack) ||
                other.isOnTrack == isOnTrack));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    targetAmount,
    currentAmount,
    timeHorizonYears,
    priority,
    type,
    targetDate,
    requiredMonthlyContribution,
    projectedValue,
    isOnTrack,
  );

  /// Create a copy of InvestmentGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentGoalImplCopyWith<_$InvestmentGoalImpl> get copyWith =>
      __$$InvestmentGoalImplCopyWithImpl<_$InvestmentGoalImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentGoalImplToJson(this);
  }
}

abstract class _InvestmentGoal implements InvestmentGoal {
  const factory _InvestmentGoal({
    required final String id,
    required final String name,
    required final double targetAmount,
    required final double currentAmount,
    required final int timeHorizonYears,
    required final GoalPriority priority,
    required final GoalType type,
    required final DateTime targetDate,
    required final double requiredMonthlyContribution,
    required final double projectedValue,
    required final bool isOnTrack,
  }) = _$InvestmentGoalImpl;

  factory _InvestmentGoal.fromJson(Map<String, dynamic> json) =
      _$InvestmentGoalImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  double get targetAmount;
  @override
  double get currentAmount;
  @override
  int get timeHorizonYears;
  @override
  GoalPriority get priority;
  @override
  GoalType get type;
  @override
  DateTime get targetDate;
  @override
  double get requiredMonthlyContribution;
  @override
  double get projectedValue;
  @override
  bool get isOnTrack;

  /// Create a copy of InvestmentGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvestmentGoalImplCopyWith<_$InvestmentGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PortfolioAnalysis _$PortfolioAnalysisFromJson(Map<String, dynamic> json) {
  return _PortfolioAnalysis.fromJson(json);
}

/// @nodoc
mixin _$PortfolioAnalysis {
  double get totalValue => throw _privateConstructorUsedError;
  List<PortfolioHolding> get holdings => throw _privateConstructorUsedError;
  Map<String, double> get assetAllocation =>
      throw _privateConstructorUsedError; // asset type -> percentage
  DiversificationScore get diversification =>
      throw _privateConstructorUsedError;
  double get projectedAnnualReturn => throw _privateConstructorUsedError;
  double get riskLevel => throw _privateConstructorUsedError; // 0-1
  List<PortfolioIssue> get issues => throw _privateConstructorUsedError;
  DateTime get analyzedAt => throw _privateConstructorUsedError;

  /// Serializes this PortfolioAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PortfolioAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PortfolioAnalysisCopyWith<PortfolioAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioAnalysisCopyWith<$Res> {
  factory $PortfolioAnalysisCopyWith(
    PortfolioAnalysis value,
    $Res Function(PortfolioAnalysis) then,
  ) = _$PortfolioAnalysisCopyWithImpl<$Res, PortfolioAnalysis>;
  @useResult
  $Res call({
    double totalValue,
    List<PortfolioHolding> holdings,
    Map<String, double> assetAllocation,
    DiversificationScore diversification,
    double projectedAnnualReturn,
    double riskLevel,
    List<PortfolioIssue> issues,
    DateTime analyzedAt,
  });

  $DiversificationScoreCopyWith<$Res> get diversification;
}

/// @nodoc
class _$PortfolioAnalysisCopyWithImpl<$Res, $Val extends PortfolioAnalysis>
    implements $PortfolioAnalysisCopyWith<$Res> {
  _$PortfolioAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PortfolioAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalValue = null,
    Object? holdings = null,
    Object? assetAllocation = null,
    Object? diversification = null,
    Object? projectedAnnualReturn = null,
    Object? riskLevel = null,
    Object? issues = null,
    Object? analyzedAt = null,
  }) {
    return _then(
      _value.copyWith(
            totalValue: null == totalValue
                ? _value.totalValue
                : totalValue // ignore: cast_nullable_to_non_nullable
                      as double,
            holdings: null == holdings
                ? _value.holdings
                : holdings // ignore: cast_nullable_to_non_nullable
                      as List<PortfolioHolding>,
            assetAllocation: null == assetAllocation
                ? _value.assetAllocation
                : assetAllocation // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            diversification: null == diversification
                ? _value.diversification
                : diversification // ignore: cast_nullable_to_non_nullable
                      as DiversificationScore,
            projectedAnnualReturn: null == projectedAnnualReturn
                ? _value.projectedAnnualReturn
                : projectedAnnualReturn // ignore: cast_nullable_to_non_nullable
                      as double,
            riskLevel: null == riskLevel
                ? _value.riskLevel
                : riskLevel // ignore: cast_nullable_to_non_nullable
                      as double,
            issues: null == issues
                ? _value.issues
                : issues // ignore: cast_nullable_to_non_nullable
                      as List<PortfolioIssue>,
            analyzedAt: null == analyzedAt
                ? _value.analyzedAt
                : analyzedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of PortfolioAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DiversificationScoreCopyWith<$Res> get diversification {
    return $DiversificationScoreCopyWith<$Res>(_value.diversification, (value) {
      return _then(_value.copyWith(diversification: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PortfolioAnalysisImplCopyWith<$Res>
    implements $PortfolioAnalysisCopyWith<$Res> {
  factory _$$PortfolioAnalysisImplCopyWith(
    _$PortfolioAnalysisImpl value,
    $Res Function(_$PortfolioAnalysisImpl) then,
  ) = __$$PortfolioAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double totalValue,
    List<PortfolioHolding> holdings,
    Map<String, double> assetAllocation,
    DiversificationScore diversification,
    double projectedAnnualReturn,
    double riskLevel,
    List<PortfolioIssue> issues,
    DateTime analyzedAt,
  });

  @override
  $DiversificationScoreCopyWith<$Res> get diversification;
}

/// @nodoc
class __$$PortfolioAnalysisImplCopyWithImpl<$Res>
    extends _$PortfolioAnalysisCopyWithImpl<$Res, _$PortfolioAnalysisImpl>
    implements _$$PortfolioAnalysisImplCopyWith<$Res> {
  __$$PortfolioAnalysisImplCopyWithImpl(
    _$PortfolioAnalysisImpl _value,
    $Res Function(_$PortfolioAnalysisImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PortfolioAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalValue = null,
    Object? holdings = null,
    Object? assetAllocation = null,
    Object? diversification = null,
    Object? projectedAnnualReturn = null,
    Object? riskLevel = null,
    Object? issues = null,
    Object? analyzedAt = null,
  }) {
    return _then(
      _$PortfolioAnalysisImpl(
        totalValue: null == totalValue
            ? _value.totalValue
            : totalValue // ignore: cast_nullable_to_non_nullable
                  as double,
        holdings: null == holdings
            ? _value._holdings
            : holdings // ignore: cast_nullable_to_non_nullable
                  as List<PortfolioHolding>,
        assetAllocation: null == assetAllocation
            ? _value._assetAllocation
            : assetAllocation // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        diversification: null == diversification
            ? _value.diversification
            : diversification // ignore: cast_nullable_to_non_nullable
                  as DiversificationScore,
        projectedAnnualReturn: null == projectedAnnualReturn
            ? _value.projectedAnnualReturn
            : projectedAnnualReturn // ignore: cast_nullable_to_non_nullable
                  as double,
        riskLevel: null == riskLevel
            ? _value.riskLevel
            : riskLevel // ignore: cast_nullable_to_non_nullable
                  as double,
        issues: null == issues
            ? _value._issues
            : issues // ignore: cast_nullable_to_non_nullable
                  as List<PortfolioIssue>,
        analyzedAt: null == analyzedAt
            ? _value.analyzedAt
            : analyzedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfolioAnalysisImpl implements _PortfolioAnalysis {
  const _$PortfolioAnalysisImpl({
    required this.totalValue,
    required final List<PortfolioHolding> holdings,
    required final Map<String, double> assetAllocation,
    required this.diversification,
    required this.projectedAnnualReturn,
    required this.riskLevel,
    required final List<PortfolioIssue> issues,
    required this.analyzedAt,
  }) : _holdings = holdings,
       _assetAllocation = assetAllocation,
       _issues = issues;

  factory _$PortfolioAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioAnalysisImplFromJson(json);

  @override
  final double totalValue;
  final List<PortfolioHolding> _holdings;
  @override
  List<PortfolioHolding> get holdings {
    if (_holdings is EqualUnmodifiableListView) return _holdings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_holdings);
  }

  final Map<String, double> _assetAllocation;
  @override
  Map<String, double> get assetAllocation {
    if (_assetAllocation is EqualUnmodifiableMapView) return _assetAllocation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_assetAllocation);
  }

  // asset type -> percentage
  @override
  final DiversificationScore diversification;
  @override
  final double projectedAnnualReturn;
  @override
  final double riskLevel;
  // 0-1
  final List<PortfolioIssue> _issues;
  // 0-1
  @override
  List<PortfolioIssue> get issues {
    if (_issues is EqualUnmodifiableListView) return _issues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_issues);
  }

  @override
  final DateTime analyzedAt;

  @override
  String toString() {
    return 'PortfolioAnalysis(totalValue: $totalValue, holdings: $holdings, assetAllocation: $assetAllocation, diversification: $diversification, projectedAnnualReturn: $projectedAnnualReturn, riskLevel: $riskLevel, issues: $issues, analyzedAt: $analyzedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioAnalysisImpl &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            const DeepCollectionEquality().equals(other._holdings, _holdings) &&
            const DeepCollectionEquality().equals(
              other._assetAllocation,
              _assetAllocation,
            ) &&
            (identical(other.diversification, diversification) ||
                other.diversification == diversification) &&
            (identical(other.projectedAnnualReturn, projectedAnnualReturn) ||
                other.projectedAnnualReturn == projectedAnnualReturn) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            const DeepCollectionEquality().equals(other._issues, _issues) &&
            (identical(other.analyzedAt, analyzedAt) ||
                other.analyzedAt == analyzedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalValue,
    const DeepCollectionEquality().hash(_holdings),
    const DeepCollectionEquality().hash(_assetAllocation),
    diversification,
    projectedAnnualReturn,
    riskLevel,
    const DeepCollectionEquality().hash(_issues),
    analyzedAt,
  );

  /// Create a copy of PortfolioAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioAnalysisImplCopyWith<_$PortfolioAnalysisImpl> get copyWith =>
      __$$PortfolioAnalysisImplCopyWithImpl<_$PortfolioAnalysisImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioAnalysisImplToJson(this);
  }
}

abstract class _PortfolioAnalysis implements PortfolioAnalysis {
  const factory _PortfolioAnalysis({
    required final double totalValue,
    required final List<PortfolioHolding> holdings,
    required final Map<String, double> assetAllocation,
    required final DiversificationScore diversification,
    required final double projectedAnnualReturn,
    required final double riskLevel,
    required final List<PortfolioIssue> issues,
    required final DateTime analyzedAt,
  }) = _$PortfolioAnalysisImpl;

  factory _PortfolioAnalysis.fromJson(Map<String, dynamic> json) =
      _$PortfolioAnalysisImpl.fromJson;

  @override
  double get totalValue;
  @override
  List<PortfolioHolding> get holdings;
  @override
  Map<String, double> get assetAllocation; // asset type -> percentage
  @override
  DiversificationScore get diversification;
  @override
  double get projectedAnnualReturn;
  @override
  double get riskLevel; // 0-1
  @override
  List<PortfolioIssue> get issues;
  @override
  DateTime get analyzedAt;

  /// Create a copy of PortfolioAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioAnalysisImplCopyWith<_$PortfolioAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PortfolioHolding _$PortfolioHoldingFromJson(Map<String, dynamic> json) {
  return _PortfolioHolding.fromJson(json);
}

/// @nodoc
mixin _$PortfolioHolding {
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  AssetType get assetType => throw _privateConstructorUsedError;
  double get shares => throw _privateConstructorUsedError;
  double get currentPrice => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;
  double get percentOfPortfolio => throw _privateConstructorUsedError;
  double get gainLoss => throw _privateConstructorUsedError;
  double get gainLossPercent => throw _privateConstructorUsedError;

  /// Serializes this PortfolioHolding to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PortfolioHolding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PortfolioHoldingCopyWith<PortfolioHolding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioHoldingCopyWith<$Res> {
  factory $PortfolioHoldingCopyWith(
    PortfolioHolding value,
    $Res Function(PortfolioHolding) then,
  ) = _$PortfolioHoldingCopyWithImpl<$Res, PortfolioHolding>;
  @useResult
  $Res call({
    String symbol,
    String name,
    AssetType assetType,
    double shares,
    double currentPrice,
    double totalValue,
    double percentOfPortfolio,
    double gainLoss,
    double gainLossPercent,
  });
}

/// @nodoc
class _$PortfolioHoldingCopyWithImpl<$Res, $Val extends PortfolioHolding>
    implements $PortfolioHoldingCopyWith<$Res> {
  _$PortfolioHoldingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PortfolioHolding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? name = null,
    Object? assetType = null,
    Object? shares = null,
    Object? currentPrice = null,
    Object? totalValue = null,
    Object? percentOfPortfolio = null,
    Object? gainLoss = null,
    Object? gainLossPercent = null,
  }) {
    return _then(
      _value.copyWith(
            symbol: null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            assetType: null == assetType
                ? _value.assetType
                : assetType // ignore: cast_nullable_to_non_nullable
                      as AssetType,
            shares: null == shares
                ? _value.shares
                : shares // ignore: cast_nullable_to_non_nullable
                      as double,
            currentPrice: null == currentPrice
                ? _value.currentPrice
                : currentPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            totalValue: null == totalValue
                ? _value.totalValue
                : totalValue // ignore: cast_nullable_to_non_nullable
                      as double,
            percentOfPortfolio: null == percentOfPortfolio
                ? _value.percentOfPortfolio
                : percentOfPortfolio // ignore: cast_nullable_to_non_nullable
                      as double,
            gainLoss: null == gainLoss
                ? _value.gainLoss
                : gainLoss // ignore: cast_nullable_to_non_nullable
                      as double,
            gainLossPercent: null == gainLossPercent
                ? _value.gainLossPercent
                : gainLossPercent // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PortfolioHoldingImplCopyWith<$Res>
    implements $PortfolioHoldingCopyWith<$Res> {
  factory _$$PortfolioHoldingImplCopyWith(
    _$PortfolioHoldingImpl value,
    $Res Function(_$PortfolioHoldingImpl) then,
  ) = __$$PortfolioHoldingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String symbol,
    String name,
    AssetType assetType,
    double shares,
    double currentPrice,
    double totalValue,
    double percentOfPortfolio,
    double gainLoss,
    double gainLossPercent,
  });
}

/// @nodoc
class __$$PortfolioHoldingImplCopyWithImpl<$Res>
    extends _$PortfolioHoldingCopyWithImpl<$Res, _$PortfolioHoldingImpl>
    implements _$$PortfolioHoldingImplCopyWith<$Res> {
  __$$PortfolioHoldingImplCopyWithImpl(
    _$PortfolioHoldingImpl _value,
    $Res Function(_$PortfolioHoldingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PortfolioHolding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? name = null,
    Object? assetType = null,
    Object? shares = null,
    Object? currentPrice = null,
    Object? totalValue = null,
    Object? percentOfPortfolio = null,
    Object? gainLoss = null,
    Object? gainLossPercent = null,
  }) {
    return _then(
      _$PortfolioHoldingImpl(
        symbol: null == symbol
            ? _value.symbol
            : symbol // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        assetType: null == assetType
            ? _value.assetType
            : assetType // ignore: cast_nullable_to_non_nullable
                  as AssetType,
        shares: null == shares
            ? _value.shares
            : shares // ignore: cast_nullable_to_non_nullable
                  as double,
        currentPrice: null == currentPrice
            ? _value.currentPrice
            : currentPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        totalValue: null == totalValue
            ? _value.totalValue
            : totalValue // ignore: cast_nullable_to_non_nullable
                  as double,
        percentOfPortfolio: null == percentOfPortfolio
            ? _value.percentOfPortfolio
            : percentOfPortfolio // ignore: cast_nullable_to_non_nullable
                  as double,
        gainLoss: null == gainLoss
            ? _value.gainLoss
            : gainLoss // ignore: cast_nullable_to_non_nullable
                  as double,
        gainLossPercent: null == gainLossPercent
            ? _value.gainLossPercent
            : gainLossPercent // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PortfolioHoldingImpl implements _PortfolioHolding {
  const _$PortfolioHoldingImpl({
    required this.symbol,
    required this.name,
    required this.assetType,
    required this.shares,
    required this.currentPrice,
    required this.totalValue,
    required this.percentOfPortfolio,
    required this.gainLoss,
    required this.gainLossPercent,
  });

  factory _$PortfolioHoldingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioHoldingImplFromJson(json);

  @override
  final String symbol;
  @override
  final String name;
  @override
  final AssetType assetType;
  @override
  final double shares;
  @override
  final double currentPrice;
  @override
  final double totalValue;
  @override
  final double percentOfPortfolio;
  @override
  final double gainLoss;
  @override
  final double gainLossPercent;

  @override
  String toString() {
    return 'PortfolioHolding(symbol: $symbol, name: $name, assetType: $assetType, shares: $shares, currentPrice: $currentPrice, totalValue: $totalValue, percentOfPortfolio: $percentOfPortfolio, gainLoss: $gainLoss, gainLossPercent: $gainLossPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioHoldingImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.shares, shares) || other.shares == shares) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.percentOfPortfolio, percentOfPortfolio) ||
                other.percentOfPortfolio == percentOfPortfolio) &&
            (identical(other.gainLoss, gainLoss) ||
                other.gainLoss == gainLoss) &&
            (identical(other.gainLossPercent, gainLossPercent) ||
                other.gainLossPercent == gainLossPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    symbol,
    name,
    assetType,
    shares,
    currentPrice,
    totalValue,
    percentOfPortfolio,
    gainLoss,
    gainLossPercent,
  );

  /// Create a copy of PortfolioHolding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioHoldingImplCopyWith<_$PortfolioHoldingImpl> get copyWith =>
      __$$PortfolioHoldingImplCopyWithImpl<_$PortfolioHoldingImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioHoldingImplToJson(this);
  }
}

abstract class _PortfolioHolding implements PortfolioHolding {
  const factory _PortfolioHolding({
    required final String symbol,
    required final String name,
    required final AssetType assetType,
    required final double shares,
    required final double currentPrice,
    required final double totalValue,
    required final double percentOfPortfolio,
    required final double gainLoss,
    required final double gainLossPercent,
  }) = _$PortfolioHoldingImpl;

  factory _PortfolioHolding.fromJson(Map<String, dynamic> json) =
      _$PortfolioHoldingImpl.fromJson;

  @override
  String get symbol;
  @override
  String get name;
  @override
  AssetType get assetType;
  @override
  double get shares;
  @override
  double get currentPrice;
  @override
  double get totalValue;
  @override
  double get percentOfPortfolio;
  @override
  double get gainLoss;
  @override
  double get gainLossPercent;

  /// Create a copy of PortfolioHolding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioHoldingImplCopyWith<_$PortfolioHoldingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DiversificationScore _$DiversificationScoreFromJson(Map<String, dynamic> json) {
  return _DiversificationScore.fromJson(json);
}

/// @nodoc
mixin _$DiversificationScore {
  double get overallScore => throw _privateConstructorUsedError; // 0-100
  double get assetClassScore => throw _privateConstructorUsedError;
  double get sectorScore => throw _privateConstructorUsedError;
  double get geographicScore => throw _privateConstructorUsedError;
  DiversificationLevel get level => throw _privateConstructorUsedError;
  List<String> get recommendations => throw _privateConstructorUsedError;

  /// Serializes this DiversificationScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiversificationScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiversificationScoreCopyWith<DiversificationScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiversificationScoreCopyWith<$Res> {
  factory $DiversificationScoreCopyWith(
    DiversificationScore value,
    $Res Function(DiversificationScore) then,
  ) = _$DiversificationScoreCopyWithImpl<$Res, DiversificationScore>;
  @useResult
  $Res call({
    double overallScore,
    double assetClassScore,
    double sectorScore,
    double geographicScore,
    DiversificationLevel level,
    List<String> recommendations,
  });
}

/// @nodoc
class _$DiversificationScoreCopyWithImpl<
  $Res,
  $Val extends DiversificationScore
>
    implements $DiversificationScoreCopyWith<$Res> {
  _$DiversificationScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiversificationScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallScore = null,
    Object? assetClassScore = null,
    Object? sectorScore = null,
    Object? geographicScore = null,
    Object? level = null,
    Object? recommendations = null,
  }) {
    return _then(
      _value.copyWith(
            overallScore: null == overallScore
                ? _value.overallScore
                : overallScore // ignore: cast_nullable_to_non_nullable
                      as double,
            assetClassScore: null == assetClassScore
                ? _value.assetClassScore
                : assetClassScore // ignore: cast_nullable_to_non_nullable
                      as double,
            sectorScore: null == sectorScore
                ? _value.sectorScore
                : sectorScore // ignore: cast_nullable_to_non_nullable
                      as double,
            geographicScore: null == geographicScore
                ? _value.geographicScore
                : geographicScore // ignore: cast_nullable_to_non_nullable
                      as double,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as DiversificationLevel,
            recommendations: null == recommendations
                ? _value.recommendations
                : recommendations // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiversificationScoreImplCopyWith<$Res>
    implements $DiversificationScoreCopyWith<$Res> {
  factory _$$DiversificationScoreImplCopyWith(
    _$DiversificationScoreImpl value,
    $Res Function(_$DiversificationScoreImpl) then,
  ) = __$$DiversificationScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double overallScore,
    double assetClassScore,
    double sectorScore,
    double geographicScore,
    DiversificationLevel level,
    List<String> recommendations,
  });
}

/// @nodoc
class __$$DiversificationScoreImplCopyWithImpl<$Res>
    extends _$DiversificationScoreCopyWithImpl<$Res, _$DiversificationScoreImpl>
    implements _$$DiversificationScoreImplCopyWith<$Res> {
  __$$DiversificationScoreImplCopyWithImpl(
    _$DiversificationScoreImpl _value,
    $Res Function(_$DiversificationScoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiversificationScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? overallScore = null,
    Object? assetClassScore = null,
    Object? sectorScore = null,
    Object? geographicScore = null,
    Object? level = null,
    Object? recommendations = null,
  }) {
    return _then(
      _$DiversificationScoreImpl(
        overallScore: null == overallScore
            ? _value.overallScore
            : overallScore // ignore: cast_nullable_to_non_nullable
                  as double,
        assetClassScore: null == assetClassScore
            ? _value.assetClassScore
            : assetClassScore // ignore: cast_nullable_to_non_nullable
                  as double,
        sectorScore: null == sectorScore
            ? _value.sectorScore
            : sectorScore // ignore: cast_nullable_to_non_nullable
                  as double,
        geographicScore: null == geographicScore
            ? _value.geographicScore
            : geographicScore // ignore: cast_nullable_to_non_nullable
                  as double,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as DiversificationLevel,
        recommendations: null == recommendations
            ? _value._recommendations
            : recommendations // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiversificationScoreImpl implements _DiversificationScore {
  const _$DiversificationScoreImpl({
    required this.overallScore,
    required this.assetClassScore,
    required this.sectorScore,
    required this.geographicScore,
    required this.level,
    required final List<String> recommendations,
  }) : _recommendations = recommendations;

  factory _$DiversificationScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiversificationScoreImplFromJson(json);

  @override
  final double overallScore;
  // 0-100
  @override
  final double assetClassScore;
  @override
  final double sectorScore;
  @override
  final double geographicScore;
  @override
  final DiversificationLevel level;
  final List<String> _recommendations;
  @override
  List<String> get recommendations {
    if (_recommendations is EqualUnmodifiableListView) return _recommendations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendations);
  }

  @override
  String toString() {
    return 'DiversificationScore(overallScore: $overallScore, assetClassScore: $assetClassScore, sectorScore: $sectorScore, geographicScore: $geographicScore, level: $level, recommendations: $recommendations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiversificationScoreImpl &&
            (identical(other.overallScore, overallScore) ||
                other.overallScore == overallScore) &&
            (identical(other.assetClassScore, assetClassScore) ||
                other.assetClassScore == assetClassScore) &&
            (identical(other.sectorScore, sectorScore) ||
                other.sectorScore == sectorScore) &&
            (identical(other.geographicScore, geographicScore) ||
                other.geographicScore == geographicScore) &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality().equals(
              other._recommendations,
              _recommendations,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    overallScore,
    assetClassScore,
    sectorScore,
    geographicScore,
    level,
    const DeepCollectionEquality().hash(_recommendations),
  );

  /// Create a copy of DiversificationScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiversificationScoreImplCopyWith<_$DiversificationScoreImpl>
  get copyWith =>
      __$$DiversificationScoreImplCopyWithImpl<_$DiversificationScoreImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DiversificationScoreImplToJson(this);
  }
}

abstract class _DiversificationScore implements DiversificationScore {
  const factory _DiversificationScore({
    required final double overallScore,
    required final double assetClassScore,
    required final double sectorScore,
    required final double geographicScore,
    required final DiversificationLevel level,
    required final List<String> recommendations,
  }) = _$DiversificationScoreImpl;

  factory _DiversificationScore.fromJson(Map<String, dynamic> json) =
      _$DiversificationScoreImpl.fromJson;

  @override
  double get overallScore; // 0-100
  @override
  double get assetClassScore;
  @override
  double get sectorScore;
  @override
  double get geographicScore;
  @override
  DiversificationLevel get level;
  @override
  List<String> get recommendations;

  /// Create a copy of DiversificationScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiversificationScoreImplCopyWith<_$DiversificationScoreImpl>
  get copyWith => throw _privateConstructorUsedError;
}

PortfolioIssue _$PortfolioIssueFromJson(Map<String, dynamic> json) {
  return _PortfolioIssue.fromJson(json);
}

/// @nodoc
mixin _$PortfolioIssue {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  IssueSeverity get severity => throw _privateConstructorUsedError;
  String get recommendation => throw _privateConstructorUsedError;

  /// Serializes this PortfolioIssue to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PortfolioIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PortfolioIssueCopyWith<PortfolioIssue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioIssueCopyWith<$Res> {
  factory $PortfolioIssueCopyWith(
    PortfolioIssue value,
    $Res Function(PortfolioIssue) then,
  ) = _$PortfolioIssueCopyWithImpl<$Res, PortfolioIssue>;
  @useResult
  $Res call({
    String title,
    String description,
    IssueSeverity severity,
    String recommendation,
  });
}

/// @nodoc
class _$PortfolioIssueCopyWithImpl<$Res, $Val extends PortfolioIssue>
    implements $PortfolioIssueCopyWith<$Res> {
  _$PortfolioIssueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PortfolioIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? severity = null,
    Object? recommendation = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            severity: null == severity
                ? _value.severity
                : severity // ignore: cast_nullable_to_non_nullable
                      as IssueSeverity,
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
abstract class _$$PortfolioIssueImplCopyWith<$Res>
    implements $PortfolioIssueCopyWith<$Res> {
  factory _$$PortfolioIssueImplCopyWith(
    _$PortfolioIssueImpl value,
    $Res Function(_$PortfolioIssueImpl) then,
  ) = __$$PortfolioIssueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String description,
    IssueSeverity severity,
    String recommendation,
  });
}

/// @nodoc
class __$$PortfolioIssueImplCopyWithImpl<$Res>
    extends _$PortfolioIssueCopyWithImpl<$Res, _$PortfolioIssueImpl>
    implements _$$PortfolioIssueImplCopyWith<$Res> {
  __$$PortfolioIssueImplCopyWithImpl(
    _$PortfolioIssueImpl _value,
    $Res Function(_$PortfolioIssueImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PortfolioIssue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? severity = null,
    Object? recommendation = null,
  }) {
    return _then(
      _$PortfolioIssueImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        severity: null == severity
            ? _value.severity
            : severity // ignore: cast_nullable_to_non_nullable
                  as IssueSeverity,
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
class _$PortfolioIssueImpl implements _PortfolioIssue {
  const _$PortfolioIssueImpl({
    required this.title,
    required this.description,
    required this.severity,
    required this.recommendation,
  });

  factory _$PortfolioIssueImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortfolioIssueImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final IssueSeverity severity;
  @override
  final String recommendation;

  @override
  String toString() {
    return 'PortfolioIssue(title: $title, description: $description, severity: $severity, recommendation: $recommendation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortfolioIssueImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, severity, recommendation);

  /// Create a copy of PortfolioIssue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PortfolioIssueImplCopyWith<_$PortfolioIssueImpl> get copyWith =>
      __$$PortfolioIssueImplCopyWithImpl<_$PortfolioIssueImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PortfolioIssueImplToJson(this);
  }
}

abstract class _PortfolioIssue implements PortfolioIssue {
  const factory _PortfolioIssue({
    required final String title,
    required final String description,
    required final IssueSeverity severity,
    required final String recommendation,
  }) = _$PortfolioIssueImpl;

  factory _PortfolioIssue.fromJson(Map<String, dynamic> json) =
      _$PortfolioIssueImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  IssueSeverity get severity;
  @override
  String get recommendation;

  /// Create a copy of PortfolioIssue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PortfolioIssueImplCopyWith<_$PortfolioIssueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvestmentRecommendation _$InvestmentRecommendationFromJson(
  Map<String, dynamic> json,
) {
  return _InvestmentRecommendation.fromJson(json);
}

/// @nodoc
mixin _$InvestmentRecommendation {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  AssetType get assetType => throw _privateConstructorUsedError;
  RecommendationType get recommendationType =>
      throw _privateConstructorUsedError;
  String get reasoning => throw _privateConstructorUsedError;
  double get suggestedAllocation =>
      throw _privateConstructorUsedError; // percentage
  double? get currentPrice => throw _privateConstructorUsedError;
  double? get expenseRatio =>
      throw _privateConstructorUsedError; // for ETFs/mutual funds
  double? get dividendYield => throw _privateConstructorUsedError;
  RiskLevel get riskLevel => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  DateTime get recommendedAt => throw _privateConstructorUsedError;
  bool get isTaxAdvantaged => throw _privateConstructorUsedError;
  String? get taxAdvantageExplanation => throw _privateConstructorUsedError;

  /// Serializes this InvestmentRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvestmentRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvestmentRecommendationCopyWith<InvestmentRecommendation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentRecommendationCopyWith<$Res> {
  factory $InvestmentRecommendationCopyWith(
    InvestmentRecommendation value,
    $Res Function(InvestmentRecommendation) then,
  ) = _$InvestmentRecommendationCopyWithImpl<$Res, InvestmentRecommendation>;
  @useResult
  $Res call({
    String id,
    String symbol,
    String name,
    AssetType assetType,
    RecommendationType recommendationType,
    String reasoning,
    double suggestedAllocation,
    double? currentPrice,
    double? expenseRatio,
    double? dividendYield,
    RiskLevel riskLevel,
    List<String> tags,
    DateTime recommendedAt,
    bool isTaxAdvantaged,
    String? taxAdvantageExplanation,
  });
}

/// @nodoc
class _$InvestmentRecommendationCopyWithImpl<
  $Res,
  $Val extends InvestmentRecommendation
>
    implements $InvestmentRecommendationCopyWith<$Res> {
  _$InvestmentRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvestmentRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = null,
    Object? assetType = null,
    Object? recommendationType = null,
    Object? reasoning = null,
    Object? suggestedAllocation = null,
    Object? currentPrice = freezed,
    Object? expenseRatio = freezed,
    Object? dividendYield = freezed,
    Object? riskLevel = null,
    Object? tags = null,
    Object? recommendedAt = null,
    Object? isTaxAdvantaged = null,
    Object? taxAdvantageExplanation = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            symbol: null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            assetType: null == assetType
                ? _value.assetType
                : assetType // ignore: cast_nullable_to_non_nullable
                      as AssetType,
            recommendationType: null == recommendationType
                ? _value.recommendationType
                : recommendationType // ignore: cast_nullable_to_non_nullable
                      as RecommendationType,
            reasoning: null == reasoning
                ? _value.reasoning
                : reasoning // ignore: cast_nullable_to_non_nullable
                      as String,
            suggestedAllocation: null == suggestedAllocation
                ? _value.suggestedAllocation
                : suggestedAllocation // ignore: cast_nullable_to_non_nullable
                      as double,
            currentPrice: freezed == currentPrice
                ? _value.currentPrice
                : currentPrice // ignore: cast_nullable_to_non_nullable
                      as double?,
            expenseRatio: freezed == expenseRatio
                ? _value.expenseRatio
                : expenseRatio // ignore: cast_nullable_to_non_nullable
                      as double?,
            dividendYield: freezed == dividendYield
                ? _value.dividendYield
                : dividendYield // ignore: cast_nullable_to_non_nullable
                      as double?,
            riskLevel: null == riskLevel
                ? _value.riskLevel
                : riskLevel // ignore: cast_nullable_to_non_nullable
                      as RiskLevel,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            recommendedAt: null == recommendedAt
                ? _value.recommendedAt
                : recommendedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isTaxAdvantaged: null == isTaxAdvantaged
                ? _value.isTaxAdvantaged
                : isTaxAdvantaged // ignore: cast_nullable_to_non_nullable
                      as bool,
            taxAdvantageExplanation: freezed == taxAdvantageExplanation
                ? _value.taxAdvantageExplanation
                : taxAdvantageExplanation // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvestmentRecommendationImplCopyWith<$Res>
    implements $InvestmentRecommendationCopyWith<$Res> {
  factory _$$InvestmentRecommendationImplCopyWith(
    _$InvestmentRecommendationImpl value,
    $Res Function(_$InvestmentRecommendationImpl) then,
  ) = __$$InvestmentRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String symbol,
    String name,
    AssetType assetType,
    RecommendationType recommendationType,
    String reasoning,
    double suggestedAllocation,
    double? currentPrice,
    double? expenseRatio,
    double? dividendYield,
    RiskLevel riskLevel,
    List<String> tags,
    DateTime recommendedAt,
    bool isTaxAdvantaged,
    String? taxAdvantageExplanation,
  });
}

/// @nodoc
class __$$InvestmentRecommendationImplCopyWithImpl<$Res>
    extends
        _$InvestmentRecommendationCopyWithImpl<
          $Res,
          _$InvestmentRecommendationImpl
        >
    implements _$$InvestmentRecommendationImplCopyWith<$Res> {
  __$$InvestmentRecommendationImplCopyWithImpl(
    _$InvestmentRecommendationImpl _value,
    $Res Function(_$InvestmentRecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvestmentRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = null,
    Object? assetType = null,
    Object? recommendationType = null,
    Object? reasoning = null,
    Object? suggestedAllocation = null,
    Object? currentPrice = freezed,
    Object? expenseRatio = freezed,
    Object? dividendYield = freezed,
    Object? riskLevel = null,
    Object? tags = null,
    Object? recommendedAt = null,
    Object? isTaxAdvantaged = null,
    Object? taxAdvantageExplanation = freezed,
  }) {
    return _then(
      _$InvestmentRecommendationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        symbol: null == symbol
            ? _value.symbol
            : symbol // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        assetType: null == assetType
            ? _value.assetType
            : assetType // ignore: cast_nullable_to_non_nullable
                  as AssetType,
        recommendationType: null == recommendationType
            ? _value.recommendationType
            : recommendationType // ignore: cast_nullable_to_non_nullable
                  as RecommendationType,
        reasoning: null == reasoning
            ? _value.reasoning
            : reasoning // ignore: cast_nullable_to_non_nullable
                  as String,
        suggestedAllocation: null == suggestedAllocation
            ? _value.suggestedAllocation
            : suggestedAllocation // ignore: cast_nullable_to_non_nullable
                  as double,
        currentPrice: freezed == currentPrice
            ? _value.currentPrice
            : currentPrice // ignore: cast_nullable_to_non_nullable
                  as double?,
        expenseRatio: freezed == expenseRatio
            ? _value.expenseRatio
            : expenseRatio // ignore: cast_nullable_to_non_nullable
                  as double?,
        dividendYield: freezed == dividendYield
            ? _value.dividendYield
            : dividendYield // ignore: cast_nullable_to_non_nullable
                  as double?,
        riskLevel: null == riskLevel
            ? _value.riskLevel
            : riskLevel // ignore: cast_nullable_to_non_nullable
                  as RiskLevel,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        recommendedAt: null == recommendedAt
            ? _value.recommendedAt
            : recommendedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isTaxAdvantaged: null == isTaxAdvantaged
            ? _value.isTaxAdvantaged
            : isTaxAdvantaged // ignore: cast_nullable_to_non_nullable
                  as bool,
        taxAdvantageExplanation: freezed == taxAdvantageExplanation
            ? _value.taxAdvantageExplanation
            : taxAdvantageExplanation // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestmentRecommendationImpl implements _InvestmentRecommendation {
  const _$InvestmentRecommendationImpl({
    required this.id,
    required this.symbol,
    required this.name,
    required this.assetType,
    required this.recommendationType,
    required this.reasoning,
    required this.suggestedAllocation,
    this.currentPrice,
    this.expenseRatio,
    this.dividendYield,
    required this.riskLevel,
    required final List<String> tags,
    required this.recommendedAt,
    required this.isTaxAdvantaged,
    this.taxAdvantageExplanation,
  }) : _tags = tags;

  factory _$InvestmentRecommendationImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentRecommendationImplFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String name;
  @override
  final AssetType assetType;
  @override
  final RecommendationType recommendationType;
  @override
  final String reasoning;
  @override
  final double suggestedAllocation;
  // percentage
  @override
  final double? currentPrice;
  @override
  final double? expenseRatio;
  // for ETFs/mutual funds
  @override
  final double? dividendYield;
  @override
  final RiskLevel riskLevel;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final DateTime recommendedAt;
  @override
  final bool isTaxAdvantaged;
  @override
  final String? taxAdvantageExplanation;

  @override
  String toString() {
    return 'InvestmentRecommendation(id: $id, symbol: $symbol, name: $name, assetType: $assetType, recommendationType: $recommendationType, reasoning: $reasoning, suggestedAllocation: $suggestedAllocation, currentPrice: $currentPrice, expenseRatio: $expenseRatio, dividendYield: $dividendYield, riskLevel: $riskLevel, tags: $tags, recommendedAt: $recommendedAt, isTaxAdvantaged: $isTaxAdvantaged, taxAdvantageExplanation: $taxAdvantageExplanation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentRecommendationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.recommendationType, recommendationType) ||
                other.recommendationType == recommendationType) &&
            (identical(other.reasoning, reasoning) ||
                other.reasoning == reasoning) &&
            (identical(other.suggestedAllocation, suggestedAllocation) ||
                other.suggestedAllocation == suggestedAllocation) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.expenseRatio, expenseRatio) ||
                other.expenseRatio == expenseRatio) &&
            (identical(other.dividendYield, dividendYield) ||
                other.dividendYield == dividendYield) &&
            (identical(other.riskLevel, riskLevel) ||
                other.riskLevel == riskLevel) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.recommendedAt, recommendedAt) ||
                other.recommendedAt == recommendedAt) &&
            (identical(other.isTaxAdvantaged, isTaxAdvantaged) ||
                other.isTaxAdvantaged == isTaxAdvantaged) &&
            (identical(
                  other.taxAdvantageExplanation,
                  taxAdvantageExplanation,
                ) ||
                other.taxAdvantageExplanation == taxAdvantageExplanation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    symbol,
    name,
    assetType,
    recommendationType,
    reasoning,
    suggestedAllocation,
    currentPrice,
    expenseRatio,
    dividendYield,
    riskLevel,
    const DeepCollectionEquality().hash(_tags),
    recommendedAt,
    isTaxAdvantaged,
    taxAdvantageExplanation,
  );

  /// Create a copy of InvestmentRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentRecommendationImplCopyWith<_$InvestmentRecommendationImpl>
  get copyWith =>
      __$$InvestmentRecommendationImplCopyWithImpl<
        _$InvestmentRecommendationImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentRecommendationImplToJson(this);
  }
}

abstract class _InvestmentRecommendation implements InvestmentRecommendation {
  const factory _InvestmentRecommendation({
    required final String id,
    required final String symbol,
    required final String name,
    required final AssetType assetType,
    required final RecommendationType recommendationType,
    required final String reasoning,
    required final double suggestedAllocation,
    final double? currentPrice,
    final double? expenseRatio,
    final double? dividendYield,
    required final RiskLevel riskLevel,
    required final List<String> tags,
    required final DateTime recommendedAt,
    required final bool isTaxAdvantaged,
    final String? taxAdvantageExplanation,
  }) = _$InvestmentRecommendationImpl;

  factory _InvestmentRecommendation.fromJson(Map<String, dynamic> json) =
      _$InvestmentRecommendationImpl.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String get name;
  @override
  AssetType get assetType;
  @override
  RecommendationType get recommendationType;
  @override
  String get reasoning;
  @override
  double get suggestedAllocation; // percentage
  @override
  double? get currentPrice;
  @override
  double? get expenseRatio; // for ETFs/mutual funds
  @override
  double? get dividendYield;
  @override
  RiskLevel get riskLevel;
  @override
  List<String> get tags;
  @override
  DateTime get recommendedAt;
  @override
  bool get isTaxAdvantaged;
  @override
  String? get taxAdvantageExplanation;

  /// Create a copy of InvestmentRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvestmentRecommendationImplCopyWith<_$InvestmentRecommendationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

DCAplan _$DCAplanFromJson(Map<String, dynamic> json) {
  return _DCAplan.fromJson(json);
}

/// @nodoc
mixin _$DCAplan {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get monthlyAmount => throw _privateConstructorUsedError;
  int get dayOfMonth => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  int get totalContributions => throw _privateConstructorUsedError;
  double get totalInvested => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  double get averageCost => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this DCAplan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DCAplan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DCAplanCopyWith<DCAplan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DCAplanCopyWith<$Res> {
  factory $DCAplanCopyWith(DCAplan value, $Res Function(DCAplan) then) =
      _$DCAplanCopyWithImpl<$Res, DCAplan>;
  @useResult
  $Res call({
    String id,
    String symbol,
    String name,
    double monthlyAmount,
    int dayOfMonth,
    DateTime startDate,
    DateTime? endDate,
    int totalContributions,
    double totalInvested,
    double currentValue,
    double averageCost,
    bool isActive,
  });
}

/// @nodoc
class _$DCAplanCopyWithImpl<$Res, $Val extends DCAplan>
    implements $DCAplanCopyWith<$Res> {
  _$DCAplanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DCAplan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = null,
    Object? monthlyAmount = null,
    Object? dayOfMonth = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? totalContributions = null,
    Object? totalInvested = null,
    Object? currentValue = null,
    Object? averageCost = null,
    Object? isActive = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            symbol: null == symbol
                ? _value.symbol
                : symbol // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            monthlyAmount: null == monthlyAmount
                ? _value.monthlyAmount
                : monthlyAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            dayOfMonth: null == dayOfMonth
                ? _value.dayOfMonth
                : dayOfMonth // ignore: cast_nullable_to_non_nullable
                      as int,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            totalContributions: null == totalContributions
                ? _value.totalContributions
                : totalContributions // ignore: cast_nullable_to_non_nullable
                      as int,
            totalInvested: null == totalInvested
                ? _value.totalInvested
                : totalInvested // ignore: cast_nullable_to_non_nullable
                      as double,
            currentValue: null == currentValue
                ? _value.currentValue
                : currentValue // ignore: cast_nullable_to_non_nullable
                      as double,
            averageCost: null == averageCost
                ? _value.averageCost
                : averageCost // ignore: cast_nullable_to_non_nullable
                      as double,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DCAplanImplCopyWith<$Res> implements $DCAplanCopyWith<$Res> {
  factory _$$DCAplanImplCopyWith(
    _$DCAplanImpl value,
    $Res Function(_$DCAplanImpl) then,
  ) = __$$DCAplanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String symbol,
    String name,
    double monthlyAmount,
    int dayOfMonth,
    DateTime startDate,
    DateTime? endDate,
    int totalContributions,
    double totalInvested,
    double currentValue,
    double averageCost,
    bool isActive,
  });
}

/// @nodoc
class __$$DCAplanImplCopyWithImpl<$Res>
    extends _$DCAplanCopyWithImpl<$Res, _$DCAplanImpl>
    implements _$$DCAplanImplCopyWith<$Res> {
  __$$DCAplanImplCopyWithImpl(
    _$DCAplanImpl _value,
    $Res Function(_$DCAplanImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DCAplan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? name = null,
    Object? monthlyAmount = null,
    Object? dayOfMonth = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? totalContributions = null,
    Object? totalInvested = null,
    Object? currentValue = null,
    Object? averageCost = null,
    Object? isActive = null,
  }) {
    return _then(
      _$DCAplanImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        symbol: null == symbol
            ? _value.symbol
            : symbol // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        monthlyAmount: null == monthlyAmount
            ? _value.monthlyAmount
            : monthlyAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        dayOfMonth: null == dayOfMonth
            ? _value.dayOfMonth
            : dayOfMonth // ignore: cast_nullable_to_non_nullable
                  as int,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        totalContributions: null == totalContributions
            ? _value.totalContributions
            : totalContributions // ignore: cast_nullable_to_non_nullable
                  as int,
        totalInvested: null == totalInvested
            ? _value.totalInvested
            : totalInvested // ignore: cast_nullable_to_non_nullable
                  as double,
        currentValue: null == currentValue
            ? _value.currentValue
            : currentValue // ignore: cast_nullable_to_non_nullable
                  as double,
        averageCost: null == averageCost
            ? _value.averageCost
            : averageCost // ignore: cast_nullable_to_non_nullable
                  as double,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DCAplanImpl implements _DCAplan {
  const _$DCAplanImpl({
    required this.id,
    required this.symbol,
    required this.name,
    required this.monthlyAmount,
    required this.dayOfMonth,
    required this.startDate,
    required this.endDate,
    required this.totalContributions,
    required this.totalInvested,
    required this.currentValue,
    required this.averageCost,
    required this.isActive,
  });

  factory _$DCAplanImpl.fromJson(Map<String, dynamic> json) =>
      _$$DCAplanImplFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String name;
  @override
  final double monthlyAmount;
  @override
  final int dayOfMonth;
  @override
  final DateTime startDate;
  @override
  final DateTime? endDate;
  @override
  final int totalContributions;
  @override
  final double totalInvested;
  @override
  final double currentValue;
  @override
  final double averageCost;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'DCAplan(id: $id, symbol: $symbol, name: $name, monthlyAmount: $monthlyAmount, dayOfMonth: $dayOfMonth, startDate: $startDate, endDate: $endDate, totalContributions: $totalContributions, totalInvested: $totalInvested, currentValue: $currentValue, averageCost: $averageCost, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DCAplanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.monthlyAmount, monthlyAmount) ||
                other.monthlyAmount == monthlyAmount) &&
            (identical(other.dayOfMonth, dayOfMonth) ||
                other.dayOfMonth == dayOfMonth) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.totalContributions, totalContributions) ||
                other.totalContributions == totalContributions) &&
            (identical(other.totalInvested, totalInvested) ||
                other.totalInvested == totalInvested) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.averageCost, averageCost) ||
                other.averageCost == averageCost) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    symbol,
    name,
    monthlyAmount,
    dayOfMonth,
    startDate,
    endDate,
    totalContributions,
    totalInvested,
    currentValue,
    averageCost,
    isActive,
  );

  /// Create a copy of DCAplan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DCAplanImplCopyWith<_$DCAplanImpl> get copyWith =>
      __$$DCAplanImplCopyWithImpl<_$DCAplanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DCAplanImplToJson(this);
  }
}

abstract class _DCAplan implements DCAplan {
  const factory _DCAplan({
    required final String id,
    required final String symbol,
    required final String name,
    required final double monthlyAmount,
    required final int dayOfMonth,
    required final DateTime startDate,
    required final DateTime? endDate,
    required final int totalContributions,
    required final double totalInvested,
    required final double currentValue,
    required final double averageCost,
    required final bool isActive,
  }) = _$DCAplanImpl;

  factory _DCAplan.fromJson(Map<String, dynamic> json) = _$DCAplanImpl.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String get name;
  @override
  double get monthlyAmount;
  @override
  int get dayOfMonth;
  @override
  DateTime get startDate;
  @override
  DateTime? get endDate;
  @override
  int get totalContributions;
  @override
  double get totalInvested;
  @override
  double get currentValue;
  @override
  double get averageCost;
  @override
  bool get isActive;

  /// Create a copy of DCAplan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DCAplanImplCopyWith<_$DCAplanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaxAdvantageRecommendation _$TaxAdvantageRecommendationFromJson(
  Map<String, dynamic> json,
) {
  return _TaxAdvantageRecommendation.fromJson(json);
}

/// @nodoc
mixin _$TaxAdvantageRecommendation {
  TaxAccountType get accountType => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;
  double get annualLimit => throw _privateConstructorUsedError;
  double get currentContribution => throw _privateConstructorUsedError;
  double get remainingRoom => throw _privateConstructorUsedError;
  double get potentialTaxSavings => throw _privateConstructorUsedError;
  List<String> get eligibilityNotes => throw _privateConstructorUsedError;

  /// Serializes this TaxAdvantageRecommendation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaxAdvantageRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaxAdvantageRecommendationCopyWith<TaxAdvantageRecommendation>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxAdvantageRecommendationCopyWith<$Res> {
  factory $TaxAdvantageRecommendationCopyWith(
    TaxAdvantageRecommendation value,
    $Res Function(TaxAdvantageRecommendation) then,
  ) =
      _$TaxAdvantageRecommendationCopyWithImpl<
        $Res,
        TaxAdvantageRecommendation
      >;
  @useResult
  $Res call({
    TaxAccountType accountType,
    String reason,
    double annualLimit,
    double currentContribution,
    double remainingRoom,
    double potentialTaxSavings,
    List<String> eligibilityNotes,
  });
}

/// @nodoc
class _$TaxAdvantageRecommendationCopyWithImpl<
  $Res,
  $Val extends TaxAdvantageRecommendation
>
    implements $TaxAdvantageRecommendationCopyWith<$Res> {
  _$TaxAdvantageRecommendationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaxAdvantageRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountType = null,
    Object? reason = null,
    Object? annualLimit = null,
    Object? currentContribution = null,
    Object? remainingRoom = null,
    Object? potentialTaxSavings = null,
    Object? eligibilityNotes = null,
  }) {
    return _then(
      _value.copyWith(
            accountType: null == accountType
                ? _value.accountType
                : accountType // ignore: cast_nullable_to_non_nullable
                      as TaxAccountType,
            reason: null == reason
                ? _value.reason
                : reason // ignore: cast_nullable_to_non_nullable
                      as String,
            annualLimit: null == annualLimit
                ? _value.annualLimit
                : annualLimit // ignore: cast_nullable_to_non_nullable
                      as double,
            currentContribution: null == currentContribution
                ? _value.currentContribution
                : currentContribution // ignore: cast_nullable_to_non_nullable
                      as double,
            remainingRoom: null == remainingRoom
                ? _value.remainingRoom
                : remainingRoom // ignore: cast_nullable_to_non_nullable
                      as double,
            potentialTaxSavings: null == potentialTaxSavings
                ? _value.potentialTaxSavings
                : potentialTaxSavings // ignore: cast_nullable_to_non_nullable
                      as double,
            eligibilityNotes: null == eligibilityNotes
                ? _value.eligibilityNotes
                : eligibilityNotes // ignore: cast_nullable_to_non_nullable
                      as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TaxAdvantageRecommendationImplCopyWith<$Res>
    implements $TaxAdvantageRecommendationCopyWith<$Res> {
  factory _$$TaxAdvantageRecommendationImplCopyWith(
    _$TaxAdvantageRecommendationImpl value,
    $Res Function(_$TaxAdvantageRecommendationImpl) then,
  ) = __$$TaxAdvantageRecommendationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TaxAccountType accountType,
    String reason,
    double annualLimit,
    double currentContribution,
    double remainingRoom,
    double potentialTaxSavings,
    List<String> eligibilityNotes,
  });
}

/// @nodoc
class __$$TaxAdvantageRecommendationImplCopyWithImpl<$Res>
    extends
        _$TaxAdvantageRecommendationCopyWithImpl<
          $Res,
          _$TaxAdvantageRecommendationImpl
        >
    implements _$$TaxAdvantageRecommendationImplCopyWith<$Res> {
  __$$TaxAdvantageRecommendationImplCopyWithImpl(
    _$TaxAdvantageRecommendationImpl _value,
    $Res Function(_$TaxAdvantageRecommendationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TaxAdvantageRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountType = null,
    Object? reason = null,
    Object? annualLimit = null,
    Object? currentContribution = null,
    Object? remainingRoom = null,
    Object? potentialTaxSavings = null,
    Object? eligibilityNotes = null,
  }) {
    return _then(
      _$TaxAdvantageRecommendationImpl(
        accountType: null == accountType
            ? _value.accountType
            : accountType // ignore: cast_nullable_to_non_nullable
                  as TaxAccountType,
        reason: null == reason
            ? _value.reason
            : reason // ignore: cast_nullable_to_non_nullable
                  as String,
        annualLimit: null == annualLimit
            ? _value.annualLimit
            : annualLimit // ignore: cast_nullable_to_non_nullable
                  as double,
        currentContribution: null == currentContribution
            ? _value.currentContribution
            : currentContribution // ignore: cast_nullable_to_non_nullable
                  as double,
        remainingRoom: null == remainingRoom
            ? _value.remainingRoom
            : remainingRoom // ignore: cast_nullable_to_non_nullable
                  as double,
        potentialTaxSavings: null == potentialTaxSavings
            ? _value.potentialTaxSavings
            : potentialTaxSavings // ignore: cast_nullable_to_non_nullable
                  as double,
        eligibilityNotes: null == eligibilityNotes
            ? _value._eligibilityNotes
            : eligibilityNotes // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxAdvantageRecommendationImpl implements _TaxAdvantageRecommendation {
  const _$TaxAdvantageRecommendationImpl({
    required this.accountType,
    required this.reason,
    required this.annualLimit,
    required this.currentContribution,
    required this.remainingRoom,
    required this.potentialTaxSavings,
    required final List<String> eligibilityNotes,
  }) : _eligibilityNotes = eligibilityNotes;

  factory _$TaxAdvantageRecommendationImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$TaxAdvantageRecommendationImplFromJson(json);

  @override
  final TaxAccountType accountType;
  @override
  final String reason;
  @override
  final double annualLimit;
  @override
  final double currentContribution;
  @override
  final double remainingRoom;
  @override
  final double potentialTaxSavings;
  final List<String> _eligibilityNotes;
  @override
  List<String> get eligibilityNotes {
    if (_eligibilityNotes is EqualUnmodifiableListView)
      return _eligibilityNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eligibilityNotes);
  }

  @override
  String toString() {
    return 'TaxAdvantageRecommendation(accountType: $accountType, reason: $reason, annualLimit: $annualLimit, currentContribution: $currentContribution, remainingRoom: $remainingRoom, potentialTaxSavings: $potentialTaxSavings, eligibilityNotes: $eligibilityNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxAdvantageRecommendationImpl &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.annualLimit, annualLimit) ||
                other.annualLimit == annualLimit) &&
            (identical(other.currentContribution, currentContribution) ||
                other.currentContribution == currentContribution) &&
            (identical(other.remainingRoom, remainingRoom) ||
                other.remainingRoom == remainingRoom) &&
            (identical(other.potentialTaxSavings, potentialTaxSavings) ||
                other.potentialTaxSavings == potentialTaxSavings) &&
            const DeepCollectionEquality().equals(
              other._eligibilityNotes,
              _eligibilityNotes,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    accountType,
    reason,
    annualLimit,
    currentContribution,
    remainingRoom,
    potentialTaxSavings,
    const DeepCollectionEquality().hash(_eligibilityNotes),
  );

  /// Create a copy of TaxAdvantageRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxAdvantageRecommendationImplCopyWith<_$TaxAdvantageRecommendationImpl>
  get copyWith =>
      __$$TaxAdvantageRecommendationImplCopyWithImpl<
        _$TaxAdvantageRecommendationImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxAdvantageRecommendationImplToJson(this);
  }
}

abstract class _TaxAdvantageRecommendation
    implements TaxAdvantageRecommendation {
  const factory _TaxAdvantageRecommendation({
    required final TaxAccountType accountType,
    required final String reason,
    required final double annualLimit,
    required final double currentContribution,
    required final double remainingRoom,
    required final double potentialTaxSavings,
    required final List<String> eligibilityNotes,
  }) = _$TaxAdvantageRecommendationImpl;

  factory _TaxAdvantageRecommendation.fromJson(Map<String, dynamic> json) =
      _$TaxAdvantageRecommendationImpl.fromJson;

  @override
  TaxAccountType get accountType;
  @override
  String get reason;
  @override
  double get annualLimit;
  @override
  double get currentContribution;
  @override
  double get remainingRoom;
  @override
  double get potentialTaxSavings;
  @override
  List<String> get eligibilityNotes;

  /// Create a copy of TaxAdvantageRecommendation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaxAdvantageRecommendationImplCopyWith<_$TaxAdvantageRecommendationImpl>
  get copyWith => throw _privateConstructorUsedError;
}

InvestmentEducation _$InvestmentEducationFromJson(Map<String, dynamic> json) {
  return _InvestmentEducation.fromJson(json);
}

/// @nodoc
mixin _$InvestmentEducation {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  EducationTopic get topic => throw _privateConstructorUsedError;
  EducationLevel get level => throw _privateConstructorUsedError;
  int get readTimeMinutes => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this InvestmentEducation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvestmentEducation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvestmentEducationCopyWith<InvestmentEducation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvestmentEducationCopyWith<$Res> {
  factory $InvestmentEducationCopyWith(
    InvestmentEducation value,
    $Res Function(InvestmentEducation) then,
  ) = _$InvestmentEducationCopyWithImpl<$Res, InvestmentEducation>;
  @useResult
  $Res call({
    String id,
    String title,
    String content,
    EducationTopic topic,
    EducationLevel level,
    int readTimeMinutes,
    bool isCompleted,
  });
}

/// @nodoc
class _$InvestmentEducationCopyWithImpl<$Res, $Val extends InvestmentEducation>
    implements $InvestmentEducationCopyWith<$Res> {
  _$InvestmentEducationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvestmentEducation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? topic = null,
    Object? level = null,
    Object? readTimeMinutes = null,
    Object? isCompleted = null,
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
            content: null == content
                ? _value.content
                : content // ignore: cast_nullable_to_non_nullable
                      as String,
            topic: null == topic
                ? _value.topic
                : topic // ignore: cast_nullable_to_non_nullable
                      as EducationTopic,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as EducationLevel,
            readTimeMinutes: null == readTimeMinutes
                ? _value.readTimeMinutes
                : readTimeMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InvestmentEducationImplCopyWith<$Res>
    implements $InvestmentEducationCopyWith<$Res> {
  factory _$$InvestmentEducationImplCopyWith(
    _$InvestmentEducationImpl value,
    $Res Function(_$InvestmentEducationImpl) then,
  ) = __$$InvestmentEducationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String content,
    EducationTopic topic,
    EducationLevel level,
    int readTimeMinutes,
    bool isCompleted,
  });
}

/// @nodoc
class __$$InvestmentEducationImplCopyWithImpl<$Res>
    extends _$InvestmentEducationCopyWithImpl<$Res, _$InvestmentEducationImpl>
    implements _$$InvestmentEducationImplCopyWith<$Res> {
  __$$InvestmentEducationImplCopyWithImpl(
    _$InvestmentEducationImpl _value,
    $Res Function(_$InvestmentEducationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InvestmentEducation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? topic = null,
    Object? level = null,
    Object? readTimeMinutes = null,
    Object? isCompleted = null,
  }) {
    return _then(
      _$InvestmentEducationImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        topic: null == topic
            ? _value.topic
            : topic // ignore: cast_nullable_to_non_nullable
                  as EducationTopic,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as EducationLevel,
        readTimeMinutes: null == readTimeMinutes
            ? _value.readTimeMinutes
            : readTimeMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InvestmentEducationImpl implements _InvestmentEducation {
  const _$InvestmentEducationImpl({
    required this.id,
    required this.title,
    required this.content,
    required this.topic,
    required this.level,
    required this.readTimeMinutes,
    required this.isCompleted,
  });

  factory _$InvestmentEducationImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvestmentEducationImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  final EducationTopic topic;
  @override
  final EducationLevel level;
  @override
  final int readTimeMinutes;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'InvestmentEducation(id: $id, title: $title, content: $content, topic: $topic, level: $level, readTimeMinutes: $readTimeMinutes, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvestmentEducationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.readTimeMinutes, readTimeMinutes) ||
                other.readTimeMinutes == readTimeMinutes) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    content,
    topic,
    level,
    readTimeMinutes,
    isCompleted,
  );

  /// Create a copy of InvestmentEducation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvestmentEducationImplCopyWith<_$InvestmentEducationImpl> get copyWith =>
      __$$InvestmentEducationImplCopyWithImpl<_$InvestmentEducationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$InvestmentEducationImplToJson(this);
  }
}

abstract class _InvestmentEducation implements InvestmentEducation {
  const factory _InvestmentEducation({
    required final String id,
    required final String title,
    required final String content,
    required final EducationTopic topic,
    required final EducationLevel level,
    required final int readTimeMinutes,
    required final bool isCompleted,
  }) = _$InvestmentEducationImpl;

  factory _InvestmentEducation.fromJson(Map<String, dynamic> json) =
      _$InvestmentEducationImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  EducationTopic get topic;
  @override
  EducationLevel get level;
  @override
  int get readTimeMinutes;
  @override
  bool get isCompleted;

  /// Create a copy of InvestmentEducation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvestmentEducationImplCopyWith<_$InvestmentEducationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
