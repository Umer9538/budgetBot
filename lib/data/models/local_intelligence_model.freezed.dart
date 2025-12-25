// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_intelligence_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LocalIntelligence _$LocalIntelligenceFromJson(Map<String, dynamic> json) {
  return _LocalIntelligence.fromJson(json);
}

/// @nodoc
mixin _$LocalIntelligence {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  LocalProfile get localProfile => throw _privateConstructorUsedError;
  List<PriceComparison> get priceComparisons =>
      throw _privateConstructorUsedError;
  NeighborhoodBenchmark get benchmark => throw _privateConstructorUsedError;
  List<LocalDeal> get deals => throw _privateConstructorUsedError;
  List<CommunitySavingsGroup> get savingsGroups =>
      throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this LocalIntelligence to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalIntelligence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalIntelligenceCopyWith<LocalIntelligence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalIntelligenceCopyWith<$Res> {
  factory $LocalIntelligenceCopyWith(
    LocalIntelligence value,
    $Res Function(LocalIntelligence) then,
  ) = _$LocalIntelligenceCopyWithImpl<$Res, LocalIntelligence>;
  @useResult
  $Res call({
    String id,
    String userId,
    LocalProfile localProfile,
    List<PriceComparison> priceComparisons,
    NeighborhoodBenchmark benchmark,
    List<LocalDeal> deals,
    List<CommunitySavingsGroup> savingsGroups,
    DateTime lastUpdated,
  });

  $LocalProfileCopyWith<$Res> get localProfile;
  $NeighborhoodBenchmarkCopyWith<$Res> get benchmark;
}

/// @nodoc
class _$LocalIntelligenceCopyWithImpl<$Res, $Val extends LocalIntelligence>
    implements $LocalIntelligenceCopyWith<$Res> {
  _$LocalIntelligenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalIntelligence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? localProfile = null,
    Object? priceComparisons = null,
    Object? benchmark = null,
    Object? deals = null,
    Object? savingsGroups = null,
    Object? lastUpdated = null,
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
            localProfile: null == localProfile
                ? _value.localProfile
                : localProfile // ignore: cast_nullable_to_non_nullable
                      as LocalProfile,
            priceComparisons: null == priceComparisons
                ? _value.priceComparisons
                : priceComparisons // ignore: cast_nullable_to_non_nullable
                      as List<PriceComparison>,
            benchmark: null == benchmark
                ? _value.benchmark
                : benchmark // ignore: cast_nullable_to_non_nullable
                      as NeighborhoodBenchmark,
            deals: null == deals
                ? _value.deals
                : deals // ignore: cast_nullable_to_non_nullable
                      as List<LocalDeal>,
            savingsGroups: null == savingsGroups
                ? _value.savingsGroups
                : savingsGroups // ignore: cast_nullable_to_non_nullable
                      as List<CommunitySavingsGroup>,
            lastUpdated: null == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }

  /// Create a copy of LocalIntelligence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalProfileCopyWith<$Res> get localProfile {
    return $LocalProfileCopyWith<$Res>(_value.localProfile, (value) {
      return _then(_value.copyWith(localProfile: value) as $Val);
    });
  }

  /// Create a copy of LocalIntelligence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NeighborhoodBenchmarkCopyWith<$Res> get benchmark {
    return $NeighborhoodBenchmarkCopyWith<$Res>(_value.benchmark, (value) {
      return _then(_value.copyWith(benchmark: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocalIntelligenceImplCopyWith<$Res>
    implements $LocalIntelligenceCopyWith<$Res> {
  factory _$$LocalIntelligenceImplCopyWith(
    _$LocalIntelligenceImpl value,
    $Res Function(_$LocalIntelligenceImpl) then,
  ) = __$$LocalIntelligenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String userId,
    LocalProfile localProfile,
    List<PriceComparison> priceComparisons,
    NeighborhoodBenchmark benchmark,
    List<LocalDeal> deals,
    List<CommunitySavingsGroup> savingsGroups,
    DateTime lastUpdated,
  });

  @override
  $LocalProfileCopyWith<$Res> get localProfile;
  @override
  $NeighborhoodBenchmarkCopyWith<$Res> get benchmark;
}

/// @nodoc
class __$$LocalIntelligenceImplCopyWithImpl<$Res>
    extends _$LocalIntelligenceCopyWithImpl<$Res, _$LocalIntelligenceImpl>
    implements _$$LocalIntelligenceImplCopyWith<$Res> {
  __$$LocalIntelligenceImplCopyWithImpl(
    _$LocalIntelligenceImpl _value,
    $Res Function(_$LocalIntelligenceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalIntelligence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? localProfile = null,
    Object? priceComparisons = null,
    Object? benchmark = null,
    Object? deals = null,
    Object? savingsGroups = null,
    Object? lastUpdated = null,
  }) {
    return _then(
      _$LocalIntelligenceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        localProfile: null == localProfile
            ? _value.localProfile
            : localProfile // ignore: cast_nullable_to_non_nullable
                  as LocalProfile,
        priceComparisons: null == priceComparisons
            ? _value._priceComparisons
            : priceComparisons // ignore: cast_nullable_to_non_nullable
                  as List<PriceComparison>,
        benchmark: null == benchmark
            ? _value.benchmark
            : benchmark // ignore: cast_nullable_to_non_nullable
                  as NeighborhoodBenchmark,
        deals: null == deals
            ? _value._deals
            : deals // ignore: cast_nullable_to_non_nullable
                  as List<LocalDeal>,
        savingsGroups: null == savingsGroups
            ? _value._savingsGroups
            : savingsGroups // ignore: cast_nullable_to_non_nullable
                  as List<CommunitySavingsGroup>,
        lastUpdated: null == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalIntelligenceImpl implements _LocalIntelligence {
  const _$LocalIntelligenceImpl({
    required this.id,
    required this.userId,
    required this.localProfile,
    required final List<PriceComparison> priceComparisons,
    required this.benchmark,
    required final List<LocalDeal> deals,
    required final List<CommunitySavingsGroup> savingsGroups,
    required this.lastUpdated,
  }) : _priceComparisons = priceComparisons,
       _deals = deals,
       _savingsGroups = savingsGroups;

  factory _$LocalIntelligenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalIntelligenceImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final LocalProfile localProfile;
  final List<PriceComparison> _priceComparisons;
  @override
  List<PriceComparison> get priceComparisons {
    if (_priceComparisons is EqualUnmodifiableListView)
      return _priceComparisons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceComparisons);
  }

  @override
  final NeighborhoodBenchmark benchmark;
  final List<LocalDeal> _deals;
  @override
  List<LocalDeal> get deals {
    if (_deals is EqualUnmodifiableListView) return _deals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deals);
  }

  final List<CommunitySavingsGroup> _savingsGroups;
  @override
  List<CommunitySavingsGroup> get savingsGroups {
    if (_savingsGroups is EqualUnmodifiableListView) return _savingsGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savingsGroups);
  }

  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'LocalIntelligence(id: $id, userId: $userId, localProfile: $localProfile, priceComparisons: $priceComparisons, benchmark: $benchmark, deals: $deals, savingsGroups: $savingsGroups, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalIntelligenceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.localProfile, localProfile) ||
                other.localProfile == localProfile) &&
            const DeepCollectionEquality().equals(
              other._priceComparisons,
              _priceComparisons,
            ) &&
            (identical(other.benchmark, benchmark) ||
                other.benchmark == benchmark) &&
            const DeepCollectionEquality().equals(other._deals, _deals) &&
            const DeepCollectionEquality().equals(
              other._savingsGroups,
              _savingsGroups,
            ) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    userId,
    localProfile,
    const DeepCollectionEquality().hash(_priceComparisons),
    benchmark,
    const DeepCollectionEquality().hash(_deals),
    const DeepCollectionEquality().hash(_savingsGroups),
    lastUpdated,
  );

  /// Create a copy of LocalIntelligence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalIntelligenceImplCopyWith<_$LocalIntelligenceImpl> get copyWith =>
      __$$LocalIntelligenceImplCopyWithImpl<_$LocalIntelligenceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalIntelligenceImplToJson(this);
  }
}

abstract class _LocalIntelligence implements LocalIntelligence {
  const factory _LocalIntelligence({
    required final String id,
    required final String userId,
    required final LocalProfile localProfile,
    required final List<PriceComparison> priceComparisons,
    required final NeighborhoodBenchmark benchmark,
    required final List<LocalDeal> deals,
    required final List<CommunitySavingsGroup> savingsGroups,
    required final DateTime lastUpdated,
  }) = _$LocalIntelligenceImpl;

  factory _LocalIntelligence.fromJson(Map<String, dynamic> json) =
      _$LocalIntelligenceImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  LocalProfile get localProfile;
  @override
  List<PriceComparison> get priceComparisons;
  @override
  NeighborhoodBenchmark get benchmark;
  @override
  List<LocalDeal> get deals;
  @override
  List<CommunitySavingsGroup> get savingsGroups;
  @override
  DateTime get lastUpdated;

  /// Create a copy of LocalIntelligence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalIntelligenceImplCopyWith<_$LocalIntelligenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalProfile _$LocalProfileFromJson(Map<String, dynamic> json) {
  return _LocalProfile.fromJson(json);
}

/// @nodoc
mixin _$LocalProfile {
  String get zipCode => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get neighborhood => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  double get searchRadiusMiles => throw _privateConstructorUsedError;
  List<String> get preferredStores => throw _privateConstructorUsedError;
  List<CategoryType> get trackedCategories =>
      throw _privateConstructorUsedError;
  bool get shareAnonymousData => throw _privateConstructorUsedError;

  /// Serializes this LocalProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalProfileCopyWith<LocalProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalProfileCopyWith<$Res> {
  factory $LocalProfileCopyWith(
    LocalProfile value,
    $Res Function(LocalProfile) then,
  ) = _$LocalProfileCopyWithImpl<$Res, LocalProfile>;
  @useResult
  $Res call({
    String zipCode,
    String city,
    String state,
    String neighborhood,
    double latitude,
    double longitude,
    double searchRadiusMiles,
    List<String> preferredStores,
    List<CategoryType> trackedCategories,
    bool shareAnonymousData,
  });
}

