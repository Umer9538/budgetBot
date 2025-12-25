// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'micro_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MicroTask _$MicroTaskFromJson(Map<String, dynamic> json) {
  return _MicroTask.fromJson(json);
}

/// @nodoc
mixin _$MicroTask {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  TaskType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  TaskDifficulty get difficulty => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get actionUrl => throw _privateConstructorUsedError;
  String? get actionLabel => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this MicroTask to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MicroTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MicroTaskCopyWith<MicroTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MicroTaskCopyWith<$Res> {
  factory $MicroTaskCopyWith(MicroTask value, $Res Function(MicroTask) then) =
      _$MicroTaskCopyWithImpl<$Res, MicroTask>;
  @useResult
  $Res call({
    String id,
    String userId,
    TaskType type,
    String title,
    String description,
    int points,
    TaskStatus status,
    TaskDifficulty difficulty,
    DateTime? dueDate,
    DateTime? completedAt,
    String? actionUrl,
    String? actionLabel,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
  });
}

/// @nodoc
class _$MicroTaskCopyWithImpl<$Res, $Val extends MicroTask>
    implements $MicroTaskCopyWith<$Res> {
  _$MicroTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MicroTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? points = null,
    Object? status = null,
    Object? difficulty = null,
    Object? dueDate = freezed,
    Object? completedAt = freezed,
    Object? actionUrl = freezed,
    Object? actionLabel = freezed,
    Object? metadata = freezed,
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
                      as TaskType,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            points: null == points
                ? _value.points
                : points // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TaskStatus,
            difficulty: null == difficulty
                ? _value.difficulty
                : difficulty // ignore: cast_nullable_to_non_nullable
                      as TaskDifficulty,
            dueDate: freezed == dueDate
                ? _value.dueDate
                : dueDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            actionUrl: freezed == actionUrl
                ? _value.actionUrl
                : actionUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            actionLabel: freezed == actionLabel
                ? _value.actionLabel
                : actionLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            metadata: freezed == metadata
                ? _value.metadata
                : metadata // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
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
abstract class _$$MicroTaskImplCopyWith<$Res>
    implements $MicroTaskCopyWith<$Res> {
  factory _$$MicroTaskImplCopyWith(
    _$MicroTaskImpl value,
    $Res Function(_$MicroTaskImpl) then,
  ) = __$$MicroTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    TaskType type,
    String title,
    String description,
    int points,
    TaskStatus status,
    TaskDifficulty difficulty,
    DateTime? dueDate,
    DateTime? completedAt,
    String? actionUrl,
    String? actionLabel,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
  });
}

