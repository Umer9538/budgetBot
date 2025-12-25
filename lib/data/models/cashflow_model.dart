import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/enums.dart';

part 'cashflow_model.freezed.dart';
part 'cashflow_model.g.dart';

/// Model for cashflow prediction
@freezed
class CashflowPrediction with _$CashflowPrediction {
  const CashflowPrediction._();

  const factory CashflowPrediction({
    required String id,
    required String userId,
    required double currentBalance,
    required double predictedBalance,
    required DateTime predictionDate,
    required CashflowStatus status,
    required PredictionConfidence confidence,
    @Default([]) List<CashflowEvent> upcomingEvents,
    @Default([]) List<DailyBalance> dailyProjections,
    DateTime? crisisDate,
    double? crisisAmount,
    String? crisisReason,
    @Default([]) List<String> recommendations,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? updatedAt,
  }) = _CashflowPrediction;

  factory CashflowPrediction.fromJson(Map<String, dynamic> json) =>
      _$CashflowPredictionFromJson(json);

  factory CashflowPrediction.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return CashflowPrediction.fromJson({...data, 'id': doc.id});
  }

  /// Days until predicted crisis (null if no crisis predicted)
  int? get daysUntilCrisis {
    if (crisisDate == null) return null;
    return crisisDate!.difference(DateTime.now()).inDays;
  }

  /// Check if crisis is imminent (within 3 days)
  bool get isCrisisImminent => daysUntilCrisis != null && daysUntilCrisis! <= 3;

  /// Check if needs immediate attention
  bool get needsAttention =>
      status == CashflowStatus.warning ||
      status == CashflowStatus.critical ||
      status == CashflowStatus.crisis;

  /// Get the lowest projected balance
  double get lowestProjectedBalance {
    if (dailyProjections.isEmpty) return predictedBalance;
    return dailyProjections.map((d) => d.balance).reduce((a, b) => a < b ? a : b);
  }

  /// Get date of lowest balance
  DateTime? get lowestBalanceDate {
    if (dailyProjections.isEmpty) return null;
    final lowest = lowestProjectedBalance;
    return dailyProjections.firstWhere((d) => d.balance == lowest).date;
  }
}

/// Model for a cashflow event (income or expense)
@freezed
class CashflowEvent with _$CashflowEvent {
  const CashflowEvent._();

  const factory CashflowEvent({
    required String id,
    required String name,
    required double amount,
    required DateTime date,
    required CashflowEventType type,
    required bool isRecurring,
    String? recurringPattern,
    CategoryType? category,
    PredictionConfidence? confidence,
    String? merchantName,
    @Default(false) bool isConfirmed,
  }) = _CashflowEvent;

  factory CashflowEvent.fromJson(Map<String, dynamic> json) =>
      _$CashflowEventFromJson(json);

  /// Check if event is income
  bool get isIncome => type == CashflowEventType.income;

  /// Check if event is expense
  bool get isExpense => type == CashflowEventType.expense;

  /// Formatted amount with sign
  String get formattedAmount {
    final sign = isIncome ? '+' : '-';
    return '$sign\$${amount.abs().toStringAsFixed(2)}';
  }
}

/// Type of cashflow event
enum CashflowEventType {
  income,
  expense,
  transfer,
}

/// Model for daily balance projection
@freezed
class DailyBalance with _$DailyBalance {
  const factory DailyBalance({
    required DateTime date,
    required double balance,
    required double inflow,
    required double outflow,
    @Default([]) List<String> eventIds,
  }) = _DailyBalance;

  factory DailyBalance.fromJson(Map<String, dynamic> json) =>
      _$DailyBalanceFromJson(json);
}

/// Model for recurring transaction pattern
@freezed
class RecurringTransaction with _$RecurringTransaction {
  const RecurringTransaction._();

  const factory RecurringTransaction({
    required String id,
    required String userId,
    required String name,
    required double amount,
    required RecurringFrequency frequency,
    required DateTime nextDate,
    required CashflowEventType type,
    CategoryType? category,
    String? merchantName,
    @Default([]) List<DateTime> history,
    @Default(true) bool isActive,
    PredictionConfidence? confidence,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
  }) = _RecurringTransaction;