/// @nodoc
class _$LocalProfileCopyWithImpl<$Res, $Val extends LocalProfile>
    implements $LocalProfileCopyWith<$Res> {
  _$LocalProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipCode = null,
    Object? city = null,
    Object? state = null,
    Object? neighborhood = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? searchRadiusMiles = null,
    Object? preferredStores = null,
    Object? trackedCategories = null,
    Object? shareAnonymousData = null,
  }) {
    return _then(
      _value.copyWith(
            zipCode: null == zipCode
                ? _value.zipCode
                : zipCode // ignore: cast_nullable_to_non_nullable
                      as String,
            city: null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as String,
            neighborhood: null == neighborhood
                ? _value.neighborhood
                : neighborhood // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            searchRadiusMiles: null == searchRadiusMiles
                ? _value.searchRadiusMiles
                : searchRadiusMiles // ignore: cast_nullable_to_non_nullable
                      as double,
            preferredStores: null == preferredStores
                ? _value.preferredStores
                : preferredStores // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            trackedCategories: null == trackedCategories
                ? _value.trackedCategories
                : trackedCategories // ignore: cast_nullable_to_non_nullable
                      as List<CategoryType>,
            shareAnonymousData: null == shareAnonymousData
                ? _value.shareAnonymousData
                : shareAnonymousData // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocalProfileImplCopyWith<$Res>
    implements $LocalProfileCopyWith<$Res> {
  factory _$$LocalProfileImplCopyWith(
    _$LocalProfileImpl value,
    $Res Function(_$LocalProfileImpl) then,
  ) = __$$LocalProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String zipCode,
    String city,
    String state,
    String neighborhood,
    double latitude,
    double longitude,
    double searchRadiusMiles,
    List<String> preferredStores,
    List<CategoryType> trackedCategories,
    bool shareAnonymousData,
  });
}

/// @nodoc
class __$$LocalProfileImplCopyWithImpl<$Res>
    extends _$LocalProfileCopyWithImpl<$Res, _$LocalProfileImpl>
    implements _$$LocalProfileImplCopyWith<$Res> {
  __$$LocalProfileImplCopyWithImpl(
    _$LocalProfileImpl _value,
    $Res Function(_$LocalProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipCode = null,
    Object? city = null,
    Object? state = null,
    Object? neighborhood = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? searchRadiusMiles = null,
    Object? preferredStores = null,
    Object? trackedCategories = null,
    Object? shareAnonymousData = null,
  }) {
    return _then(
      _$LocalProfileImpl(
        zipCode: null == zipCode
            ? _value.zipCode
            : zipCode // ignore: cast_nullable_to_non_nullable
                  as String,
        city: null == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as String,
        neighborhood: null == neighborhood
            ? _value.neighborhood
            : neighborhood // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        searchRadiusMiles: null == searchRadiusMiles
            ? _value.searchRadiusMiles
            : searchRadiusMiles // ignore: cast_nullable_to_non_nullable
                  as double,
        preferredStores: null == preferredStores
            ? _value._preferredStores
            : preferredStores // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        trackedCategories: null == trackedCategories
            ? _value._trackedCategories
            : trackedCategories // ignore: cast_nullable_to_non_nullable
                  as List<CategoryType>,
        shareAnonymousData: null == shareAnonymousData
            ? _value.shareAnonymousData
            : shareAnonymousData // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalProfileImpl implements _LocalProfile {
  const _$LocalProfileImpl({
    required this.zipCode,
    required this.city,
    required this.state,
    required this.neighborhood,
    required this.latitude,
    required this.longitude,
    required this.searchRadiusMiles,
    required final List<String> preferredStores,
    required final List<CategoryType> trackedCategories,
    required this.shareAnonymousData,
  }) : _preferredStores = preferredStores,
       _trackedCategories = trackedCategories;

  factory _$LocalProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalProfileImplFromJson(json);

  @override
  final String zipCode;
  @override
  final String city;
  @override
  final String state;
  @override
  final String neighborhood;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final double searchRadiusMiles;
  final List<String> _preferredStores;
  @override
  List<String> get preferredStores {
    if (_preferredStores is EqualUnmodifiableListView) return _preferredStores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preferredStores);
  }

  final List<CategoryType> _trackedCategories;
  @override
  List<CategoryType> get trackedCategories {
    if (_trackedCategories is EqualUnmodifiableListView)
      return _trackedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trackedCategories);
  }

  @override
  final bool shareAnonymousData;

  @override
  String toString() {
    return 'LocalProfile(zipCode: $zipCode, city: $city, state: $state, neighborhood: $neighborhood, latitude: $latitude, longitude: $longitude, searchRadiusMiles: $searchRadiusMiles, preferredStores: $preferredStores, trackedCategories: $trackedCategories, shareAnonymousData: $shareAnonymousData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalProfileImpl &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.searchRadiusMiles, searchRadiusMiles) ||
                other.searchRadiusMiles == searchRadiusMiles) &&
            const DeepCollectionEquality().equals(
              other._preferredStores,
              _preferredStores,
            ) &&
            const DeepCollectionEquality().equals(
              other._trackedCategories,
              _trackedCategories,
            ) &&
            (identical(other.shareAnonymousData, shareAnonymousData) ||
                other.shareAnonymousData == shareAnonymousData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    zipCode,
    city,
    state,
    neighborhood,
    latitude,
    longitude,
    searchRadiusMiles,
    const DeepCollectionEquality().hash(_preferredStores),
    const DeepCollectionEquality().hash(_trackedCategories),
    shareAnonymousData,
  );

  /// Create a copy of LocalProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalProfileImplCopyWith<_$LocalProfileImpl> get copyWith =>
      __$$LocalProfileImplCopyWithImpl<_$LocalProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalProfileImplToJson(this);
  }
}

abstract class _LocalProfile implements LocalProfile {
  const factory _LocalProfile({
    required final String zipCode,
    required final String city,
    required final String state,
    required final String neighborhood,
    required final double latitude,
    required final double longitude,
    required final double searchRadiusMiles,
    required final List<String> preferredStores,
    required final List<CategoryType> trackedCategories,
    required final bool shareAnonymousData,
  }) = _$LocalProfileImpl;

  factory _LocalProfile.fromJson(Map<String, dynamic> json) =
      _$LocalProfileImpl.fromJson;

  @override
  String get zipCode;
  @override
  String get city;
  @override
  String get state;
  @override
  String get neighborhood;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  double get searchRadiusMiles;
  @override
  List<String> get preferredStores;
  @override
  List<CategoryType> get trackedCategories;
  @override
  bool get shareAnonymousData;

  /// Create a copy of LocalProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalProfileImplCopyWith<_$LocalProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceComparison _$PriceComparisonFromJson(Map<String, dynamic> json) {
  return _PriceComparison.fromJson(json);
}

/// @nodoc
mixin _$PriceComparison {
  String get id => throw _privateConstructorUsedError;
  String get itemName => throw _privateConstructorUsedError;
  CategoryType get category => throw _privateConstructorUsedError;
  List<LocalPrice> get prices => throw _privateConstructorUsedError;
  double get bestPrice => throw _privateConstructorUsedError;
  String get bestPriceLocation => throw _privateConstructorUsedError;
  double get averagePrice => throw _privateConstructorUsedError;
  double get userPaidPrice => throw _privateConstructorUsedError;
  double get potentialSavings => throw _privateConstructorUsedError;
  DateTime get comparedAt => throw _privateConstructorUsedError;

  /// Serializes this PriceComparison to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PriceComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PriceComparisonCopyWith<PriceComparison> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceComparisonCopyWith<$Res> {
  factory $PriceComparisonCopyWith(
    PriceComparison value,
    $Res Function(PriceComparison) then,
  ) = _$PriceComparisonCopyWithImpl<$Res, PriceComparison>;
  @useResult
  $Res call({
    String id,
    String itemName,
    CategoryType category,
    List<LocalPrice> prices,
    double bestPrice,
    String bestPriceLocation,
    double averagePrice,
    double userPaidPrice,
    double potentialSavings,
    DateTime comparedAt,
  });
}

/// @nodoc
class _$PriceComparisonCopyWithImpl<$Res, $Val extends PriceComparison>
    implements $PriceComparisonCopyWith<$Res> {
  _$PriceComparisonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemName = null,
    Object? category = null,
    Object? prices = null,
    Object? bestPrice = null,
    Object? bestPriceLocation = null,
    Object? averagePrice = null,
    Object? userPaidPrice = null,
    Object? potentialSavings = null,
    Object? comparedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            itemName: null == itemName
                ? _value.itemName
                : itemName // ignore: cast_nullable_to_non_nullable
                      as String,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as CategoryType,
            prices: null == prices
                ? _value.prices
                : prices // ignore: cast_nullable_to_non_nullable
                      as List<LocalPrice>,
            bestPrice: null == bestPrice
                ? _value.bestPrice
                : bestPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            bestPriceLocation: null == bestPriceLocation
                ? _value.bestPriceLocation
                : bestPriceLocation // ignore: cast_nullable_to_non_nullable
                      as String,
            averagePrice: null == averagePrice
                ? _value.averagePrice
                : averagePrice // ignore: cast_nullable_to_non_nullable
                      as double,
            userPaidPrice: null == userPaidPrice
                ? _value.userPaidPrice
                : userPaidPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            potentialSavings: null == potentialSavings
                ? _value.potentialSavings
                : potentialSavings // ignore: cast_nullable_to_non_nullable
                      as double,
            comparedAt: null == comparedAt
                ? _value.comparedAt
                : comparedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PriceComparisonImplCopyWith<$Res>
    implements $PriceComparisonCopyWith<$Res> {
  factory _$$PriceComparisonImplCopyWith(
    _$PriceComparisonImpl value,
    $Res Function(_$PriceComparisonImpl) then,
  ) = __$$PriceComparisonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String itemName,
    CategoryType category,
    List<LocalPrice> prices,
    double bestPrice,
    String bestPriceLocation,
    double averagePrice,
    double userPaidPrice,
    double potentialSavings,
    DateTime comparedAt,
  });
}

