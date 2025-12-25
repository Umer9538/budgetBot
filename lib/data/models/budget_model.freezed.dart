// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BudgetModel _$BudgetModelFromJson(Map<String, dynamic> json) {
  return _BudgetModel.fromJson(json);
}

/// @nodoc
mixin _$BudgetModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  CategoryType get category => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  BudgetPeriod get period => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  bool get rollover => throw _privateConstructorUsedError;
  double get rolloverAmount =>
      throw _privateConstructorUsedError; // Amount rolled over from previous period
  double get spent => throw _privateConstructorUsedError;
  List<double> get alertThresholds => throw _privateConstructorUsedError;
  bool get isShared => throw _privateConstructorUsedError;
  List<String> get sharedWith => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get colorHex => throw _privateConstructorUsedError;
  String? get iconName =>
      throw _privateConstructorUsedError; // Merchant-based budget support
  BudgetTargetType get targetType => throw _privateConstructorUsedError;
  String? get merchantName =>
      throw _privateConstructorUsedError; // For merchant-based budgets
  List<String> get merchantPatterns =>
      throw _privateConstructorUsedError; // Multiple merchant patterns to match
  // Template tracking
  String? get templateId =>
      throw _privateConstructorUsedError; // If created from a template
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this BudgetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetModelCopyWith<BudgetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetModelCopyWith<$Res> {
  factory $BudgetModelCopyWith(
    BudgetModel value,
    $Res Function(BudgetModel) then,
  ) = _$BudgetModelCopyWithImpl<$Res, BudgetModel>;
  @useResult
  $Res call({
    String id,
    String userId,
    String name,
    CategoryType category,
    double amount,
    BudgetPeriod period,
    @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
    DateTime startDate,
    DateTime? endDate,
    bool rollover,
    double rolloverAmount,
    double spent,
    List<double> alertThresholds,
    bool isShared,
    List<String> sharedWith,
    bool isActive,
    String? colorHex,
    String? iconName,
    BudgetTargetType targetType,
    String? merchantName,
    List<String> merchantPatterns,
    String? templateId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$BudgetModelCopyWithImpl<$Res, $Val extends BudgetModel>
    implements $BudgetModelCopyWith<$Res> {
  _$BudgetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? category = null,
    Object? amount = null,
    Object? period = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? rollover = null,
    Object? rolloverAmount = null,
    Object? spent = null,
    Object? alertThresholds = null,
    Object? isShared = null,
    Object? sharedWith = null,
    Object? isActive = null,
    Object? colorHex = freezed,
    Object? iconName = freezed,
    Object? targetType = null,
    Object? merchantName = freezed,
    Object? merchantPatterns = null,
    Object? templateId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as CategoryType,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            period: null == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                      as BudgetPeriod,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: freezed == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            rollover: null == rollover
                ? _value.rollover
                : rollover // ignore: cast_nullable_to_non_nullable
                      as bool,
            rolloverAmount: null == rolloverAmount
                ? _value.rolloverAmount
                : rolloverAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            spent: null == spent
                ? _value.spent
                : spent // ignore: cast_nullable_to_non_nullable
                      as double,
            alertThresholds: null == alertThresholds
                ? _value.alertThresholds
                : alertThresholds // ignore: cast_nullable_to_non_nullable
                      as List<double>,
            isShared: null == isShared
                ? _value.isShared
                : isShared // ignore: cast_nullable_to_non_nullable
                      as bool,
            sharedWith: null == sharedWith
                ? _value.sharedWith
                : sharedWith // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            colorHex: freezed == colorHex
                ? _value.colorHex
                : colorHex // ignore: cast_nullable_to_non_nullable
                      as String?,
            iconName: freezed == iconName
                ? _value.iconName
                : iconName // ignore: cast_nullable_to_non_nullable
                      as String?,
            targetType: null == targetType
                ? _value.targetType
                : targetType // ignore: cast_nullable_to_non_nullable
                      as BudgetTargetType,
            merchantName: freezed == merchantName
                ? _value.merchantName
                : merchantName // ignore: cast_nullable_to_non_nullable
                      as String?,
            merchantPatterns: null == merchantPatterns
                ? _value.merchantPatterns
                : merchantPatterns // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            templateId: freezed == templateId
                ? _value.templateId
                : templateId // ignore: cast_nullable_to_non_nullable
                      as String?,
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
}

/// @nodoc
abstract class _$$BudgetModelImplCopyWith<$Res>
    implements $BudgetModelCopyWith<$Res> {
  factory _$$BudgetModelImplCopyWith(
    _$BudgetModelImpl value,
    $Res Function(_$BudgetModelImpl) then,
  ) = __$$BudgetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String name,
    CategoryType category,
    double amount,
    BudgetPeriod period,
    @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
    DateTime startDate,
    DateTime? endDate,
    bool rollover,
    double rolloverAmount,
    double spent,
    List<double> alertThresholds,
    bool isShared,
    List<String> sharedWith,
    bool isActive,
    String? colorHex,
    String? iconName,
    BudgetTargetType targetType,
    String? merchantName,
    List<String> merchantPatterns,
    String? templateId,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$BudgetModelImplCopyWithImpl<$Res>
    extends _$BudgetModelCopyWithImpl<$Res, _$BudgetModelImpl>
    implements _$$BudgetModelImplCopyWith<$Res> {
  __$$BudgetModelImplCopyWithImpl(
    _$BudgetModelImpl _value,
    $Res Function(_$BudgetModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? category = null,
    Object? amount = null,
    Object? period = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? rollover = null,
    Object? rolloverAmount = null,
    Object? spent = null,
    Object? alertThresholds = null,
    Object? isShared = null,
    Object? sharedWith = null,
    Object? isActive = null,
    Object? colorHex = freezed,
    Object? iconName = freezed,
    Object? targetType = null,
    Object? merchantName = freezed,
    Object? merchantPatterns = null,
    Object? templateId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$BudgetModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as CategoryType,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        period: null == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as BudgetPeriod,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: freezed == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        rollover: null == rollover
            ? _value.rollover
            : rollover // ignore: cast_nullable_to_non_nullable
                  as bool,
        rolloverAmount: null == rolloverAmount
            ? _value.rolloverAmount
            : rolloverAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        spent: null == spent
            ? _value.spent
            : spent // ignore: cast_nullable_to_non_nullable
                  as double,
        alertThresholds: null == alertThresholds
            ? _value._alertThresholds
            : alertThresholds // ignore: cast_nullable_to_non_nullable
                  as List<double>,
        isShared: null == isShared
            ? _value.isShared
            : isShared // ignore: cast_nullable_to_non_nullable
                  as bool,
        sharedWith: null == sharedWith
            ? _value._sharedWith
            : sharedWith // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        colorHex: freezed == colorHex
            ? _value.colorHex
            : colorHex // ignore: cast_nullable_to_non_nullable
                  as String?,
        iconName: freezed == iconName
            ? _value.iconName
            : iconName // ignore: cast_nullable_to_non_nullable
                  as String?,
        targetType: null == targetType
            ? _value.targetType
            : targetType // ignore: cast_nullable_to_non_nullable
                  as BudgetTargetType,
        merchantName: freezed == merchantName
            ? _value.merchantName
            : merchantName // ignore: cast_nullable_to_non_nullable
                  as String?,
        merchantPatterns: null == merchantPatterns
            ? _value._merchantPatterns
            : merchantPatterns // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        templateId: freezed == templateId
            ? _value.templateId
            : templateId // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$BudgetModelImpl implements _BudgetModel {
  const _$BudgetModelImpl({
    required this.id,
    required this.userId,
    required this.name,
    required this.category,
    required this.amount,
    required this.period,
    @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
    required this.startDate,
    this.endDate,
    this.rollover = false,
    this.rolloverAmount = 0.0,
    this.spent = 0.0,
    final List<double> alertThresholds = const [0.5, 0.75, 0.9, 1.0],
    this.isShared = false,
    final List<String> sharedWith = const [],
    this.isActive = true,
    this.colorHex,
    this.iconName,
    this.targetType = BudgetTargetType.category,
    this.merchantName,
    final List<String> merchantPatterns = const [],
    this.templateId,
    this.createdAt,
    this.updatedAt,
  }) : _alertThresholds = alertThresholds,
       _sharedWith = sharedWith,
       _merchantPatterns = merchantPatterns;

  factory _$BudgetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final CategoryType category;
  @override
  final double amount;
  @override
  final BudgetPeriod period;
  @override
  @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
  final DateTime startDate;
  @override
  final DateTime? endDate;
  @override
  @JsonKey()
  final bool rollover;
  @override
  @JsonKey()
  final double rolloverAmount;
  // Amount rolled over from previous period
  @override
  @JsonKey()
  final double spent;
  final List<double> _alertThresholds;
  @override
  @JsonKey()
  List<double> get alertThresholds {
    if (_alertThresholds is EqualUnmodifiableListView) return _alertThresholds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alertThresholds);
  }

  @override
  @JsonKey()
  final bool isShared;
  final List<String> _sharedWith;
  @override
  @JsonKey()
  List<String> get sharedWith {
    if (_sharedWith is EqualUnmodifiableListView) return _sharedWith;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sharedWith);
  }

  @override
  @JsonKey()
  final bool isActive;
  @override
  final String? colorHex;
  @override
  final String? iconName;
  // Merchant-based budget support
  @override
  @JsonKey()
  final BudgetTargetType targetType;
  @override
  final String? merchantName;
  // For merchant-based budgets
  final List<String> _merchantPatterns;
  // For merchant-based budgets
  @override
  @JsonKey()
  List<String> get merchantPatterns {
    if (_merchantPatterns is EqualUnmodifiableListView)
      return _merchantPatterns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_merchantPatterns);
  }

  // Multiple merchant patterns to match
  // Template tracking
  @override
  final String? templateId;
  // If created from a template
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BudgetModel(id: $id, userId: $userId, name: $name, category: $category, amount: $amount, period: $period, startDate: $startDate, endDate: $endDate, rollover: $rollover, rolloverAmount: $rolloverAmount, spent: $spent, alertThresholds: $alertThresholds, isShared: $isShared, sharedWith: $sharedWith, isActive: $isActive, colorHex: $colorHex, iconName: $iconName, targetType: $targetType, merchantName: $merchantName, merchantPatterns: $merchantPatterns, templateId: $templateId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.rollover, rollover) ||
                other.rollover == rollover) &&
            (identical(other.rolloverAmount, rolloverAmount) ||
                other.rolloverAmount == rolloverAmount) &&
            (identical(other.spent, spent) || other.spent == spent) &&
            const DeepCollectionEquality().equals(
              other._alertThresholds,
              _alertThresholds,
            ) &&
            (identical(other.isShared, isShared) ||
                other.isShared == isShared) &&
            const DeepCollectionEquality().equals(
              other._sharedWith,
              _sharedWith,
            ) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.colorHex, colorHex) ||
                other.colorHex == colorHex) &&
            (identical(other.iconName, iconName) ||
                other.iconName == iconName) &&
            (identical(other.targetType, targetType) ||
                other.targetType == targetType) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            const DeepCollectionEquality().equals(
              other._merchantPatterns,
              _merchantPatterns,
            ) &&
            (identical(other.templateId, templateId) ||
                other.templateId == templateId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    userId,
    name,
    category,
    amount,
    period,
    startDate,
    endDate,
    rollover,
    rolloverAmount,
    spent,
    const DeepCollectionEquality().hash(_alertThresholds),
    isShared,
    const DeepCollectionEquality().hash(_sharedWith),
    isActive,
    colorHex,
    iconName,
    targetType,
    merchantName,
    const DeepCollectionEquality().hash(_merchantPatterns),
    templateId,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetModelImplCopyWith<_$BudgetModelImpl> get copyWith =>
      __$$BudgetModelImplCopyWithImpl<_$BudgetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetModelImplToJson(this);
  }
}

