// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) {
  return _TransactionModel.fromJson(json);
}

/// @nodoc
mixin _$TransactionModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get accountId => throw _privateConstructorUsedError;
  String? get plaidTransactionId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
  DateTime get date => throw _privateConstructorUsedError;
  String get merchantName => throw _privateConstructorUsedError;
  CategoryType get category => throw _privateConstructorUsedError;
  CategoryType? get subcategory => throw _privateConstructorUsedError;
  TransactionType get type => throw _privateConstructorUsedError;
  bool get isManual => throw _privateConstructorUsedError;
  TransactionLocation? get location => throw _privateConstructorUsedError;
  TransactionReceipt? get receipt => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  double? get carbonFootprint => throw _privateConstructorUsedError;
  EmotionalContext? get emotionalContext => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  String? get recurringGroupId => throw _privateConstructorUsedError;
  bool get isPending => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TransactionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionModelCopyWith<TransactionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionModelCopyWith<$Res> {
  factory $TransactionModelCopyWith(
    TransactionModel value,
    $Res Function(TransactionModel) then,
  ) = _$TransactionModelCopyWithImpl<$Res, TransactionModel>;
  @useResult
  $Res call({
    String id,
    String userId,
    String? accountId,
    String? plaidTransactionId,
    double amount,
    String currency,
    @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
    DateTime date,
    String merchantName,
    CategoryType category,
    CategoryType? subcategory,
    TransactionType type,
    bool isManual,
    TransactionLocation? location,
    TransactionReceipt? receipt,
    List<String> tags,
    String? notes,
    double? carbonFootprint,
    EmotionalContext? emotionalContext,
    bool isRecurring,
    String? recurringGroupId,
    bool isPending,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? updatedAt,
  });

  $TransactionLocationCopyWith<$Res>? get location;
  $TransactionReceiptCopyWith<$Res>? get receipt;
  $EmotionalContextCopyWith<$Res>? get emotionalContext;
}

