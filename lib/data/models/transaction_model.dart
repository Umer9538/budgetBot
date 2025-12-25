import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/enums.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    required String userId,
    String? accountId,
    String? plaidTransactionId,
    required double amount,
    @Default('USD') String currency,
    @JsonKey(fromJson: _timestampFromJsonRequired, toJson: _timestampToJson)
    required DateTime date,
    required String merchantName,
    required CategoryType category,
    CategoryType? subcategory,
    required TransactionType type,
    @Default(false) bool isManual,
    TransactionLocation? location,
    TransactionReceipt? receipt,
    @Default([]) List<String> tags,
    String? notes,
    double? carbonFootprint,
    EmotionalContext? emotionalContext,
    @Default(false) bool isRecurring,
    String? recurringGroupId,
    @Default(false) bool isPending,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? updatedAt,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  factory TransactionModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return TransactionModel.fromJson({...data, 'id': doc.id});
  }
}

@freezed
class TransactionLocation with _$TransactionLocation {
  const factory TransactionLocation({
    double? lat,
    double? lng,
    String? address,
    String? city,
    String? country,
  }) = _TransactionLocation;

  factory TransactionLocation.fromJson(Map<String, dynamic> json) =>
      _$TransactionLocationFromJson(json);
}

@freezed
class TransactionReceipt with _$TransactionReceipt {
  const factory TransactionReceipt({
    String? imageUrl,
    Map<String, dynamic>? ocrData,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? uploadedAt,
  }) = _TransactionReceipt;

  factory TransactionReceipt.fromJson(Map<String, dynamic> json) =>
      _$TransactionReceiptFromJson(json);
}

@freezed
class EmotionalContext with _$EmotionalContext {
  const factory EmotionalContext({
    MoodType? mood,
    @Default(0) int stressLevel,
    String? notes,
  }) = _EmotionalContext;

  factory EmotionalContext.fromJson(Map<String, dynamic> json) =>
      _$EmotionalContextFromJson(json);
}

// Extension for transaction utilities
extension TransactionModelExtension on TransactionModel {
  /// Returns signed amount (negative for expenses)
  double get signedAmount {
    return type == TransactionType.expense ? -amount : amount;
  }

  /// Display amount with currency symbol
  String get formattedAmount {
    final symbol = currency == 'USD' ? '\$' : currency;
    final sign = type == TransactionType.expense ? '-' : '+';
    return '$sign$symbol${amount.toStringAsFixed(2)}';
  }

  /// Short formatted date
  String get formattedDate {
    return '${date.month}/${date.day}/${date.year}';
  }

  /// Check if transaction is from today
  bool get isToday {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Check if transaction is from this week
  bool get isThisWeek {
    final now = DateTime.now();
    final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    return date.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
        date.isBefore(endOfWeek.add(const Duration(days: 1)));
  }

  /// Check if transaction is from this month
  bool get isThisMonth {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month;
  }
}

// Helper functions for Timestamp conversion
DateTime _timestampFromJsonRequired(dynamic value) {
  if (value is Timestamp) return value.toDate();
  if (value is String) return DateTime.parse(value);
  return DateTime.now();
}

DateTime? _timestampFromJson(dynamic value) {
  if (value == null) return null;
  if (value is Timestamp) return value.toDate();
  if (value is String) return DateTime.parse(value);
  return null;
}

dynamic _timestampToJson(DateTime? dateTime) {
  return dateTime?.toIso8601String();
}
