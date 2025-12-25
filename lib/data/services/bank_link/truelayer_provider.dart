import '../../../core/enums/enums.dart';
import 'bank_link_provider.dart';

/// TrueLayer implementation of BankLinkProvider
/// Supports: UK, Ireland, Spain, France, Germany, Italy, and more EU countries
class TrueLayerProvider implements BankLinkProvider {
  TrueLayerProvider();

  String? _clientId;
  String? _clientSecret;
  String _environment = 'sandbox'; // sandbox, production

  @override
  BankLinkProviderType get providerType => BankLinkProviderType.trueLayer;

  @override
  String get displayName => 'TrueLayer';

  @override
  List<BankLinkRegion> get supportedRegions => [
        BankLinkRegion.uk,
        BankLinkRegion.europe,
      ];

  @override
  Future<void> initialize({
    required String clientId,
    required String secret,
    String? environment,
  }) async {
    _clientId = clientId;
    _clientSecret = secret;
    _environment = environment ?? 'sandbox';

    // TODO: Initialize TrueLayer SDK
  }

  @override
  bool get isConfigured => _clientId != null && _clientSecret != null;

  @override
  Future<BankLinkResult> launchLinkFlow({
    required String userId,
    String? institutionId,
  }) async {
    if (!isConfigured) {
      return BankLinkResult.failure(
        error: 'TrueLayer is not configured. Please set up your API keys.',
        errorCode: 'NOT_CONFIGURED',
      );
    }

    try {
      // TODO: Implement actual TrueLayer Link flow
      // 1. Create auth link via backend API
      // 2. Open TrueLayer auth in webview/browser
      // 3. Handle callback with authorization code
      // 4. Exchange code for access token
      // 5. Return account data

      return BankLinkResult.failure(
        error: 'TrueLayer integration not yet implemented. Coming soon!',
        errorCode: 'NOT_IMPLEMENTED',
      );
    } catch (e) {
      return BankLinkResult.failure(
        error: 'Failed to link account: $e',
        errorCode: 'LINK_ERROR',
      );
    }
  }

  @override
  Future<List<LinkedAccountData>> getAccounts({
    required String accessToken,
  }) async {
    // TODO: Implement TrueLayer accounts API call
    // GET https://api.truelayer.com/data/v1/accounts
    return [];
  }