/// @nodoc
class _$TransactionModelCopyWithImpl<$Res, $Val extends TransactionModel>
    implements $TransactionModelCopyWith<$Res> {
  _$TransactionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? accountId = freezed,
    Object? plaidTransactionId = freezed,
    Object? amount = null,
    Object? currency = null,
    Object? date = null,
    Object? merchantName = null,
    Object? category = null,
    Object? subcategory = freezed,
    Object? type = null,
    Object? isManual = null,
    Object? location = freezed,
    Object? receipt = freezed,
    Object? tags = null,
    Object? notes = freezed,
    Object? carbonFootprint = freezed,
    Object? emotionalContext = freezed,
    Object? isRecurring = null,
    Object? recurringGroupId = freezed,
    Object? isPending = null,
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
            accountId: freezed == accountId
                ? _value.accountId
                : accountId // ignore: cast_nullable_to_non_nullable
                      as String?,
            plaidTransactionId: freezed == plaidTransactionId
                ? _value.plaidTransactionId
                : plaidTransactionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            date: null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            merchantName: null == merchantName
                ? _value.merchantName
                : merchantName // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as CategoryType,
            subcategory: freezed == subcategory
                ? _value.subcategory
                : subcategory // ignore: cast_nullable_to_non_nullable
                      as CategoryType?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as TransactionType,
            isManual: null == isManual
                ? _value.isManual
                : isManual // ignore: cast_nullable_to_non_nullable
                      as bool,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as TransactionLocation?,
            receipt: freezed == receipt
                ? _value.receipt
                : receipt // ignore: cast_nullable_to_non_nullable
                      as TransactionReceipt?,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            carbonFootprint: freezed == carbonFootprint
                ? _value.carbonFootprint
                : carbonFootprint // ignore: cast_nullable_to_non_nullable
                      as double?,
            emotionalContext: freezed == emotionalContext
                ? _value.emotionalContext
                : emotionalContext // ignore: cast_nullable_to_non_nullable
                      as EmotionalContext?,
            isRecurring: null == isRecurring
                ? _value.isRecurring
                : isRecurring // ignore: cast_nullable_to_non_nullable
                      as bool,
            recurringGroupId: freezed == recurringGroupId
                ? _value.recurringGroupId
                : recurringGroupId // ignore: cast_nullable_to_non_nullable
                      as String?,
            isPending: null == isPending
                ? _value.isPending
                : isPending // ignore: cast_nullable_to_non_nullable
                      as bool,
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

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionLocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $TransactionLocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionReceiptCopyWith<$Res>? get receipt {
    if (_value.receipt == null) {
      return null;
    }

    return $TransactionReceiptCopyWith<$Res>(_value.receipt!, (value) {
      return _then(_value.copyWith(receipt: value) as $Val);
    });
  }

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EmotionalContextCopyWith<$Res>? get emotionalContext {
    if (_value.emotionalContext == null) {
      return null;
    }

    return $EmotionalContextCopyWith<$Res>(_value.emotionalContext!, (value) {
      return _then(_value.copyWith(emotionalContext: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionModelImplCopyWith<$Res>
    implements $TransactionModelCopyWith<$Res> {
  factory _$$TransactionModelImplCopyWith(
    _$TransactionModelImpl value,
    $Res Function(_$TransactionModelImpl) then,
  ) = __$$TransactionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    String? accountId,
    String? plaidTransactionId,
    double amount,
    String currency,
    @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
    DateTime date,
    String merchantName,
    CategoryType category,
    CategoryType? subcategory,
    TransactionType type,
    bool isManual,
    TransactionLocation? location,
    TransactionReceipt? receipt,
    List<String> tags,
    String? notes,
    double? carbonFootprint,
    EmotionalContext? emotionalContext,
    bool isRecurring,
    String? recurringGroupId,
    bool isPending,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? updatedAt,
  });

  @override
  $TransactionLocationCopyWith<$Res>? get location;
  @override
  $TransactionReceiptCopyWith<$Res>? get receipt;
  @override
  $EmotionalContextCopyWith<$Res>? get emotionalContext;
}

/// @nodoc
class __$$TransactionModelImplCopyWithImpl<$Res>
    extends _$TransactionModelCopyWithImpl<$Res, _$TransactionModelImpl>
    implements _$$TransactionModelImplCopyWith<$Res> {
  __$$TransactionModelImplCopyWithImpl(
    _$TransactionModelImpl _value,
    $Res Function(_$TransactionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? accountId = freezed,
    Object? plaidTransactionId = freezed,
    Object? amount = null,
    Object? currency = null,
    Object? date = null,
    Object? merchantName = null,
    Object? category = null,
    Object? subcategory = freezed,
    Object? type = null,
    Object? isManual = null,
    Object? location = freezed,
    Object? receipt = freezed,
    Object? tags = null,
    Object? notes = freezed,
    Object? carbonFootprint = freezed,
    Object? emotionalContext = freezed,
    Object? isRecurring = null,
    Object? recurringGroupId = freezed,
    Object? isPending = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$TransactionModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        accountId: freezed == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as String?,
        plaidTransactionId: freezed == plaidTransactionId
            ? _value.plaidTransactionId
            : plaidTransactionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        date: null == date
            ? _value.date
            : date // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        merchantName: null == merchantName
            ? _value.merchantName
            : merchantName // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as CategoryType,
        subcategory: freezed == subcategory
            ? _value.subcategory
            : subcategory // ignore: cast_nullable_to_non_nullable
                  as CategoryType?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as TransactionType,
        isManual: null == isManual
            ? _value.isManual
            : isManual // ignore: cast_nullable_to_non_nullable
                  as bool,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as TransactionLocation?,
        receipt: freezed == receipt
            ? _value.receipt
            : receipt // ignore: cast_nullable_to_non_nullable
                  as TransactionReceipt?,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        carbonFootprint: freezed == carbonFootprint
            ? _value.carbonFootprint
            : carbonFootprint // ignore: cast_nullable_to_non_nullable
                  as double?,
        emotionalContext: freezed == emotionalContext
            ? _value.emotionalContext
            : emotionalContext // ignore: cast_nullable_to_non_nullable
                  as EmotionalContext?,
        isRecurring: null == isRecurring
            ? _value.isRecurring
            : isRecurring // ignore: cast_nullable_to_non_nullable
                  as bool,
        recurringGroupId: freezed == recurringGroupId
            ? _value.recurringGroupId
            : recurringGroupId // ignore: cast_nullable_to_non_nullable
                  as String?,
        isPending: null == isPending
            ? _value.isPending
            : isPending // ignore: cast_nullable_to_non_nullable
                  as bool,
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
class _$TransactionModelImpl implements _TransactionModel {
  const _$TransactionModelImpl({
    required this.id,
    required this.userId,
    this.accountId,
    this.plaidTransactionId,
    required this.amount,
    this.currency = 'USD',
    @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
    required this.date,
    required this.merchantName,
    required this.category,
    this.subcategory,
    required this.type,
    this.isManual = false,
    this.location,
    this.receipt,
    final List<String> tags = const [],
    this.notes,
    this.carbonFootprint,
    this.emotionalContext,
    this.isRecurring = false,
    this.recurringGroupId,
    this.isPending = false,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.updatedAt,
  }) : _tags = tags;

  factory _$TransactionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? accountId;
  @override
  final String? plaidTransactionId;
  @override
  final double amount;
  @override
  @JsonKey()
  final String currency;
  @override
  @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
  final DateTime date;
  @override
  final String merchantName;
  @override
  final CategoryType category;
  @override
  final CategoryType? subcategory;
  @override
  final TransactionType type;
  @override
  @JsonKey()
  final bool isManual;
  @override
  final TransactionLocation? location;
  @override
  final TransactionReceipt? receipt;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? notes;
  @override
  final double? carbonFootprint;
  @override
  final EmotionalContext? emotionalContext;
  @override
  @JsonKey()
  final bool isRecurring;
  @override
  final String? recurringGroupId;
  @override
  @JsonKey()
  final bool isPending;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? createdAt;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TransactionModel(id: $id, userId: $userId, accountId: $accountId, plaidTransactionId: $plaidTransactionId, amount: $amount, currency: $currency, date: $date, merchantName: $merchantName, category: $category, subcategory: $subcategory, type: $type, isManual: $isManual, location: $location, receipt: $receipt, tags: $tags, notes: $notes, carbonFootprint: $carbonFootprint, emotionalContext: $emotionalContext, isRecurring: $isRecurring, recurringGroupId: $recurringGroupId, isPending: $isPending, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.plaidTransactionId, plaidTransactionId) ||
                other.plaidTransactionId == plaidTransactionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.merchantName, merchantName) ||
                other.merchantName == merchantName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.subcategory, subcategory) ||
                other.subcategory == subcategory) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isManual, isManual) ||
                other.isManual == isManual) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.receipt, receipt) || other.receipt == receipt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.carbonFootprint, carbonFootprint) ||
                other.carbonFootprint == carbonFootprint) &&
            (identical(other.emotionalContext, emotionalContext) ||
                other.emotionalContext == emotionalContext) &&
            (identical(other.isRecurring, isRecurring) ||
                other.isRecurring == isRecurring) &&
            (identical(other.recurringGroupId, recurringGroupId) ||
                other.recurringGroupId == recurringGroupId) &&
            (identical(other.isPending, isPending) ||
                other.isPending == isPending) &&
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
    accountId,
    plaidTransactionId,
    amount,
    currency,
    date,
    merchantName,
    category,
    subcategory,
    type,
    isManual,
    location,
    receipt,
    const DeepCollectionEquality().hash(_tags),
    notes,
    carbonFootprint,
    emotionalContext,
    isRecurring,
    recurringGroupId,
    isPending,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      __$$TransactionModelImplCopyWithImpl<_$TransactionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionModelImplToJson(this);
  }
}