/// @nodoc
class __$$PriceComparisonImplCopyWithImpl<$Res>
    extends _$PriceComparisonCopyWithImpl<$Res, _$PriceComparisonImpl>
    implements _$$PriceComparisonImplCopyWith<$Res> {
  __$$PriceComparisonImplCopyWithImpl(
    _$PriceComparisonImpl _value,
    $Res Function(_$PriceComparisonImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PriceComparison
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemName = null,
    Object? category = null,
    Object? prices = null,
    Object? bestPrice = null,
    Object? bestPriceLocation = null,
    Object? averagePrice = null,
    Object? userPaidPrice = null,
    Object? potentialSavings = null,
    Object? comparedAt = null,
  }) {
    return _then(
      _$PriceComparisonImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        itemName: null == itemName
            ? _value.itemName
            : itemName // ignore: cast_nullable_to_non_nullable
                  as String,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as CategoryType,
        prices: null == prices
            ? _value._prices
            : prices // ignore: cast_nullable_to_non_nullable
                  as List<LocalPrice>,
        bestPrice: null == bestPrice
            ? _value.bestPrice
            : bestPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        bestPriceLocation: null == bestPriceLocation
            ? _value.bestPriceLocation
            : bestPriceLocation // ignore: cast_nullable_to_non_nullable
                  as String,
        averagePrice: null == averagePrice
            ? _value.averagePrice
            : averagePrice // ignore: cast_nullable_to_non_nullable
                  as double,
        userPaidPrice: null == userPaidPrice
            ? _value.userPaidPrice
            : userPaidPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        potentialSavings: null == potentialSavings
            ? _value.potentialSavings
            : potentialSavings // ignore: cast_nullable_to_non_nullable
                  as double,
        comparedAt: null == comparedAt
            ? _value.comparedAt
            : comparedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceComparisonImpl implements _PriceComparison {
  const _$PriceComparisonImpl({
    required this.id,
    required this.itemName,
    required this.category,
    required final List<LocalPrice> prices,
    required this.bestPrice,
    required this.bestPriceLocation,
    required this.averagePrice,
    required this.userPaidPrice,
    required this.potentialSavings,
    required this.comparedAt,
  }) : _prices = prices;

  factory _$PriceComparisonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceComparisonImplFromJson(json);

  @override
  final String id;
  @override
  final String itemName;
  @override
  final CategoryType category;
  final List<LocalPrice> _prices;
  @override
  List<LocalPrice> get prices {
    if (_prices is EqualUnmodifiableListView) return _prices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prices);
  }

  @override
  final double bestPrice;
  @override
  final String bestPriceLocation;
  @override
  final double averagePrice;
  @override
  final double userPaidPrice;
  @override
  final double potentialSavings;
  @override
  final DateTime comparedAt;

  @override
  String toString() {
    return 'PriceComparison(id: $id, itemName: $itemName, category: $category, prices: $prices, bestPrice: $bestPrice, bestPriceLocation: $bestPriceLocation, averagePrice: $averagePrice, userPaidPrice: $userPaidPrice, potentialSavings: $potentialSavings, comparedAt: $comparedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceComparisonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._prices, _prices) &&
            (identical(other.bestPrice, bestPrice) ||
                other.bestPrice == bestPrice) &&
            (identical(other.bestPriceLocation, bestPriceLocation) ||
                other.bestPriceLocation == bestPriceLocation) &&
            (identical(other.averagePrice, averagePrice) ||
                other.averagePrice == averagePrice) &&
            (identical(other.userPaidPrice, userPaidPrice) ||
                other.userPaidPrice == userPaidPrice) &&
            (identical(other.potentialSavings, potentialSavings) ||
                other.potentialSavings == potentialSavings) &&
            (identical(other.comparedAt, comparedAt) ||
                other.comparedAt == comparedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    itemName,
    category,
    const DeepCollectionEquality().hash(_prices),
    bestPrice,
    bestPriceLocation,
    averagePrice,
    userPaidPrice,
    potentialSavings,
    comparedAt,
  );

  /// Create a copy of PriceComparison
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceComparisonImplCopyWith<_$PriceComparisonImpl> get copyWith =>
      __$$PriceComparisonImplCopyWithImpl<_$PriceComparisonImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceComparisonImplToJson(this);
  }
}

abstract class _PriceComparison implements PriceComparison {
  const factory _PriceComparison({
    required final String id,
    required final String itemName,
    required final CategoryType category,
    required final List<LocalPrice> prices,
    required final double bestPrice,
    required final String bestPriceLocation,
    required final double averagePrice,
    required final double userPaidPrice,
    required final double potentialSavings,
    required final DateTime comparedAt,
  }) = _$PriceComparisonImpl;

  factory _PriceComparison.fromJson(Map<String, dynamic> json) =
      _$PriceComparisonImpl.fromJson;

  @override
  String get id;
  @override
  String get itemName;
  @override
  CategoryType get category;
  @override
  List<LocalPrice> get prices;
  @override
  double get bestPrice;
  @override
  String get bestPriceLocation;
  @override
  double get averagePrice;
  @override
  double get userPaidPrice;
  @override
  double get potentialSavings;
  @override
  DateTime get comparedAt;

  /// Create a copy of PriceComparison
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceComparisonImplCopyWith<_$PriceComparisonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalPrice _$LocalPriceFromJson(Map<String, dynamic> json) {
  return _LocalPrice.fromJson(json);
}

/// @nodoc
mixin _$LocalPrice {
  String get storeName => throw _privateConstructorUsedError;
  String get storeAddress => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get distanceMiles => throw _privateConstructorUsedError;
  DateTime get lastVerified => throw _privateConstructorUsedError;
  PriceConfidence get confidence => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  bool? get inStock => throw _privateConstructorUsedError;

  /// Serializes this LocalPrice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalPriceCopyWith<LocalPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalPriceCopyWith<$Res> {
  factory $LocalPriceCopyWith(
    LocalPrice value,
    $Res Function(LocalPrice) then,
  ) = _$LocalPriceCopyWithImpl<$Res, LocalPrice>;
  @useResult
  $Res call({
    String storeName,
    String storeAddress,
    double price,
    double distanceMiles,
    DateTime lastVerified,
    PriceConfidence confidence,
    String? notes,
    bool? inStock,
  });
}

/// @nodoc
class _$LocalPriceCopyWithImpl<$Res, $Val extends LocalPrice>
    implements $LocalPriceCopyWith<$Res> {
  _$LocalPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeName = null,
    Object? storeAddress = null,
    Object? price = null,
    Object? distanceMiles = null,
    Object? lastVerified = null,
    Object? confidence = null,
    Object? notes = freezed,
    Object? inStock = freezed,
  }) {
    return _then(
      _value.copyWith(
            storeName: null == storeName
                ? _value.storeName
                : storeName // ignore: cast_nullable_to_non_nullable
                      as String,
            storeAddress: null == storeAddress
                ? _value.storeAddress
                : storeAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as double,
            distanceMiles: null == distanceMiles
                ? _value.distanceMiles
                : distanceMiles // ignore: cast_nullable_to_non_nullable
                      as double,
            lastVerified: null == lastVerified
                ? _value.lastVerified
                : lastVerified // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            confidence: null == confidence
                ? _value.confidence
                : confidence // ignore: cast_nullable_to_non_nullable
                      as PriceConfidence,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            inStock: freezed == inStock
                ? _value.inStock
                : inStock // ignore: cast_nullable_to_non_nullable
                      as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocalPriceImplCopyWith<$Res>
    implements $LocalPriceCopyWith<$Res> {
  factory _$$LocalPriceImplCopyWith(
    _$LocalPriceImpl value,
    $Res Function(_$LocalPriceImpl) then,
  ) = __$$LocalPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String storeName,
    String storeAddress,
    double price,
    double distanceMiles,
    DateTime lastVerified,
    PriceConfidence confidence,
    String? notes,
    bool? inStock,
  });
}

/// @nodoc
class __$$LocalPriceImplCopyWithImpl<$Res>
    extends _$LocalPriceCopyWithImpl<$Res, _$LocalPriceImpl>
    implements _$$LocalPriceImplCopyWith<$Res> {
  __$$LocalPriceImplCopyWithImpl(
    _$LocalPriceImpl _value,
    $Res Function(_$LocalPriceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeName = null,
    Object? storeAddress = null,
    Object? price = null,
    Object? distanceMiles = null,
    Object? lastVerified = null,
    Object? confidence = null,
    Object? notes = freezed,
    Object? inStock = freezed,
  }) {
    return _then(
      _$LocalPriceImpl(
        storeName: null == storeName
            ? _value.storeName
            : storeName // ignore: cast_nullable_to_non_nullable
                  as String,
        storeAddress: null == storeAddress
            ? _value.storeAddress
            : storeAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as double,
        distanceMiles: null == distanceMiles
            ? _value.distanceMiles
            : distanceMiles // ignore: cast_nullable_to_non_nullable
                  as double,
        lastVerified: null == lastVerified
            ? _value.lastVerified
            : lastVerified // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        confidence: null == confidence
            ? _value.confidence
            : confidence // ignore: cast_nullable_to_non_nullable
                  as PriceConfidence,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        inStock: freezed == inStock
            ? _value.inStock
            : inStock // ignore: cast_nullable_to_non_nullable
                  as bool?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalPriceImpl implements _LocalPrice {
  const _$LocalPriceImpl({
    required this.storeName,
    required this.storeAddress,
    required this.price,
    required this.distanceMiles,
    required this.lastVerified,
    required this.confidence,
    this.notes,
    this.inStock,
  });

  factory _$LocalPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalPriceImplFromJson(json);

  @override
  final String storeName;
  @override
  final String storeAddress;
  @override
  final double price;
  @override
  final double distanceMiles;
  @override
  final DateTime lastVerified;
  @override
  final PriceConfidence confidence;
  @override
  final String? notes;
  @override
  final bool? inStock;

  @override
  String toString() {
    return 'LocalPrice(storeName: $storeName, storeAddress: $storeAddress, price: $price, distanceMiles: $distanceMiles, lastVerified: $lastVerified, confidence: $confidence, notes: $notes, inStock: $inStock)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalPriceImpl &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.storeAddress, storeAddress) ||
                other.storeAddress == storeAddress) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.distanceMiles, distanceMiles) ||
                other.distanceMiles == distanceMiles) &&
            (identical(other.lastVerified, lastVerified) ||
                other.lastVerified == lastVerified) &&
            (identical(other.confidence, confidence) ||
                other.confidence == confidence) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.inStock, inStock) || other.inStock == inStock));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    storeName,
    storeAddress,
    price,
    distanceMiles,
    lastVerified,
    confidence,
    notes,
    inStock,
  );

  /// Create a copy of LocalPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalPriceImplCopyWith<_$LocalPriceImpl> get copyWith =>
      __$$LocalPriceImplCopyWithImpl<_$LocalPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalPriceImplToJson(this);
  }
}

abstract class _LocalPrice implements LocalPrice {
  const factory _LocalPrice({
    required final String storeName,
    required final String storeAddress,
    required final double price,
    required final double distanceMiles,
    required final DateTime lastVerified,
    required final PriceConfidence confidence,
    final String? notes,
    final bool? inStock,
  }) = _$LocalPriceImpl;

  factory _LocalPrice.fromJson(Map<String, dynamic> json) =
      _$LocalPriceImpl.fromJson;

  @override
  String get storeName;
  @override
  String get storeAddress;
  @override
  double get price;
  @override
  double get distanceMiles;
  @override
  DateTime get lastVerified;
  @override
  PriceConfidence get confidence;
  @override
  String? get notes;
  @override
  bool? get inStock;

  /// Create a copy of LocalPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalPriceImplCopyWith<_$LocalPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NeighborhoodBenchmark _$NeighborhoodBenchmarkFromJson(
  Map<String, dynamic> json,
) {
  return _NeighborhoodBenchmark.fromJson(json);
}

