import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:plaid_flutter/plaid_flutter.dart';
import 'package:dio/dio.dart';

import '../../../core/config/env_config.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/enums/enums.dart';
import 'bank_link_provider.dart';

/// Plaid implementation of BankLinkProvider
/// Supports: USA, Canada, UK, Ireland, France, Spain, Netherlands, Germany
class PlaidProvider implements BankLinkProvider {
  PlaidProvider({Dio? dio, bool autoInitialize = true}) : _dio = dio ?? Dio() {
    if (autoInitialize && EnvConfig.isPlaidConfigured) {
      _initializeFromEnv();
    }
  }

  final Dio _dio;

  String? _clientId;
  String? _secret;
  String _environment = 'sandbox'; // sandbox, development, production
  String? _baseUrl;

  /// Initialize from environment configuration
  void _initializeFromEnv() {
    _clientId = EnvConfig.plaidClientId;
    _secret = EnvConfig.plaidSecret;
    _environment = EnvConfig.plaidEnv;
    _baseUrl = _environment == 'production'
        ? ApiConstants.plaidBaseUrl
        : ApiConstants.plaidSandboxUrl;
    debugPrint('PlaidProvider initialized from EnvConfig (env: $_environment)');
  }

  @override
  BankLinkProviderType get providerType => BankLinkProviderType.plaid;

  @override
  String get displayName => 'Plaid';

  @override
  List<BankLinkRegion> get supportedRegions => [
        BankLinkRegion.usa,
        BankLinkRegion.canada,
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
    _secret = secret;
    _environment = environment ?? 'sandbox';

    // Set base URL based on environment
    _baseUrl = _environment == 'production'
        ? ApiConstants.plaidBaseUrl
        : ApiConstants.plaidSandboxUrl;
  }

  @override
  bool get isConfigured => _clientId != null && _secret != null;

  /// Create a link token for Plaid Link
  Future<String?> createLinkToken({
    required String userId,
    String? accessToken, // For update mode
    String? institutionId,
  }) async {
    if (!isConfigured) return null;

    try {
      final response = await _dio.post(
        '$_baseUrl/link/token/create',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
        data: jsonEncode({
          'client_id': _clientId,
          'secret': _secret,
          'client_name': 'BudgetBot',
          'user': {'client_user_id': userId},
          'products': EnvConfig.plaidProducts,
          'country_codes': EnvConfig.plaidCountryCodes,
          'language': 'en',
          if (accessToken != null) 'access_token': accessToken,
          if (institutionId != null) 'institution_id': institutionId,
        }),
      );

      if (response.statusCode == 200) {
        return response.data['link_token'];
      }
      return null;
    } catch (e) {
      debugPrint('Error creating link token: $e');
      return null;
    }
  }

  /// Exchange public token for access token
  Future<String?> exchangePublicToken(String publicToken) async {
    if (!isConfigured) return null;

    try {
      final response = await _dio.post(
        '$_baseUrl/item/public_token/exchange',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({
          'client_id': _clientId,
          'secret': _secret,
          'public_token': publicToken,
        }),
      );

      if (response.statusCode == 200) {
        return response.data['access_token'];
      }
      return null;
    } catch (e) {
      debugPrint('Error exchanging public token: $e');
      return null;
    }
  }

  @override
  Future<BankLinkResult> launchLinkFlow({
    required String userId,
    String? institutionId,
  }) async {
    if (!isConfigured) {
      return BankLinkResult.failure(
        error: 'Plaid is not configured. Please set up your API keys.',
        errorCode: 'NOT_CONFIGURED',
      );
    }

    try {
      // Create link token
      final linkToken = await createLinkToken(
        userId: userId,
        institutionId: institutionId,
      );

      if (linkToken == null) {
        return BankLinkResult.failure(
          error: 'Failed to create link token',
          errorCode: 'LINK_TOKEN_ERROR',
        );
      }

      // Create Plaid Link configuration
      final configuration = LinkTokenConfiguration(token: linkToken);

      // Launch Plaid Link and wait for result
      final result = await _launchPlaidLink(configuration);

      if (result == null) {
        return BankLinkResult.failure(
          error: 'Link flow was cancelled',
          errorCode: 'USER_CANCELLED',
        );
      }

      // Exchange public token for access token
      final accessToken = await exchangePublicToken(result.publicToken);

      if (accessToken == null) {
        return BankLinkResult.failure(
          error: 'Failed to exchange token',
          errorCode: 'TOKEN_EXCHANGE_ERROR',
        );
      }

      // Get accounts
      final accounts = await getAccounts(accessToken: accessToken);

      return BankLinkResult.success(
        accounts: accounts,
        accessToken: accessToken,
        institutionId: result.metadata.institution?.id,
        institutionName: result.metadata.institution?.name,
      );
    } catch (e) {
      return BankLinkResult.failure(
        error: 'Failed to link account: $e',
        errorCode: 'LINK_ERROR',
      );
    }
  }

