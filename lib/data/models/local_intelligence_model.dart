import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/enums.dart';

part 'local_intelligence_model.freezed.dart';
part 'local_intelligence_model.g.dart';

/// Local Economic Intelligence - hyperlocal price comparisons and insights
@freezed
class LocalIntelligence with _$LocalIntelligence {
  const factory LocalIntelligence({
    required String id,
    required String userId,
    required LocalProfile localProfile,
    required List<PriceComparison> priceComparisons,
    required NeighborhoodBenchmark benchmark,
    required List<LocalDeal> deals,
    required List<CommunitySavingsGroup> savingsGroups,
    required DateTime lastUpdated,
  }) = _LocalIntelligence;

  factory LocalIntelligence.fromJson(Map<String, dynamic> json) =>
      _$LocalIntelligenceFromJson(json);
}

/// User's local profile for intelligence
@freezed
class LocalProfile with _$LocalProfile {
  const factory LocalProfile({
    required String zipCode,
    required String city,
    required String state,
    required String neighborhood,
    required double latitude,
    required double longitude,
    required double searchRadiusMiles,
    required List<String> preferredStores,
    required List<CategoryType> trackedCategories,
    required bool shareAnonymousData, // for community benchmarks
  }) = _LocalProfile;

  factory LocalProfile.fromJson(Map<String, dynamic> json) =>
      _$LocalProfileFromJson(json);
}

/// Price comparison for an item/service
@freezed
class PriceComparison with _$PriceComparison {
  const factory PriceComparison({
    required String id,
    required String itemName,
    required CategoryType category,
    required List<LocalPrice> prices,
    required double bestPrice,
    required String bestPriceLocation,
    required double averagePrice,
    required double userPaidPrice,
    required double potentialSavings,
    required DateTime comparedAt,
  }) = _PriceComparison;

  factory PriceComparison.fromJson(Map<String, dynamic> json) =>
      _$PriceComparisonFromJson(json);
}

/// Price at a specific location
@freezed
class LocalPrice with _$LocalPrice {
  const factory LocalPrice({
    required String storeName,
    required String storeAddress,
    required double price,
    required double distanceMiles,
    required DateTime lastVerified,
    required PriceConfidence confidence,
    String? notes,
    bool? inStock,
  }) = _LocalPrice;

  factory LocalPrice.fromJson(Map<String, dynamic> json) =>
      _$LocalPriceFromJson(json);
}

/// Confidence level for price data
enum PriceConfidence {
  verified,
  reported,
  estimated,
}

extension PriceConfidenceExtension on PriceConfidence {
  String get displayName {
    switch (this) {
      case PriceConfidence.verified:
        return 'Verified';
      case PriceConfidence.reported:
        return 'Reported';
      case PriceConfidence.estimated:
        return 'Estimated';
    }
  }

  String get icon {
    switch (this) {
      case PriceConfidence.verified:
        return '✓';
      case PriceConfidence.reported:
        return '👥';
      case PriceConfidence.estimated:
        return '~';
    }
  }
}

/// Neighborhood spending benchmark
@freezed
class NeighborhoodBenchmark with _$NeighborhoodBenchmark {
  const factory NeighborhoodBenchmark({
    required String neighborhoodName,
    required int householdsCompared,
    required double medianIncome,
    required Map<String, CategoryBenchmark> categoryBenchmarks,
    required double userOverallRank, // percentile 0-100
    required List<BenchmarkInsight> insights,
    required DateTime lastUpdated,
  }) = _NeighborhoodBenchmark;

  factory NeighborhoodBenchmark.fromJson(Map<String, dynamic> json) =>
      _$NeighborhoodBenchmarkFromJson(json);
}

/// Benchmark for a spending category
@freezed
class CategoryBenchmark with _$CategoryBenchmark {
  const factory CategoryBenchmark({
    required String categoryName,
    required double neighborhoodAverage,
    required double neighborhoodMedian,
    required double userSpending,
    required double percentile, // where user falls 0-100
    required SpendingComparison comparison,
    required double potentialSavings,
  }) = _CategoryBenchmark;

  factory CategoryBenchmark.fromJson(Map<String, dynamic> json) =>
      _$CategoryBenchmarkFromJson(json);
}

/// How user compares to neighborhood
enum SpendingComparison {
  muchLower,
  lower,
  average,
  higher,
  muchHigher,
}

extension SpendingComparisonExtension on SpendingComparison {
  String get displayName {
    switch (this) {
      case SpendingComparison.muchLower:
        return 'Much Lower';
      case SpendingComparison.lower:
        return 'Lower';
      case SpendingComparison.average:
        return 'Average';
      case SpendingComparison.higher:
        return 'Higher';
      case SpendingComparison.muchHigher:
        return 'Much Higher';
    }
  }

  String get icon {
    switch (this) {
      case SpendingComparison.muchLower:
        return '⬇️⬇️';
      case SpendingComparison.lower:
        return '⬇️';
      case SpendingComparison.average:
        return '➡️';
      case SpendingComparison.higher:
        return '⬆️';
      case SpendingComparison.muchHigher:
        return '⬆️⬆️';
    }
  }
}

/// Insight from benchmark analysis
@freezed
class BenchmarkInsight with _$BenchmarkInsight {
  const factory BenchmarkInsight({
    required String title,
    required String description,
    required LocalInsightType type,
    required double potentialImpact,
    required String actionItem,
  }) = _BenchmarkInsight;