/// @nodoc
mixin _$NeighborhoodBenchmark {
  String get neighborhoodName => throw _privateConstructorUsedError;
  int get householdsCompared => throw _privateConstructorUsedError;
  double get medianIncome => throw _privateConstructorUsedError;
  Map<String, CategoryBenchmark> get categoryBenchmarks =>
      throw _privateConstructorUsedError;
  double get userOverallRank =>
      throw _privateConstructorUsedError; // percentile 0-100
  List<BenchmarkInsight> get insights => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this NeighborhoodBenchmark to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NeighborhoodBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NeighborhoodBenchmarkCopyWith<NeighborhoodBenchmark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NeighborhoodBenchmarkCopyWith<$Res> {
  factory $NeighborhoodBenchmarkCopyWith(
    NeighborhoodBenchmark value,
    $Res Function(NeighborhoodBenchmark) then,
  ) = _$NeighborhoodBenchmarkCopyWithImpl<$Res, NeighborhoodBenchmark>;
  @useResult
  $Res call({
    String neighborhoodName,
    int householdsCompared,
    double medianIncome,
    Map<String, CategoryBenchmark> categoryBenchmarks,
    double userOverallRank,
    List<BenchmarkInsight> insights,
    DateTime lastUpdated,
  });
}

/// @nodoc
class _$NeighborhoodBenchmarkCopyWithImpl<
  $Res,
  $Val extends NeighborhoodBenchmark
>
    implements $NeighborhoodBenchmarkCopyWith<$Res> {
  _$NeighborhoodBenchmarkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NeighborhoodBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? neighborhoodName = null,
    Object? householdsCompared = null,
    Object? medianIncome = null,
    Object? categoryBenchmarks = null,
    Object? userOverallRank = null,
    Object? insights = null,
    Object? lastUpdated = null,
  }) {
    return _then(
      _value.copyWith(
            neighborhoodName: null == neighborhoodName
                ? _value.neighborhoodName
                : neighborhoodName // ignore: cast_nullable_to_non_nullable
                      as String,
            householdsCompared: null == householdsCompared
                ? _value.householdsCompared
                : householdsCompared // ignore: cast_nullable_to_non_nullable
                      as int,
            medianIncome: null == medianIncome
                ? _value.medianIncome
                : medianIncome // ignore: cast_nullable_to_non_nullable
                      as double,
            categoryBenchmarks: null == categoryBenchmarks
                ? _value.categoryBenchmarks
                : categoryBenchmarks // ignore: cast_nullable_to_non_nullable
                      as Map<String, CategoryBenchmark>,
            userOverallRank: null == userOverallRank
                ? _value.userOverallRank
                : userOverallRank // ignore: cast_nullable_to_non_nullable
                      as double,
            insights: null == insights
                ? _value.insights
                : insights // ignore: cast_nullable_to_non_nullable
                      as List<BenchmarkInsight>,
            lastUpdated: null == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NeighborhoodBenchmarkImplCopyWith<$Res>
    implements $NeighborhoodBenchmarkCopyWith<$Res> {
  factory _$$NeighborhoodBenchmarkImplCopyWith(
    _$NeighborhoodBenchmarkImpl value,
    $Res Function(_$NeighborhoodBenchmarkImpl) then,
  ) = __$$NeighborhoodBenchmarkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String neighborhoodName,
    int householdsCompared,
    double medianIncome,
    Map<String, CategoryBenchmark> categoryBenchmarks,
    double userOverallRank,
    List<BenchmarkInsight> insights,
    DateTime lastUpdated,
  });
}

/// @nodoc
class __$$NeighborhoodBenchmarkImplCopyWithImpl<$Res>
    extends
        _$NeighborhoodBenchmarkCopyWithImpl<$Res, _$NeighborhoodBenchmarkImpl>
    implements _$$NeighborhoodBenchmarkImplCopyWith<$Res> {
  __$$NeighborhoodBenchmarkImplCopyWithImpl(
    _$NeighborhoodBenchmarkImpl _value,
    $Res Function(_$NeighborhoodBenchmarkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NeighborhoodBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? neighborhoodName = null,
    Object? householdsCompared = null,
    Object? medianIncome = null,
    Object? categoryBenchmarks = null,
    Object? userOverallRank = null,
    Object? insights = null,
    Object? lastUpdated = null,
  }) {
    return _then(
      _$NeighborhoodBenchmarkImpl(
        neighborhoodName: null == neighborhoodName
            ? _value.neighborhoodName
            : neighborhoodName // ignore: cast_nullable_to_non_nullable
                  as String,
        householdsCompared: null == householdsCompared
            ? _value.householdsCompared
            : householdsCompared // ignore: cast_nullable_to_non_nullable
                  as int,
        medianIncome: null == medianIncome
            ? _value.medianIncome
            : medianIncome // ignore: cast_nullable_to_non_nullable
                  as double,
        categoryBenchmarks: null == categoryBenchmarks
            ? _value._categoryBenchmarks
            : categoryBenchmarks // ignore: cast_nullable_to_non_nullable
                  as Map<String, CategoryBenchmark>,
        userOverallRank: null == userOverallRank
            ? _value.userOverallRank
            : userOverallRank // ignore: cast_nullable_to_non_nullable
                  as double,
        insights: null == insights
            ? _value._insights
            : insights // ignore: cast_nullable_to_non_nullable
                  as List<BenchmarkInsight>,
        lastUpdated: null == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NeighborhoodBenchmarkImpl implements _NeighborhoodBenchmark {
  const _$NeighborhoodBenchmarkImpl({
    required this.neighborhoodName,
    required this.householdsCompared,
    required this.medianIncome,
    required final Map<String, CategoryBenchmark> categoryBenchmarks,
    required this.userOverallRank,
    required final List<BenchmarkInsight> insights,
    required this.lastUpdated,
  }) : _categoryBenchmarks = categoryBenchmarks,
       _insights = insights;

  factory _$NeighborhoodBenchmarkImpl.fromJson(Map<String, dynamic> json) =>
      _$$NeighborhoodBenchmarkImplFromJson(json);

  @override
  final String neighborhoodName;
  @override
  final int householdsCompared;
  @override
  final double medianIncome;
  final Map<String, CategoryBenchmark> _categoryBenchmarks;
  @override
  Map<String, CategoryBenchmark> get categoryBenchmarks {
    if (_categoryBenchmarks is EqualUnmodifiableMapView)
      return _categoryBenchmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryBenchmarks);
  }

  @override
  final double userOverallRank;
  // percentile 0-100
  final List<BenchmarkInsight> _insights;
  // percentile 0-100
  @override
  List<BenchmarkInsight> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'NeighborhoodBenchmark(neighborhoodName: $neighborhoodName, householdsCompared: $householdsCompared, medianIncome: $medianIncome, categoryBenchmarks: $categoryBenchmarks, userOverallRank: $userOverallRank, insights: $insights, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NeighborhoodBenchmarkImpl &&
            (identical(other.neighborhoodName, neighborhoodName) ||
                other.neighborhoodName == neighborhoodName) &&
            (identical(other.householdsCompared, householdsCompared) ||
                other.householdsCompared == householdsCompared) &&
            (identical(other.medianIncome, medianIncome) ||
                other.medianIncome == medianIncome) &&
            const DeepCollectionEquality().equals(
              other._categoryBenchmarks,
              _categoryBenchmarks,
            ) &&
            (identical(other.userOverallRank, userOverallRank) ||
                other.userOverallRank == userOverallRank) &&
            const DeepCollectionEquality().equals(other._insights, _insights) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    neighborhoodName,
    householdsCompared,
    medianIncome,
    const DeepCollectionEquality().hash(_categoryBenchmarks),
    userOverallRank,
    const DeepCollectionEquality().hash(_insights),
    lastUpdated,
  );

  /// Create a copy of NeighborhoodBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NeighborhoodBenchmarkImplCopyWith<_$NeighborhoodBenchmarkImpl>
  get copyWith =>
      __$$NeighborhoodBenchmarkImplCopyWithImpl<_$NeighborhoodBenchmarkImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$NeighborhoodBenchmarkImplToJson(this);
  }
}

abstract class _NeighborhoodBenchmark implements NeighborhoodBenchmark {
  const factory _NeighborhoodBenchmark({
    required final String neighborhoodName,
    required final int householdsCompared,
    required final double medianIncome,
    required final Map<String, CategoryBenchmark> categoryBenchmarks,
    required final double userOverallRank,
    required final List<BenchmarkInsight> insights,
    required final DateTime lastUpdated,
  }) = _$NeighborhoodBenchmarkImpl;

  factory _NeighborhoodBenchmark.fromJson(Map<String, dynamic> json) =
      _$NeighborhoodBenchmarkImpl.fromJson;

  @override
  String get neighborhoodName;
  @override
  int get householdsCompared;
  @override
  double get medianIncome;
  @override
  Map<String, CategoryBenchmark> get categoryBenchmarks;
  @override
  double get userOverallRank; // percentile 0-100
  @override
  List<BenchmarkInsight> get insights;
  @override
  DateTime get lastUpdated;

  /// Create a copy of NeighborhoodBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NeighborhoodBenchmarkImplCopyWith<_$NeighborhoodBenchmarkImpl>
  get copyWith => throw _privateConstructorUsedError;
}

CategoryBenchmark _$CategoryBenchmarkFromJson(Map<String, dynamic> json) {
  return _CategoryBenchmark.fromJson(json);
}

/// @nodoc
mixin _$CategoryBenchmark {
  String get categoryName => throw _privateConstructorUsedError;
  double get neighborhoodAverage => throw _privateConstructorUsedError;
  double get neighborhoodMedian => throw _privateConstructorUsedError;
  double get userSpending => throw _privateConstructorUsedError;
  double get percentile =>
      throw _privateConstructorUsedError; // where user falls 0-100
  SpendingComparison get comparison => throw _privateConstructorUsedError;
  double get potentialSavings => throw _privateConstructorUsedError;

  /// Serializes this CategoryBenchmark to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryBenchmarkCopyWith<CategoryBenchmark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryBenchmarkCopyWith<$Res> {
  factory $CategoryBenchmarkCopyWith(
    CategoryBenchmark value,
    $Res Function(CategoryBenchmark) then,
  ) = _$CategoryBenchmarkCopyWithImpl<$Res, CategoryBenchmark>;
  @useResult
  $Res call({
    String categoryName,
    double neighborhoodAverage,
    double neighborhoodMedian,
    double userSpending,
    double percentile,
    SpendingComparison comparison,
    double potentialSavings,
  });
}

/// @nodoc
class _$CategoryBenchmarkCopyWithImpl<$Res, $Val extends CategoryBenchmark>
    implements $CategoryBenchmarkCopyWith<$Res> {
  _$CategoryBenchmarkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? neighborhoodAverage = null,
    Object? neighborhoodMedian = null,
    Object? userSpending = null,
    Object? percentile = null,
    Object? comparison = null,
    Object? potentialSavings = null,
  }) {
    return _then(
      _value.copyWith(
            categoryName: null == categoryName
                ? _value.categoryName
                : categoryName // ignore: cast_nullable_to_non_nullable
                      as String,
            neighborhoodAverage: null == neighborhoodAverage
                ? _value.neighborhoodAverage
                : neighborhoodAverage // ignore: cast_nullable_to_non_nullable
                      as double,
            neighborhoodMedian: null == neighborhoodMedian
                ? _value.neighborhoodMedian
                : neighborhoodMedian // ignore: cast_nullable_to_non_nullable
                      as double,
            userSpending: null == userSpending
                ? _value.userSpending
                : userSpending // ignore: cast_nullable_to_non_nullable
                      as double,
            percentile: null == percentile
                ? _value.percentile
                : percentile // ignore: cast_nullable_to_non_nullable
                      as double,
            comparison: null == comparison
                ? _value.comparison
                : comparison // ignore: cast_nullable_to_non_nullable
                      as SpendingComparison,
            potentialSavings: null == potentialSavings
                ? _value.potentialSavings
                : potentialSavings // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryBenchmarkImplCopyWith<$Res>
    implements $CategoryBenchmarkCopyWith<$Res> {
  factory _$$CategoryBenchmarkImplCopyWith(
    _$CategoryBenchmarkImpl value,
    $Res Function(_$CategoryBenchmarkImpl) then,
  ) = __$$CategoryBenchmarkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String categoryName,
    double neighborhoodAverage,
    double neighborhoodMedian,
    double userSpending,
    double percentile,
    SpendingComparison comparison,
    double potentialSavings,
  });
}

/// @nodoc
class __$$CategoryBenchmarkImplCopyWithImpl<$Res>
    extends _$CategoryBenchmarkCopyWithImpl<$Res, _$CategoryBenchmarkImpl>
    implements _$$CategoryBenchmarkImplCopyWith<$Res> {
  __$$CategoryBenchmarkImplCopyWithImpl(
    _$CategoryBenchmarkImpl _value,
    $Res Function(_$CategoryBenchmarkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? neighborhoodAverage = null,
    Object? neighborhoodMedian = null,
    Object? userSpending = null,
    Object? percentile = null,
    Object? comparison = null,
    Object? potentialSavings = null,
  }) {
    return _then(
      _$CategoryBenchmarkImpl(
        categoryName: null == categoryName
            ? _value.categoryName
            : categoryName // ignore: cast_nullable_to_non_nullable
                  as String,
        neighborhoodAverage: null == neighborhoodAverage
            ? _value.neighborhoodAverage
            : neighborhoodAverage // ignore: cast_nullable_to_non_nullable
                  as double,
        neighborhoodMedian: null == neighborhoodMedian
            ? _value.neighborhoodMedian
            : neighborhoodMedian // ignore: cast_nullable_to_non_nullable
                  as double,
        userSpending: null == userSpending
            ? _value.userSpending
            : userSpending // ignore: cast_nullable_to_non_nullable
                  as double,
        percentile: null == percentile
            ? _value.percentile
            : percentile // ignore: cast_nullable_to_non_nullable
                  as double,
        comparison: null == comparison
            ? _value.comparison
            : comparison // ignore: cast_nullable_to_non_nullable
                  as SpendingComparison,
        potentialSavings: null == potentialSavings
            ? _value.potentialSavings
            : potentialSavings // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryBenchmarkImpl implements _CategoryBenchmark {
  const _$CategoryBenchmarkImpl({
    required this.categoryName,
    required this.neighborhoodAverage,
    required this.neighborhoodMedian,
    required this.userSpending,
    required this.percentile,
    required this.comparison,
    required this.potentialSavings,
  });

  factory _$CategoryBenchmarkImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryBenchmarkImplFromJson(json);

  @override
  final String categoryName;
  @override
  final double neighborhoodAverage;
  @override
  final double neighborhoodMedian;
  @override
  final double userSpending;
  @override
  final double percentile;
  // where user falls 0-100
  @override
  final SpendingComparison comparison;
  @override
  final double potentialSavings;

  @override
  String toString() {
    return 'CategoryBenchmark(categoryName: $categoryName, neighborhoodAverage: $neighborhoodAverage, neighborhoodMedian: $neighborhoodMedian, userSpending: $userSpending, percentile: $percentile, comparison: $comparison, potentialSavings: $potentialSavings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryBenchmarkImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.neighborhoodAverage, neighborhoodAverage) ||
                other.neighborhoodAverage == neighborhoodAverage) &&
            (identical(other.neighborhoodMedian, neighborhoodMedian) ||
                other.neighborhoodMedian == neighborhoodMedian) &&
            (identical(other.userSpending, userSpending) ||
                other.userSpending == userSpending) &&
            (identical(other.percentile, percentile) ||
                other.percentile == percentile) &&
            (identical(other.comparison, comparison) ||
                other.comparison == comparison) &&
            (identical(other.potentialSavings, potentialSavings) ||
                other.potentialSavings == potentialSavings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    categoryName,
    neighborhoodAverage,
    neighborhoodMedian,
    userSpending,
    percentile,
    comparison,
    potentialSavings,
  );

  /// Create a copy of CategoryBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryBenchmarkImplCopyWith<_$CategoryBenchmarkImpl> get copyWith =>
      __$$CategoryBenchmarkImplCopyWithImpl<_$CategoryBenchmarkImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryBenchmarkImplToJson(this);
  }
}

abstract class _CategoryBenchmark implements CategoryBenchmark {
  const factory _CategoryBenchmark({
    required final String categoryName,
    required final double neighborhoodAverage,
    required final double neighborhoodMedian,
    required final double userSpending,
    required final double percentile,
    required final SpendingComparison comparison,
    required final double potentialSavings,
  }) = _$CategoryBenchmarkImpl;

  factory _CategoryBenchmark.fromJson(Map<String, dynamic> json) =
      _$CategoryBenchmarkImpl.fromJson;

  @override
  String get categoryName;
  @override
  double get neighborhoodAverage;
  @override
  double get neighborhoodMedian;
  @override
  double get userSpending;
  @override
  double get percentile; // where user falls 0-100
  @override
  SpendingComparison get comparison;
  @override
  double get potentialSavings;

  /// Create a copy of CategoryBenchmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryBenchmarkImplCopyWith<_$CategoryBenchmarkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BenchmarkInsight _$BenchmarkInsightFromJson(Map<String, dynamic> json) {
  return _BenchmarkInsight.fromJson(json);
}

/// @nodoc
mixin _$BenchmarkInsight {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  LocalInsightType get type => throw _privateConstructorUsedError;
  double get potentialImpact => throw _privateConstructorUsedError;
  String get actionItem => throw _privateConstructorUsedError;

  /// Serializes this BenchmarkInsight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BenchmarkInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BenchmarkInsightCopyWith<BenchmarkInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BenchmarkInsightCopyWith<$Res> {
  factory $BenchmarkInsightCopyWith(
    BenchmarkInsight value,
    $Res Function(BenchmarkInsight) then,
  ) = _$BenchmarkInsightCopyWithImpl<$Res, BenchmarkInsight>;
  @useResult
  $Res call({
    String title,
    String description,
    LocalInsightType type,
    double potentialImpact,
    String actionItem,
  });
}

/// @nodoc
class _$BenchmarkInsightCopyWithImpl<$Res, $Val extends BenchmarkInsight>
    implements $BenchmarkInsightCopyWith<$Res> {
  _$BenchmarkInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BenchmarkInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? potentialImpact = null,
    Object? actionItem = null,
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
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as LocalInsightType,
            potentialImpact: null == potentialImpact
                ? _value.potentialImpact
                : potentialImpact // ignore: cast_nullable_to_non_nullable
                      as double,
            actionItem: null == actionItem
                ? _value.actionItem
                : actionItem // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BenchmarkInsightImplCopyWith<$Res>
    implements $BenchmarkInsightCopyWith<$Res> {
  factory _$$BenchmarkInsightImplCopyWith(
    _$BenchmarkInsightImpl value,
    $Res Function(_$BenchmarkInsightImpl) then,
  ) = __$$BenchmarkInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String description,
    LocalInsightType type,
    double potentialImpact,
    String actionItem,
  });
}

/// @nodoc
class __$$BenchmarkInsightImplCopyWithImpl<$Res>
    extends _$BenchmarkInsightCopyWithImpl<$Res, _$BenchmarkInsightImpl>
    implements _$$BenchmarkInsightImplCopyWith<$Res> {
  __$$BenchmarkInsightImplCopyWithImpl(
    _$BenchmarkInsightImpl _value,
    $Res Function(_$BenchmarkInsightImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BenchmarkInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? type = null,
    Object? potentialImpact = null,
    Object? actionItem = null,
  }) {
    return _then(
      _$BenchmarkInsightImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as LocalInsightType,
        potentialImpact: null == potentialImpact
            ? _value.potentialImpact
            : potentialImpact // ignore: cast_nullable_to_non_nullable
                  as double,
        actionItem: null == actionItem
            ? _value.actionItem
            : actionItem // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BenchmarkInsightImpl implements _BenchmarkInsight {
  const _$BenchmarkInsightImpl({
    required this.title,
    required this.description,
    required this.type,
    required this.potentialImpact,
    required this.actionItem,
  });

  factory _$BenchmarkInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$BenchmarkInsightImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final LocalInsightType type;
  @override
  final double potentialImpact;
  @override
  final String actionItem;

  @override
  String toString() {
    return 'BenchmarkInsight(title: $title, description: $description, type: $type, potentialImpact: $potentialImpact, actionItem: $actionItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BenchmarkInsightImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.potentialImpact, potentialImpact) ||
                other.potentialImpact == potentialImpact) &&
            (identical(other.actionItem, actionItem) ||
                other.actionItem == actionItem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    description,
    type,
    potentialImpact,
    actionItem,
  );

  /// Create a copy of BenchmarkInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BenchmarkInsightImplCopyWith<_$BenchmarkInsightImpl> get copyWith =>
      __$$BenchmarkInsightImplCopyWithImpl<_$BenchmarkInsightImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BenchmarkInsightImplToJson(this);
  }
}

abstract class _BenchmarkInsight implements BenchmarkInsight {
  const factory _BenchmarkInsight({
    required final String title,
    required final String description,
    required final LocalInsightType type,
    required final double potentialImpact,
    required final String actionItem,
  }) = _$BenchmarkInsightImpl;

  factory _BenchmarkInsight.fromJson(Map<String, dynamic> json) =
      _$BenchmarkInsightImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  LocalInsightType get type;
  @override
  double get potentialImpact;
  @override
  String get actionItem;

  /// Create a copy of BenchmarkInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BenchmarkInsightImplCopyWith<_$BenchmarkInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocalDeal _$LocalDealFromJson(Map<String, dynamic> json) {
  return _LocalDeal.fromJson(json);
}

/// @nodoc
mixin _$LocalDeal {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String get storeAddress => throw _privateConstructorUsedError;
  double get distanceMiles => throw _privateConstructorUsedError;
  double get originalPrice => throw _privateConstructorUsedError;
  double get dealPrice => throw _privateConstructorUsedError;
  double get savingsPercent => throw _privateConstructorUsedError;
  CategoryType get category => throw _privateConstructorUsedError;
  DateTime get validFrom => throw _privateConstructorUsedError;
  DateTime get validUntil => throw _privateConstructorUsedError;
  DealSource get source => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;
  int? get claimedCount =>
      throw _privateConstructorUsedError; // how many users claimed
  double? get rating => throw _privateConstructorUsedError;

  /// Serializes this LocalDeal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalDeal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalDealCopyWith<LocalDeal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalDealCopyWith<$Res> {
  factory $LocalDealCopyWith(LocalDeal value, $Res Function(LocalDeal) then) =
      _$LocalDealCopyWithImpl<$Res, LocalDeal>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String storeName,
    String storeAddress,
    double distanceMiles,
    double originalPrice,
    double dealPrice,
    double savingsPercent,
    CategoryType category,
    DateTime validFrom,
    DateTime validUntil,
    DealSource source,
    bool isVerified,
    int? claimedCount,
    double? rating,
  });
}

/// @nodoc
class _$LocalDealCopyWithImpl<$Res, $Val extends LocalDeal>
    implements $LocalDealCopyWith<$Res> {
  _$LocalDealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalDeal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? storeName = null,
    Object? storeAddress = null,
    Object? distanceMiles = null,
    Object? originalPrice = null,
    Object? dealPrice = null,
    Object? savingsPercent = null,
    Object? category = null,
    Object? validFrom = null,
    Object? validUntil = null,
    Object? source = null,
    Object? isVerified = null,
    Object? claimedCount = freezed,
    Object? rating = freezed,
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
            storeName: null == storeName
                ? _value.storeName
                : storeName // ignore: cast_nullable_to_non_nullable
                      as String,
            storeAddress: null == storeAddress
                ? _value.storeAddress
                : storeAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            distanceMiles: null == distanceMiles
                ? _value.distanceMiles
                : distanceMiles // ignore: cast_nullable_to_non_nullable
                      as double,
            originalPrice: null == originalPrice
                ? _value.originalPrice
                : originalPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            dealPrice: null == dealPrice
                ? _value.dealPrice
                : dealPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            savingsPercent: null == savingsPercent
                ? _value.savingsPercent
                : savingsPercent // ignore: cast_nullable_to_non_nullable
                      as double,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as CategoryType,
            validFrom: null == validFrom
                ? _value.validFrom
                : validFrom // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            validUntil: null == validUntil
                ? _value.validUntil
                : validUntil // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as DealSource,
            isVerified: null == isVerified
                ? _value.isVerified
                : isVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            claimedCount: freezed == claimedCount
                ? _value.claimedCount
                : claimedCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            rating: freezed == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocalDealImplCopyWith<$Res>
    implements $LocalDealCopyWith<$Res> {
  factory _$$LocalDealImplCopyWith(
    _$LocalDealImpl value,
    $Res Function(_$LocalDealImpl) then,
  ) = __$$LocalDealImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String storeName,
    String storeAddress,
    double distanceMiles,
    double originalPrice,
    double dealPrice,
    double savingsPercent,
    CategoryType category,
    DateTime validFrom,
    DateTime validUntil,
    DealSource source,
    bool isVerified,
    int? claimedCount,
    double? rating,
  });
}

/// @nodoc
class __$$LocalDealImplCopyWithImpl<$Res>
    extends _$LocalDealCopyWithImpl<$Res, _$LocalDealImpl>
    implements _$$LocalDealImplCopyWith<$Res> {
  __$$LocalDealImplCopyWithImpl(
    _$LocalDealImpl _value,
    $Res Function(_$LocalDealImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalDeal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? storeName = null,
    Object? storeAddress = null,
    Object? distanceMiles = null,
    Object? originalPrice = null,
    Object? dealPrice = null,
    Object? savingsPercent = null,
    Object? category = null,
    Object? validFrom = null,
    Object? validUntil = null,
    Object? source = null,
    Object? isVerified = null,
    Object? claimedCount = freezed,
    Object? rating = freezed,
  }) {
    return _then(
      _$LocalDealImpl(
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
        storeName: null == storeName
            ? _value.storeName
            : storeName // ignore: cast_nullable_to_non_nullable
                  as String,
        storeAddress: null == storeAddress
            ? _value.storeAddress
            : storeAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        distanceMiles: null == distanceMiles
            ? _value.distanceMiles
            : distanceMiles // ignore: cast_nullable_to_non_nullable
                  as double,
        originalPrice: null == originalPrice
            ? _value.originalPrice
            : originalPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        dealPrice: null == dealPrice
            ? _value.dealPrice
            : dealPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        savingsPercent: null == savingsPercent
            ? _value.savingsPercent
            : savingsPercent // ignore: cast_nullable_to_non_nullable
                  as double,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as CategoryType,
        validFrom: null == validFrom
            ? _value.validFrom
            : validFrom // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        validUntil: null == validUntil
            ? _value.validUntil
            : validUntil // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as DealSource,
        isVerified: null == isVerified
            ? _value.isVerified
            : isVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        claimedCount: freezed == claimedCount
            ? _value.claimedCount
            : claimedCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        rating: freezed == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalDealImpl implements _LocalDeal {
  const _$LocalDealImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.storeName,
    required this.storeAddress,
    required this.distanceMiles,
    required this.originalPrice,
    required this.dealPrice,
    required this.savingsPercent,
    required this.category,
    required this.validFrom,
    required this.validUntil,
    required this.source,
    required this.isVerified,
    this.claimedCount,
    this.rating,
  });

  factory _$LocalDealImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalDealImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String storeName;
  @override
  final String storeAddress;
  @override
  final double distanceMiles;
  @override
  final double originalPrice;
  @override
  final double dealPrice;
  @override
  final double savingsPercent;
  @override
  final CategoryType category;
  @override
  final DateTime validFrom;
  @override
  final DateTime validUntil;
  @override
  final DealSource source;
  @override
  final bool isVerified;
  @override
  final int? claimedCount;
  // how many users claimed
  @override
  final double? rating;

  @override
  String toString() {
    return 'LocalDeal(id: $id, title: $title, description: $description, storeName: $storeName, storeAddress: $storeAddress, distanceMiles: $distanceMiles, originalPrice: $originalPrice, dealPrice: $dealPrice, savingsPercent: $savingsPercent, category: $category, validFrom: $validFrom, validUntil: $validUntil, source: $source, isVerified: $isVerified, claimedCount: $claimedCount, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalDealImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.storeAddress, storeAddress) ||
                other.storeAddress == storeAddress) &&
            (identical(other.distanceMiles, distanceMiles) ||
                other.distanceMiles == distanceMiles) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            (identical(other.dealPrice, dealPrice) ||
                other.dealPrice == dealPrice) &&
            (identical(other.savingsPercent, savingsPercent) ||
                other.savingsPercent == savingsPercent) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.validFrom, validFrom) ||
                other.validFrom == validFrom) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.claimedCount, claimedCount) ||
                other.claimedCount == claimedCount) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    storeName,
    storeAddress,
    distanceMiles,
    originalPrice,
    dealPrice,
    savingsPercent,
    category,
    validFrom,
    validUntil,
    source,
    isVerified,
    claimedCount,
    rating,
  );

  /// Create a copy of LocalDeal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalDealImplCopyWith<_$LocalDealImpl> get copyWith =>
      __$$LocalDealImplCopyWithImpl<_$LocalDealImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalDealImplToJson(this);
  }
}

