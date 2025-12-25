import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/enums.dart';

part 'carbon_wallet_model.freezed.dart';
part 'carbon_wallet_model.g.dart';

/// Model for Carbon Wallet (environmental impact tracking)
@freezed
class CarbonWallet with _$CarbonWallet {
  const factory CarbonWallet({
    required String id,
    required String userId,
    required DateTime periodStart,
    required DateTime periodEnd,
    required double totalCarbonKg,
    required double offsetCarbonKg,
    required double netCarbonKg,
    required CarbonImpactLevel impactLevel,
    required Map<String, double> categoryBreakdown, // category -> kg CO2
    required List<CarbonTransaction> topEmitters,
    required double comparedToAverage, // percentage vs average user
    @Default([]) List<String> recommendations,
    @Default([]) List<CarbonGoal> goals,
    DateTime? createdAt,
  }) = _CarbonWallet;

  factory CarbonWallet.fromJson(Map<String, dynamic> json) =>
      _$CarbonWalletFromJson(json);
}

/// Carbon impact level
enum CarbonImpactLevel {
  veryLow,
  low,
  moderate,
  high,
  veryHigh,
}

extension CarbonImpactLevelExtension on CarbonImpactLevel {
  String get displayName {
    switch (this) {
      case CarbonImpactLevel.veryLow:
        return 'Very Low';
      case CarbonImpactLevel.low:
        return 'Low';
      case CarbonImpactLevel.moderate:
        return 'Moderate';
      case CarbonImpactLevel.high:
        return 'High';
      case CarbonImpactLevel.veryHigh:
        return 'Very High';
    }
  }

  String get icon {
    switch (this) {
      case CarbonImpactLevel.veryLow:
        return '🌱';
      case CarbonImpactLevel.low:
        return '🌿';
      case CarbonImpactLevel.moderate:
        return '🌳';
      case CarbonImpactLevel.high:
        return '🏭';
      case CarbonImpactLevel.veryHigh:
        return '💨';
    }
  }

  String get description {
    switch (this) {
      case CarbonImpactLevel.veryLow:
        return 'Excellent! Your spending is very eco-friendly.';
      case CarbonImpactLevel.low:
        return 'Great job! Below average carbon footprint.';
      case CarbonImpactLevel.moderate:
        return 'Average carbon footprint. Room for improvement.';
      case CarbonImpactLevel.high:
        return 'Above average. Consider greener alternatives.';
      case CarbonImpactLevel.veryHigh:
        return 'High impact. Significant changes recommended.';
    }
  }
}

/// Transaction with carbon footprint
@freezed
class CarbonTransaction with _$CarbonTransaction {
  const factory CarbonTransaction({
    required String transactionId,
    required String merchantName,
    required double amount,
    required double carbonKg,
    required CategoryType category,
    required DateTime date,
    String? alternativeSuggestion,
    double? potentialSavingsKg,
  }) = _CarbonTransaction;

  factory CarbonTransaction.fromJson(Map<String, dynamic> json) =>
      _$CarbonTransactionFromJson(json);
}

/// Carbon reduction goal
@freezed
class CarbonGoal with _$CarbonGoal {
  const factory CarbonGoal({
    required String id,
    required String title,
    required String description,
    required double targetReductionKg,
    required double currentReductionKg,
    required DateTime startDate,
    required DateTime endDate,
    required CarbonGoalStatus status,
    String? category, // optional category focus
    int? rewardPoints,
  }) = _CarbonGoal;

  factory CarbonGoal.fromJson(Map<String, dynamic> json) =>
      _$CarbonGoalFromJson(json);
}

enum CarbonGoalStatus {
  active,
  completed,
  failed,
  expired,
}

extension CarbonGoalStatusExtension on CarbonGoalStatus {
  String get displayName {
    switch (this) {
      case CarbonGoalStatus.active:
        return 'Active';
      case CarbonGoalStatus.completed:
        return 'Completed';
      case CarbonGoalStatus.failed:
        return 'Not Achieved';
      case CarbonGoalStatus.expired:
        return 'Expired';
    }
  }
}

/// Carbon offset purchase
@freezed
class CarbonOffset with _$CarbonOffset {
  const factory CarbonOffset({
    required String id,
    required String userId,
    required double amountKg,
    required double costUsd,
    required String provider,
    required String projectName,
    required DateTime purchaseDate,
    String? certificateUrl,
  }) = _CarbonOffset;

  factory CarbonOffset.fromJson(Map<String, dynamic> json) =>
      _$CarbonOffsetFromJson(json);
}

/// Category carbon multipliers (kg CO2 per dollar spent)
class CategoryCarbonFactors {
  // Carbon factors by category group
  static const Map<String, double> _groupFactors = {
    'food': 0.25, // Food production + transport
    'transportation': 0.45, // Fuel, flights
    'shopping': 0.20, // Manufacturing, shipping
    'entertainment': 0.10, // Mostly digital
    'utilities': 0.35, // Energy production
    'housing': 0.15, // Maintenance, supplies
    'health': 0.12, // Medical supplies
    'education': 0.08, // Low impact
    'financial': 0.05, // Mostly digital
    'other': 0.15, // Average
  };

  static double getFactorForCategory(CategoryType category) {
    // Map specific categories to their carbon factors
    switch (category) {
      // Food & Dining - higher impact
      case CategoryType.groceries:
      case CategoryType.restaurants:
      case CategoryType.coffeeShops:
      case CategoryType.foodDelivery:
        return 0.25;

      // Transportation - highest impact
      case CategoryType.fuel:
      case CategoryType.carPayment:
      case CategoryType.rideShare:
        return 0.45;
      case CategoryType.publicTransit:
        return 0.15; // Lower than car

      // Housing
      case CategoryType.rentMortgage:
      case CategoryType.maintenance:
        return 0.15;
      case CategoryType.utilities:
        return 0.35;
      case CategoryType.phoneAndInternet:
        return 0.08;

      // Shopping - medium impact
      case CategoryType.clothing:
      case CategoryType.electronics:
      case CategoryType.homeGoods:
      case CategoryType.onlineShopping:
        return 0.20;

      // Entertainment - low impact (mostly digital)
      case CategoryType.streamingServices:
      case CategoryType.gaming:
        return 0.05;
      case CategoryType.eventsAndConcerts:
      case CategoryType.hobbies:
        return 0.12;

      // Health
      case CategoryType.medical:
      case CategoryType.pharmacy:
      case CategoryType.fitness:
      case CategoryType.mentalHealth:
      case CategoryType.personalCare:
        return 0.12;

      // Financial - minimal impact
      case CategoryType.investmentContributions:
      case CategoryType.fees:
      case CategoryType.insurance:
      case CategoryType.taxes:
      case CategoryType.savings:
        return 0.02;

      // Other
      case CategoryType.gifts:
        return 0.18;
      case CategoryType.charity:
        return 0.05;
      case CategoryType.education:
        return 0.08;
      case CategoryType.miscellaneous:
        return 0.15;

      // Income categories (no carbon footprint)
      case CategoryType.salary:
      case CategoryType.freelance:
      case CategoryType.investments:
      case CategoryType.otherIncome:
        return 0.0;
    }
  }
}