abstract class _TransactionModel implements TransactionModel {
  const factory _TransactionModel({
    required final String id,
    required final String userId,
    final String? accountId,
    final String? plaidTransactionId,
    required final double amount,
    final String currency,
    @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
    required final DateTime date,
    required final String merchantName,
    required final CategoryType category,
    final CategoryType? subcategory,
    required final TransactionType type,
    final bool isManual,
    final TransactionLocation? location,
    final TransactionReceipt? receipt,
    final List<String> tags,
    final String? notes,
    final double? carbonFootprint,
    final EmotionalContext? emotionalContext,
    final bool isRecurring,
    final String? recurringGroupId,
    final bool isPending,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? updatedAt,
  }) = _$TransactionModelImpl;

  factory _TransactionModel.fromJson(Map<String, dynamic> json) =
      _$TransactionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String? get accountId;
  @override
  String? get plaidTransactionId;
  @override
  double get amount;
  @override
  String get currency;
  @override
  @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
  DateTime get date;
  @override
  String get merchantName;
  @override
  CategoryType get category;
  @override
  CategoryType? get subcategory;
  @override
  TransactionType get type;
  @override
  bool get isManual;
  @override
  TransactionLocation? get location;
  @override
  TransactionReceipt? get receipt;
  @override
  List<String> get tags;
  @override
  String? get notes;
  @override
  double? get carbonFootprint;
  @override
  EmotionalContext? get emotionalContext;
  @override
  bool get isRecurring;
  @override
  String? get recurringGroupId;
  @override
  bool get isPending;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get createdAt;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get updatedAt;