abstract class _LocalDeal implements LocalDeal {
  const factory _LocalDeal({
    required final String id,
    required final String title,
    required final String description,
    required final String storeName,
    required final String storeAddress,
    required final double distanceMiles,
    required final double originalPrice,
    required final double dealPrice,
    required final double savingsPercent,
    required final CategoryType category,
    required final DateTime validFrom,
    required final DateTime validUntil,
    required final DealSource source,
    required final bool isVerified,
    final int? claimedCount,
    final double? rating,
  }) = _$LocalDealImpl;

  factory _LocalDeal.fromJson(Map<String, dynamic> json) =
      _$LocalDealImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get storeName;
  @override
  String get storeAddress;
  @override
  double get distanceMiles;
  @override
  double get originalPrice;
  @override
  double get dealPrice;
  @override
  double get savingsPercent;
  @override
  CategoryType get category;
  @override
  DateTime get validFrom;
  @override
  DateTime get validUntil;
  @override
  DealSource get source;
  @override
  bool get isVerified;
  @override
  int? get claimedCount; // how many users claimed
  @override
  double? get rating;

  /// Create a copy of LocalDeal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalDealImplCopyWith<_$LocalDealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommunitySavingsGroup _$CommunitySavingsGroupFromJson(
  Map<String, dynamic> json,
) {
  return _CommunitySavingsGroup.fromJson(json);
}