  /// Launch Plaid Link and return success result
  Future<LinkSuccess?> _launchPlaidLink(LinkTokenConfiguration configuration) async {
    LinkSuccess? successResult;
    bool completed = false;

    // Set up stream listeners
    PlaidLink.onSuccess.listen((success) {
      successResult = success;
      completed = true;
    });

    PlaidLink.onExit.listen((exit) {
      if (!completed) {
        completed = true;
      }
    });

    PlaidLink.onEvent.listen((event) {
      debugPrint('Plaid Event: ${event.name}');
    });

    // Open Plaid Link
    PlaidLink.open(configuration: configuration);

    // Wait for completion (with timeout)
    final startTime = DateTime.now();
    while (!completed) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (DateTime.now().difference(startTime).inMinutes > 10) {
        break; // 10 minute timeout
      }
    }

    return successResult;
  }

  @override
  Future<List<LinkedAccountData>> getAccounts({
    required String accessToken,
  }) async {
    if (!isConfigured) return [];

    try {
      final response = await _dio.post(
        '$_baseUrl/accounts/get',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({
          'client_id': _clientId,
          'secret': _secret,
          'access_token': accessToken,
        }),
      );

      if (response.statusCode == 200) {
        final accounts = response.data['accounts'] as List;
        final item = response.data['item'];

        return accounts.map((a) => LinkedAccountData(
          providerAccountId: a['account_id'],
          name: a['name'] ?? a['official_name'] ?? 'Account',
          type: _mapAccountType(a['type']),
          subtype: a['subtype'],
          mask: a['mask'],
          currentBalance: (a['balances']['current'] ?? 0).toDouble(),
          availableBalance: (a['balances']['available'] ?? 0).toDouble(),
          currency: a['balances']['iso_currency_code'] ?? 'USD',
          institutionId: item?['institution_id'],
        )).toList();
      }
      return [];
    } catch (e) {
      debugPrint('Error getting accounts: $e');
      return [];
    }
  }

  @override
  Future<List<ProviderTransactionData>> getTransactions({
    required String accessToken,
    required String accountId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    if (!isConfigured) return [];

    final start = startDate ?? DateTime.now().subtract(const Duration(days: 30));
    final end = endDate ?? DateTime.now();

    try {
      final response = await _dio.post(
        '$_baseUrl/transactions/get',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({
          'client_id': _clientId,
          'secret': _secret,
          'access_token': accessToken,
          'start_date': _formatDate(start),
          'end_date': _formatDate(end),
          'options': {
            'account_ids': [accountId],
            'count': 500,
          },
        }),
      );

      if (response.statusCode == 200) {
        final transactions = response.data['transactions'] as List;

        return transactions.map((t) => ProviderTransactionData(
          providerTransactionId: t['transaction_id'],
          accountId: t['account_id'],
          amount: (t['amount'] ?? 0).toDouble(),
          date: DateTime.parse(t['date']),
          name: t['name'] ?? '',
          merchantName: t['merchant_name'],
          category: (t['category'] as List?)?.firstOrNull,
          pending: t['pending'] ?? false,
          currency: t['iso_currency_code'] ?? 'USD',
          location: t['location'] != null ? {
            'address': t['location']['address'],
            'city': t['location']['city'],
            'region': t['location']['region'],
            'postal_code': t['location']['postal_code'],
            'country': t['location']['country'],
            'lat': t['location']['lat'],
            'lon': t['location']['lon'],
          } : null,
        )).toList();
      }
      return [];
    } catch (e) {
      debugPrint('Error getting transactions: $e');
      return [];
    }
  }

  /// Get all transactions for historical import (up to 24 months)
  Future<List<ProviderTransactionData>> getAllTransactions({
    required String accessToken,
    int monthsBack = 24,
  }) async {
    if (!isConfigured) return [];

    final allTransactions = <ProviderTransactionData>[];
    final endDate = DateTime.now();
    final startDate = DateTime(
      endDate.year - (monthsBack ~/ 12),
      endDate.month - (monthsBack % 12),
      endDate.day,
    );

    String? cursor;
    bool hasMore = true;

    try {
      // First, sync transactions to get latest data
      await _syncTransactions(accessToken);

      // Then use pagination to get all transactions
      while (hasMore) {
        final response = await _dio.post(
          '$_baseUrl/transactions/sync',
          options: Options(
            headers: {'Content-Type': 'application/json'},
          ),
          data: jsonEncode({
            'client_id': _clientId,
            'secret': _secret,
            'access_token': accessToken,
            if (cursor != null) 'cursor': cursor,
            'count': 500,
          }),
        );

        if (response.statusCode == 200) {
          final added = response.data['added'] as List? ?? [];
          final modified = response.data['modified'] as List? ?? [];

          for (final t in [...added, ...modified]) {
            final txDate = DateTime.parse(t['date']);
            if (txDate.isAfter(startDate)) {
              allTransactions.add(ProviderTransactionData(
                providerTransactionId: t['transaction_id'],
                accountId: t['account_id'],
                amount: (t['amount'] ?? 0).toDouble(),
                date: txDate,
                name: t['name'] ?? '',
                merchantName: t['merchant_name'],
                category: (t['category'] as List?)?.firstOrNull,
                pending: t['pending'] ?? false,
                currency: t['iso_currency_code'] ?? 'USD',
                location: t['location'] != null ? {
                  'address': t['location']['address'],
                  'city': t['location']['city'],
                  'region': t['location']['region'],
                  'postal_code': t['location']['postal_code'],
                  'country': t['location']['country'],
                  'lat': t['location']['lat'],
                  'lon': t['location']['lon'],
                } : null,
              ));
            }
          }

          hasMore = response.data['has_more'] ?? false;
          cursor = response.data['next_cursor'];
        } else {
          hasMore = false;
        }
      }
    } catch (e) {
      debugPrint('Error getting all transactions: $e');
    }

    return allTransactions;
  }

  /// Sync transactions to get latest data
  Future<void> _syncTransactions(String accessToken) async {
    try {
      await _dio.post(
        '$_baseUrl/transactions/sync',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({
          'client_id': _clientId,
          'secret': _secret,
          'access_token': accessToken,
        }),
      );
    } catch (e) {
      debugPrint('Error syncing transactions: $e');
    }
  }

  @override
  Future<List<LinkedAccountData>> refreshBalances({
    required String accessToken,
  }) async {
    // Get accounts returns fresh balances
    return getAccounts(accessToken: accessToken);
  }

  @override
  Future<List<InstitutionData>> searchInstitutions({
    required String query,
    List<String>? countryCodes,
  }) async {
    if (!isConfigured) return _getMockInstitutions(query);

    try {
      final response = await _dio.post(
        '$_baseUrl/institutions/search',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({
          'client_id': _clientId,
          'secret': _secret,
          'query': query.isEmpty ? 'bank' : query,
          'products': ['transactions'],
          'country_codes': countryCodes ?? ['US', 'CA', 'GB'],
          'options': {
            'include_optional_metadata': true,
          },
        }),
      );

      if (response.statusCode == 200) {
        final institutions = response.data['institutions'] as List;
        return institutions.map((i) => InstitutionData(
          id: i['institution_id'],
          name: i['name'],
          logo: i['logo'],
          primaryColor: i['primary_color'],
          url: i['url'],
          countryCodes: List<String>.from(i['country_codes'] ?? []),
        )).toList();
      }
      return _getMockInstitutions(query);
    } catch (e) {
      debugPrint('Error searching institutions: $e');
      return _getMockInstitutions(query);
    }
  }

  @override
  Future<InstitutionData?> getInstitution({
    required String institutionId,
  }) async {
    if (!isConfigured) return null;

    try {
      final response = await _dio.post(
        '$_baseUrl/institutions/get_by_id',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({
          'client_id': _clientId,
          'secret': _secret,
          'institution_id': institutionId,
          'country_codes': ['US', 'CA', 'GB'],
          'options': {
            'include_optional_metadata': true,
          },
        }),
      );

      if (response.statusCode == 200) {
        final i = response.data['institution'];
        return InstitutionData(
          id: i['institution_id'],
          name: i['name'],
          logo: i['logo'],
          primaryColor: i['primary_color'],
          url: i['url'],
          countryCodes: List<String>.from(i['country_codes'] ?? []),
        );
      }
      return null;
    } catch (e) {
      debugPrint('Error getting institution: $e');
      return null;
    }
  }

  @override
  Future<bool> unlinkAccount({
    required String accessToken,
  }) async {
    if (!isConfigured) return false;

    try {
      final response = await _dio.post(
        '$_baseUrl/item/remove',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({
          'client_id': _clientId,
          'secret': _secret,
          'access_token': accessToken,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      debugPrint('Error unlinking account: $e');
      return false;
    }
  }

  @override
  Future<bool> isLinkValid({
    required String accessToken,
  }) async {
    if (!isConfigured) return false;

    try {
      final response = await _dio.post(
        '$_baseUrl/item/get',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: jsonEncode({
          'client_id': _clientId,
          'secret': _secret,
          'access_token': accessToken,
        }),
      );

      if (response.statusCode == 200) {
        final item = response.data['item'];
        return item['error'] == null;
      }
      return false;
    } catch (e) {
      debugPrint('Error checking link status: $e');
      return false;
    }
  }

  /// Format date for Plaid API
  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  /// Map Plaid account type to our AccountType enum
  AccountType _mapAccountType(String? plaidType) {
    switch (plaidType?.toLowerCase()) {
      case 'depository':
        return AccountType.checking;
      case 'credit':
        return AccountType.creditCard;
      case 'loan':
        return AccountType.loan;
      case 'investment':
      case 'brokerage':
        return AccountType.investment;
      default:
        return AccountType.other;
    }
  }

  /// Mock institutions for development/demo when API is not configured
  List<InstitutionData> _getMockInstitutions(String query) {
    final allInstitutions = [
      const InstitutionData(
        id: 'ins_1',
        name: 'Chase',
        logo: null,
        primaryColor: '#0066B3',
        url: 'https://www.chase.com',
        countryCodes: ['US'],
      ),
      const InstitutionData(
        id: 'ins_2',
        name: 'Bank of America',
        logo: null,
        primaryColor: '#E31837',
        url: 'https://www.bankofamerica.com',
        countryCodes: ['US'],
      ),
      const InstitutionData(
        id: 'ins_3',
        name: 'Wells Fargo',
        logo: null,
        primaryColor: '#D71E28',
        url: 'https://www.wellsfargo.com',
        countryCodes: ['US'],
      ),
      const InstitutionData(
        id: 'ins_4',
        name: 'Citibank',
        logo: null,
        primaryColor: '#003B70',
        url: 'https://www.citi.com',
        countryCodes: ['US'],
      ),
      const InstitutionData(
        id: 'ins_5',
        name: 'Capital One',
        logo: null,
        primaryColor: '#D03027',
        url: 'https://www.capitalone.com',
        countryCodes: ['US'],
      ),
      const InstitutionData(
        id: 'ins_6',
        name: 'TD Bank',
        logo: null,
        primaryColor: '#34A853',
        url: 'https://www.td.com',
        countryCodes: ['US', 'CA'],
      ),
      const InstitutionData(
        id: 'ins_7',
        name: 'RBC Royal Bank',
        logo: null,
        primaryColor: '#0051A5',
        url: 'https://www.rbc.com',
        countryCodes: ['CA'],
      ),
      const InstitutionData(
        id: 'ins_8',
        name: 'Barclays',
        logo: null,
        primaryColor: '#00AEEF',
        url: 'https://www.barclays.co.uk',
        countryCodes: ['GB'],
      ),
      const InstitutionData(
        id: 'ins_9',
        name: 'HSBC',
        logo: null,
        primaryColor: '#DB0011',
        url: 'https://www.hsbc.com',
        countryCodes: ['GB', 'US'],
      ),
      const InstitutionData(
        id: 'ins_10',
        name: 'Lloyds Bank',
        logo: null,
        primaryColor: '#006A4D',
        url: 'https://www.lloydsbank.com',
        countryCodes: ['GB'],
      ),
    ];

    if (query.isEmpty) return allInstitutions;

    return allInstitutions
        .where((i) => i.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
