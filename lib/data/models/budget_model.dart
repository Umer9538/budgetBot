import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/enums/enums.dart';
part 'budget_model.freezed.dart';
part 'budget_model.g.dart';

/// Budget target type - category or merchant based
enum BudgetTargetType {
  category,
  merchant,
}

@freezed
class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    required String id,
    required String userId,
    required String name,
    required CategoryType category,
    required double amount,
    required BudgetPeriod period,
    @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
    required DateTime startDate,
    DateTime? endDate,
    @Default(false) bool rollover,
    @Default(0.0) double rolloverAmount, // Amount rolled over from previous period
    @Default(0.0) double spent,
    @Default([0.5, 0.75, 0.9, 1.0]) List<double> alertThresholds,
    @Default(false) bool isShared,
    @Default([]) List<String> sharedWith,
    @Default(true) bool isActive,
    String? colorHex,
    String? iconName,
    // Merchant-based budget support
    @Default(BudgetTargetType.category) BudgetTargetType targetType,
    String? merchantName, // For merchant-based budgets
    @Default([]) List<String> merchantPatterns, // Multiple merchant patterns to match
    // Template tracking
    String? templateId, // If created from a template
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _BudgetModel;

  factory BudgetModel.fromJson(Map<String, dynamic> json) =>
      _$BudgetModelFromJson(json);

  factory BudgetModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return BudgetModel.fromJson({...data, 'id': doc.id});
  }
}

// Extension for budget utilities
extension BudgetModelExtension on BudgetModel {
  /// Total available budget (base amount + rollover)
  double get totalBudget => amount + rolloverAmount;

  /// Remaining budget amount (including rollover)
  double get remaining => totalBudget - spent;

  /// Percentage of budget used (0.0 to 1.0+)
  double get percentUsed => totalBudget > 0 ? spent / totalBudget : 0.0;

  /// Check if this is a merchant-based budget
  bool get isMerchantBased => targetType == BudgetTargetType.merchant;

  /// Check if a merchant name matches this budget
  bool matchesMerchant(String merchant) {
    if (!isMerchantBased) return false;
    final lowerMerchant = merchant.toLowerCase();

    // Check exact merchant name
    if (merchantName != null &&
        lowerMerchant.contains(merchantName!.toLowerCase())) {
      return true;
    }

    // Check merchant patterns
    for (final pattern in merchantPatterns) {
      if (lowerMerchant.contains(pattern.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  /// Percentage of budget used (clamped 0-100)
  int get percentUsedClamped => (percentUsed * 100).clamp(0, 100).toInt();

  /// Check if budget is exceeded
  bool get isExceeded => spent > amount;

  /// Check if budget is approaching limit (>= 90%)
  bool get isApproaching => percentUsed >= 0.9 && !isExceeded;

  /// Check if budget is warning level (>= 75%)
  bool get isWarning => percentUsed >= 0.75 && percentUsed < 0.9;

  /// Check if budget is on track (< 75%)
  bool get isOnTrack => percentUsed < 0.75;

  /// Get current alert level
  BudgetAlertLevel get alertLevel {
    if (isExceeded) return BudgetAlertLevel.exceeded;
    if (isApproaching) return BudgetAlertLevel.critical;
    if (isWarning) return BudgetAlertLevel.warning;
    return BudgetAlertLevel.normal;
  }

  /// Format remaining amount with currency
  String get formattedRemaining {
    final absRemaining = remaining.abs();
    final prefix = remaining < 0 ? '-\$' : '\$';
    return '$prefix${absRemaining.toStringAsFixed(2)}';
  }

  /// Format budget amount
  String get formattedAmount => '\$${amount.toStringAsFixed(2)}';

  /// Format spent amount
  String get formattedSpent => '\$${spent.toStringAsFixed(2)}';

  /// Check if budget period has ended
  bool get isPeriodEnded {
    if (endDate == null) return false;
    return DateTime.now().isAfter(endDate!);
  }

  /// Calculate daily budget
  double get dailyBudget {
    final days = period.days;
    return days > 0 ? amount / days : amount;
  }

  /// Calculate remaining daily budget
  double get remainingDailyBudget {
    final now = DateTime.now();
    final daysRemaining = endDate != null
        ? endDate!.difference(now).inDays + 1
        : period.days - now.difference(startDate).inDays;
    return daysRemaining > 0 ? remaining / daysRemaining : 0;
  }
}

enum BudgetAlertLevel {
  normal,
  warning,
  critical,
  exceeded,
}

extension BudgetAlertLevelExtension on BudgetAlertLevel {
  String get displayName {
    switch (this) {
      case BudgetAlertLevel.normal:
        return 'On Track';
      case BudgetAlertLevel.warning:
        return 'Warning';
      case BudgetAlertLevel.critical:
        return 'Approaching Limit';
      case BudgetAlertLevel.exceeded:
        return 'Exceeded';
    }
  }
}

// Helper functions for Timestamp conversion
DateTime _timestampFromJsonRequired(dynamic value) {
  if (value is Timestamp) return value.toDate();
  if (value is String) return DateTime.parse(value);
  return DateTime.now();
}

dynamic _timestampToJson(DateTime? dateTime) {
  return dateTime?.toIso8601String();
}