/// @nodoc
mixin _$CommunitySavingsGroup {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  GroupType get type => throw _privateConstructorUsedError;
  int get memberCount => throw _privateConstructorUsedError;
  double get totalSaved => throw _privateConstructorUsedError; // by all members
  String get neighborhood => throw _privateConstructorUsedError;
  List<String> get categories =>
      throw _privateConstructorUsedError; // focus categories
  bool get isPublic => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get meetingSchedule => throw _privateConstructorUsedError;
  String? get contactInfo => throw _privateConstructorUsedError;

  /// Serializes this CommunitySavingsGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunitySavingsGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunitySavingsGroupCopyWith<CommunitySavingsGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunitySavingsGroupCopyWith<$Res> {
  factory $CommunitySavingsGroupCopyWith(
    CommunitySavingsGroup value,
    $Res Function(CommunitySavingsGroup) then,
  ) = _$CommunitySavingsGroupCopyWithImpl<$Res, CommunitySavingsGroup>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    GroupType type,
    int memberCount,
    double totalSaved,
    String neighborhood,
    List<String> categories,
    bool isPublic,
    DateTime createdAt,
    String? meetingSchedule,
    String? contactInfo,
  });
}

/// @nodoc
class _$CommunitySavingsGroupCopyWithImpl<
  $Res,
  $Val extends CommunitySavingsGroup
>
    implements $CommunitySavingsGroupCopyWith<$Res> {
  _$CommunitySavingsGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunitySavingsGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? memberCount = null,
    Object? totalSaved = null,
    Object? neighborhood = null,
    Object? categories = null,
    Object? isPublic = null,
    Object? createdAt = null,
    Object? meetingSchedule = freezed,
    Object? contactInfo = freezed,
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
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as GroupType,
            memberCount: null == memberCount
                ? _value.memberCount
                : memberCount // ignore: cast_nullable_to_non_nullable
                      as int,
            totalSaved: null == totalSaved
                ? _value.totalSaved
                : totalSaved // ignore: cast_nullable_to_non_nullable
                      as double,
            neighborhood: null == neighborhood
                ? _value.neighborhood
                : neighborhood // ignore: cast_nullable_to_non_nullable
                      as String,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            isPublic: null == isPublic
                ? _value.isPublic
                : isPublic // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            meetingSchedule: freezed == meetingSchedule
                ? _value.meetingSchedule
                : meetingSchedule // ignore: cast_nullable_to_non_nullable
                      as String?,
            contactInfo: freezed == contactInfo
                ? _value.contactInfo
                : contactInfo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CommunitySavingsGroupImplCopyWith<$Res>
    implements $CommunitySavingsGroupCopyWith<$Res> {
  factory _$$CommunitySavingsGroupImplCopyWith(
    _$CommunitySavingsGroupImpl value,
    $Res Function(_$CommunitySavingsGroupImpl) then,
  ) = __$$CommunitySavingsGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    GroupType type,
    int memberCount,
    double totalSaved,
    String neighborhood,
    List<String> categories,
    bool isPublic,
    DateTime createdAt,
    String? meetingSchedule,
    String? contactInfo,
  });
}