  /// Create a copy of TransactionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionModelImplCopyWith<_$TransactionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionLocation _$TransactionLocationFromJson(Map<String, dynamic> json) {
  return _TransactionLocation.fromJson(json);
}

/// @nodoc
mixin _$TransactionLocation {
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  /// Serializes this TransactionLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionLocationCopyWith<TransactionLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionLocationCopyWith<$Res> {
  factory $TransactionLocationCopyWith(
    TransactionLocation value,
    $Res Function(TransactionLocation) then,
  ) = _$TransactionLocationCopyWithImpl<$Res, TransactionLocation>;
  @useResult
  $Res call({
    double? lat,
    double? lng,
    String? address,
    String? city,
    String? country,
  });
}

/// @nodoc
class _$TransactionLocationCopyWithImpl<$Res, $Val extends TransactionLocation>
    implements $TransactionLocationCopyWith<$Res> {
  _$TransactionLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
  }) {
    return _then(
      _value.copyWith(
            lat: freezed == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double?,
            lng: freezed == lng
                ? _value.lng
                : lng // ignore: cast_nullable_to_non_nullable
                      as double?,
            address: freezed == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                      as String?,
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String?,
            country: freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TransactionLocationImplCopyWith<$Res>
    implements $TransactionLocationCopyWith<$Res> {
  factory _$$TransactionLocationImplCopyWith(
    _$TransactionLocationImpl value,
    $Res Function(_$TransactionLocationImpl) then,
  ) = __$$TransactionLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double? lat,
    double? lng,
    String? address,
    String? city,
    String? country,
  });
}

/// @nodoc
class __$$TransactionLocationImplCopyWithImpl<$Res>
    extends _$TransactionLocationCopyWithImpl<$Res, _$TransactionLocationImpl>
    implements _$$TransactionLocationImplCopyWith<$Res> {
  __$$TransactionLocationImplCopyWithImpl(
    _$TransactionLocationImpl _value,
    $Res Function(_$TransactionLocationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionLocation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? country = freezed,
  }) {
    return _then(
      _$TransactionLocationImpl(
        lat: freezed == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double?,
        lng: freezed == lng
            ? _value.lng
            : lng // ignore: cast_nullable_to_non_nullable
                  as double?,
        address: freezed == address
            ? _value.address
            : address // ignore: cast_nullable_to_non_nullable
                  as String?,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        country: freezed == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionLocationImpl implements _TransactionLocation {
  const _$TransactionLocationImpl({
    this.lat,
    this.lng,
    this.address,
    this.city,
    this.country,
  });

  factory _$TransactionLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionLocationImplFromJson(json);

  @override
  final double? lat;
  @override
  final double? lng;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? country;

  @override
  String toString() {
    return 'TransactionLocation(lat: $lat, lng: $lng, address: $address, city: $city, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionLocationImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lat, lng, address, city, country);

  /// Create a copy of TransactionLocation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionLocationImplCopyWith<_$TransactionLocationImpl> get copyWith =>
      __$$TransactionLocationImplCopyWithImpl<_$TransactionLocationImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionLocationImplToJson(this);
  }
}

abstract class _TransactionLocation implements TransactionLocation {
  const factory _TransactionLocation({
    final double? lat,
    final double? lng,
    final String? address,
    final String? city,
    final String? country,
  }) = _$TransactionLocationImpl;

  factory _TransactionLocation.fromJson(Map<String, dynamic> json) =
      _$TransactionLocationImpl.fromJson;

  @override
  double? get lat;
  @override
  double? get lng;
  @override
  String? get address;
  @override
  String? get city;
  @override
  String? get country;

  /// Create a copy of TransactionLocation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionLocationImplCopyWith<_$TransactionLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionReceipt _$TransactionReceiptFromJson(Map<String, dynamic> json) {
  return _TransactionReceipt.fromJson(json);
}

/// @nodoc
mixin _$TransactionReceipt {
  String? get imageUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get ocrData => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get uploadedAt => throw _privateConstructorUsedError;

  /// Serializes this TransactionReceipt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionReceipt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionReceiptCopyWith<TransactionReceipt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionReceiptCopyWith<$Res> {
  factory $TransactionReceiptCopyWith(
    TransactionReceipt value,
    $Res Function(TransactionReceipt) then,
  ) = _$TransactionReceiptCopyWithImpl<$Res, TransactionReceipt>;
  @useResult
  $Res call({
    String? imageUrl,
    Map<String, dynamic>? ocrData,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? uploadedAt,
  });
}

/// @nodoc
class _$TransactionReceiptCopyWithImpl<$Res, $Val extends TransactionReceipt>
    implements $TransactionReceiptCopyWith<$Res> {
  _$TransactionReceiptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionReceipt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? ocrData = freezed,
    Object? uploadedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            ocrData: freezed == ocrData
                ? _value.ocrData
                : ocrData // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>?,
            uploadedAt: freezed == uploadedAt
                ? _value.uploadedAt
                : uploadedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TransactionReceiptImplCopyWith<$Res>
    implements $TransactionReceiptCopyWith<$Res> {
  factory _$$TransactionReceiptImplCopyWith(
    _$TransactionReceiptImpl value,
    $Res Function(_$TransactionReceiptImpl) then,
  ) = __$$TransactionReceiptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? imageUrl,
    Map<String, dynamic>? ocrData,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? uploadedAt,
  });
}

/// @nodoc
class __$$TransactionReceiptImplCopyWithImpl<$Res>
    extends _$TransactionReceiptCopyWithImpl<$Res, _$TransactionReceiptImpl>
    implements _$$TransactionReceiptImplCopyWith<$Res> {
  __$$TransactionReceiptImplCopyWithImpl(
    _$TransactionReceiptImpl _value,
    $Res Function(_$TransactionReceiptImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TransactionReceipt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? ocrData = freezed,
    Object? uploadedAt = freezed,
  }) {
    return _then(
      _$TransactionReceiptImpl(
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        ocrData: freezed == ocrData
            ? _value._ocrData
            : ocrData // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>?,
        uploadedAt: freezed == uploadedAt
            ? _value.uploadedAt
            : uploadedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionReceiptImpl implements _TransactionReceipt {
  const _$TransactionReceiptImpl({
    this.imageUrl,
    final Map<String, dynamic>? ocrData,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    this.uploadedAt,
  }) : _ocrData = ocrData;

  factory _$TransactionReceiptImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionReceiptImplFromJson(json);

  @override
  final String? imageUrl;
  final Map<String, dynamic>? _ocrData;
  @override
  Map<String, dynamic>? get ocrData {
    final value = _ocrData;
    if (value == null) return null;
    if (_ocrData is EqualUnmodifiableMapView) return _ocrData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  final DateTime? uploadedAt;

  @override
  String toString() {
    return 'TransactionReceipt(imageUrl: $imageUrl, ocrData: $ocrData, uploadedAt: $uploadedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionReceiptImpl &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._ocrData, _ocrData) &&
            (identical(other.uploadedAt, uploadedAt) ||
                other.uploadedAt == uploadedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    imageUrl,
    const DeepCollectionEquality().hash(_ocrData),
    uploadedAt,
  );

  /// Create a copy of TransactionReceipt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionReceiptImplCopyWith<_$TransactionReceiptImpl> get copyWith =>
      __$$TransactionReceiptImplCopyWithImpl<_$TransactionReceiptImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionReceiptImplToJson(this);
  }
}

abstract class _TransactionReceipt implements TransactionReceipt {
  const factory _TransactionReceipt({
    final String? imageUrl,
    final Map<String, dynamic>? ocrData,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    final DateTime? uploadedAt,
  }) = _$TransactionReceiptImpl;

  factory _TransactionReceipt.fromJson(Map<String, dynamic> json) =
      _$TransactionReceiptImpl.fromJson;

  @override
  String? get imageUrl;
  @override
  Map<String, dynamic>? get ocrData;
  @override
  @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
  DateTime? get uploadedAt;

  /// Create a copy of TransactionReceipt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionReceiptImplCopyWith<_$TransactionReceiptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EmotionalContext _$EmotionalContextFromJson(Map<String, dynamic> json) {
  return _EmotionalContext.fromJson(json);
}

/// @nodoc
mixin _$EmotionalContext {
  MoodType? get mood => throw _privateConstructorUsedError;
  int get stressLevel => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this EmotionalContext to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmotionalContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmotionalContextCopyWith<EmotionalContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmotionalContextCopyWith<$Res> {
  factory $EmotionalContextCopyWith(
    EmotionalContext value,
    $Res Function(EmotionalContext) then,
  ) = _$EmotionalContextCopyWithImpl<$Res, EmotionalContext>;
  @useResult
  $Res call({MoodType? mood, int stressLevel, String? notes});
}

/// @nodoc
class _$EmotionalContextCopyWithImpl<$Res, $Val extends EmotionalContext>
    implements $EmotionalContextCopyWith<$Res> {
  _$EmotionalContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EmotionalContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = freezed,
    Object? stressLevel = null,
    Object? notes = freezed,
  }) {
    return _then(
      _value.copyWith(
            mood: freezed == mood
                ? _value.mood
                : mood // ignore: cast_nullable_to_non_nullable
                      as MoodType?,
            stressLevel: null == stressLevel
                ? _value.stressLevel
                : stressLevel // ignore: cast_nullable_to_non_nullable
                      as int,
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
abstract class _$$EmotionalContextImplCopyWith<$Res>
    implements $EmotionalContextCopyWith<$Res> {
  factory _$$EmotionalContextImplCopyWith(
    _$EmotionalContextImpl value,
    $Res Function(_$EmotionalContextImpl) then,
  ) = __$$EmotionalContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MoodType? mood, int stressLevel, String? notes});
}

/// @nodoc
class __$$EmotionalContextImplCopyWithImpl<$Res>
    extends _$EmotionalContextCopyWithImpl<$Res, _$EmotionalContextImpl>
    implements _$$EmotionalContextImplCopyWith<$Res> {
  __$$EmotionalContextImplCopyWithImpl(
    _$EmotionalContextImpl _value,
    $Res Function(_$EmotionalContextImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EmotionalContext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mood = freezed,
    Object? stressLevel = null,
    Object? notes = freezed,
  }) {
    return _then(
      _$EmotionalContextImpl(
        mood: freezed == mood
            ? _value.mood
            : mood // ignore: cast_nullable_to_non_nullable
                  as MoodType?,
        stressLevel: null == stressLevel
            ? _value.stressLevel
            : stressLevel // ignore: cast_nullable_to_non_nullable
                  as int,
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
class _$EmotionalContextImpl implements _EmotionalContext {
  const _$EmotionalContextImpl({this.mood, this.stressLevel = 0, this.notes});

  factory _$EmotionalContextImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmotionalContextImplFromJson(json);

  @override
  final MoodType? mood;
  @override
  @JsonKey()
  final int stressLevel;
  @override
  final String? notes;

  @override
  String toString() {
    return 'EmotionalContext(mood: $mood, stressLevel: $stressLevel, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmotionalContextImpl &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.stressLevel, stressLevel) ||
                other.stressLevel == stressLevel) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mood, stressLevel, notes);

  /// Create a copy of EmotionalContext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmotionalContextImplCopyWith<_$EmotionalContextImpl> get copyWith =>
      __$$EmotionalContextImplCopyWithImpl<_$EmotionalContextImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$EmotionalContextImplToJson(this);
  }
}

abstract class _EmotionalContext implements EmotionalContext {
  const factory _EmotionalContext({
    final MoodType? mood,
    final int stressLevel,
    final String? notes,
  }) = _$EmotionalContextImpl;

  factory _EmotionalContext.fromJson(Map<String, dynamic> json) =
      _$EmotionalContextImpl.fromJson;

  @override
  MoodType? get mood;
  @override
  int get stressLevel;
  @override
  String? get notes;

  /// Create a copy of EmotionalContext
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmotionalContextImplCopyWith<_$EmotionalContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
