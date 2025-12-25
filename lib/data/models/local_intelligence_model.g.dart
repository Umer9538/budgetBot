// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_intelligence_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalIntelligenceImpl _$$LocalIntelligenceImplFromJson(
  Map<String, dynamic> json,
) => _$LocalIntelligenceImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  localProfile: LocalProfile.fromJson(
    json['localProfile'] as Map<String, dynamic>,
  ),
  priceComparisons: (json['priceComparisons'] as List<dynamic>)
      .map((e) => PriceComparison.fromJson(e as Map<String, dynamic>))
      .toList(),
  benchmark: NeighborhoodBenchmark.fromJson(
    json['benchmark'] as Map<String, dynamic>,
  ),
  deals: (json['deals'] as List<dynamic>)
      .map((e) => LocalDeal.fromJson(e as Map<String, dynamic>))
      .toList(),
  savingsGroups: (json['savingsGroups'] as List<dynamic>)
      .map((e) => CommunitySavingsGroup.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
);

Map<String, dynamic> _$$LocalIntelligenceImplToJson(
  _$LocalIntelligenceImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'localProfile': instance.localProfile,
  'priceComparisons': instance.priceComparisons,
  'benchmark': instance.benchmark,
  'deals': instance.deals,
  'savingsGroups': instance.savingsGroups,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
};