/// @nodoc
class __$$CommunitySavingsGroupImplCopyWithImpl<$Res>
    extends
        _$CommunitySavingsGroupCopyWithImpl<$Res, _$CommunitySavingsGroupImpl>
    implements _$$CommunitySavingsGroupImplCopyWith<$Res> {
  __$$CommunitySavingsGroupImplCopyWithImpl(
    _$CommunitySavingsGroupImpl _value,
    $Res Function(_$CommunitySavingsGroupImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CommunitySavingsGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? memberCount = null,
    Object? totalSaved = null,
    Object? neighborhood = null,
    Object? categories = null,
    Object? isPublic = null,
    Object? createdAt = null,
    Object? meetingSchedule = freezed,
    Object? contactInfo = freezed,
  }) {
    return _then(
      _$CommunitySavingsGroupImpl(
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
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as GroupType,
        memberCount: null == memberCount
            ? _value.memberCount
            : memberCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalSaved: null == totalSaved
            ? _value.totalSaved
            : totalSaved // ignore: cast_nullable_to_non_nullable
                  as double,
        neighborhood: null == neighborhood
            ? _value.neighborhood
            : neighborhood // ignore: cast_nullable_to_non_nullable
                  as String,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        isPublic: null == isPublic
            ? _value.isPublic
            : isPublic // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        meetingSchedule: freezed == meetingSchedule
            ? _value.meetingSchedule
            : meetingSchedule // ignore: cast_nullable_to_non_nullable
                  as String?,
        contactInfo: freezed == contactInfo
            ? _value.contactInfo
            : contactInfo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunitySavingsGroupImpl implements _CommunitySavingsGroup {
  const _$CommunitySavingsGroupImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.memberCount,
    required this.totalSaved,
    required this.neighborhood,
    required final List<String> categories,
    required this.isPublic,
    required this.createdAt,
    this.meetingSchedule,
    this.contactInfo,
  }) : _categories = categories;

  factory _$CommunitySavingsGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunitySavingsGroupImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final GroupType type;
  @override
  final int memberCount;
  @override
  final double totalSaved;
  // by all members
  @override
  final String neighborhood;
  final List<String> _categories;
  @override
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  // focus categories
  @override
  final bool isPublic;
  @override
  final DateTime createdAt;
  @override
  final String? meetingSchedule;
  @override
  final String? contactInfo;

  @override
  String toString() {
    return 'CommunitySavingsGroup(id: $id, name: $name, description: $description, type: $type, memberCount: $memberCount, totalSaved: $totalSaved, neighborhood: $neighborhood, categories: $categories, isPublic: $isPublic, createdAt: $createdAt, meetingSchedule: $meetingSchedule, contactInfo: $contactInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunitySavingsGroupImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.totalSaved, totalSaved) ||
                other.totalSaved == totalSaved) &&
            (identical(other.neighborhood, neighborhood) ||
                other.neighborhood == neighborhood) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.meetingSchedule, meetingSchedule) ||
                other.meetingSchedule == meetingSchedule) &&
            (identical(other.contactInfo, contactInfo) ||
                other.contactInfo == contactInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    type,
    memberCount,
    totalSaved,
    neighborhood,
    const DeepCollectionEquality().hash(_categories),
    isPublic,
    createdAt,
    meetingSchedule,
    contactInfo,
  );

  /// Create a copy of CommunitySavingsGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunitySavingsGroupImplCopyWith<_$CommunitySavingsGroupImpl>
  get copyWith =>
      __$$CommunitySavingsGroupImplCopyWithImpl<_$CommunitySavingsGroupImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunitySavingsGroupImplToJson(this);
  }
}

abstract class _CommunitySavingsGroup implements CommunitySavingsGroup {
  const factory _CommunitySavingsGroup({
    required final String id,
    required final String name,
    required final String description,
    required final GroupType type,
    required final int memberCount,
    required final double totalSaved,
    required final String neighborhood,
    required final List<String> categories,
    required final bool isPublic,
    required final DateTime createdAt,
    final String? meetingSchedule,
    final String? contactInfo,
  }) = _$CommunitySavingsGroupImpl;

  factory _CommunitySavingsGroup.fromJson(Map<String, dynamic> json) =
      _$CommunitySavingsGroupImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  GroupType get type;
  @override
  int get memberCount;
  @override
  double get totalSaved; // by all members
  @override
  String get neighborhood;
  @override
  List<String> get categories; // focus categories
  @override
  bool get isPublic;
  @override
  DateTime get createdAt;
  @override
  String? get meetingSchedule;
  @override
  String? get contactInfo;

  /// Create a copy of CommunitySavingsGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunitySavingsGroupImplCopyWith<_$CommunitySavingsGroupImpl>
  get copyWith => throw _privateConstructorUsedError;
}

LocalEconomicStats _$LocalEconomicStatsFromJson(Map<String, dynamic> json) {
  return _LocalEconomicStats.fromJson(json);
}

/// @nodoc
mixin _$LocalEconomicStats {
  String get zipCode => throw _privateConstructorUsedError;
  double get averageGasPrice => throw _privateConstructorUsedError;
  double get averageRent => throw _privateConstructorUsedError;
  double get costOfLivingIndex =>
      throw _privateConstructorUsedError; // 100 = national average
  double get groceryIndex => throw _privateConstructorUsedError;
  double get utilitiesIndex => throw _privateConstructorUsedError;
  double get transportIndex => throw _privateConstructorUsedError;
  Map<String, double> get categoryAverages =>
      throw _privateConstructorUsedError;
  List<PriceTrend> get priceTrends => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this LocalEconomicStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalEconomicStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalEconomicStatsCopyWith<LocalEconomicStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalEconomicStatsCopyWith<$Res> {
  factory $LocalEconomicStatsCopyWith(
    LocalEconomicStats value,
    $Res Function(LocalEconomicStats) then,
  ) = _$LocalEconomicStatsCopyWithImpl<$Res, LocalEconomicStats>;
  @useResult
  $Res call({
    String zipCode,
    double averageGasPrice,
    double averageRent,
    double costOfLivingIndex,
    double groceryIndex,
    double utilitiesIndex,
    double transportIndex,
    Map<String, double> categoryAverages,
    List<PriceTrend> priceTrends,
    DateTime lastUpdated,
  });
}

/// @nodoc
class _$LocalEconomicStatsCopyWithImpl<$Res, $Val extends LocalEconomicStats>
    implements $LocalEconomicStatsCopyWith<$Res> {
  _$LocalEconomicStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalEconomicStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipCode = null,
    Object? averageGasPrice = null,
    Object? averageRent = null,
    Object? costOfLivingIndex = null,
    Object? groceryIndex = null,
    Object? utilitiesIndex = null,
    Object? transportIndex = null,
    Object? categoryAverages = null,
    Object? priceTrends = null,
    Object? lastUpdated = null,
  }) {
    return _then(
      _value.copyWith(
            zipCode: null == zipCode
                ? _value.zipCode
                : zipCode // ignore: cast_nullable_to_non_nullable
                      as String,
            averageGasPrice: null == averageGasPrice
                ? _value.averageGasPrice
                : averageGasPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            averageRent: null == averageRent
                ? _value.averageRent
                : averageRent // ignore: cast_nullable_to_non_nullable
                      as double,
            costOfLivingIndex: null == costOfLivingIndex
                ? _value.costOfLivingIndex
                : costOfLivingIndex // ignore: cast_nullable_to_non_nullable
                      as double,
            groceryIndex: null == groceryIndex
                ? _value.groceryIndex
                : groceryIndex // ignore: cast_nullable_to_non_nullable
                      as double,
            utilitiesIndex: null == utilitiesIndex
                ? _value.utilitiesIndex
                : utilitiesIndex // ignore: cast_nullable_to_non_nullable
                      as double,
            transportIndex: null == transportIndex
                ? _value.transportIndex
                : transportIndex // ignore: cast_nullable_to_non_nullable
                      as double,
            categoryAverages: null == categoryAverages
                ? _value.categoryAverages
                : categoryAverages // ignore: cast_nullable_to_non_nullable
                      as Map<String, double>,
            priceTrends: null == priceTrends
                ? _value.priceTrends
                : priceTrends // ignore: cast_nullable_to_non_nullable
                      as List<PriceTrend>,
            lastUpdated: null == lastUpdated
                ? _value.lastUpdated
                : lastUpdated // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LocalEconomicStatsImplCopyWith<$Res>
    implements $LocalEconomicStatsCopyWith<$Res> {
  factory _$$LocalEconomicStatsImplCopyWith(
    _$LocalEconomicStatsImpl value,
    $Res Function(_$LocalEconomicStatsImpl) then,
  ) = __$$LocalEconomicStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String zipCode,
    double averageGasPrice,
    double averageRent,
    double costOfLivingIndex,
    double groceryIndex,
    double utilitiesIndex,
    double transportIndex,
    Map<String, double> categoryAverages,
    List<PriceTrend> priceTrends,
    DateTime lastUpdated,
  });
}

/// @nodoc
class __$$LocalEconomicStatsImplCopyWithImpl<$Res>
    extends _$LocalEconomicStatsCopyWithImpl<$Res, _$LocalEconomicStatsImpl>
    implements _$$LocalEconomicStatsImplCopyWith<$Res> {
  __$$LocalEconomicStatsImplCopyWithImpl(
    _$LocalEconomicStatsImpl _value,
    $Res Function(_$LocalEconomicStatsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LocalEconomicStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? zipCode = null,
    Object? averageGasPrice = null,
    Object? averageRent = null,
    Object? costOfLivingIndex = null,
    Object? groceryIndex = null,
    Object? utilitiesIndex = null,
    Object? transportIndex = null,
    Object? categoryAverages = null,
    Object? priceTrends = null,
    Object? lastUpdated = null,
  }) {
    return _then(
      _$LocalEconomicStatsImpl(
        zipCode: null == zipCode
            ? _value.zipCode
            : zipCode // ignore: cast_nullable_to_non_nullable
                  as String,
        averageGasPrice: null == averageGasPrice
            ? _value.averageGasPrice
            : averageGasPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        averageRent: null == averageRent
            ? _value.averageRent
            : averageRent // ignore: cast_nullable_to_non_nullable
                  as double,
        costOfLivingIndex: null == costOfLivingIndex
            ? _value.costOfLivingIndex
            : costOfLivingIndex // ignore: cast_nullable_to_non_nullable
                  as double,
        groceryIndex: null == groceryIndex
            ? _value.groceryIndex
            : groceryIndex // ignore: cast_nullable_to_non_nullable
                  as double,
        utilitiesIndex: null == utilitiesIndex
            ? _value.utilitiesIndex
            : utilitiesIndex // ignore: cast_nullable_to_non_nullable
                  as double,
        transportIndex: null == transportIndex
            ? _value.transportIndex
            : transportIndex // ignore: cast_nullable_to_non_nullable
                  as double,
        categoryAverages: null == categoryAverages
            ? _value._categoryAverages
            : categoryAverages // ignore: cast_nullable_to_non_nullable
                  as Map<String, double>,
        priceTrends: null == priceTrends
            ? _value._priceTrends
            : priceTrends // ignore: cast_nullable_to_non_nullable
                  as List<PriceTrend>,
        lastUpdated: null == lastUpdated
            ? _value.lastUpdated
            : lastUpdated // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalEconomicStatsImpl implements _LocalEconomicStats {
  const _$LocalEconomicStatsImpl({
    required this.zipCode,
    required this.averageGasPrice,
    required this.averageRent,
    required this.costOfLivingIndex,
    required this.groceryIndex,
    required this.utilitiesIndex,
    required this.transportIndex,
    required final Map<String, double> categoryAverages,
    required final List<PriceTrend> priceTrends,
    required this.lastUpdated,
  }) : _categoryAverages = categoryAverages,
       _priceTrends = priceTrends;

  factory _$LocalEconomicStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalEconomicStatsImplFromJson(json);

  @override
  final String zipCode;
  @override
  final double averageGasPrice;
  @override
  final double averageRent;
  @override
  final double costOfLivingIndex;
  // 100 = national average
  @override
  final double groceryIndex;
  @override
  final double utilitiesIndex;
  @override
  final double transportIndex;
  final Map<String, double> _categoryAverages;
  @override
  Map<String, double> get categoryAverages {
    if (_categoryAverages is EqualUnmodifiableMapView) return _categoryAverages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryAverages);
  }

  final List<PriceTrend> _priceTrends;
  @override
  List<PriceTrend> get priceTrends {
    if (_priceTrends is EqualUnmodifiableListView) return _priceTrends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceTrends);
  }

  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'LocalEconomicStats(zipCode: $zipCode, averageGasPrice: $averageGasPrice, averageRent: $averageRent, costOfLivingIndex: $costOfLivingIndex, groceryIndex: $groceryIndex, utilitiesIndex: $utilitiesIndex, transportIndex: $transportIndex, categoryAverages: $categoryAverages, priceTrends: $priceTrends, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalEconomicStatsImpl &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.averageGasPrice, averageGasPrice) ||
                other.averageGasPrice == averageGasPrice) &&
            (identical(other.averageRent, averageRent) ||
                other.averageRent == averageRent) &&
            (identical(other.costOfLivingIndex, costOfLivingIndex) ||
                other.costOfLivingIndex == costOfLivingIndex) &&
            (identical(other.groceryIndex, groceryIndex) ||
                other.groceryIndex == groceryIndex) &&
            (identical(other.utilitiesIndex, utilitiesIndex) ||
                other.utilitiesIndex == utilitiesIndex) &&
            (identical(other.transportIndex, transportIndex) ||
                other.transportIndex == transportIndex) &&
            const DeepCollectionEquality().equals(
              other._categoryAverages,
              _categoryAverages,
            ) &&
            const DeepCollectionEquality().equals(
              other._priceTrends,
              _priceTrends,
            ) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    zipCode,
    averageGasPrice,
    averageRent,
    costOfLivingIndex,
    groceryIndex,
    utilitiesIndex,
    transportIndex,
    const DeepCollectionEquality().hash(_categoryAverages),
    const DeepCollectionEquality().hash(_priceTrends),
    lastUpdated,
  );

  /// Create a copy of LocalEconomicStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalEconomicStatsImplCopyWith<_$LocalEconomicStatsImpl> get copyWith =>
      __$$LocalEconomicStatsImplCopyWithImpl<_$LocalEconomicStatsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalEconomicStatsImplToJson(this);
  }
}

