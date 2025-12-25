import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/enums.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    required String id,
    required String userId,
    String? plaidAccountId,
    required String institutionName,
    required AccountType accountType,
    required String accountName,
    String? mask,
    @Default(0.0) double currentBalance,
    @Default(0.0) double availableBalance,
    @Default('USD') String currency,
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? lastSynced,
    @Default(true) bool isActive,
    @Default(false) bool isManual,
    @Default(false) bool isLinked, // Whether account is linked via bank provider
    String? institutionLogo,
    String? institutionId, // Provider institution ID
    String? providerAccountId, // Account ID from provider (Plaid, etc.)
    String? providerType, // Provider type name (e.g., 'plaid', 'trueLayer')
    String? accessToken, // Access token for provider API
    @JsonKey(fromJson: _timestampFromJson, toJson: _timestampToJson)
    DateTime? createdAt,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  factory AccountModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return AccountModel.fromJson({...data, 'id': doc.id});
  }
}

// Extension for account utilities
extension AccountModelExtension on AccountModel {
  /// Display balance formatted with currency symbol
  String get formattedBalance {
    final symbol = currency == 'USD' ? '\$' : currency;
    return '$symbol${currentBalance.toStringAsFixed(2)}';
  }

  /// Account display name with last 4 digits
  String get displayName {
    if (mask != null && mask!.isNotEmpty) {
      return '$accountName ••••$mask';
    }
    return accountName;
  }

  /// Check if account needs refresh
  bool get needsSync {
    if (lastSynced == null) return true;
    final hoursSinceSync = DateTime.now().difference(lastSynced!).inHours;
    return hoursSinceSync >= 4;
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
