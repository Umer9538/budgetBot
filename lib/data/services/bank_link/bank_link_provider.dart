import '../../../core/enums/enums.dart';

/// Supported bank linking providers
enum BankLinkProviderType {
  plaid,
  trueLayer,
  yodlee,
  mx,
  basiq,
  belvo,
  setu,
  manual,
}

/// Supported regions for bank linking
enum BankLinkRegion {
  usa,
  canada,
  uk,
  europe,
  australia,
  india,
  latinAmerica,
  other,
}

extension BankLinkRegionExtension on BankLinkRegion {
  String get displayName {
    switch (this) {
      case BankLinkRegion.usa:
        return 'United States';
      case BankLinkRegion.canada:
        return 'Canada';
      case BankLinkRegion.uk:
        return 'United Kingdom';
      case BankLinkRegion.europe:
        return 'Europe';
      case BankLinkRegion.australia:
        return 'Australia';
      case BankLinkRegion.india:
        return 'India';
      case BankLinkRegion.latinAmerica:
        return 'Latin America';
      case BankLinkRegion.other:
        return 'Other';
    }
  }

  /// Get recommended providers for this region
  List<BankLinkProviderType> get recommendedProviders {
    switch (this) {
      case BankLinkRegion.usa:
        return [BankLinkProviderType.plaid, BankLinkProviderType.mx, BankLinkProviderType.yodlee];
      case BankLinkRegion.canada:
        return [BankLinkProviderType.plaid, BankLinkProviderType.mx];
      case BankLinkRegion.uk:
        return [BankLinkProviderType.trueLayer, BankLinkProviderType.plaid];
      case BankLinkRegion.europe:
        return [BankLinkProviderType.trueLayer, BankLinkProviderType.plaid];
      case BankLinkRegion.australia:
        return [BankLinkProviderType.basiq];
      case BankLinkRegion.india:
        return [BankLinkProviderType.setu];
      case BankLinkRegion.latinAmerica:
        return [BankLinkProviderType.belvo];
      case BankLinkRegion.other:
        return [BankLinkProviderType.manual];
    }
  }
}

/// Result of a bank link operation
class BankLinkResult {
  const BankLinkResult({
    required this.success,
    this.accounts,
    this.accessToken,
    this.institutionId,
    this.institutionName,
    this.error,
    this.errorCode,
  });

  final bool success;
  final List<LinkedAccountData>? accounts;
  final String? accessToken;
  final String? institutionId;
  final String? institutionName;
  final String? error;
  final String? errorCode;

  factory BankLinkResult.success({
    required List<LinkedAccountData> accounts,
    String? accessToken,
    String? institutionId,
    String? institutionName,
  }) {
    return BankLinkResult(
      success: true,
      accounts: accounts,
      accessToken: accessToken,
      institutionId: institutionId,
      institutionName: institutionName,
    );
  }

  factory BankLinkResult.failure({
    required String error,
    String? errorCode,
  }) {
    return BankLinkResult(
      success: false,
      error: error,
      errorCode: errorCode,
    );
  }
}

/// Data for a linked account from a provider
class LinkedAccountData {
  const LinkedAccountData({
    required this.providerAccountId,
    required this.name,
    required this.type,
    this.subtype,
    this.mask,
    this.currentBalance = 0.0,
    this.availableBalance = 0.0,
    this.currency = 'USD',
    this.institutionId,
    this.institutionName,
  });

  final String providerAccountId;
  final String name;
  final AccountType type;
  final String? subtype;
  final String? mask;
  final double currentBalance;
  final double availableBalance;
  final String currency;
  final String? institutionId;
  final String? institutionName;
}

/// Institution data from provider
class InstitutionData {
  const InstitutionData({
    required this.id,
    required this.name,
    this.logo,
    this.primaryColor,
    this.url,
    this.countryCodes = const [],
  });

  final String id;
  final String name;
  final String? logo;
  final String? primaryColor;
  final String? url;
  final List<String> countryCodes;
}

/// Transaction data from provider
class ProviderTransactionData {
  const ProviderTransactionData({
    required this.providerTransactionId,
    required this.accountId,
    required this.amount,
    required this.date,
    required this.name,
    this.merchantName,
    this.category,
    this.pending = false,
    this.currency = 'USD',
    this.location,
  });

  final String providerTransactionId;
  final String accountId;
  final double amount;
  final DateTime date;
  final String name;
  final String? merchantName;
  final String? category;
  final bool pending;
  final String currency;
  final Map<String, dynamic>? location;
}

/// Abstract interface for bank linking providers
abstract class BankLinkProvider {
  /// Provider type identifier
  BankLinkProviderType get providerType;

  /// Display name for the provider
  String get displayName;

  /// Supported regions
  List<BankLinkRegion> get supportedRegions;

  /// Initialize the provider with credentials
  Future<void> initialize({
    required String clientId,
    required String secret,
    String? environment,
  });

  /// Check if the provider is properly configured
  bool get isConfigured;

  /// Launch the bank linking flow
  /// Returns a BankLinkResult with account data on success
  Future<BankLinkResult> launchLinkFlow({
    required String userId,
    String? institutionId,
  });

  /// Get accounts for an existing link
  Future<List<LinkedAccountData>> getAccounts({
    required String accessToken,
  });

  /// Get transactions for an account
  Future<List<ProviderTransactionData>> getTransactions({
    required String accessToken,
    required String accountId,
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Refresh account balances
  Future<List<LinkedAccountData>> refreshBalances({
    required String accessToken,
  });

  /// Search for institutions
  Future<List<InstitutionData>> searchInstitutions({
    required String query,
    List<String>? countryCodes,
  });

  /// Get institution by ID
  Future<InstitutionData?> getInstitution({
    required String institutionId,
  });

  /// Remove a linked account
  Future<bool> unlinkAccount({
    required String accessToken,
  });

  /// Check if the link is still valid
  Future<bool> isLinkValid({
    required String accessToken,
  });
}
