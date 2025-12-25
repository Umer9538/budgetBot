// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_question_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserSecurityQuestion _$UserSecurityQuestionFromJson(Map<String, dynamic> json) {
  return _UserSecurityQuestion.fromJson(json);
}

/// @nodoc
mixin _$UserSecurityQuestion {
  String get question => throw _privateConstructorUsedError;
  String get answerHash => throw _privateConstructorUsedError;

  /// Serializes this UserSecurityQuestion to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSecurityQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSecurityQuestionCopyWith<UserSecurityQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSecurityQuestionCopyWith<$Res> {
  factory $UserSecurityQuestionCopyWith(
    UserSecurityQuestion value,
    $Res Function(UserSecurityQuestion) then,
  ) = _$UserSecurityQuestionCopyWithImpl<$Res, UserSecurityQuestion>;
  @useResult
  $Res call({String question, String answerHash});
}

/// @nodoc
class _$UserSecurityQuestionCopyWithImpl<
  $Res,
  $Val extends UserSecurityQuestion
>
    implements $UserSecurityQuestionCopyWith<$Res> {
  _$UserSecurityQuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSecurityQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? question = null, Object? answerHash = null}) {
    return _then(
      _value.copyWith(
            question: null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as String,
            answerHash: null == answerHash
                ? _value.answerHash
                : answerHash // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserSecurityQuestionImplCopyWith<$Res>
    implements $UserSecurityQuestionCopyWith<$Res> {
  factory _$$UserSecurityQuestionImplCopyWith(
    _$UserSecurityQuestionImpl value,
    $Res Function(_$UserSecurityQuestionImpl) then,
  ) = __$$UserSecurityQuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String question, String answerHash});
}

/// @nodoc
class __$$UserSecurityQuestionImplCopyWithImpl<$Res>
    extends _$UserSecurityQuestionCopyWithImpl<$Res, _$UserSecurityQuestionImpl>
    implements _$$UserSecurityQuestionImplCopyWith<$Res> {
  __$$UserSecurityQuestionImplCopyWithImpl(
    _$UserSecurityQuestionImpl _value,
    $Res Function(_$UserSecurityQuestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserSecurityQuestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? question = null, Object? answerHash = null}) {
    return _then(
      _$UserSecurityQuestionImpl(
        question: null == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as String,
        answerHash: null == answerHash
            ? _value.answerHash
            : answerHash // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSecurityQuestionImpl implements _UserSecurityQuestion {
  const _$UserSecurityQuestionImpl({
    required this.question,
    required this.answerHash,
  });

  factory _$UserSecurityQuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSecurityQuestionImplFromJson(json);

  @override
  final String question;
  @override
  final String answerHash;

  @override
  String toString() {
    return 'UserSecurityQuestion(question: $question, answerHash: $answerHash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSecurityQuestionImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answerHash, answerHash) ||
                other.answerHash == answerHash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, question, answerHash);

  /// Create a copy of UserSecurityQuestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSecurityQuestionImplCopyWith<_$UserSecurityQuestionImpl>
  get copyWith =>
      __$$UserSecurityQuestionImplCopyWithImpl<_$UserSecurityQuestionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSecurityQuestionImplToJson(this);
  }
}

abstract class _UserSecurityQuestion implements UserSecurityQuestion {
  const factory _UserSecurityQuestion({
    required final String question,
    required final String answerHash,
  }) = _$UserSecurityQuestionImpl;

  factory _UserSecurityQuestion.fromJson(Map<String, dynamic> json) =
      _$UserSecurityQuestionImpl.fromJson;

  @override
  String get question;
  @override
  String get answerHash;

  /// Create a copy of UserSecurityQuestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSecurityQuestionImplCopyWith<_$UserSecurityQuestionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

UserSecurityData _$UserSecurityDataFromJson(Map<String, dynamic> json) {
  return _UserSecurityData.fromJson(json);
}

/// @nodoc
mixin _$UserSecurityData {
  String get userId => throw _privateConstructorUsedError;
  List<UserSecurityQuestion> get questions =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserSecurityData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSecurityData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSecurityDataCopyWith<UserSecurityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSecurityDataCopyWith<$Res> {
  factory $UserSecurityDataCopyWith(
    UserSecurityData value,
    $Res Function(UserSecurityData) then,
  ) = _$UserSecurityDataCopyWithImpl<$Res, UserSecurityData>;
  @useResult
  $Res call({
    String userId,
    List<UserSecurityQuestion> questions,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$UserSecurityDataCopyWithImpl<$Res, $Val extends UserSecurityData>
    implements $UserSecurityDataCopyWith<$Res> {
  _$UserSecurityDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSecurityData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? questions = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            questions: null == questions
                ? _value.questions
                : questions // ignore: cast_nullable_to_non_nullable
                      as List<UserSecurityQuestion>,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
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
abstract class _$$UserSecurityDataImplCopyWith<$Res>
    implements $UserSecurityDataCopyWith<$Res> {
  factory _$$UserSecurityDataImplCopyWith(
    _$UserSecurityDataImpl value,
    $Res Function(_$UserSecurityDataImpl) then,
  ) = __$$UserSecurityDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String userId,
    List<UserSecurityQuestion> questions,
    DateTime createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$UserSecurityDataImplCopyWithImpl<$Res>
    extends _$UserSecurityDataCopyWithImpl<$Res, _$UserSecurityDataImpl>
    implements _$$UserSecurityDataImplCopyWith<$Res> {
  __$$UserSecurityDataImplCopyWithImpl(
    _$UserSecurityDataImpl _value,
    $Res Function(_$UserSecurityDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserSecurityData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? questions = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$UserSecurityDataImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        questions: null == questions
            ? _value._questions
            : questions // ignore: cast_nullable_to_non_nullable
                  as List<UserSecurityQuestion>,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
class _$UserSecurityDataImpl extends _UserSecurityData {
  const _$UserSecurityDataImpl({
    required this.userId,
    required final List<UserSecurityQuestion> questions,
    required this.createdAt,
    this.updatedAt,
  }) : _questions = questions,
       super._();

  factory _$UserSecurityDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSecurityDataImplFromJson(json);

  @override
  final String userId;
  final List<UserSecurityQuestion> _questions;
  @override
  List<UserSecurityQuestion> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'UserSecurityData(userId: $userId, questions: $questions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSecurityDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(
              other._questions,
              _questions,
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
    userId,
    const DeepCollectionEquality().hash(_questions),
    createdAt,
    updatedAt,
  );

  /// Create a copy of UserSecurityData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSecurityDataImplCopyWith<_$UserSecurityDataImpl> get copyWith =>
      __$$UserSecurityDataImplCopyWithImpl<_$UserSecurityDataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSecurityDataImplToJson(this);
  }
}

abstract class _UserSecurityData extends UserSecurityData {
  const factory _UserSecurityData({
    required final String userId,
    required final List<UserSecurityQuestion> questions,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$UserSecurityDataImpl;
  const _UserSecurityData._() : super._();

  factory _UserSecurityData.fromJson(Map<String, dynamic> json) =
      _$UserSecurityDataImpl.fromJson;

  @override
  String get userId;
  @override
  List<UserSecurityQuestion> get questions;
  @override
  DateTime get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of UserSecurityData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSecurityDataImplCopyWith<_$UserSecurityDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