/// @nodoc
class __$$MicroTaskImplCopyWithImpl<$Res>
    extends _$MicroTaskCopyWithImpl<$Res, _$MicroTaskImpl>
    implements _$$MicroTaskImplCopyWith<$Res> {
  __$$MicroTaskImplCopyWithImpl(
    _$MicroTaskImpl _value,
    $Res Function(_$MicroTaskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MicroTask
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? points = null,
    Object? status = null,
    Object? difficulty = null,
    Object? dueDate = freezed,
    Object? completedAt = freezed,
    Object? actionUrl = freezed,
    Object? actionLabel = freezed,
    Object? metadata = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$MicroTaskImpl(
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
                  as TaskType,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        points: null == points
            ? _value.points
            : points // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TaskStatus,
        difficulty: null == difficulty
            ? _value.difficulty
            : difficulty // ignore: cast_nullable_to_non_nullable
                  as TaskDifficulty,
        dueDate: freezed == dueDate
            ? _value.dueDate
            : dueDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        actionUrl: freezed == actionUrl
            ? _value.actionUrl
            : actionUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionLabel: freezed == actionLabel
            ? _value.actionLabel
            : actionLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        metadata: freezed == metadata
            ? _value._metadata
            : metadata // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
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
class _$MicroTaskImpl implements _MicroTask {
  const _$MicroTaskImpl({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.description,
    required this.points,
    required this.status,
    required this.difficulty,
    this.dueDate,
    this.completedAt,
    this.actionUrl,
    this.actionLabel,
    final Map<String, dynamic>? metadata,
    this.createdAt,
  }) : _metadata = metadata;

  factory _$MicroTaskImpl.fromJson(Map<String, dynamic> json) =>
      _$$MicroTaskImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final TaskType type;
  @override
  final String title;
  @override
  final String description;
  @override
  final int points;
  @override
  final TaskStatus status;
  @override
  final TaskDifficulty difficulty;
  @override
  final DateTime? dueDate;
  @override
  final DateTime? completedAt;
  @override
  final String? actionUrl;
  @override
  final String? actionLabel;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'MicroTask(id: $id, userId: $userId, type: $type, title: $title, description: $description, points: $points, status: $status, difficulty: $difficulty, dueDate: $dueDate, completedAt: $completedAt, actionUrl: $actionUrl, actionLabel: $actionLabel, metadata: $metadata, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MicroTaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.actionLabel, actionLabel) ||
                other.actionLabel == actionLabel) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
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
    description,
    points,
    status,
    difficulty,
    dueDate,
    completedAt,
    actionUrl,
    actionLabel,
    const DeepCollectionEquality().hash(_metadata),
    createdAt,
  );

  /// Create a copy of MicroTask
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MicroTaskImplCopyWith<_$MicroTaskImpl> get copyWith =>
      __$$MicroTaskImplCopyWithImpl<_$MicroTaskImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MicroTaskImplToJson(this);
  }
}

abstract class _MicroTask implements MicroTask {
  const factory _MicroTask({
    required final String id,
    required final String userId,
    required final TaskType type,
    required final String title,
    required final String description,
    required final int points,
    required final TaskStatus status,
    required final TaskDifficulty difficulty,
    final DateTime? dueDate,
    final DateTime? completedAt,
    final String? actionUrl,
    final String? actionLabel,
    final Map<String, dynamic>? metadata,
    final DateTime? createdAt,
  }) = _$MicroTaskImpl;

  factory _MicroTask.fromJson(Map<String, dynamic> json) =
      _$MicroTaskImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  TaskType get type;
  @override
  String get title;
  @override
  String get description;
  @override
  int get points;
  @override
  TaskStatus get status;
  @override
  TaskDifficulty get difficulty;
  @override
  DateTime? get dueDate;
  @override
  DateTime? get completedAt;
  @override
  String? get actionUrl;
  @override
  String? get actionLabel;
  @override
  Map<String, dynamic>? get metadata;
  @override
  DateTime? get createdAt;

  /// Create a copy of MicroTask
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MicroTaskImplCopyWith<_$MicroTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyChallenge _$DailyChallengeFromJson(Map<String, dynamic> json) {
  return _DailyChallenge.fromJson(json);
}

/// @nodoc
mixin _$DailyChallenge {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<MicroTask> get tasks => throw _privateConstructorUsedError;
  int get totalPoints => throw _privateConstructorUsedError;
  int get earnedPoints => throw _privateConstructorUsedError;
  int get completedCount => throw _privateConstructorUsedError;
  bool get bonusEarned => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this DailyChallenge to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyChallenge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyChallengeCopyWith<DailyChallenge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyChallengeCopyWith<$Res> {
  factory $DailyChallengeCopyWith(
    DailyChallenge value,
    $Res Function(DailyChallenge) then,
  ) = _$DailyChallengeCopyWithImpl<$Res, DailyChallenge>;
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime date,
    List<MicroTask> tasks,
    int totalPoints,
    int earnedPoints,
    int completedCount,
    bool bonusEarned,
    DateTime? completedAt,
  });
}

/// @nodoc
class _$DailyChallengeCopyWithImpl<$Res, $Val extends DailyChallenge>
    implements $DailyChallengeCopyWith<$Res> {
  _$DailyChallengeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyChallenge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? tasks = null,
    Object? totalPoints = null,
    Object? earnedPoints = null,
    Object? completedCount = null,
    Object? bonusEarned = null,
    Object? completedAt = freezed,
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
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            tasks: null == tasks
                ? _value.tasks
                : tasks // ignore: cast_nullable_to_non_nullable
                      as List<MicroTask>,
            totalPoints: null == totalPoints
                ? _value.totalPoints
                : totalPoints // ignore: cast_nullable_to_non_nullable
                      as int,
            earnedPoints: null == earnedPoints
                ? _value.earnedPoints
                : earnedPoints // ignore: cast_nullable_to_non_nullable
                      as int,
            completedCount: null == completedCount
                ? _value.completedCount
                : completedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            bonusEarned: null == bonusEarned
                ? _value.bonusEarned
                : bonusEarned // ignore: cast_nullable_to_non_nullable
                      as bool,
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
abstract class _$$DailyChallengeImplCopyWith<$Res>
    implements $DailyChallengeCopyWith<$Res> {
  factory _$$DailyChallengeImplCopyWith(
    _$DailyChallengeImpl value,
    $Res Function(_$DailyChallengeImpl) then,
  ) = __$$DailyChallengeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    DateTime date,
    List<MicroTask> tasks,
    int totalPoints,
    int earnedPoints,
    int completedCount,
    bool bonusEarned,
    DateTime? completedAt,
  });
}