  @override
  Future<List<ProviderTransactionData>> getTransactions({
    required String accessToken,
    required String accountId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    // TODO: Implement TrueLayer transactions API call
    // GET https://api.truelayer.com/data/v1/accounts/{account_id}/transactions
    return [];
  }

  @override
  Future<List<LinkedAccountData>> refreshBalances({
    required String accessToken,
  }) async {
    return getAccounts(accessToken: accessToken);
  }

  @override
  Future<List<InstitutionData>> searchInstitutions({
    required String query,
    List<String>? countryCodes,
  }) async {
    // TODO: Implement TrueLayer providers API call
    // Return mock data for now
    return _getMockInstitutions(query, countryCodes);
  }

  @override
  Future<InstitutionData?> getInstitution({
    required String institutionId,
  }) async {
    return null;
  }

  @override
  Future<bool> unlinkAccount({
    required String accessToken,
  }) async {
    // TrueLayer tokens expire, so unlinking is done by deleting stored token
    return true;
  }

  @override
  Future<bool> isLinkValid({
    required String accessToken,
  }) async {
    try {
      // TODO: Check token validity via TrueLayer API
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Map TrueLayer account type to our AccountType enum
  AccountType _mapAccountType(String trueLayerType) {
    switch (trueLayerType.toLowerCase()) {
      case 'current':
        return AccountType.checking;
      case 'savings':
        return AccountType.savings;
      case 'credit_card':
        return AccountType.creditCard;
      case 'loan':
        return AccountType.loan;
      case 'investment':
        return AccountType.investment;
      default:
        return AccountType.other;
    }
  }

  /// Mock institutions for development/demo
  List<InstitutionData> _getMockInstitutions(
      String query, List<String>? countryCodes) {
    final allInstitutions = [
      // UK Banks
      const InstitutionData(
        id: 'tl_uk_barclays',
        name: 'Barclays',
        logo: null,
        primaryColor: '#00AEEF',
        url: 'https://www.barclays.co.uk',
        countryCodes: ['GB'],
      ),
      const InstitutionData(
        id: 'tl_uk_hsbc',
        name: 'HSBC UK',
        logo: null,
        primaryColor: '#DB0011',
        url: 'https://www.hsbc.co.uk',
        countryCodes: ['GB'],
      ),
      const InstitutionData(
        id: 'tl_uk_lloyds',
        name: 'Lloyds Bank',
        logo: null,
        primaryColor: '#006A4D',
        url: 'https://www.lloydsbank.com',
        countryCodes: ['GB'],
      ),
      const InstitutionData(
        id: 'tl_uk_natwest',
        name: 'NatWest',
        logo: null,
        primaryColor: '#5B2D8C',
        url: 'https://www.natwest.com',
        countryCodes: ['GB'],
      ),
      const InstitutionData(
        id: 'tl_uk_santander',
        name: 'Santander UK',
        logo: null,
        primaryColor: '#EC0000',
        url: 'https://www.santander.co.uk',
        countryCodes: ['GB'],
      ),
      const InstitutionData(
        id: 'tl_uk_monzo',
        name: 'Monzo',
        logo: null,
        primaryColor: '#14233C',
        url: 'https://www.monzo.com',
        countryCodes: ['GB'],
      ),
      const InstitutionData(
        id: 'tl_uk_revolut',
        name: 'Revolut',
        logo: null,
        primaryColor: '#0075EB',
        url: 'https://www.revolut.com',
        countryCodes: ['GB', 'EU'],
      ),
      const InstitutionData(
        id: 'tl_uk_starling',
        name: 'Starling Bank',
        logo: null,
        primaryColor: '#6935D3',
        url: 'https://www.starlingbank.com',
        countryCodes: ['GB'],
      ),
      // EU Banks
      const InstitutionData(
        id: 'tl_eu_ing',
        name: 'ING',
        logo: null,
        primaryColor: '#FF6200',
        url: 'https://www.ing.com',
        countryCodes: ['NL', 'DE', 'ES', 'FR'],
      ),
      const InstitutionData(
        id: 'tl_eu_deutsche',
        name: 'Deutsche Bank',
        logo: null,
        primaryColor: '#0018A8',
        url: 'https://www.db.com',
        countryCodes: ['DE'],
      ),
      const InstitutionData(
        id: 'tl_eu_bnp',
        name: 'BNP Paribas',
        logo: null,
        primaryColor: '#00915A',
        url: 'https://www.bnpparibas.com',
        countryCodes: ['FR'],
      ),
      const InstitutionData(
        id: 'tl_eu_bbva',
        name: 'BBVA',
        logo: null,
        primaryColor: '#004481',
        url: 'https://www.bbva.es',
        countryCodes: ['ES'],
      ),
      const InstitutionData(
        id: 'tl_ie_aib',
        name: 'AIB',
        logo: null,
        primaryColor: '#6D2077',
        url: 'https://www.aib.ie',
        countryCodes: ['IE'],
      ),
      const InstitutionData(
        id: 'tl_ie_boi',
        name: 'Bank of Ireland',
        logo: null,
        primaryColor: '#005837',
        url: 'https://www.bankofireland.com',
        countryCodes: ['IE'],
      ),
    ];

    var filtered = allInstitutions;

    // Filter by country codes if provided
    if (countryCodes != null && countryCodes.isNotEmpty) {
      filtered = filtered
          .where((i) =>
              i.countryCodes.any((c) => countryCodes.contains(c.toUpperCase())))
          .toList();
    }

    // Filter by query
    if (query.isNotEmpty) {
      filtered = filtered
          .where((i) => i.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    return filtered;
  }
}