abstract class _BudgetModel implements BudgetModel {
  const factory _BudgetModel({
    required final String id,
    required final String userId,
    required final String name,
    required final CategoryType category,
    required final double amount,
    required final BudgetPeriod period,
    @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
    required final DateTime startDate,
    final DateTime? endDate,
    final bool rollover,
    final double rolloverAmount,
    final double spent,
    final List<double> alertThresholds,
    final bool isShared,
    final List<String> sharedWith,
    final bool isActive,
    final String? colorHex,
    final String? iconName,
    final BudgetTargetType targetType,
    final String? merchantName,
    final List<String> merchantPatterns,
    final String? templateId,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$BudgetModelImpl;

  factory _BudgetModel.fromJson(Map<String, dynamic> json) =
      _$BudgetModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get name;
  @override
  CategoryType get category;
  @override
  double get amount;
  @override
  BudgetPeriod get period;
  @override
  @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
  DateTime get startDate;
  @override
  DateTime? get endDate;
  @override
  bool get rollover;
  @override
  double get rolloverAmount; // Amount rolled over from previous period
  @override
  double get spent;
  @override
  List<double> get alertThresholds;
  @override
  bool get isShared;
  @override
  List<String> get sharedWith;
  @override
  bool get isActive;
  @override
  String? get colorHex;
  @override
  String? get iconName; // Merchant-based budget support
  @override
  BudgetTargetType get targetType;
  @override
  String? get merchantName; // For merchant-based budgets
  @override
  List<String> get merchantPatterns; // Multiple merchant patterns to match
  // Template tracking
  @override
  String? get templateId; // If created from a template
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of BudgetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetModelImplCopyWith<_$BudgetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