/// @nodoc
class __$$DailyChallengeImplCopyWithImpl<$Res>
    extends _$DailyChallengeCopyWithImpl<$Res, _$DailyChallengeImpl>
    implements _$$DailyChallengeImplCopyWith<$Res> {
  __$$DailyChallengeImplCopyWithImpl(
    _$DailyChallengeImpl _value,
    $Res Function(_$DailyChallengeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DailyChallenge
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? date = null,
    Object? tasks = null,
    Object? totalPoints = null,
    Object? earnedPoints = null,
    Object? completedCount = null,
    Object? bonusEarned = null,
    Object? completedAt = freezed,
  }) {
    return _then(
      _$DailyChallengeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        tasks: null == tasks
            ? _value._tasks
            : tasks // ignore: cast_nullable_to_non_nullable
                  as List<MicroTask>,
        totalPoints: null == totalPoints
            ? _value.totalPoints
            : totalPoints // ignore: cast_nullable_to_non_nullable
                  as int,
        earnedPoints: null == earnedPoints
            ? _value.earnedPoints
            : earnedPoints // ignore: cast_nullable_to_non_nullable
                  as int,
        completedCount: null == completedCount
            ? _value.completedCount
            : completedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        bonusEarned: null == bonusEarned
            ? _value.bonusEarned
            : bonusEarned // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$DailyChallengeImpl implements _DailyChallenge {
  const _$DailyChallengeImpl({
    required this.id,
    required this.userId,
    required this.date,
    required final List<MicroTask> tasks,
    required this.totalPoints,
    required this.earnedPoints,
    required this.completedCount,
    required this.bonusEarned,
    this.completedAt,
  }) : _tasks = tasks;

  factory _$DailyChallengeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyChallengeImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final DateTime date;
  final List<MicroTask> _tasks;
  @override
  List<MicroTask> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  final int totalPoints;
  @override
  final int earnedPoints;
  @override
  final int completedCount;
  @override
  final bool bonusEarned;
  @override
  final DateTime? completedAt;

  @override
  String toString() {
    return 'DailyChallenge(id: $id, userId: $userId, date: $date, tasks: $tasks, totalPoints: $totalPoints, earnedPoints: $earnedPoints, completedCount: $completedCount, bonusEarned: $bonusEarned, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyChallengeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.earnedPoints, earnedPoints) ||
                other.earnedPoints == earnedPoints) &&
            (identical(other.completedCount, completedCount) ||
                other.completedCount == completedCount) &&
            (identical(other.bonusEarned, bonusEarned) ||
                other.bonusEarned == bonusEarned) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    date,
    const DeepCollectionEquality().hash(_tasks),
    totalPoints,
    earnedPoints,
    completedCount,
    bonusEarned,
    completedAt,
  );

  /// Create a copy of DailyChallenge
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyChallengeImplCopyWith<_$DailyChallengeImpl> get copyWith =>
      __$$DailyChallengeImplCopyWithImpl<_$DailyChallengeImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyChallengeImplToJson(this);
  }
}

abstract class _DailyChallenge implements DailyChallenge {
  const factory _DailyChallenge({
    required final String id,
    required final String userId,
    required final DateTime date,
    required final List<MicroTask> tasks,
    required final int totalPoints,
    required final int earnedPoints,
    required final int completedCount,
    required final bool bonusEarned,
    final DateTime? completedAt,
  }) = _$DailyChallengeImpl;