abstract class _LocalEconomicStats implements LocalEconomicStats {
  const factory _LocalEconomicStats({
    required final String zipCode,
    required final double averageGasPrice,
    required final double averageRent,
    required final double costOfLivingIndex,
    required final double groceryIndex,
    required final double utilitiesIndex,
    required final double transportIndex,
    required final Map<String, double> categoryAverages,
    required final List<PriceTrend> priceTrends,
    required final DateTime lastUpdated,
  }) = _$LocalEconomicStatsImpl;

  factory _LocalEconomicStats.fromJson(Map<String, dynamic> json) =
      _$LocalEconomicStatsImpl.fromJson;

  @override
  String get zipCode;
  @override
  double get averageGasPrice;
  @override
  double get averageRent;
  @override
  double get costOfLivingIndex; // 100 = national average
  @override
  double get groceryIndex;
  @override
  double get utilitiesIndex;
  @override
  double get transportIndex;
  @override
  Map<String, double> get categoryAverages;
  @override
  List<PriceTrend> get priceTrends;
  @override
  DateTime get lastUpdated;

  /// Create a copy of LocalEconomicStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalEconomicStatsImplCopyWith<_$LocalEconomicStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceTrend _$PriceTrendFromJson(Map<String, dynamic> json) {
  return _PriceTrend.fromJson(json);
}

/// @nodoc
mixin _$PriceTrend {
  String get itemName => throw _privateConstructorUsedError;
  double get currentPrice => throw _privateConstructorUsedError;
  double get changePercent => throw _privateConstructorUsedError;
  TrendDirection get direction => throw _privateConstructorUsedError;
  String get timeframe => throw _privateConstructorUsedError;
  String? get prediction => throw _privateConstructorUsedError;

  /// Serializes this PriceTrend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PriceTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PriceTrendCopyWith<PriceTrend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceTrendCopyWith<$Res> {
  factory $PriceTrendCopyWith(
    PriceTrend value,
    $Res Function(PriceTrend) then,
  ) = _$PriceTrendCopyWithImpl<$Res, PriceTrend>;
  @useResult
  $Res call({
    String itemName,
    double currentPrice,
    double changePercent,
    TrendDirection direction,
    String timeframe,
    String? prediction,
  });
}

/// @nodoc
class _$PriceTrendCopyWithImpl<$Res, $Val extends PriceTrend>
    implements $PriceTrendCopyWith<$Res> {
  _$PriceTrendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? currentPrice = null,
    Object? changePercent = null,
    Object? direction = null,
    Object? timeframe = null,
    Object? prediction = freezed,
  }) {
    return _then(
      _value.copyWith(
            itemName: null == itemName
                ? _value.itemName
                : itemName // ignore: cast_nullable_to_non_nullable
                      as String,
            currentPrice: null == currentPrice
                ? _value.currentPrice
                : currentPrice // ignore: cast_nullable_to_non_nullable
                      as double,
            changePercent: null == changePercent
                ? _value.changePercent
                : changePercent // ignore: cast_nullable_to_non_nullable
                      as double,
            direction: null == direction
                ? _value.direction
                : direction // ignore: cast_nullable_to_non_nullable
                      as TrendDirection,
            timeframe: null == timeframe
                ? _value.timeframe
                : timeframe // ignore: cast_nullable_to_non_nullable
                      as String,
            prediction: freezed == prediction
                ? _value.prediction
                : prediction // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PriceTrendImplCopyWith<$Res>
    implements $PriceTrendCopyWith<$Res> {
  factory _$$PriceTrendImplCopyWith(
    _$PriceTrendImpl value,
    $Res Function(_$PriceTrendImpl) then,
  ) = __$$PriceTrendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String itemName,
    double currentPrice,
    double changePercent,
    TrendDirection direction,
    String timeframe,
    String? prediction,
  });
}

/// @nodoc
class __$$PriceTrendImplCopyWithImpl<$Res>
    extends _$PriceTrendCopyWithImpl<$Res, _$PriceTrendImpl>
    implements _$$PriceTrendImplCopyWith<$Res> {
  __$$PriceTrendImplCopyWithImpl(
    _$PriceTrendImpl _value,
    $Res Function(_$PriceTrendImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PriceTrend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? currentPrice = null,
    Object? changePercent = null,
    Object? direction = null,
    Object? timeframe = null,
    Object? prediction = freezed,
  }) {
    return _then(
      _$PriceTrendImpl(
        itemName: null == itemName
            ? _value.itemName
            : itemName // ignore: cast_nullable_to_non_nullable
                  as String,
        currentPrice: null == currentPrice
            ? _value.currentPrice
            : currentPrice // ignore: cast_nullable_to_non_nullable
                  as double,
        changePercent: null == changePercent
            ? _value.changePercent
            : changePercent // ignore: cast_nullable_to_non_nullable
                  as double,
        direction: null == direction
            ? _value.direction
            : direction // ignore: cast_nullable_to_non_nullable
                  as TrendDirection,
        timeframe: null == timeframe
            ? _value.timeframe
            : timeframe // ignore: cast_nullable_to_non_nullable
                  as String,
        prediction: freezed == prediction
            ? _value.prediction
            : prediction // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceTrendImpl implements _PriceTrend {
  const _$PriceTrendImpl({
    required this.itemName,
    required this.currentPrice,
    required this.changePercent,
    required this.direction,
    required this.timeframe,
    this.prediction,
  });

  factory _$PriceTrendImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceTrendImplFromJson(json);

  @override
  final String itemName;
  @override
  final double currentPrice;
  @override
  final double changePercent;
  @override
  final TrendDirection direction;
  @override
  final String timeframe;
  @override
  final String? prediction;

  @override
  String toString() {
    return 'PriceTrend(itemName: $itemName, currentPrice: $currentPrice, changePercent: $changePercent, direction: $direction, timeframe: $timeframe, prediction: $prediction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceTrendImpl &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.changePercent, changePercent) ||
                other.changePercent == changePercent) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.timeframe, timeframe) ||
                other.timeframe == timeframe) &&
            (identical(other.prediction, prediction) ||
                other.prediction == prediction));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    itemName,
    currentPrice,
    changePercent,
    direction,
    timeframe,
    prediction,
  );

  /// Create a copy of PriceTrend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceTrendImplCopyWith<_$PriceTrendImpl> get copyWith =>
      __$$PriceTrendImplCopyWithImpl<_$PriceTrendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceTrendImplToJson(this);
  }
}

abstract class _PriceTrend implements PriceTrend {
  const factory _PriceTrend({
    required final String itemName,
    required final double currentPrice,
    required final double changePercent,
    required final TrendDirection direction,
    required final String timeframe,
    final String? prediction,
  }) = _$PriceTrendImpl;

  factory _PriceTrend.fromJson(Map<String, dynamic> json) =
      _$PriceTrendImpl.fromJson;

  @override
  String get itemName;
  @override
  double get currentPrice;
  @override
  double get changePercent;
  @override
  TrendDirection get direction;
  @override
  String get timeframe;
  @override
  String? get prediction;

  /// Create a copy of PriceTrend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceTrendImplCopyWith<_$PriceTrendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