_$LocalProfileImpl _$$LocalProfileImplFromJson(Map<String, dynamic> json) =>
    _$LocalProfileImpl(
      zipCode: json['zipCode'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      neighborhood: json['neighborhood'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      searchRadiusMiles: (json['searchRadiusMiles'] as num).toDouble(),
      preferredStores: (json['preferredStores'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      trackedCategories: (json['trackedCategories'] as List<dynamic>)
          .map((e) => $enumDecode(_$CategoryTypeEnumMap, e))
          .toList(),
      shareAnonymousData: json['shareAnonymousData'] as bool,
    );

Map<String, dynamic> _$$LocalProfileImplToJson(_$LocalProfileImpl instance) =>
    <String, dynamic>{
      'zipCode': instance.zipCode,
      'city': instance.city,
      'state': instance.state,
      'neighborhood': instance.neighborhood,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'searchRadiusMiles': instance.searchRadiusMiles,
      'preferredStores': instance.preferredStores,
      'trackedCategories': instance.trackedCategories
          .map((e) => _$CategoryTypeEnumMap[e]!)
          .toList(),
      'shareAnonymousData': instance.shareAnonymousData,
    };

const _$CategoryTypeEnumMap = {
  CategoryType.salary: 'salary',
  CategoryType.freelance: 'freelance',
  CategoryType.investments: 'investments',
  CategoryType.otherIncome: 'otherIncome',
  CategoryType.rentMortgage: 'rentMortgage',
  CategoryType.utilities: 'utilities',
  CategoryType.maintenance: 'maintenance',
  CategoryType.phoneAndInternet: 'phoneAndInternet',
  CategoryType.fuel: 'fuel',
  CategoryType.publicTransit: 'publicTransit',
  CategoryType.rideShare: 'rideShare',
  CategoryType.carPayment: 'carPayment',
  CategoryType.groceries: 'groceries',
  CategoryType.restaurants: 'restaurants',
  CategoryType.coffeeShops: 'coffeeShops',
  CategoryType.foodDelivery: 'foodDelivery',
  CategoryType.clothing: 'clothing',
  CategoryType.electronics: 'electronics',
  CategoryType.homeGoods: 'homeGoods',
  CategoryType.onlineShopping: 'onlineShopping',
  CategoryType.streamingServices: 'streamingServices',
  CategoryType.gaming: 'gaming',
  CategoryType.eventsAndConcerts: 'eventsAndConcerts',
  CategoryType.hobbies: 'hobbies',
  CategoryType.medical: 'medical',
  CategoryType.pharmacy: 'pharmacy',
  CategoryType.fitness: 'fitness',
  CategoryType.mentalHealth: 'mentalHealth',
  CategoryType.personalCare: 'personalCare',
  CategoryType.investmentContributions: 'investmentContributions',
  CategoryType.fees: 'fees',
  CategoryType.insurance: 'insurance',
  CategoryType.taxes: 'taxes',
  CategoryType.savings: 'savings',
  CategoryType.gifts: 'gifts',
  CategoryType.charity: 'charity',
  CategoryType.education: 'education',
  CategoryType.miscellaneous: 'miscellaneous',
};

_$PriceComparisonImpl _$$PriceComparisonImplFromJson(
  Map<String, dynamic> json,
) => _$PriceComparisonImpl(
  id: json['id'] as String,
  itemName: json['itemName'] as String,
  category: $enumDecode(_$CategoryTypeEnumMap, json['category']),
  prices: (json['prices'] as List<dynamic>)
      .map((e) => LocalPrice.fromJson(e as Map<String, dynamic>))
      .toList(),
  bestPrice: (json['bestPrice'] as num).toDouble(),
  bestPriceLocation: json['bestPriceLocation'] as String,
  averagePrice: (json['averagePrice'] as num).toDouble(),
  userPaidPrice: (json['userPaidPrice'] as num).toDouble(),
  potentialSavings: (json['potentialSavings'] as num).toDouble(),
  comparedAt: DateTime.parse(json['comparedAt'] as String),
);

Map<String, dynamic> _$$PriceComparisonImplToJson(
  _$PriceComparisonImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'itemName': instance.itemName,
  'category': _$CategoryTypeEnumMap[instance.category]!,
  'prices': instance.prices,
  'bestPrice': instance.bestPrice,
  'bestPriceLocation': instance.bestPriceLocation,
  'averagePrice': instance.averagePrice,
  'userPaidPrice': instance.userPaidPrice,
  'potentialSavings': instance.potentialSavings,
  'comparedAt': instance.comparedAt.toIso8601String(),
};

_$LocalPriceImpl _$$LocalPriceImplFromJson(Map<String, dynamic> json) =>
    _$LocalPriceImpl(
      storeName: json['storeName'] as String,
      storeAddress: json['storeAddress'] as String,
      price: (json['price'] as num).toDouble(),
      distanceMiles: (json['distanceMiles'] as num).toDouble(),
      lastVerified: DateTime.parse(json['lastVerified'] as String),
      confidence: $enumDecode(_$PriceConfidenceEnumMap, json['confidence']),
      notes: json['notes'] as String?,
      inStock: json['inStock'] as bool?,
    );

Map<String, dynamic> _$$LocalPriceImplToJson(_$LocalPriceImpl instance) =>
    <String, dynamic>{
      'storeName': instance.storeName,
      'storeAddress': instance.storeAddress,
      'price': instance.price,
      'distanceMiles': instance.distanceMiles,
      'lastVerified': instance.lastVerified.toIso8601String(),
      'confidence': _$PriceConfidenceEnumMap[instance.confidence]!,
      'notes': instance.notes,
      'inStock': instance.inStock,
    };

const _$PriceConfidenceEnumMap = {
  PriceConfidence.verified: 'verified',
  PriceConfidence.reported: 'reported',
  PriceConfidence.estimated: 'estimated',
};

_$NeighborhoodBenchmarkImpl _$$NeighborhoodBenchmarkImplFromJson(
  Map<String, dynamic> json,
) => _$NeighborhoodBenchmarkImpl(
  neighborhoodName: json['neighborhoodName'] as String,
  householdsCompared: (json['householdsCompared'] as num).toInt(),
  medianIncome: (json['medianIncome'] as num).toDouble(),
  categoryBenchmarks: (json['categoryBenchmarks'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry(k, CategoryBenchmark.fromJson(e as Map<String, dynamic>)),
  ),
  userOverallRank: (json['userOverallRank'] as num).toDouble(),
  insights: (json['insights'] as List<dynamic>)
      .map((e) => BenchmarkInsight.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
);

Map<String, dynamic> _$$NeighborhoodBenchmarkImplToJson(
  _$NeighborhoodBenchmarkImpl instance,
) => <String, dynamic>{
  'neighborhoodName': instance.neighborhoodName,
  'householdsCompared': instance.householdsCompared,
  'medianIncome': instance.medianIncome,
  'categoryBenchmarks': instance.categoryBenchmarks,
  'userOverallRank': instance.userOverallRank,
  'insights': instance.insights,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
};

_$CategoryBenchmarkImpl _$$CategoryBenchmarkImplFromJson(
  Map<String, dynamic> json,
) => _$CategoryBenchmarkImpl(
  categoryName: json['categoryName'] as String,
  neighborhoodAverage: (json['neighborhoodAverage'] as num).toDouble(),
  neighborhoodMedian: (json['neighborhoodMedian'] as num).toDouble(),
  userSpending: (json['userSpending'] as num).toDouble(),
  percentile: (json['percentile'] as num).toDouble(),
  comparison: $enumDecode(_$SpendingComparisonEnumMap, json['comparison']),
  potentialSavings: (json['potentialSavings'] as num).toDouble(),
);

Map<String, dynamic> _$$CategoryBenchmarkImplToJson(
  _$CategoryBenchmarkImpl instance,
) => <String, dynamic>{
  'categoryName': instance.categoryName,
  'neighborhoodAverage': instance.neighborhoodAverage,
  'neighborhoodMedian': instance.neighborhoodMedian,
  'userSpending': instance.userSpending,
  'percentile': instance.percentile,
  'comparison': _$SpendingComparisonEnumMap[instance.comparison]!,
  'potentialSavings': instance.potentialSavings,
};

const _$SpendingComparisonEnumMap = {
  SpendingComparison.muchLower: 'muchLower',
  SpendingComparison.lower: 'lower',
  SpendingComparison.average: 'average',
  SpendingComparison.higher: 'higher',
  SpendingComparison.muchHigher: 'muchHigher',
};

_$BenchmarkInsightImpl _$$BenchmarkInsightImplFromJson(
  Map<String, dynamic> json,
) => _$BenchmarkInsightImpl(
  title: json['title'] as String,
  description: json['description'] as String,
  type: $enumDecode(_$LocalInsightTypeEnumMap, json['type']),
  potentialImpact: (json['potentialImpact'] as num).toDouble(),
  actionItem: json['actionItem'] as String,
);

Map<String, dynamic> _$$BenchmarkInsightImplToJson(
  _$BenchmarkInsightImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'type': _$LocalInsightTypeEnumMap[instance.type]!,
  'potentialImpact': instance.potentialImpact,
  'actionItem': instance.actionItem,
};

const _$LocalInsightTypeEnumMap = {
  LocalInsightType.savings: 'savings',
  LocalInsightType.spending: 'spending',
  LocalInsightType.opportunity: 'opportunity',
  LocalInsightType.warning: 'warning',
  LocalInsightType.celebration: 'celebration',
};

_$LocalDealImpl _$$LocalDealImplFromJson(Map<String, dynamic> json) =>
    _$LocalDealImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      storeName: json['storeName'] as String,
      storeAddress: json['storeAddress'] as String,
      distanceMiles: (json['distanceMiles'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      dealPrice: (json['dealPrice'] as num).toDouble(),
      savingsPercent: (json['savingsPercent'] as num).toDouble(),
      category: $enumDecode(_$CategoryTypeEnumMap, json['category']),
      validFrom: DateTime.parse(json['validFrom'] as String),
      validUntil: DateTime.parse(json['validUntil'] as String),
      source: $enumDecode(_$DealSourceEnumMap, json['source']),
      isVerified: json['isVerified'] as bool,
      claimedCount: (json['claimedCount'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$LocalDealImplToJson(_$LocalDealImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'storeName': instance.storeName,
      'storeAddress': instance.storeAddress,
      'distanceMiles': instance.distanceMiles,
      'originalPrice': instance.originalPrice,
      'dealPrice': instance.dealPrice,
      'savingsPercent': instance.savingsPercent,
      'category': _$CategoryTypeEnumMap[instance.category]!,
      'validFrom': instance.validFrom.toIso8601String(),
      'validUntil': instance.validUntil.toIso8601String(),
      'source': _$DealSourceEnumMap[instance.source]!,
      'isVerified': instance.isVerified,
      'claimedCount': instance.claimedCount,
      'rating': instance.rating,
    };

const _$DealSourceEnumMap = {
  DealSource.store: 'store',
  DealSource.community: 'community',
  DealSource.coupon: 'coupon',
  DealSource.cashback: 'cashback',
};

_$CommunitySavingsGroupImpl _$$CommunitySavingsGroupImplFromJson(
  Map<String, dynamic> json,
) => _$CommunitySavingsGroupImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  type: $enumDecode(_$GroupTypeEnumMap, json['type']),
  memberCount: (json['memberCount'] as num).toInt(),
  totalSaved: (json['totalSaved'] as num).toDouble(),
  neighborhood: json['neighborhood'] as String,
  categories: (json['categories'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  isPublic: json['isPublic'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  meetingSchedule: json['meetingSchedule'] as String?,
  contactInfo: json['contactInfo'] as String?,
);

Map<String, dynamic> _$$CommunitySavingsGroupImplToJson(
  _$CommunitySavingsGroupImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'type': _$GroupTypeEnumMap[instance.type]!,
  'memberCount': instance.memberCount,
  'totalSaved': instance.totalSaved,
  'neighborhood': instance.neighborhood,
  'categories': instance.categories,
  'isPublic': instance.isPublic,
  'createdAt': instance.createdAt.toIso8601String(),
  'meetingSchedule': instance.meetingSchedule,
  'contactInfo': instance.contactInfo,
};

const _$GroupTypeEnumMap = {
  GroupType.bulkBuying: 'bulkBuying',
  GroupType.dealSharing: 'dealSharing',
  GroupType.budgetSupport: 'budgetSupport',
  GroupType.investmentClub: 'investmentClub',
  GroupType.couponExchange: 'couponExchange',
};

_$LocalEconomicStatsImpl _$$LocalEconomicStatsImplFromJson(
  Map<String, dynamic> json,
) => _$LocalEconomicStatsImpl(
  zipCode: json['zipCode'] as String,
  averageGasPrice: (json['averageGasPrice'] as num).toDouble(),
  averageRent: (json['averageRent'] as num).toDouble(),
  costOfLivingIndex: (json['costOfLivingIndex'] as num).toDouble(),
  groceryIndex: (json['groceryIndex'] as num).toDouble(),
  utilitiesIndex: (json['utilitiesIndex'] as num).toDouble(),
  transportIndex: (json['transportIndex'] as num).toDouble(),
  categoryAverages: (json['categoryAverages'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  priceTrends: (json['priceTrends'] as List<dynamic>)
      .map((e) => PriceTrend.fromJson(e as Map<String, dynamic>))
      .toList(),
  lastUpdated: DateTime.parse(json['lastUpdated'] as String),
);

Map<String, dynamic> _$$LocalEconomicStatsImplToJson(
  _$LocalEconomicStatsImpl instance,
) => <String, dynamic>{
  'zipCode': instance.zipCode,
  'averageGasPrice': instance.averageGasPrice,
  'averageRent': instance.averageRent,
  'costOfLivingIndex': instance.costOfLivingIndex,
  'groceryIndex': instance.groceryIndex,
  'utilitiesIndex': instance.utilitiesIndex,
  'transportIndex': instance.transportIndex,
  'categoryAverages': instance.categoryAverages,
  'priceTrends': instance.priceTrends,
  'lastUpdated': instance.lastUpdated.toIso8601String(),
};

_$PriceTrendImpl _$$PriceTrendImplFromJson(Map<String, dynamic> json) =>
    _$PriceTrendImpl(
      itemName: json['itemName'] as String,
      currentPrice: (json['currentPrice'] as num).toDouble(),
      changePercent: (json['changePercent'] as num).toDouble(),
      direction: $enumDecode(_$TrendDirectionEnumMap, json['direction']),
      timeframe: json['timeframe'] as String,
      prediction: json['prediction'] as String?,
    );

Map<String, dynamic> _$$PriceTrendImplToJson(_$PriceTrendImpl instance) =>
    <String, dynamic>{
      'itemName': instance.itemName,
      'currentPrice': instance.currentPrice,
      'changePercent': instance.changePercent,
      'direction': _$TrendDirectionEnumMap[instance.direction]!,
      'timeframe': instance.timeframe,
      'prediction': instance.prediction,
    };

const _$TrendDirectionEnumMap = {
  TrendDirection.up: 'up',
  TrendDirection.down: 'down',
  TrendDirection.stable: 'stable',
};