  factory _DailyChallenge.fromJson(Map<String, dynamic> json) =
      _$DailyChallengeImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  DateTime get date;
  @override
  List<MicroTask> get tasks;
  @override
  int get totalPoints;
  @override
  int get earnedPoints;
  @override
  int get completedCount;
  @override
  bool get bonusEarned;
  @override
  DateTime? get completedAt;

  /// Create a copy of DailyChallenge
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyChallengeImplCopyWith<_$DailyChallengeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Achievement _$AchievementFromJson(Map<String, dynamic> json) {
  return _Achievement.fromJson(json);
}

/// @nodoc
mixin _$Achievement {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  AchievementCategory get category => throw _privateConstructorUsedError;
  int get requiredProgress => throw _privateConstructorUsedError;
  int? get currentProgress => throw _privateConstructorUsedError;
  DateTime? get unlockedAt => throw _privateConstructorUsedError;
  int? get bonusPoints => throw _privateConstructorUsedError;

  /// Serializes this Achievement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AchievementCopyWith<Achievement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AchievementCopyWith<$Res> {
  factory $AchievementCopyWith(
    Achievement value,
    $Res Function(Achievement) then,
  ) = _$AchievementCopyWithImpl<$Res, Achievement>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String icon,
    AchievementCategory category,
    int requiredProgress,
    int? currentProgress,
    DateTime? unlockedAt,
    int? bonusPoints,
  });
}

/// @nodoc
class _$AchievementCopyWithImpl<$Res, $Val extends Achievement>
    implements $AchievementCopyWith<$Res> {
  _$AchievementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? icon = null,
    Object? category = null,
    Object? requiredProgress = null,
    Object? currentProgress = freezed,
    Object? unlockedAt = freezed,
    Object? bonusPoints = freezed,
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
            icon: null == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as AchievementCategory,
            requiredProgress: null == requiredProgress
                ? _value.requiredProgress
                : requiredProgress // ignore: cast_nullable_to_non_nullable
                      as int,
            currentProgress: freezed == currentProgress
                ? _value.currentProgress
                : currentProgress // ignore: cast_nullable_to_non_nullable
                      as int?,
            unlockedAt: freezed == unlockedAt
                ? _value.unlockedAt
                : unlockedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            bonusPoints: freezed == bonusPoints
                ? _value.bonusPoints
                : bonusPoints // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AchievementImplCopyWith<$Res>
    implements $AchievementCopyWith<$Res> {
  factory _$$AchievementImplCopyWith(
    _$AchievementImpl value,
    $Res Function(_$AchievementImpl) then,
  ) = __$$AchievementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String icon,
    AchievementCategory category,
    int requiredProgress,
    int? currentProgress,
    DateTime? unlockedAt,
    int? bonusPoints,
  });
}

/// @nodoc
class __$$AchievementImplCopyWithImpl<$Res>
    extends _$AchievementCopyWithImpl<$Res, _$AchievementImpl>
    implements _$$AchievementImplCopyWith<$Res> {
  __$$AchievementImplCopyWithImpl(
    _$AchievementImpl _value,
    $Res Function(_$AchievementImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? icon = null,
    Object? category = null,
    Object? requiredProgress = null,
    Object? currentProgress = freezed,
    Object? unlockedAt = freezed,
    Object? bonusPoints = freezed,
  }) {
    return _then(
      _$AchievementImpl(
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
        icon: null == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as AchievementCategory,
        requiredProgress: null == requiredProgress
            ? _value.requiredProgress
            : requiredProgress // ignore: cast_nullable_to_non_nullable
                  as int,
        currentProgress: freezed == currentProgress
            ? _value.currentProgress
            : currentProgress // ignore: cast_nullable_to_non_nullable
                  as int?,
        unlockedAt: freezed == unlockedAt
            ? _value.unlockedAt
            : unlockedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        bonusPoints: freezed == bonusPoints
            ? _value.bonusPoints
            : bonusPoints // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AchievementImpl implements _Achievement {
  const _$AchievementImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.category,
    required this.requiredProgress,
    this.currentProgress,
    this.unlockedAt,
    this.bonusPoints,
  });

  factory _$AchievementImpl.fromJson(Map<String, dynamic> json) =>
      _$$AchievementImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String icon;
  @override
  final AchievementCategory category;
  @override
  final int requiredProgress;
  @override
  final int? currentProgress;
  @override
  final DateTime? unlockedAt;
  @override
  final int? bonusPoints;

  @override
  String toString() {
    return 'Achievement(id: $id, name: $name, description: $description, icon: $icon, category: $category, requiredProgress: $requiredProgress, currentProgress: $currentProgress, unlockedAt: $unlockedAt, bonusPoints: $bonusPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AchievementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.requiredProgress, requiredProgress) ||
                other.requiredProgress == requiredProgress) &&
            (identical(other.currentProgress, currentProgress) ||
                other.currentProgress == currentProgress) &&
            (identical(other.unlockedAt, unlockedAt) ||
                other.unlockedAt == unlockedAt) &&
            (identical(other.bonusPoints, bonusPoints) ||
                other.bonusPoints == bonusPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    icon,
    category,
    requiredProgress,
    currentProgress,
    unlockedAt,
    bonusPoints,
  );

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      __$$AchievementImplCopyWithImpl<_$AchievementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AchievementImplToJson(this);
  }
}