  factory RecurringTransaction.fromJson(Map<String, dynamic> json) =>
      _$RecurringTransactionFromJson(json);

  factory RecurringTransaction.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return RecurringTransaction.fromJson({...data, 'id': doc.id});
  }

  /// Calculate next occurrence after a given date
  DateTime getNextOccurrence(DateTime after) {
    DateTime next = nextDate;
    while (next.isBefore(after) || next.isAtSameMomentAs(after)) {
      next = _addFrequency(next);
    }
    return next;
  }

  DateTime _addFrequency(DateTime date) {
    switch (frequency) {
      case RecurringFrequency.daily:
        return date.add(const Duration(days: 1));
      case RecurringFrequency.weekly:
        return date.add(const Duration(days: 7));
      case RecurringFrequency.biWeekly:
        return date.add(const Duration(days: 14));
      case RecurringFrequency.monthly:
        return DateTime(date.year, date.month + 1, date.day);
      case RecurringFrequency.quarterly:
        return DateTime(date.year, date.month + 3, date.day);
      case RecurringFrequency.yearly:
        return DateTime(date.year + 1, date.month, date.day);
    }
  }

  /// Get all occurrences within a date range
  List<DateTime> getOccurrencesInRange(DateTime start, DateTime end) {
    final occurrences = <DateTime>[];
    DateTime current = nextDate;

    // Move to start if needed
    while (current.isBefore(start)) {
      current = _addFrequency(current);
    }

    // Collect all occurrences until end
    while (current.isBefore(end) || current.isAtSameMomentAs(end)) {
      occurrences.add(current);
      current = _addFrequency(current);
    }

    return occurrences;
  }
}

/// Frequency of recurring transactions
enum RecurringFrequency {
  daily,
  weekly,
  biWeekly,
  monthly,
  quarterly,
  yearly,
}

extension RecurringFrequencyExtension on RecurringFrequency {
  String get displayName {
    switch (this) {
      case RecurringFrequency.daily:
        return 'Daily';
      case RecurringFrequency.weekly:
        return 'Weekly';
      case RecurringFrequency.biWeekly:
        return 'Bi-Weekly';
      case RecurringFrequency.monthly:
        return 'Monthly';
      case RecurringFrequency.quarterly:
        return 'Quarterly';
      case RecurringFrequency.yearly:
        return 'Yearly';
    }
  }

  int get daysApproximate {
    switch (this) {
      case RecurringFrequency.daily:
        return 1;
      case RecurringFrequency.weekly:
        return 7;
      case RecurringFrequency.biWeekly:
        return 14;
      case RecurringFrequency.monthly:
        return 30;
      case RecurringFrequency.quarterly:
        return 90;
      case RecurringFrequency.yearly:
        return 365;
    }
  }
}

/// Model for cashflow alert
@freezed
class CashflowAlert with _$CashflowAlert {
  const factory CashflowAlert({
    required String id,
    required String userId,
    required AlertType type,
    required String title,
    required String message,
    required CashflowStatus severity,
    required DateTime alertDate,
    DateTime? crisisDate,
    double? projectedShortfall,
    @Default([]) List<String> suggestedActions,
    @Default(false) bool isRead,
    @Default(false) bool isDismissed,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
  }) = _CashflowAlert;

  factory CashflowAlert.fromJson(Map<String, dynamic> json) =>
      _$CashflowAlertFromJson(json);

  factory CashflowAlert.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return CashflowAlert.fromJson({...data, 'id': doc.id});
  }
}

// Helper functions for Timestamp conversion
DateTime? _timestampFromJson(dynamic value) {
  if (value == null) return null;
  if (value is Timestamp) return value.toDate();
  if (value is String) return DateTime.parse(value);
  return null;
}

dynamic _timestampToJson(DateTime? dateTime) {
  return dateTime?.toIso8601String();
}
