// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

InsightModel _$InsightModelFromJson(Map<String, dynamic> json) {
  return _InsightModel.fromJson(json);
}

/// @nodoc
mixin _$InsightModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  InsightType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;
  bool get actionable => throw _privateConstructorUsedError;
  InsightAction? get action => throw _privateConstructorUsedError;
  InsightPriority get priority => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  bool get isDismissed => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  /// Serializes this InsightModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InsightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InsightModelCopyWith<InsightModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightModelCopyWith<$Res> {
  factory $InsightModelCopyWith(
    InsightModel value,
    $Res Function(InsightModel) then,
  ) = _$InsightModelCopyWithImpl<$Res, InsightModel>;
  @useResult
  $Res call({
    String id,
    String userId,
    InsightType type,
    String title,
    String description,
    Map<String, dynamic>? data,
    bool actionable,
    InsightAction? action,
    InsightPriority priority,
    bool isRead,
    bool isDismissed,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? expiresAt,
  });

  $InsightActionCopyWith<$Res>? get action;
}

/// @nodoc
class _$InsightModelCopyWithImpl<$Res, $Val extends InsightModel>
    implements $InsightModelCopyWith<$Res> {
  _$InsightModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InsightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? data = freezed,
    Object? actionable = null,
    Object? action = freezed,
    Object? priority = null,
    Object? isRead = null,
    Object? isDismissed = null,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
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
                      as InsightType,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            actionable: null == actionable
                ? _value.actionable
                : actionable // ignore: cast_nullable_to_non_nullable
                      as bool,
            action: freezed == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as InsightAction?,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as InsightPriority,
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
            expiresAt: freezed == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of InsightModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InsightActionCopyWith<$Res>? get action {
    if (_value.action == null) {
      return null;
    }

    return $InsightActionCopyWith<$Res>(_value.action!, (value) {
      return _then(_value.copyWith(action: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InsightModelImplCopyWith<$Res>
    implements $InsightModelCopyWith<$Res> {
  factory _$$InsightModelImplCopyWith(
    _$InsightModelImpl value,
    $Res Function(_$InsightModelImpl) then,
  ) = __$$InsightModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    InsightType type,
    String title,
    String description,
    Map<String, dynamic>? data,
    bool actionable,
    InsightAction? action,
    InsightPriority priority,
    bool isRead,
    bool isDismissed,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? expiresAt,
  });

  @override
  $InsightActionCopyWith<$Res>? get action;
}

/// @nodoc
class __$$InsightModelImplCopyWithImpl<$Res>
    extends _$InsightModelCopyWithImpl<$Res, _$InsightModelImpl>
    implements _$$InsightModelImplCopyWith<$Res> {
  __$$InsightModelImplCopyWithImpl(
    _$InsightModelImpl _value,
    $Res Function(_$InsightModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InsightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? type = null,
    Object? title = null,
    Object? description = null,
    Object? data = freezed,
    Object? actionable = null,
    Object? action = freezed,
    Object? priority = null,
    Object? isRead = null,
    Object? isDismissed = null,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
  }) {
    return _then(
      _$InsightModelImpl(
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
                  as InsightType,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        data: freezed == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        actionable: null == actionable
            ? _value.actionable
            : actionable // ignore: cast_nullable_to_non_nullable
                  as bool,
        action: freezed == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as InsightAction?,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as InsightPriority,
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
        expiresAt: freezed == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InsightModelImpl implements _InsightModel {
  const _$InsightModelImpl({
    required this.id,
    required this.userId,
    required this.type,
    required this.title,
    required this.description,
    final Map<String, dynamic>? data,
    this.actionable = true,
    this.action,
    this.priority = InsightPriority.medium,
    this.isRead = false,
    this.isDismissed = false,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.expiresAt,
  }) : _data = data;

  factory _$InsightModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsightModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final InsightType type;
  @override
  final String title;
  @override
  final String description;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool actionable;
  @override
  final InsightAction? action;
  @override
  @JsonKey()
  final InsightPriority priority;
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
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'InsightModel(id: $id, userId: $userId, type: $type, title: $title, description: $description, data: $data, actionable: $actionable, action: $action, priority: $priority, isRead: $isRead, isDismissed: $isDismissed, createdAt: $createdAt, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsightModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.actionable, actionable) ||
                other.actionable == actionable) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.isDismissed, isDismissed) ||
                other.isDismissed == isDismissed) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
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
    const DeepCollectionEquality().hash(_data),
    actionable,
    action,
    priority,
    isRead,
    isDismissed,
    createdAt,
    expiresAt,
  );

  /// Create a copy of InsightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InsightModelImplCopyWith<_$InsightModelImpl> get copyWith =>
      __$$InsightModelImplCopyWithImpl<_$InsightModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsightModelImplToJson(this);
  }
}

abstract class _InsightModel implements InsightModel {
  const factory _InsightModel({
    required final String id,
    required final String userId,
    required final InsightType type,
    required final String title,
    required final String description,
    final Map<String, dynamic>? data,
    final bool actionable,
    final InsightAction? action,
    final InsightPriority priority,
    final bool isRead,
    final bool isDismissed,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? expiresAt,
  }) = _$InsightModelImpl;

  factory _InsightModel.fromJson(Map<String, dynamic> json) =
      _$InsightModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  InsightType get type;
  @override
  String get title;
  @override
  String get description;
  @override
  Map<String, dynamic>? get data;
  @override
  bool get actionable;
  @override
  InsightAction? get action;
  @override
  InsightPriority get priority;
  @override
  bool get isRead;
  @override
  bool get isDismissed;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get expiresAt;

  /// Create a copy of InsightModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InsightModelImplCopyWith<_$InsightModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InsightAction _$InsightActionFromJson(Map<String, dynamic> json) {
  return _InsightAction.fromJson(json);
}

/// @nodoc
mixin _$InsightAction {
  String get type => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  Map<String, dynamic>? get params => throw _privateConstructorUsedError;

  /// Serializes this InsightAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InsightAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InsightActionCopyWith<InsightAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightActionCopyWith<$Res> {
  factory $InsightActionCopyWith(
    InsightAction value,
    $Res Function(InsightAction) then,
  ) = _$InsightActionCopyWithImpl<$Res, InsightAction>;
  @useResult
  $Res call({String type, String label, Map<String, dynamic>? params});
}

/// @nodoc
class _$InsightActionCopyWithImpl<$Res, $Val extends InsightAction>
    implements $InsightActionCopyWith<$Res> {
  _$InsightActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InsightAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? label = null,
    Object? params = freezed,
  }) {
    return _then(
      _value.copyWith(
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            label: null == label
                ? _value.label
                : label // ignore: cast_nullable_to_non_nullable
                      as String,
            params: freezed == params
                ? _value.params
                : params // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$InsightActionImplCopyWith<$Res>
    implements $InsightActionCopyWith<$Res> {
  factory _$$InsightActionImplCopyWith(
    _$InsightActionImpl value,
    $Res Function(_$InsightActionImpl) then,
  ) = __$$InsightActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String label, Map<String, dynamic>? params});
}

/// @nodoc
class __$$InsightActionImplCopyWithImpl<$Res>
    extends _$InsightActionCopyWithImpl<$Res, _$InsightActionImpl>
    implements _$$InsightActionImplCopyWith<$Res> {
  __$$InsightActionImplCopyWithImpl(
    _$InsightActionImpl _value,
    $Res Function(_$InsightActionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of InsightAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? label = null,
    Object? params = freezed,
  }) {
    return _then(
      _$InsightActionImpl(
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        label: null == label
            ? _value.label
            : label // ignore: cast_nullable_to_non_nullable
                  as String,
        params: freezed == params
            ? _value._params
            : params // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$InsightActionImpl implements _InsightAction {
  const _$InsightActionImpl({
    required this.type,
    required this.label,
    final Map<String, dynamic>? params,
  }) : _params = params;

  factory _$InsightActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsightActionImplFromJson(json);

  @override
  final String type;
  @override
  final String label;
  final Map<String, dynamic>? _params;
  @override
  Map<String, dynamic>? get params {
    final value = _params;
    if (value == null) return null;
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'InsightAction(type: $type, label: $label, params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsightActionImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other._params, _params));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    type,
    label,
    const DeepCollectionEquality().hash(_params),
  );

  /// Create a copy of InsightAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InsightActionImplCopyWith<_$InsightActionImpl> get copyWith =>
      __$$InsightActionImplCopyWithImpl<_$InsightActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsightActionImplToJson(this);
  }
}

abstract class _InsightAction implements InsightAction {
  const factory _InsightAction({
    required final String type,
    required final String label,
    final Map<String, dynamic>? params,
  }) = _$InsightActionImpl;

  factory _InsightAction.fromJson(Map<String, dynamic> json) =
      _$InsightActionImpl.fromJson;

  @override
  String get type;
  @override
  String get label;
  @override
  Map<String, dynamic>? get params;

  /// Create a copy of InsightAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InsightActionImplCopyWith<_$InsightActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