  factory BenchmarkInsight.fromJson(Map<String, dynamic> json) =>
      _$BenchmarkInsightFromJson(json);
}

/// Type of local insight
enum LocalInsightType {
  savings,
  spending,
  opportunity,
  warning,
  celebration,
}

extension LocalInsightTypeExtension on LocalInsightType {
  String get icon {
    switch (this) {
      case LocalInsightType.savings:
        return '💰';
      case LocalInsightType.spending:
        return '💸';
      case LocalInsightType.opportunity:
        return '🎯';
      case LocalInsightType.warning:
        return '⚠️';
      case LocalInsightType.celebration:
        return '🎉';
    }
  }
}

/// Local deal from aggregation
@freezed
class LocalDeal with _$LocalDeal {
  const factory LocalDeal({
    required String id,
    required String title,
    required String description,
    required String storeName,
    required String storeAddress,
    required double distanceMiles,
    required double originalPrice,
    required double dealPrice,
    required double savingsPercent,
    required CategoryType category,
    required DateTime validFrom,
    required DateTime validUntil,
    required DealSource source,
    required bool isVerified,
    int? claimedCount, // how many users claimed
    double? rating,
  }) = _LocalDeal;

  factory LocalDeal.fromJson(Map<String, dynamic> json) =>
      _$LocalDealFromJson(json);
}

/// Source of deal
enum DealSource {
  store,
  community,
  coupon,
  cashback,
}

extension DealSourceExtension on DealSource {
  String get displayName {
    switch (this) {
      case DealSource.store:
        return 'Store Sale';
      case DealSource.community:
        return 'Community Find';
      case DealSource.coupon:
        return 'Coupon';
      case DealSource.cashback:
        return 'Cashback';
    }
  }

  String get icon {
    switch (this) {
      case DealSource.store:
        return '🏪';
      case DealSource.community:
        return '👥';
      case DealSource.coupon:
        return '🎟️';
      case DealSource.cashback:
        return '💵';
    }
  }
}

/// Community savings group
@freezed
class CommunitySavingsGroup with _$CommunitySavingsGroup {
  const factory CommunitySavingsGroup({
    required String id,
    required String name,
    required String description,
    required GroupType type,
    required int memberCount,
    required double totalSaved, // by all members
    required String neighborhood,
    required List<String> categories, // focus categories
    required bool isPublic,
    required DateTime createdAt,
    String? meetingSchedule,
    String? contactInfo,
  }) = _CommunitySavingsGroup;

  factory CommunitySavingsGroup.fromJson(Map<String, dynamic> json) =>
      _$CommunitySavingsGroupFromJson(json);
}

/// Type of community group
enum GroupType {
  bulkBuying,
  dealSharing,
  budgetSupport,
  investmentClub,
  couponExchange,
}

extension GroupTypeExtension on GroupType {
  String get displayName {
    switch (this) {
      case GroupType.bulkBuying:
        return 'Bulk Buying';
      case GroupType.dealSharing:
        return 'Deal Sharing';
      case GroupType.budgetSupport:
        return 'Budget Support';
      case GroupType.investmentClub:
        return 'Investment Club';
      case GroupType.couponExchange:
        return 'Coupon Exchange';
    }
  }

  String get icon {
    switch (this) {
      case GroupType.bulkBuying:
        return '📦';
      case GroupType.dealSharing:
        return '🤝';
      case GroupType.budgetSupport:
        return '💪';
      case GroupType.investmentClub:
        return '📈';
      case GroupType.couponExchange:
        return '🎫';
    }
  }

  String get description {
    switch (this) {
      case GroupType.bulkBuying:
        return 'Group purchases for better prices';
      case GroupType.dealSharing:
        return 'Share and discover local deals';
      case GroupType.budgetSupport:
        return 'Support each other\'s financial goals';
      case GroupType.investmentClub:
        return 'Learn and invest together';
      case GroupType.couponExchange:
        return 'Trade and share coupons';
    }
  }
}

/// Local economic stats
@freezed
class LocalEconomicStats with _$LocalEconomicStats {
  const factory LocalEconomicStats({
    required String zipCode,
    required double averageGasPrice,
    required double averageRent,
    required double costOfLivingIndex, // 100 = national average
    required double groceryIndex,
    required double utilitiesIndex,
    required double transportIndex,
    required Map<String, double> categoryAverages,
    required List<PriceTrend> priceTrends,
    required DateTime lastUpdated,
  }) = _LocalEconomicStats;

  factory LocalEconomicStats.fromJson(Map<String, dynamic> json) =>
      _$LocalEconomicStatsFromJson(json);
}

/// Price trend over time
@freezed
class PriceTrend with _$PriceTrend {
  const factory PriceTrend({
    required String itemName,
    required double currentPrice,
    required double changePercent,
    required TrendDirection direction,
    required String timeframe,
    String? prediction,
  }) = _PriceTrend;

  factory PriceTrend.fromJson(Map<String, dynamic> json) =>
      _$PriceTrendFromJson(json);
}

/// Direction of price trend
enum TrendDirection {
  up,
  down,
  stable,
}

extension TrendDirectionExtension on TrendDirection {
  String get icon {
    switch (this) {
      case TrendDirection.up:
        return '📈';
      case TrendDirection.down:
        return '📉';
      case TrendDirection.stable:
        return '➡️';
    }
  }
}
