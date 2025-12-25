// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'family_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FamilyGroup _$FamilyGroupFromJson(Map<String, dynamic> json) {
  return _FamilyGroup.fromJson(json);
}

/// @nodoc
mixin _$FamilyGroup {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get adminUserId => throw _privateConstructorUsedError;
  List<FamilyMember> get members => throw _privateConstructorUsedError;
  FamilySettings get settings => throw _privateConstructorUsedError;
  List<SharedBudget> get sharedBudgets => throw _privateConstructorUsedError;
  List<FamilyGoal> get goals => throw _privateConstructorUsedError;
  List<Allowance> get allowances => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FamilyGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FamilyGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FamilyGroupCopyWith<FamilyGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyGroupCopyWith<$Res> {
  factory $FamilyGroupCopyWith(
    FamilyGroup value,
    $Res Function(FamilyGroup) then,
  ) = _$FamilyGroupCopyWithImpl<$Res, FamilyGroup>;
  @useResult
  $Res call({
    String id,
    String name,
    String adminUserId,
    List<FamilyMember> members,
    FamilySettings settings,
    List<SharedBudget> sharedBudgets,
    List<FamilyGoal> goals,
    List<Allowance> allowances,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  $FamilySettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$FamilyGroupCopyWithImpl<$Res, $Val extends FamilyGroup>
    implements $FamilyGroupCopyWith<$Res> {
  _$FamilyGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FamilyGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? adminUserId = null,
    Object? members = null,
    Object? settings = null,
    Object? sharedBudgets = null,
    Object? goals = null,
    Object? allowances = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
            adminUserId: null == adminUserId
                ? _value.adminUserId
                : adminUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            members: null == members
                ? _value.members
                : members // ignore: cast_nullable_to_non_nullable
                      as List<FamilyMember>,
            settings: null == settings
                ? _value.settings
                : settings // ignore: cast_nullable_to_non_nullable
                      as FamilySettings,
            sharedBudgets: null == sharedBudgets
                ? _value.sharedBudgets
                : sharedBudgets // ignore: cast_nullable_to_non_nullable
                      as List<SharedBudget>,
            goals: null == goals
                ? _value.goals
                : goals // ignore: cast_nullable_to_non_nullable
                      as List<FamilyGoal>,
            allowances: null == allowances
                ? _value.allowances
                : allowances // ignore: cast_nullable_to_non_nullable
                      as List<Allowance>,
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

  /// Create a copy of FamilyGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FamilySettingsCopyWith<$Res> get settings {
    return $FamilySettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FamilyGroupImplCopyWith<$Res>
    implements $FamilyGroupCopyWith<$Res> {
  factory _$$FamilyGroupImplCopyWith(
    _$FamilyGroupImpl value,
    $Res Function(_$FamilyGroupImpl) then,
  ) = __$$FamilyGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String adminUserId,
    List<FamilyMember> members,
    FamilySettings settings,
    List<SharedBudget> sharedBudgets,
    List<FamilyGoal> goals,
    List<Allowance> allowances,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  @override
  $FamilySettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$FamilyGroupImplCopyWithImpl<$Res>
    extends _$FamilyGroupCopyWithImpl<$Res, _$FamilyGroupImpl>
    implements _$$FamilyGroupImplCopyWith<$Res> {
  __$$FamilyGroupImplCopyWithImpl(
    _$FamilyGroupImpl _value,
    $Res Function(_$FamilyGroupImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FamilyGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? adminUserId = null,
    Object? members = null,
    Object? settings = null,
    Object? sharedBudgets = null,
    Object? goals = null,
    Object? allowances = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$FamilyGroupImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        adminUserId: null == adminUserId
            ? _value.adminUserId
            : adminUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        members: null == members
            ? _value._members
            : members // ignore: cast_nullable_to_non_nullable
                  as List<FamilyMember>,
        settings: null == settings
            ? _value.settings
            : settings // ignore: cast_nullable_to_non_nullable
                  as FamilySettings,
        sharedBudgets: null == sharedBudgets
            ? _value._sharedBudgets
            : sharedBudgets // ignore: cast_nullable_to_non_nullable
                  as List<SharedBudget>,
        goals: null == goals
            ? _value._goals
            : goals // ignore: cast_nullable_to_non_nullable
                  as List<FamilyGoal>,
        allowances: null == allowances
            ? _value._allowances
            : allowances // ignore: cast_nullable_to_non_nullable
                  as List<Allowance>,
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
class _$FamilyGroupImpl implements _FamilyGroup {
  const _$FamilyGroupImpl({
    required this.id,
    required this.name,
    required this.adminUserId,
    required final List<FamilyMember> members,
    required this.settings,
    final List<SharedBudget> sharedBudgets = const [],
    final List<FamilyGoal> goals = const [],
    final List<Allowance> allowances = const [],
    this.createdAt,
    this.updatedAt,
  }) : _members = members,
       _sharedBudgets = sharedBudgets,
       _goals = goals,
       _allowances = allowances;

  factory _$FamilyGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$FamilyGroupImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String adminUserId;
  final List<FamilyMember> _members;
  @override
  List<FamilyMember> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  final FamilySettings settings;
  final List<SharedBudget> _sharedBudgets;
  @override
  @JsonKey()
  List<SharedBudget> get sharedBudgets {
    if (_sharedBudgets is EqualUnmodifiableListView) return _sharedBudgets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sharedBudgets);
  }

  final List<FamilyGoal> _goals;
  @override
  @JsonKey()
  List<FamilyGoal> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  final List<Allowance> _allowances;
  @override
  @JsonKey()
  List<Allowance> get allowances {
    if (_allowances is EqualUnmodifiableListView) return _allowances;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowances);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'FamilyGroup(id: $id, name: $name, adminUserId: $adminUserId, members: $members, settings: $settings, sharedBudgets: $sharedBudgets, goals: $goals, allowances: $allowances, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FamilyGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.adminUserId, adminUserId) ||
                other.adminUserId == adminUserId) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            const DeepCollectionEquality().equals(
              other._sharedBudgets,
              _sharedBudgets,
            ) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            const DeepCollectionEquality().equals(
              other._allowances,
              _allowances,
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
    name,
    adminUserId,
    const DeepCollectionEquality().hash(_members),
    settings,
    const DeepCollectionEquality().hash(_sharedBudgets),
    const DeepCollectionEquality().hash(_goals),
    const DeepCollectionEquality().hash(_allowances),
    createdAt,
    updatedAt,
  );

  /// Create a copy of FamilyGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FamilyGroupImplCopyWith<_$FamilyGroupImpl> get copyWith =>
      __$$FamilyGroupImplCopyWithImpl<_$FamilyGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FamilyGroupImplToJson(this);
  }
}

abstract class _FamilyGroup implements FamilyGroup {
  const factory _FamilyGroup({
    required final String id,
    required final String name,
    required final String adminUserId,
    required final List<FamilyMember> members,
    required final FamilySettings settings,
    final List<SharedBudget> sharedBudgets,
    final List<FamilyGoal> goals,
    final List<Allowance> allowances,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$FamilyGroupImpl;

  factory _FamilyGroup.fromJson(Map<String, dynamic> json) =
      _$FamilyGroupImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get adminUserId;
  @override
  List<FamilyMember> get members;
  @override
  FamilySettings get settings;
  @override
  List<SharedBudget> get sharedBudgets;
  @override
  List<FamilyGoal> get goals;
  @override
  List<Allowance> get allowances;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of FamilyGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FamilyGroupImplCopyWith<_$FamilyGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FamilyMember _$FamilyMemberFromJson(Map<String, dynamic> json) {
  return _FamilyMember.fromJson(json);
}

/// @nodoc
mixin _$FamilyMember {
  String get odUserId => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  FamilyRole get role => throw _privateConstructorUsedError;
  DateTime get joinedAt => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<String> get visibleCategories =>
      throw _privateConstructorUsedError; // categories they can see
  double? get monthlyAllowance => throw _privateConstructorUsedError;
  double? get spentThisMonth => throw _privateConstructorUsedError;

  /// Serializes this FamilyMember to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FamilyMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FamilyMemberCopyWith<FamilyMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyMemberCopyWith<$Res> {
  factory $FamilyMemberCopyWith(
    FamilyMember value,
    $Res Function(FamilyMember) then,
  ) = _$FamilyMemberCopyWithImpl<$Res, FamilyMember>;
  @useResult
  $Res call({
    String odUserId,
    String displayName,
    FamilyRole role,
    DateTime joinedAt,
    String? avatarUrl,
    String? email,
    bool isActive,
    List<String> visibleCategories,
    double? monthlyAllowance,
    double? spentThisMonth,
  });
}

/// @nodoc
class _$FamilyMemberCopyWithImpl<$Res, $Val extends FamilyMember>
    implements $FamilyMemberCopyWith<$Res> {
  _$FamilyMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FamilyMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? odUserId = null,
    Object? displayName = null,
    Object? role = null,
    Object? joinedAt = null,
    Object? avatarUrl = freezed,
    Object? email = freezed,
    Object? isActive = null,
    Object? visibleCategories = null,
    Object? monthlyAllowance = freezed,
    Object? spentThisMonth = freezed,
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
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as FamilyRole,
            joinedAt: null == joinedAt
                ? _value.joinedAt
                : joinedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            visibleCategories: null == visibleCategories
                ? _value.visibleCategories
                : visibleCategories // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            monthlyAllowance: freezed == monthlyAllowance
                ? _value.monthlyAllowance
                : monthlyAllowance // ignore: cast_nullable_to_non_nullable
                      as double?,
            spentThisMonth: freezed == spentThisMonth
                ? _value.spentThisMonth
                : spentThisMonth // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FamilyMemberImplCopyWith<$Res>
    implements $FamilyMemberCopyWith<$Res> {
  factory _$$FamilyMemberImplCopyWith(
    _$FamilyMemberImpl value,
    $Res Function(_$FamilyMemberImpl) then,
  ) = __$$FamilyMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String odUserId,
    String displayName,
    FamilyRole role,
    DateTime joinedAt,
    String? avatarUrl,
    String? email,
    bool isActive,
    List<String> visibleCategories,
    double? monthlyAllowance,
    double? spentThisMonth,
  });
}

/// @nodoc
class __$$FamilyMemberImplCopyWithImpl<$Res>
    extends _$FamilyMemberCopyWithImpl<$Res, _$FamilyMemberImpl>
    implements _$$FamilyMemberImplCopyWith<$Res> {
  __$$FamilyMemberImplCopyWithImpl(
    _$FamilyMemberImpl _value,
    $Res Function(_$FamilyMemberImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FamilyMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? odUserId = null,
    Object? displayName = null,
    Object? role = null,
    Object? joinedAt = null,
    Object? avatarUrl = freezed,
    Object? email = freezed,
    Object? isActive = null,
    Object? visibleCategories = null,
    Object? monthlyAllowance = freezed,
    Object? spentThisMonth = freezed,
  }) {
    return _then(
      _$FamilyMemberImpl(
        odUserId: null == odUserId
            ? _value.odUserId
            : odUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as FamilyRole,
        joinedAt: null == joinedAt
            ? _value.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        visibleCategories: null == visibleCategories
            ? _value._visibleCategories
            : visibleCategories // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        monthlyAllowance: freezed == monthlyAllowance
            ? _value.monthlyAllowance
            : monthlyAllowance // ignore: cast_nullable_to_non_nullable
                  as double?,
        spentThisMonth: freezed == spentThisMonth
            ? _value.spentThisMonth
            : spentThisMonth // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FamilyMemberImpl implements _FamilyMember {
  const _$FamilyMemberImpl({
    required this.odUserId,
    required this.displayName,
    required this.role,
    required this.joinedAt,
    this.avatarUrl,
    this.email,
    this.isActive = true,
    final List<String> visibleCategories = const [],
    this.monthlyAllowance,
    this.spentThisMonth,
  }) : _visibleCategories = visibleCategories;

  factory _$FamilyMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$FamilyMemberImplFromJson(json);

  @override
  final String odUserId;
  @override
  final String displayName;
  @override
  final FamilyRole role;
  @override
  final DateTime joinedAt;
  @override
  final String? avatarUrl;
  @override
  final String? email;
  @override
  @JsonKey()
  final bool isActive;
  final List<String> _visibleCategories;
  @override
  @JsonKey()
  List<String> get visibleCategories {
    if (_visibleCategories is EqualUnmodifiableListView)
      return _visibleCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visibleCategories);
  }

  // categories they can see
  @override
  final double? monthlyAllowance;
  @override
  final double? spentThisMonth;

  @override
  String toString() {
    return 'FamilyMember(odUserId: $odUserId, displayName: $displayName, role: $role, joinedAt: $joinedAt, avatarUrl: $avatarUrl, email: $email, isActive: $isActive, visibleCategories: $visibleCategories, monthlyAllowance: $monthlyAllowance, spentThisMonth: $spentThisMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FamilyMemberImpl &&
            (identical(other.odUserId, odUserId) ||
                other.odUserId == odUserId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(
              other._visibleCategories,
              _visibleCategories,
            ) &&
            (identical(other.monthlyAllowance, monthlyAllowance) ||
                other.monthlyAllowance == monthlyAllowance) &&
            (identical(other.spentThisMonth, spentThisMonth) ||
                other.spentThisMonth == spentThisMonth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    odUserId,
    displayName,
    role,
    joinedAt,
    avatarUrl,
    email,
    isActive,
    const DeepCollectionEquality().hash(_visibleCategories),
    monthlyAllowance,
    spentThisMonth,
  );

  /// Create a copy of FamilyMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FamilyMemberImplCopyWith<_$FamilyMemberImpl> get copyWith =>
      __$$FamilyMemberImplCopyWithImpl<_$FamilyMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FamilyMemberImplToJson(this);
  }
}

abstract class _FamilyMember implements FamilyMember {
  const factory _FamilyMember({
    required final String odUserId,
    required final String displayName,
    required final FamilyRole role,
    required final DateTime joinedAt,
    final String? avatarUrl,
    final String? email,
    final bool isActive,
    final List<String> visibleCategories,
    final double? monthlyAllowance,
    final double? spentThisMonth,
  }) = _$FamilyMemberImpl;

  factory _FamilyMember.fromJson(Map<String, dynamic> json) =
      _$FamilyMemberImpl.fromJson;

  @override
  String get odUserId;
  @override
  String get displayName;
  @override
  FamilyRole get role;
  @override
  DateTime get joinedAt;
  @override
  String? get avatarUrl;
  @override
  String? get email;
  @override
  bool get isActive;
  @override
  List<String> get visibleCategories; // categories they can see
  @override
  double? get monthlyAllowance;
  @override
  double? get spentThisMonth;

  /// Create a copy of FamilyMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FamilyMemberImplCopyWith<_$FamilyMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FamilySettings _$FamilySettingsFromJson(Map<String, dynamic> json) {
  return _FamilySettings.fromJson(json);
}

/// @nodoc
mixin _$FamilySettings {
  bool get allowSharedBudgets => throw _privateConstructorUsedError;
  bool get allowSharedGoals => throw _privateConstructorUsedError;
  bool get showIndividualSpending => throw _privateConstructorUsedError;
  bool get enableAllowances => throw _privateConstructorUsedError;
  bool get notifyOnLargeSpending => throw _privateConstructorUsedError;
  double? get largeSpendingThreshold => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;

  /// Serializes this FamilySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FamilySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FamilySettingsCopyWith<FamilySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilySettingsCopyWith<$Res> {
  factory $FamilySettingsCopyWith(
    FamilySettings value,
    $Res Function(FamilySettings) then,
  ) = _$FamilySettingsCopyWithImpl<$Res, FamilySettings>;
  @useResult
  $Res call({
    bool allowSharedBudgets,
    bool allowSharedGoals,
    bool showIndividualSpending,
    bool enableAllowances,
    bool notifyOnLargeSpending,
    double? largeSpendingThreshold,
    String currency,
  });
}

/// @nodoc
class _$FamilySettingsCopyWithImpl<$Res, $Val extends FamilySettings>
    implements $FamilySettingsCopyWith<$Res> {
  _$FamilySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FamilySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowSharedBudgets = null,
    Object? allowSharedGoals = null,
    Object? showIndividualSpending = null,
    Object? enableAllowances = null,
    Object? notifyOnLargeSpending = null,
    Object? largeSpendingThreshold = freezed,
    Object? currency = null,
  }) {
    return _then(
      _value.copyWith(
            allowSharedBudgets: null == allowSharedBudgets
                ? _value.allowSharedBudgets
                : allowSharedBudgets // ignore: cast_nullable_to_non_nullable
                      as bool,
            allowSharedGoals: null == allowSharedGoals
                ? _value.allowSharedGoals
                : allowSharedGoals // ignore: cast_nullable_to_non_nullable
                      as bool,
            showIndividualSpending: null == showIndividualSpending
                ? _value.showIndividualSpending
                : showIndividualSpending // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableAllowances: null == enableAllowances
                ? _value.enableAllowances
                : enableAllowances // ignore: cast_nullable_to_non_nullable
                      as bool,
            notifyOnLargeSpending: null == notifyOnLargeSpending
                ? _value.notifyOnLargeSpending
                : notifyOnLargeSpending // ignore: cast_nullable_to_non_nullable
                      as bool,
            largeSpendingThreshold: freezed == largeSpendingThreshold
                ? _value.largeSpendingThreshold
                : largeSpendingThreshold // ignore: cast_nullable_to_non_nullable
                      as double?,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FamilySettingsImplCopyWith<$Res>
    implements $FamilySettingsCopyWith<$Res> {
  factory _$$FamilySettingsImplCopyWith(
    _$FamilySettingsImpl value,
    $Res Function(_$FamilySettingsImpl) then,
  ) = __$$FamilySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool allowSharedBudgets,
    bool allowSharedGoals,
    bool showIndividualSpending,
    bool enableAllowances,
    bool notifyOnLargeSpending,
    double? largeSpendingThreshold,
    String currency,
  });
}

/// @nodoc
class __$$FamilySettingsImplCopyWithImpl<$Res>
    extends _$FamilySettingsCopyWithImpl<$Res, _$FamilySettingsImpl>
    implements _$$FamilySettingsImplCopyWith<$Res> {
  __$$FamilySettingsImplCopyWithImpl(
    _$FamilySettingsImpl _value,
    $Res Function(_$FamilySettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FamilySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allowSharedBudgets = null,
    Object? allowSharedGoals = null,
    Object? showIndividualSpending = null,
    Object? enableAllowances = null,
    Object? notifyOnLargeSpending = null,
    Object? largeSpendingThreshold = freezed,
    Object? currency = null,
  }) {
    return _then(
      _$FamilySettingsImpl(
        allowSharedBudgets: null == allowSharedBudgets
            ? _value.allowSharedBudgets
            : allowSharedBudgets // ignore: cast_nullable_to_non_nullable
                  as bool,
        allowSharedGoals: null == allowSharedGoals
            ? _value.allowSharedGoals
            : allowSharedGoals // ignore: cast_nullable_to_non_nullable
                  as bool,
        showIndividualSpending: null == showIndividualSpending
            ? _value.showIndividualSpending
            : showIndividualSpending // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableAllowances: null == enableAllowances
            ? _value.enableAllowances
            : enableAllowances // ignore: cast_nullable_to_non_nullable
                  as bool,
        notifyOnLargeSpending: null == notifyOnLargeSpending
            ? _value.notifyOnLargeSpending
            : notifyOnLargeSpending // ignore: cast_nullable_to_non_nullable
                  as bool,
        largeSpendingThreshold: freezed == largeSpendingThreshold
            ? _value.largeSpendingThreshold
            : largeSpendingThreshold // ignore: cast_nullable_to_non_nullable
                  as double?,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FamilySettingsImpl implements _FamilySettings {
  const _$FamilySettingsImpl({
    this.allowSharedBudgets = true,
    this.allowSharedGoals = true,
    this.showIndividualSpending = false,
    this.enableAllowances = true,
    this.notifyOnLargeSpending = true,
    this.largeSpendingThreshold,
    this.currency = 'USD',
  });

  factory _$FamilySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$FamilySettingsImplFromJson(json);

  @override
  @JsonKey()
  final bool allowSharedBudgets;
  @override
  @JsonKey()
  final bool allowSharedGoals;
  @override
  @JsonKey()
  final bool showIndividualSpending;
  @override
  @JsonKey()
  final bool enableAllowances;
  @override
  @JsonKey()
  final bool notifyOnLargeSpending;
  @override
  final double? largeSpendingThreshold;
  @override
  @JsonKey()
  final String currency;

  @override
  String toString() {
    return 'FamilySettings(allowSharedBudgets: $allowSharedBudgets, allowSharedGoals: $allowSharedGoals, showIndividualSpending: $showIndividualSpending, enableAllowances: $enableAllowances, notifyOnLargeSpending: $notifyOnLargeSpending, largeSpendingThreshold: $largeSpendingThreshold, currency: $currency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FamilySettingsImpl &&
            (identical(other.allowSharedBudgets, allowSharedBudgets) ||
                other.allowSharedBudgets == allowSharedBudgets) &&
            (identical(other.allowSharedGoals, allowSharedGoals) ||
                other.allowSharedGoals == allowSharedGoals) &&
            (identical(other.showIndividualSpending, showIndividualSpending) ||
                other.showIndividualSpending == showIndividualSpending) &&
            (identical(other.enableAllowances, enableAllowances) ||
                other.enableAllowances == enableAllowances) &&
            (identical(other.notifyOnLargeSpending, notifyOnLargeSpending) ||
                other.notifyOnLargeSpending == notifyOnLargeSpending) &&
            (identical(other.largeSpendingThreshold, largeSpendingThreshold) ||
                other.largeSpendingThreshold == largeSpendingThreshold) &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    allowSharedBudgets,
    allowSharedGoals,
    showIndividualSpending,
    enableAllowances,
    notifyOnLargeSpending,
    largeSpendingThreshold,
    currency,
  );

  /// Create a copy of FamilySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FamilySettingsImplCopyWith<_$FamilySettingsImpl> get copyWith =>
      __$$FamilySettingsImplCopyWithImpl<_$FamilySettingsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FamilySettingsImplToJson(this);
  }
}

abstract class _FamilySettings implements FamilySettings {
  const factory _FamilySettings({
    final bool allowSharedBudgets,
    final bool allowSharedGoals,
    final bool showIndividualSpending,
    final bool enableAllowances,
    final bool notifyOnLargeSpending,
    final double? largeSpendingThreshold,
    final String currency,
  }) = _$FamilySettingsImpl;

  factory _FamilySettings.fromJson(Map<String, dynamic> json) =
      _$FamilySettingsImpl.fromJson;

  @override
  bool get allowSharedBudgets;
  @override
  bool get allowSharedGoals;
  @override
  bool get showIndividualSpending;
  @override
  bool get enableAllowances;
  @override
  bool get notifyOnLargeSpending;
  @override
  double? get largeSpendingThreshold;
  @override
  String get currency;

  /// Create a copy of FamilySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FamilySettingsImplCopyWith<_$FamilySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SharedBudget _$SharedBudgetFromJson(Map<String, dynamic> json) {
  return _SharedBudget.fromJson(json);
}

/// @nodoc
mixin _$SharedBudget {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  CategoryType get category => throw _privateConstructorUsedError;
  double get limit => throw _privateConstructorUsedError;
  double get spent => throw _privateConstructorUsedError;
  BudgetPeriod get period => throw _privateConstructorUsedError;
  List<String> get memberIds =>
      throw _privateConstructorUsedError; // who contributes
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;

  /// Serializes this SharedBudget to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SharedBudget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SharedBudgetCopyWith<SharedBudget> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedBudgetCopyWith<$Res> {
  factory $SharedBudgetCopyWith(
    SharedBudget value,
    $Res Function(SharedBudget) then,
  ) = _$SharedBudgetCopyWithImpl<$Res, SharedBudget>;
  @useResult
  $Res call({
    String id,
    String name,
    CategoryType category,
    double limit,
    double spent,
    BudgetPeriod period,
    List<String> memberIds,
    DateTime? startDate,
    DateTime? endDate,
  });
}

/// @nodoc
class _$SharedBudgetCopyWithImpl<$Res, $Val extends SharedBudget>
    implements $SharedBudgetCopyWith<$Res> {
  _$SharedBudgetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SharedBudget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? limit = null,
    Object? spent = null,
    Object? period = null,
    Object? memberIds = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
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
                      as CategoryType,
            limit: null == limit
                ? _value.limit
                : limit // ignore: cast_nullable_to_non_nullable
                      as double,
            spent: null == spent
                ? _value.spent
                : spent // ignore: cast_nullable_to_non_nullable
                      as double,
            period: null == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                      as BudgetPeriod,
            memberIds: null == memberIds
                ? _value.memberIds
                : memberIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SharedBudgetImplCopyWith<$Res>
    implements $SharedBudgetCopyWith<$Res> {
  factory _$$SharedBudgetImplCopyWith(
    _$SharedBudgetImpl value,
    $Res Function(_$SharedBudgetImpl) then,
  ) = __$$SharedBudgetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    CategoryType category,
    double limit,
    double spent,
    BudgetPeriod period,
    List<String> memberIds,
    DateTime? startDate,
    DateTime? endDate,
  });
}

/// @nodoc
class __$$SharedBudgetImplCopyWithImpl<$Res>
    extends _$SharedBudgetCopyWithImpl<$Res, _$SharedBudgetImpl>
    implements _$$SharedBudgetImplCopyWith<$Res> {
  __$$SharedBudgetImplCopyWithImpl(
    _$SharedBudgetImpl _value,
    $Res Function(_$SharedBudgetImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SharedBudget
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? limit = null,
    Object? spent = null,
    Object? period = null,
    Object? memberIds = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(
      _$SharedBudgetImpl(
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
                  as CategoryType,
        limit: null == limit
            ? _value.limit
            : limit // ignore: cast_nullable_to_non_nullable
                  as double,
        spent: null == spent
            ? _value.spent
            : spent // ignore: cast_nullable_to_non_nullable
                  as double,
        period: null == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as BudgetPeriod,
        memberIds: null == memberIds
            ? _value._memberIds
            : memberIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SharedBudgetImpl implements _SharedBudget {
  const _$SharedBudgetImpl({
    required this.id,
    required this.name,
    required this.category,
    required this.limit,
    required this.spent,
    required this.period,
    required final List<String> memberIds,
    this.startDate,
    this.endDate,
  }) : _memberIds = memberIds;

  factory _$SharedBudgetImpl.fromJson(Map<String, dynamic> json) =>
      _$$SharedBudgetImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final CategoryType category;
  @override
  final double limit;
  @override
  final double spent;
  @override
  final BudgetPeriod period;
  final List<String> _memberIds;
  @override
  List<String> get memberIds {
    if (_memberIds is EqualUnmodifiableListView) return _memberIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_memberIds);
  }

  // who contributes
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;

  @override
  String toString() {
    return 'SharedBudget(id: $id, name: $name, category: $category, limit: $limit, spent: $spent, period: $period, memberIds: $memberIds, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharedBudgetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.spent, spent) || other.spent == spent) &&
            (identical(other.period, period) || other.period == period) &&
            const DeepCollectionEquality().equals(
              other._memberIds,
              _memberIds,
            ) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    category,
    limit,
    spent,
    period,
    const DeepCollectionEquality().hash(_memberIds),
    startDate,
    endDate,
  );

  /// Create a copy of SharedBudget
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SharedBudgetImplCopyWith<_$SharedBudgetImpl> get copyWith =>
      __$$SharedBudgetImplCopyWithImpl<_$SharedBudgetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SharedBudgetImplToJson(this);
  }
}

abstract class _SharedBudget implements SharedBudget {
  const factory _SharedBudget({
    required final String id,
    required final String name,
    required final CategoryType category,
    required final double limit,
    required final double spent,
    required final BudgetPeriod period,
    required final List<String> memberIds,
    final DateTime? startDate,
    final DateTime? endDate,
  }) = _$SharedBudgetImpl;

  factory _SharedBudget.fromJson(Map<String, dynamic> json) =
      _$SharedBudgetImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  CategoryType get category;
  @override
  double get limit;
  @override
  double get spent;
  @override
  BudgetPeriod get period;
  @override
  List<String> get memberIds; // who contributes
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;

  /// Create a copy of SharedBudget
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SharedBudgetImplCopyWith<_$SharedBudgetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FamilyGoal _$FamilyGoalFromJson(Map<String, dynamic> json) {
  return _FamilyGoal.fromJson(json);
}

/// @nodoc
mixin _$FamilyGoal {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get targetAmount => throw _privateConstructorUsedError;
  double get currentAmount => throw _privateConstructorUsedError;
  DateTime get targetDate => throw _privateConstructorUsedError;
  FamilyGoalStatus get status => throw _privateConstructorUsedError;
  List<GoalContribution> get contributions =>
      throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this FamilyGoal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FamilyGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FamilyGoalCopyWith<FamilyGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyGoalCopyWith<$Res> {
  factory $FamilyGoalCopyWith(
    FamilyGoal value,
    $Res Function(FamilyGoal) then,
  ) = _$FamilyGoalCopyWithImpl<$Res, FamilyGoal>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    double targetAmount,
    double currentAmount,
    DateTime targetDate,
    FamilyGoalStatus status,
    List<GoalContribution> contributions,
    String? icon,
    String? imageUrl,
  });
}

/// @nodoc
class _$FamilyGoalCopyWithImpl<$Res, $Val extends FamilyGoal>
    implements $FamilyGoalCopyWith<$Res> {
  _$FamilyGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FamilyGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? targetAmount = null,
    Object? currentAmount = null,
    Object? targetDate = null,
    Object? status = null,
    Object? contributions = null,
    Object? icon = freezed,
    Object? imageUrl = freezed,
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
            targetAmount: null == targetAmount
                ? _value.targetAmount
                : targetAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            currentAmount: null == currentAmount
                ? _value.currentAmount
                : currentAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            targetDate: null == targetDate
                ? _value.targetDate
                : targetDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as FamilyGoalStatus,
            contributions: null == contributions
                ? _value.contributions
                : contributions // ignore: cast_nullable_to_non_nullable
                      as List<GoalContribution>,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FamilyGoalImplCopyWith<$Res>
    implements $FamilyGoalCopyWith<$Res> {
  factory _$$FamilyGoalImplCopyWith(
    _$FamilyGoalImpl value,
    $Res Function(_$FamilyGoalImpl) then,
  ) = __$$FamilyGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    double targetAmount,
    double currentAmount,
    DateTime targetDate,
    FamilyGoalStatus status,
    List<GoalContribution> contributions,
    String? icon,
    String? imageUrl,
  });
}

/// @nodoc
class __$$FamilyGoalImplCopyWithImpl<$Res>
    extends _$FamilyGoalCopyWithImpl<$Res, _$FamilyGoalImpl>
    implements _$$FamilyGoalImplCopyWith<$Res> {
  __$$FamilyGoalImplCopyWithImpl(
    _$FamilyGoalImpl _value,
    $Res Function(_$FamilyGoalImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FamilyGoal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? targetAmount = null,
    Object? currentAmount = null,
    Object? targetDate = null,
    Object? status = null,
    Object? contributions = null,
    Object? icon = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(
      _$FamilyGoalImpl(
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
        targetAmount: null == targetAmount
            ? _value.targetAmount
            : targetAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        currentAmount: null == currentAmount
            ? _value.currentAmount
            : currentAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        targetDate: null == targetDate
            ? _value.targetDate
            : targetDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as FamilyGoalStatus,
        contributions: null == contributions
            ? _value._contributions
            : contributions // ignore: cast_nullable_to_non_nullable
                  as List<GoalContribution>,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FamilyGoalImpl implements _FamilyGoal {
  const _$FamilyGoalImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.targetAmount,
    required this.currentAmount,
    required this.targetDate,
    required this.status,
    required final List<GoalContribution> contributions,
    this.icon,
    this.imageUrl,
  }) : _contributions = contributions;

  factory _$FamilyGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$FamilyGoalImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final double targetAmount;
  @override
  final double currentAmount;
  @override
  final DateTime targetDate;
  @override
  final FamilyGoalStatus status;
  final List<GoalContribution> _contributions;
  @override
  List<GoalContribution> get contributions {
    if (_contributions is EqualUnmodifiableListView) return _contributions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contributions);
  }

  @override
  final String? icon;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'FamilyGoal(id: $id, title: $title, description: $description, targetAmount: $targetAmount, currentAmount: $currentAmount, targetDate: $targetDate, status: $status, contributions: $contributions, icon: $icon, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FamilyGoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.targetAmount, targetAmount) ||
                other.targetAmount == targetAmount) &&
            (identical(other.currentAmount, currentAmount) ||
                other.currentAmount == currentAmount) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
              other._contributions,
              _contributions,
            ) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    targetAmount,
    currentAmount,
    targetDate,
    status,
    const DeepCollectionEquality().hash(_contributions),
    icon,
    imageUrl,
  );

  /// Create a copy of FamilyGoal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FamilyGoalImplCopyWith<_$FamilyGoalImpl> get copyWith =>
      __$$FamilyGoalImplCopyWithImpl<_$FamilyGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FamilyGoalImplToJson(this);
  }
}

abstract class _FamilyGoal implements FamilyGoal {
  const factory _FamilyGoal({
    required final String id,
    required final String title,
    required final String description,
    required final double targetAmount,
    required final double currentAmount,
    required final DateTime targetDate,
    required final FamilyGoalStatus status,
    required final List<GoalContribution> contributions,
    final String? icon,
    final String? imageUrl,
  }) = _$FamilyGoalImpl;

  factory _FamilyGoal.fromJson(Map<String, dynamic> json) =
      _$FamilyGoalImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  double get targetAmount;
  @override
  double get currentAmount;
  @override
  DateTime get targetDate;
  @override
  FamilyGoalStatus get status;
  @override
  List<GoalContribution> get contributions;
  @override
  String? get icon;
  @override
  String? get imageUrl;

  /// Create a copy of FamilyGoal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FamilyGoalImplCopyWith<_$FamilyGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GoalContribution _$GoalContributionFromJson(Map<String, dynamic> json) {
  return _GoalContribution.fromJson(json);
}

/// @nodoc
mixin _$GoalContribution {
  String get odUserId => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this GoalContribution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalContribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalContributionCopyWith<GoalContribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalContributionCopyWith<$Res> {
  factory $GoalContributionCopyWith(
    GoalContribution value,
    $Res Function(GoalContribution) then,
  ) = _$GoalContributionCopyWithImpl<$Res, GoalContribution>;
  @useResult
  $Res call({
    String odUserId,
    String displayName,
    double amount,
    DateTime date,
    String? note,
  });
}

/// @nodoc
class _$GoalContributionCopyWithImpl<$Res, $Val extends GoalContribution>
    implements $GoalContributionCopyWith<$Res> {
  _$GoalContributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalContribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? odUserId = null,
    Object? displayName = null,
    Object? amount = null,
    Object? date = null,
    Object? note = freezed,
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
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            note: freezed == note
                ? _value.note
                : note // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GoalContributionImplCopyWith<$Res>
    implements $GoalContributionCopyWith<$Res> {
  factory _$$GoalContributionImplCopyWith(
    _$GoalContributionImpl value,
    $Res Function(_$GoalContributionImpl) then,
  ) = __$$GoalContributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String odUserId,
    String displayName,
    double amount,
    DateTime date,
    String? note,
  });
}

/// @nodoc
class __$$GoalContributionImplCopyWithImpl<$Res>
    extends _$GoalContributionCopyWithImpl<$Res, _$GoalContributionImpl>
    implements _$$GoalContributionImplCopyWith<$Res> {
  __$$GoalContributionImplCopyWithImpl(
    _$GoalContributionImpl _value,
    $Res Function(_$GoalContributionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GoalContribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? odUserId = null,
    Object? displayName = null,
    Object? amount = null,
    Object? date = null,
    Object? note = freezed,
  }) {
    return _then(
      _$GoalContributionImpl(
        odUserId: null == odUserId
            ? _value.odUserId
            : odUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        note: freezed == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalContributionImpl implements _GoalContribution {
  const _$GoalContributionImpl({
    required this.odUserId,
    required this.displayName,
    required this.amount,
    required this.date,
    this.note,
  });

  factory _$GoalContributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalContributionImplFromJson(json);

  @override
  final String odUserId;
  @override
  final String displayName;
  @override
  final double amount;
  @override
  final DateTime date;
  @override
  final String? note;

  @override
  String toString() {
    return 'GoalContribution(odUserId: $odUserId, displayName: $displayName, amount: $amount, date: $date, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalContributionImpl &&
            (identical(other.odUserId, odUserId) ||
                other.odUserId == odUserId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, odUserId, displayName, amount, date, note);

  /// Create a copy of GoalContribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalContributionImplCopyWith<_$GoalContributionImpl> get copyWith =>
      __$$GoalContributionImplCopyWithImpl<_$GoalContributionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalContributionImplToJson(this);
  }
}

abstract class _GoalContribution implements GoalContribution {
  const factory _GoalContribution({
    required final String odUserId,
    required final String displayName,
    required final double amount,
    required final DateTime date,
    final String? note,
  }) = _$GoalContributionImpl;

  factory _GoalContribution.fromJson(Map<String, dynamic> json) =
      _$GoalContributionImpl.fromJson;

  @override
  String get odUserId;
  @override
  String get displayName;
  @override
  double get amount;
  @override
  DateTime get date;
  @override
  String? get note;

  /// Create a copy of GoalContribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalContributionImplCopyWith<_$GoalContributionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Allowance _$AllowanceFromJson(Map<String, dynamic> json) {
  return _Allowance.fromJson(json);
}

/// @nodoc
mixin _$Allowance {
  String get id => throw _privateConstructorUsedError;
  String get recipientUserId => throw _privateConstructorUsedError;
  String get recipientName => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  AllowanceFrequency get frequency => throw _privateConstructorUsedError;
  DateTime get nextPaymentDate => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  List<AllowanceRule> get rules => throw _privateConstructorUsedError;
  DateTime? get lastPaidDate => throw _privateConstructorUsedError;
  double? get spentThisPeriod => throw _privateConstructorUsedError;

  /// Serializes this Allowance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Allowance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllowanceCopyWith<Allowance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllowanceCopyWith<$Res> {
  factory $AllowanceCopyWith(Allowance value, $Res Function(Allowance) then) =
      _$AllowanceCopyWithImpl<$Res, Allowance>;
  @useResult
  $Res call({
    String id,
    String recipientUserId,
    String recipientName,
    double amount,
    AllowanceFrequency frequency,
    DateTime nextPaymentDate,
    bool isActive,
    List<AllowanceRule> rules,
    DateTime? lastPaidDate,
    double? spentThisPeriod,
  });
}

/// @nodoc
class _$AllowanceCopyWithImpl<$Res, $Val extends Allowance>
    implements $AllowanceCopyWith<$Res> {
  _$AllowanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Allowance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipientUserId = null,
    Object? recipientName = null,
    Object? amount = null,
    Object? frequency = null,
    Object? nextPaymentDate = null,
    Object? isActive = null,
    Object? rules = null,
    Object? lastPaidDate = freezed,
    Object? spentThisPeriod = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            recipientUserId: null == recipientUserId
                ? _value.recipientUserId
                : recipientUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            recipientName: null == recipientName
                ? _value.recipientName
                : recipientName // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            frequency: null == frequency
                ? _value.frequency
                : frequency // ignore: cast_nullable_to_non_nullable
                      as AllowanceFrequency,
            nextPaymentDate: null == nextPaymentDate
                ? _value.nextPaymentDate
                : nextPaymentDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            rules: null == rules
                ? _value.rules
                : rules // ignore: cast_nullable_to_non_nullable
                      as List<AllowanceRule>,
            lastPaidDate: freezed == lastPaidDate
                ? _value.lastPaidDate
                : lastPaidDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            spentThisPeriod: freezed == spentThisPeriod
                ? _value.spentThisPeriod
                : spentThisPeriod // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AllowanceImplCopyWith<$Res>
    implements $AllowanceCopyWith<$Res> {
  factory _$$AllowanceImplCopyWith(
    _$AllowanceImpl value,
    $Res Function(_$AllowanceImpl) then,
  ) = __$$AllowanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String recipientUserId,
    String recipientName,
    double amount,
    AllowanceFrequency frequency,
    DateTime nextPaymentDate,
    bool isActive,
    List<AllowanceRule> rules,
    DateTime? lastPaidDate,
    double? spentThisPeriod,
  });
}

/// @nodoc
class __$$AllowanceImplCopyWithImpl<$Res>
    extends _$AllowanceCopyWithImpl<$Res, _$AllowanceImpl>
    implements _$$AllowanceImplCopyWith<$Res> {
  __$$AllowanceImplCopyWithImpl(
    _$AllowanceImpl _value,
    $Res Function(_$AllowanceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Allowance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipientUserId = null,
    Object? recipientName = null,
    Object? amount = null,
    Object? frequency = null,
    Object? nextPaymentDate = null,
    Object? isActive = null,
    Object? rules = null,
    Object? lastPaidDate = freezed,
    Object? spentThisPeriod = freezed,
  }) {
    return _then(
      _$AllowanceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        recipientUserId: null == recipientUserId
            ? _value.recipientUserId
            : recipientUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        recipientName: null == recipientName
            ? _value.recipientName
            : recipientName // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        frequency: null == frequency
            ? _value.frequency
            : frequency // ignore: cast_nullable_to_non_nullable
                  as AllowanceFrequency,
        nextPaymentDate: null == nextPaymentDate
            ? _value.nextPaymentDate
            : nextPaymentDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        rules: null == rules
            ? _value._rules
            : rules // ignore: cast_nullable_to_non_nullable
                  as List<AllowanceRule>,
        lastPaidDate: freezed == lastPaidDate
            ? _value.lastPaidDate
            : lastPaidDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        spentThisPeriod: freezed == spentThisPeriod
            ? _value.spentThisPeriod
            : spentThisPeriod // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AllowanceImpl implements _Allowance {
  const _$AllowanceImpl({
    required this.id,
    required this.recipientUserId,
    required this.recipientName,
    required this.amount,
    required this.frequency,
    required this.nextPaymentDate,
    this.isActive = true,
    final List<AllowanceRule> rules = const [],
    this.lastPaidDate,
    this.spentThisPeriod,
  }) : _rules = rules;

  factory _$AllowanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllowanceImplFromJson(json);

  @override
  final String id;
  @override
  final String recipientUserId;
  @override
  final String recipientName;
  @override
  final double amount;
  @override
  final AllowanceFrequency frequency;
  @override
  final DateTime nextPaymentDate;
  @override
  @JsonKey()
  final bool isActive;
  final List<AllowanceRule> _rules;
  @override
  @JsonKey()
  List<AllowanceRule> get rules {
    if (_rules is EqualUnmodifiableListView) return _rules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rules);
  }

  @override
  final DateTime? lastPaidDate;
  @override
  final double? spentThisPeriod;

  @override
  String toString() {
    return 'Allowance(id: $id, recipientUserId: $recipientUserId, recipientName: $recipientName, amount: $amount, frequency: $frequency, nextPaymentDate: $nextPaymentDate, isActive: $isActive, rules: $rules, lastPaidDate: $lastPaidDate, spentThisPeriod: $spentThisPeriod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllowanceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recipientUserId, recipientUserId) ||
                other.recipientUserId == recipientUserId) &&
            (identical(other.recipientName, recipientName) ||
                other.recipientName == recipientName) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.nextPaymentDate, nextPaymentDate) ||
                other.nextPaymentDate == nextPaymentDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._rules, _rules) &&
            (identical(other.lastPaidDate, lastPaidDate) ||
                other.lastPaidDate == lastPaidDate) &&
            (identical(other.spentThisPeriod, spentThisPeriod) ||
                other.spentThisPeriod == spentThisPeriod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    recipientUserId,
    recipientName,
    amount,
    frequency,
    nextPaymentDate,
    isActive,
    const DeepCollectionEquality().hash(_rules),
    lastPaidDate,
    spentThisPeriod,
  );

  /// Create a copy of Allowance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllowanceImplCopyWith<_$AllowanceImpl> get copyWith =>
      __$$AllowanceImplCopyWithImpl<_$AllowanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllowanceImplToJson(this);
  }
}

abstract class _Allowance implements Allowance {
  const factory _Allowance({
    required final String id,
    required final String recipientUserId,
    required final String recipientName,
    required final double amount,
    required final AllowanceFrequency frequency,
    required final DateTime nextPaymentDate,
    final bool isActive,
    final List<AllowanceRule> rules,
    final DateTime? lastPaidDate,
    final double? spentThisPeriod,
  }) = _$AllowanceImpl;

  factory _Allowance.fromJson(Map<String, dynamic> json) =
      _$AllowanceImpl.fromJson;

  @override
  String get id;
  @override
  String get recipientUserId;
  @override
  String get recipientName;
  @override
  double get amount;
  @override
  AllowanceFrequency get frequency;
  @override
  DateTime get nextPaymentDate;
  @override
  bool get isActive;
  @override
  List<AllowanceRule> get rules;
  @override
  DateTime? get lastPaidDate;
  @override
  double? get spentThisPeriod;

  /// Create a copy of Allowance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllowanceImplCopyWith<_$AllowanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AllowanceRule _$AllowanceRuleFromJson(Map<String, dynamic> json) {
  return _AllowanceRule.fromJson(json);
}

/// @nodoc
mixin _$AllowanceRule {
  String get id => throw _privateConstructorUsedError;
  AllowanceRuleType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  CategoryType? get restrictedCategory => throw _privateConstructorUsedError;
  double? get maxSinglePurchase => throw _privateConstructorUsedError;
  bool? get requiresApproval => throw _privateConstructorUsedError;

  /// Serializes this AllowanceRule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllowanceRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllowanceRuleCopyWith<AllowanceRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllowanceRuleCopyWith<$Res> {
  factory $AllowanceRuleCopyWith(
    AllowanceRule value,
    $Res Function(AllowanceRule) then,
  ) = _$AllowanceRuleCopyWithImpl<$Res, AllowanceRule>;
  @useResult
  $Res call({
    String id,
    AllowanceRuleType type,
    String description,
    CategoryType? restrictedCategory,
    double? maxSinglePurchase,
    bool? requiresApproval,
  });
}

/// @nodoc
class _$AllowanceRuleCopyWithImpl<$Res, $Val extends AllowanceRule>
    implements $AllowanceRuleCopyWith<$Res> {
  _$AllowanceRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllowanceRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? description = null,
    Object? restrictedCategory = freezed,
    Object? maxSinglePurchase = freezed,
    Object? requiresApproval = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as AllowanceRuleType,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            restrictedCategory: freezed == restrictedCategory
                ? _value.restrictedCategory
                : restrictedCategory // ignore: cast_nullable_to_non_nullable
                      as CategoryType?,
            maxSinglePurchase: freezed == maxSinglePurchase
                ? _value.maxSinglePurchase
                : maxSinglePurchase // ignore: cast_nullable_to_non_nullable
                      as double?,
            requiresApproval: freezed == requiresApproval
                ? _value.requiresApproval
                : requiresApproval // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AllowanceRuleImplCopyWith<$Res>
    implements $AllowanceRuleCopyWith<$Res> {
  factory _$$AllowanceRuleImplCopyWith(
    _$AllowanceRuleImpl value,
    $Res Function(_$AllowanceRuleImpl) then,
  ) = __$$AllowanceRuleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    AllowanceRuleType type,
    String description,
    CategoryType? restrictedCategory,
    double? maxSinglePurchase,
    bool? requiresApproval,
  });
}

/// @nodoc
class __$$AllowanceRuleImplCopyWithImpl<$Res>
    extends _$AllowanceRuleCopyWithImpl<$Res, _$AllowanceRuleImpl>
    implements _$$AllowanceRuleImplCopyWith<$Res> {
  __$$AllowanceRuleImplCopyWithImpl(
    _$AllowanceRuleImpl _value,
    $Res Function(_$AllowanceRuleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AllowanceRule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? description = null,
    Object? restrictedCategory = freezed,
    Object? maxSinglePurchase = freezed,
    Object? requiresApproval = freezed,
  }) {
    return _then(
      _$AllowanceRuleImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AllowanceRuleType,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        restrictedCategory: freezed == restrictedCategory
            ? _value.restrictedCategory
            : restrictedCategory // ignore: cast_nullable_to_non_nullable
                  as CategoryType?,
        maxSinglePurchase: freezed == maxSinglePurchase
            ? _value.maxSinglePurchase
            : maxSinglePurchase // ignore: cast_nullable_to_non_nullable
                  as double?,
        requiresApproval: freezed == requiresApproval
            ? _value.requiresApproval
            : requiresApproval // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AllowanceRuleImpl implements _AllowanceRule {
  const _$AllowanceRuleImpl({
    required this.id,
    required this.type,
    required this.description,
    this.restrictedCategory,
    this.maxSinglePurchase,
    this.requiresApproval,
  });

  factory _$AllowanceRuleImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllowanceRuleImplFromJson(json);

  @override
  final String id;
  @override
  final AllowanceRuleType type;
  @override
  final String description;
  @override
  final CategoryType? restrictedCategory;
  @override
  final double? maxSinglePurchase;
  @override
  final bool? requiresApproval;

  @override
  String toString() {
    return 'AllowanceRule(id: $id, type: $type, description: $description, restrictedCategory: $restrictedCategory, maxSinglePurchase: $maxSinglePurchase, requiresApproval: $requiresApproval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllowanceRuleImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.restrictedCategory, restrictedCategory) ||
                other.restrictedCategory == restrictedCategory) &&
            (identical(other.maxSinglePurchase, maxSinglePurchase) ||
                other.maxSinglePurchase == maxSinglePurchase) &&
            (identical(other.requiresApproval, requiresApproval) ||
                other.requiresApproval == requiresApproval));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    description,
    restrictedCategory,
    maxSinglePurchase,
    requiresApproval,
  );

  /// Create a copy of AllowanceRule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllowanceRuleImplCopyWith<_$AllowanceRuleImpl> get copyWith =>
      __$$AllowanceRuleImplCopyWithImpl<_$AllowanceRuleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllowanceRuleImplToJson(this);
  }
}

abstract class _AllowanceRule implements AllowanceRule {
  const factory _AllowanceRule({
    required final String id,
    required final AllowanceRuleType type,
    required final String description,
    final CategoryType? restrictedCategory,
    final double? maxSinglePurchase,
    final bool? requiresApproval,
  }) = _$AllowanceRuleImpl;

  factory _AllowanceRule.fromJson(Map<String, dynamic> json) =
      _$AllowanceRuleImpl.fromJson;

  @override
  String get id;
  @override
  AllowanceRuleType get type;
  @override
  String get description;
  @override
  CategoryType? get restrictedCategory;
  @override
  double? get maxSinglePurchase;
  @override
  bool? get requiresApproval;

  /// Create a copy of AllowanceRule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllowanceRuleImplCopyWith<_$AllowanceRuleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FamilyActivity _$FamilyActivityFromJson(Map<String, dynamic> json) {
  return _FamilyActivity.fromJson(json);
}

/// @nodoc
mixin _$FamilyActivity {
  String get id => throw _privateConstructorUsedError;
  String get familyId => throw _privateConstructorUsedError;
  String get memberUserId => throw _privateConstructorUsedError;
  String get memberName => throw _privateConstructorUsedError;
  FamilyActivityType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  String? get relatedId => throw _privateConstructorUsedError;

  /// Serializes this FamilyActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FamilyActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FamilyActivityCopyWith<FamilyActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyActivityCopyWith<$Res> {
  factory $FamilyActivityCopyWith(
    FamilyActivity value,
    $Res Function(FamilyActivity) then,
  ) = _$FamilyActivityCopyWithImpl<$Res, FamilyActivity>;
  @useResult
  $Res call({
    String id,
    String familyId,
    String memberUserId,
    String memberName,
    FamilyActivityType type,
    String description,
    DateTime timestamp,
    double? amount,
    String? relatedId,
  });
}

/// @nodoc
class _$FamilyActivityCopyWithImpl<$Res, $Val extends FamilyActivity>
    implements $FamilyActivityCopyWith<$Res> {
  _$FamilyActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FamilyActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? familyId = null,
    Object? memberUserId = null,
    Object? memberName = null,
    Object? type = null,
    Object? description = null,
    Object? timestamp = null,
    Object? amount = freezed,
    Object? relatedId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            familyId: null == familyId
                ? _value.familyId
                : familyId // ignore: cast_nullable_to_non_nullable
                      as String,
            memberUserId: null == memberUserId
                ? _value.memberUserId
                : memberUserId // ignore: cast_nullable_to_non_nullable
                      as String,
            memberName: null == memberName
                ? _value.memberName
                : memberName // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as FamilyActivityType,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            amount: freezed == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double?,
            relatedId: freezed == relatedId
                ? _value.relatedId
                : relatedId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FamilyActivityImplCopyWith<$Res>
    implements $FamilyActivityCopyWith<$Res> {
  factory _$$FamilyActivityImplCopyWith(
    _$FamilyActivityImpl value,
    $Res Function(_$FamilyActivityImpl) then,
  ) = __$$FamilyActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String familyId,
    String memberUserId,
    String memberName,
    FamilyActivityType type,
    String description,
    DateTime timestamp,
    double? amount,
    String? relatedId,
  });
}

/// @nodoc
class __$$FamilyActivityImplCopyWithImpl<$Res>
    extends _$FamilyActivityCopyWithImpl<$Res, _$FamilyActivityImpl>
    implements _$$FamilyActivityImplCopyWith<$Res> {
  __$$FamilyActivityImplCopyWithImpl(
    _$FamilyActivityImpl _value,
    $Res Function(_$FamilyActivityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FamilyActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? familyId = null,
    Object? memberUserId = null,
    Object? memberName = null,
    Object? type = null,
    Object? description = null,
    Object? timestamp = null,
    Object? amount = freezed,
    Object? relatedId = freezed,
  }) {
    return _then(
      _$FamilyActivityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        familyId: null == familyId
            ? _value.familyId
            : familyId // ignore: cast_nullable_to_non_nullable
                  as String,
        memberUserId: null == memberUserId
            ? _value.memberUserId
            : memberUserId // ignore: cast_nullable_to_non_nullable
                  as String,
        memberName: null == memberName
            ? _value.memberName
            : memberName // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as FamilyActivityType,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        amount: freezed == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double?,
        relatedId: freezed == relatedId
            ? _value.relatedId
            : relatedId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FamilyActivityImpl implements _FamilyActivity {
  const _$FamilyActivityImpl({
    required this.id,
    required this.familyId,
    required this.memberUserId,
    required this.memberName,
    required this.type,
    required this.description,
    required this.timestamp,
    this.amount,
    this.relatedId,
  });

  factory _$FamilyActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FamilyActivityImplFromJson(json);

  @override
  final String id;
  @override
  final String familyId;
  @override
  final String memberUserId;
  @override
  final String memberName;
  @override
  final FamilyActivityType type;
  @override
  final String description;
  @override
  final DateTime timestamp;
  @override
  final double? amount;
  @override
  final String? relatedId;

  @override
  String toString() {
    return 'FamilyActivity(id: $id, familyId: $familyId, memberUserId: $memberUserId, memberName: $memberName, type: $type, description: $description, timestamp: $timestamp, amount: $amount, relatedId: $relatedId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FamilyActivityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.familyId, familyId) ||
                other.familyId == familyId) &&
            (identical(other.memberUserId, memberUserId) ||
                other.memberUserId == memberUserId) &&
            (identical(other.memberName, memberName) ||
                other.memberName == memberName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.relatedId, relatedId) ||
                other.relatedId == relatedId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    familyId,
    memberUserId,
    memberName,
    type,
    description,
    timestamp,
    amount,
    relatedId,
  );

  /// Create a copy of FamilyActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FamilyActivityImplCopyWith<_$FamilyActivityImpl> get copyWith =>
      __$$FamilyActivityImplCopyWithImpl<_$FamilyActivityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$FamilyActivityImplToJson(this);
  }
}

abstract class _FamilyActivity implements FamilyActivity {
  const factory _FamilyActivity({
    required final String id,
    required final String familyId,
    required final String memberUserId,
    required final String memberName,
    required final FamilyActivityType type,
    required final String description,
    required final DateTime timestamp,
    final double? amount,
    final String? relatedId,
  }) = _$FamilyActivityImpl;

  factory _FamilyActivity.fromJson(Map<String, dynamic> json) =
      _$FamilyActivityImpl.fromJson;

  @override
  String get id;
  @override
  String get familyId;
  @override
  String get memberUserId;
  @override
  String get memberName;
  @override
  FamilyActivityType get type;
  @override
  String get description;
  @override
  DateTime get timestamp;
  @override
  double? get amount;
  @override
  String? get relatedId;

  /// Create a copy of FamilyActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FamilyActivityImplCopyWith<_$FamilyActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