abstract class _Achievement implements Achievement {
  const factory _Achievement({
    required final String id,
    required final String name,
    required final String description,
    required final String icon,
    required final AchievementCategory category,
    required final int requiredProgress,
    final int? currentProgress,
    final DateTime? unlockedAt,
    final int? bonusPoints,
  }) = _$AchievementImpl;

  factory _Achievement.fromJson(Map<String, dynamic> json) =
      _$AchievementImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get icon;
  @override
  AchievementCategory get category;
  @override
  int get requiredProgress;
  @override
  int? get currentProgress;
  @override
  DateTime? get unlockedAt;
  @override
  int? get bonusPoints;

  /// Create a copy of Achievement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AchievementImplCopyWith<_$AchievementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeaderboardEntry _$LeaderboardEntryFromJson(Map<String, dynamic> json) {
  return _LeaderboardEntry.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardEntry {
  String get odUserId => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get streak => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;

  /// Serializes this LeaderboardEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeaderboardEntryCopyWith<LeaderboardEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardEntryCopyWith<$Res> {
  factory $LeaderboardEntryCopyWith(
    LeaderboardEntry value,
    $Res Function(LeaderboardEntry) then,
  ) = _$LeaderboardEntryCopyWithImpl<$Res, LeaderboardEntry>;
  @useResult
  $Res call({
    String odUserId,
    String displayName,
    int rank,
    int points,
    int level,
    int streak,
    String? avatarUrl,
  });
}

/// @nodoc
class _$LeaderboardEntryCopyWithImpl<$Res, $Val extends LeaderboardEntry>
    implements $LeaderboardEntryCopyWith<$Res> {
  _$LeaderboardEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? odUserId = null,
    Object? displayName = null,
    Object? rank = null,
    Object? points = null,
    Object? level = null,
    Object? streak = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _value.copyWith(
            odUserId: null == odUserId
                ? _value.odUserId
                : odUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            rank: null == rank
                ? _value.rank
                : rank // ignore: cast_nullable_to_non_nullable
                      as int,
            points: null == points
                ? _value.points
                : points // ignore: cast_nullable_to_non_nullable
                      as int,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as int,
            streak: null == streak
                ? _value.streak
                : streak // ignore: cast_nullable_to_non_nullable
                      as int,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LeaderboardEntryImplCopyWith<$Res>
    implements $LeaderboardEntryCopyWith<$Res> {
  factory _$$LeaderboardEntryImplCopyWith(
    _$LeaderboardEntryImpl value,
    $Res Function(_$LeaderboardEntryImpl) then,
  ) = __$$LeaderboardEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String odUserId,
    String displayName,
    int rank,
    int points,
    int level,
    int streak,
    String? avatarUrl,
  });
}

/// @nodoc
class __$$LeaderboardEntryImplCopyWithImpl<$Res>
    extends _$LeaderboardEntryCopyWithImpl<$Res, _$LeaderboardEntryImpl>
    implements _$$LeaderboardEntryImplCopyWith<$Res> {
  __$$LeaderboardEntryImplCopyWithImpl(
    _$LeaderboardEntryImpl _value,
    $Res Function(_$LeaderboardEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? odUserId = null,
    Object? displayName = null,
    Object? rank = null,
    Object? points = null,
    Object? level = null,
    Object? streak = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(
      _$LeaderboardEntryImpl(
        odUserId: null == odUserId
            ? _value.odUserId
            : odUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        rank: null == rank
            ? _value.rank
            : rank // ignore: cast_nullable_to_non_nullable
                  as int,
        points: null == points
            ? _value.points
            : points // ignore: cast_nullable_to_non_nullable
                  as int,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as int,
        streak: null == streak
            ? _value.streak
            : streak // ignore: cast_nullable_to_non_nullable
                  as int,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LeaderboardEntryImpl implements _LeaderboardEntry {
  const _$LeaderboardEntryImpl({
    required this.odUserId,
    required this.displayName,
    required this.rank,
    required this.points,
    required this.level,
    required this.streak,
    this.avatarUrl,
  });

  factory _$LeaderboardEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeaderboardEntryImplFromJson(json);

  @override
  final String odUserId;
  @override
  final String displayName;
  @override
  final int rank;
  @override
  final int points;
  @override
  final int level;
  @override
  final int streak;
  @override
  final String? avatarUrl;

  @override
  String toString() {
    return 'LeaderboardEntry(odUserId: $odUserId, displayName: $displayName, rank: $rank, points: $points, level: $level, streak: $streak, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeaderboardEntryImpl &&
            (identical(other.odUserId, odUserId) ||
                other.odUserId == odUserId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.streak, streak) || other.streak == streak) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    odUserId,
    displayName,
    rank,
    points,
    level,
    streak,
    avatarUrl,
  );

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeaderboardEntryImplCopyWith<_$LeaderboardEntryImpl> get copyWith =>
      __$$LeaderboardEntryImplCopyWithImpl<_$LeaderboardEntryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LeaderboardEntryImplToJson(this);
  }
}

abstract class _LeaderboardEntry implements LeaderboardEntry {
  const factory _LeaderboardEntry({
    required final String odUserId,
    required final String displayName,
    required final int rank,
    required final int points,
    required final int level,
    required final int streak,
    final String? avatarUrl,
  }) = _$LeaderboardEntryImpl;

  factory _LeaderboardEntry.fromJson(Map<String, dynamic> json) =
      _$LeaderboardEntryImpl.fromJson;

  @override
  String get odUserId;
  @override
  String get displayName;
  @override
  int get rank;
  @override
  int get points;
  @override
  int get level;
  @override
  int get streak;
  @override
  String? get avatarUrl;

  /// Create a copy of LeaderboardEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeaderboardEntryImplCopyWith<_$LeaderboardEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GamificationStats _$GamificationStatsFromJson(Map<String, dynamic> json) {
  return _GamificationStats.fromJson(json);
}

/// @nodoc
mixin _$GamificationStats {
  int get totalPoints => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get currentStreak => throw _privateConstructorUsedError;
  int get longestStreak => throw _privateConstructorUsedError;
  int get tasksCompleted => throw _privateConstructorUsedError;
  int get achievementsUnlocked => throw _privateConstructorUsedError;
  double get completionRate => throw _privateConstructorUsedError;
  int get pointsToNextLevel => throw _privateConstructorUsedError;
  UserLevel get userLevel => throw _privateConstructorUsedError;
  List<Achievement> get recentAchievements =>
      throw _privateConstructorUsedError;

  /// Serializes this GamificationStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GamificationStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GamificationStatsCopyWith<GamificationStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamificationStatsCopyWith<$Res> {
  factory $GamificationStatsCopyWith(
    GamificationStats value,
    $Res Function(GamificationStats) then,
  ) = _$GamificationStatsCopyWithImpl<$Res, GamificationStats>;
  @useResult
  $Res call({
    int totalPoints,
    int level,
    int currentStreak,
    int longestStreak,
    int tasksCompleted,
    int achievementsUnlocked,
    double completionRate,
    int pointsToNextLevel,
    UserLevel userLevel,
    List<Achievement> recentAchievements,
  });
}

/// @nodoc
class _$GamificationStatsCopyWithImpl<$Res, $Val extends GamificationStats>
    implements $GamificationStatsCopyWith<$Res> {
  _$GamificationStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GamificationStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPoints = null,
    Object? level = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? tasksCompleted = null,
    Object? achievementsUnlocked = null,
    Object? completionRate = null,
    Object? pointsToNextLevel = null,
    Object? userLevel = null,
    Object? recentAchievements = null,
  }) {
    return _then(
      _value.copyWith(
            totalPoints: null == totalPoints
                ? _value.totalPoints
                : totalPoints // ignore: cast_nullable_to_non_nullable
                      as int,
            level: null == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as int,
            currentStreak: null == currentStreak
                ? _value.currentStreak
                : currentStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            longestStreak: null == longestStreak
                ? _value.longestStreak
                : longestStreak // ignore: cast_nullable_to_non_nullable
                      as int,
            tasksCompleted: null == tasksCompleted
                ? _value.tasksCompleted
                : tasksCompleted // ignore: cast_nullable_to_non_nullable
                      as int,
            achievementsUnlocked: null == achievementsUnlocked
                ? _value.achievementsUnlocked
                : achievementsUnlocked // ignore: cast_nullable_to_non_nullable
                      as int,
            completionRate: null == completionRate
                ? _value.completionRate
                : completionRate // ignore: cast_nullable_to_non_nullable
                      as double,
            pointsToNextLevel: null == pointsToNextLevel
                ? _value.pointsToNextLevel
                : pointsToNextLevel // ignore: cast_nullable_to_non_nullable
                      as int,
            userLevel: null == userLevel
                ? _value.userLevel
                : userLevel // ignore: cast_nullable_to_non_nullable
                      as UserLevel,
            recentAchievements: null == recentAchievements
                ? _value.recentAchievements
                : recentAchievements // ignore: cast_nullable_to_non_nullable
                      as List<Achievement>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GamificationStatsImplCopyWith<$Res>
    implements $GamificationStatsCopyWith<$Res> {
  factory _$$GamificationStatsImplCopyWith(
    _$GamificationStatsImpl value,
    $Res Function(_$GamificationStatsImpl) then,
  ) = __$$GamificationStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int totalPoints,
    int level,
    int currentStreak,
    int longestStreak,
    int tasksCompleted,
    int achievementsUnlocked,
    double completionRate,
    int pointsToNextLevel,
    UserLevel userLevel,
    List<Achievement> recentAchievements,
  });
}

/// @nodoc
class __$$GamificationStatsImplCopyWithImpl<$Res>
    extends _$GamificationStatsCopyWithImpl<$Res, _$GamificationStatsImpl>
    implements _$$GamificationStatsImplCopyWith<$Res> {
  __$$GamificationStatsImplCopyWithImpl(
    _$GamificationStatsImpl _value,
    $Res Function(_$GamificationStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GamificationStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPoints = null,
    Object? level = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
    Object? tasksCompleted = null,
    Object? achievementsUnlocked = null,
    Object? completionRate = null,
    Object? pointsToNextLevel = null,
    Object? userLevel = null,
    Object? recentAchievements = null,
  }) {
    return _then(
      _$GamificationStatsImpl(
        totalPoints: null == totalPoints
            ? _value.totalPoints
            : totalPoints // ignore: cast_nullable_to_non_nullable
                  as int,
        level: null == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as int,
        currentStreak: null == currentStreak
            ? _value.currentStreak
            : currentStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        longestStreak: null == longestStreak
            ? _value.longestStreak
            : longestStreak // ignore: cast_nullable_to_non_nullable
                  as int,
        tasksCompleted: null == tasksCompleted
            ? _value.tasksCompleted
            : tasksCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        achievementsUnlocked: null == achievementsUnlocked
            ? _value.achievementsUnlocked
            : achievementsUnlocked // ignore: cast_nullable_to_non_nullable
                  as int,
        completionRate: null == completionRate
            ? _value.completionRate
            : completionRate // ignore: cast_nullable_to_non_nullable
                  as double,
        pointsToNextLevel: null == pointsToNextLevel
            ? _value.pointsToNextLevel
            : pointsToNextLevel // ignore: cast_nullable_to_non_nullable
                  as int,
        userLevel: null == userLevel
            ? _value.userLevel
            : userLevel // ignore: cast_nullable_to_non_nullable
                  as UserLevel,
        recentAchievements: null == recentAchievements
            ? _value._recentAchievements
            : recentAchievements // ignore: cast_nullable_to_non_nullable
                  as List<Achievement>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GamificationStatsImpl implements _GamificationStats {
  const _$GamificationStatsImpl({
    required this.totalPoints,
    required this.level,
    required this.currentStreak,
    required this.longestStreak,
    required this.tasksCompleted,
    required this.achievementsUnlocked,
    required this.completionRate,
    required this.pointsToNextLevel,
    required this.userLevel,
    final List<Achievement> recentAchievements = const [],
  }) : _recentAchievements = recentAchievements;

  factory _$GamificationStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GamificationStatsImplFromJson(json);

  @override
  final int totalPoints;
  @override
  final int level;
  @override
  final int currentStreak;
  @override
  final int longestStreak;
  @override
  final int tasksCompleted;
  @override
  final int achievementsUnlocked;
  @override
  final double completionRate;
  @override
  final int pointsToNextLevel;
  @override
  final UserLevel userLevel;
  final List<Achievement> _recentAchievements;
  @override
  @JsonKey()
  List<Achievement> get recentAchievements {
    if (_recentAchievements is EqualUnmodifiableListView)
      return _recentAchievements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentAchievements);
  }

  @override
  String toString() {
    return 'GamificationStats(totalPoints: $totalPoints, level: $level, currentStreak: $currentStreak, longestStreak: $longestStreak, tasksCompleted: $tasksCompleted, achievementsUnlocked: $achievementsUnlocked, completionRate: $completionRate, pointsToNextLevel: $pointsToNextLevel, userLevel: $userLevel, recentAchievements: $recentAchievements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GamificationStatsImpl &&
            (identical(other.totalPoints, totalPoints) ||
                other.totalPoints == totalPoints) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak) &&
            (identical(other.tasksCompleted, tasksCompleted) ||
                other.tasksCompleted == tasksCompleted) &&
            (identical(other.achievementsUnlocked, achievementsUnlocked) ||
                other.achievementsUnlocked == achievementsUnlocked) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.pointsToNextLevel, pointsToNextLevel) ||
                other.pointsToNextLevel == pointsToNextLevel) &&
            (identical(other.userLevel, userLevel) ||
                other.userLevel == userLevel) &&
            const DeepCollectionEquality().equals(
              other._recentAchievements,
              _recentAchievements,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalPoints,
    level,
    currentStreak,
    longestStreak,
    tasksCompleted,
    achievementsUnlocked,
    completionRate,
    pointsToNextLevel,
    userLevel,
    const DeepCollectionEquality().hash(_recentAchievements),
  );

  /// Create a copy of GamificationStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GamificationStatsImplCopyWith<_$GamificationStatsImpl> get copyWith =>
      __$$GamificationStatsImplCopyWithImpl<_$GamificationStatsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GamificationStatsImplToJson(this);
  }
}

abstract class _GamificationStats implements GamificationStats {
  const factory _GamificationStats({
    required final int totalPoints,
    required final int level,
    required final int currentStreak,
    required final int longestStreak,
    required final int tasksCompleted,
    required final int achievementsUnlocked,
    required final double completionRate,
    required final int pointsToNextLevel,
    required final UserLevel userLevel,
    final List<Achievement> recentAchievements,
  }) = _$GamificationStatsImpl;

  factory _GamificationStats.fromJson(Map<String, dynamic> json) =
      _$GamificationStatsImpl.fromJson;

  @override
  int get totalPoints;
  @override
  int get level;
  @override
  int get currentStreak;
  @override
  int get longestStreak;
  @override
  int get tasksCompleted;
  @override
  int get achievementsUnlocked;
  @override
  double get completionRate;
  @override
  int get pointsToNextLevel;
  @override
  UserLevel get userLevel;
  @override
  List<Achievement> get recentAchievements;

  /// Create a copy of GamificationStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GamificationStatsImplCopyWith<_$GamificationStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
