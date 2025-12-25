import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bank_link_provider.dart';
import 'plaid_provider.dart';
import 'truelayer_provider.dart';

/// Configuration for bank link providers
class BankLinkConfig {
  const BankLinkConfig({
    this.plaidClientId,
    this.plaidSecret,
    this.plaidEnvironment,
    this.trueLayerClientId,
    this.trueLayerClientSecret,
    this.trueLayerEnvironment,
    this.defaultRegion = BankLinkRegion.usa,
  });

  final String? plaidClientId;
  final String? plaidSecret;
  final String? plaidEnvironment;
  final String? trueLayerClientId;
  final String? trueLayerClientSecret;
  final String? trueLayerEnvironment;
  final BankLinkRegion defaultRegion;

  /// Create config from environment variables or secure storage
  factory BankLinkConfig.fromEnvironment() {
    // TODO: Load from secure storage or environment
    return const BankLinkConfig();
  }
}

/// Service that manages multiple bank link providers
class BankLinkService {
  BankLinkService({BankLinkConfig? config}) : _config = config ?? const BankLinkConfig() {
    _initializeProviders();
  }

  final BankLinkConfig _config;
  final Map<BankLinkProviderType, BankLinkProvider> _providers = {};
  BankLinkRegion _currentRegion = BankLinkRegion.usa;

  /// Initialize all available providers
  Future<void> _initializeProviders() async {
    // Register Plaid
    final plaidProvider = PlaidProvider();
    if (_config.plaidClientId != null && _config.plaidSecret != null) {
      await plaidProvider.initialize(
        clientId: _config.plaidClientId!,
        secret: _config.plaidSecret!,
        environment: _config.plaidEnvironment,
      );
    }
    _providers[BankLinkProviderType.plaid] = plaidProvider;

    // Register TrueLayer
    final trueLayerProvider = TrueLayerProvider();
    if (_config.trueLayerClientId != null &&
        _config.trueLayerClientSecret != null) {
      await trueLayerProvider.initialize(
        clientId: _config.trueLayerClientId!,
        secret: _config.trueLayerClientSecret!,
        environment: _config.trueLayerEnvironment,
      );
    }
    _providers[BankLinkProviderType.trueLayer] = trueLayerProvider;

    _currentRegion = _config.defaultRegion;
  }

  /// Get current region
  BankLinkRegion get currentRegion => _currentRegion;

  /// Set current region
  void setRegion(BankLinkRegion region) {
    _currentRegion = region;
  }

  /// Get all registered providers
  List<BankLinkProvider> get allProviders => _providers.values.toList();

  /// Get providers available for current region
  List<BankLinkProvider> get availableProviders {
    return _providers.values
        .where((p) => p.supportedRegions.contains(_currentRegion))
        .toList();
  }

  /// Get providers available for a specific region
  List<BankLinkProvider> getProvidersForRegion(BankLinkRegion region) {
    return _providers.values
        .where((p) => p.supportedRegions.contains(region))
        .toList();
  }

  /// Get recommended provider for current region
  BankLinkProvider? get recommendedProvider {
    final recommended = _currentRegion.recommendedProviders;
    for (final providerType in recommended) {
      final provider = _providers[providerType];
      if (provider != null && provider.supportedRegions.contains(_currentRegion)) {
        return provider;
      }
    }
    return availableProviders.isNotEmpty ? availableProviders.first : null;
  }

  /// Get specific provider by type
  BankLinkProvider? getProvider(BankLinkProviderType type) {
    return _providers[type];
  }

  /// Check if any provider is available for current region
  bool get hasAvailableProviders => availableProviders.isNotEmpty;

  /// Launch bank linking with recommended provider
  Future<BankLinkResult> launchLinkFlow({
    required String userId,
    BankLinkProviderType? preferredProvider,
    String? institutionId,
  }) async {
    BankLinkProvider? provider;

    if (preferredProvider != null) {
      provider = _providers[preferredProvider];
      if (provider != null && !provider.supportedRegions.contains(_currentRegion)) {
        return BankLinkResult.failure(
          error: '${provider.displayName} is not available in your region.',
          errorCode: 'REGION_NOT_SUPPORTED',
        );
      }
    }

    provider ??= recommendedProvider;

    if (provider == null) {
      return BankLinkResult.failure(
        error: 'No bank linking provider is available for your region.',
        errorCode: 'NO_PROVIDER_AVAILABLE',
      );
    }

    return provider.launchLinkFlow(
      userId: userId,
      institutionId: institutionId,
    );
  }

  /// Search institutions across all available providers
  Future<List<InstitutionSearchResult>> searchInstitutions({
    required String query,
    List<String>? countryCodes,
  }) async {
    final results = <InstitutionSearchResult>[];

    for (final provider in availableProviders) {
      try {
        final institutions = await provider.searchInstitutions(
          query: query,
          countryCodes: countryCodes,
        );
        results.addAll(institutions.map((i) => InstitutionSearchResult(
              institution: i,
              provider: provider.providerType,
            )));
      } catch (e) {
        // Skip provider on error
      }
    }

    return results;
  }

  /// Get transactions from a linked account
  Future<List<ProviderTransactionData>> getTransactions({
    required BankLinkProviderType providerType,
    required String accessToken,
    required String accountId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final provider = _providers[providerType];
    if (provider == null) {
      return [];
    }

    return provider.getTransactions(
      accessToken: accessToken,
      accountId: accountId,
      startDate: startDate,
      endDate: endDate,
    );
  }

  /// Refresh account balances
  Future<List<LinkedAccountData>> refreshBalances({
    required BankLinkProviderType providerType,
    required String accessToken,
  }) async {
    final provider = _providers[providerType];
    if (provider == null) {
      return [];
    }

    return provider.refreshBalances(accessToken: accessToken);
  }

  /// Unlink an account
  Future<bool> unlinkAccount({
    required BankLinkProviderType providerType,
    required String accessToken,
  }) async {
    final provider = _providers[providerType];
    if (provider == null) {
      return false;
    }

    return provider.unlinkAccount(accessToken: accessToken);
  }
}

/// Search result with provider information
class InstitutionSearchResult {
  const InstitutionSearchResult({
    required this.institution,
    required this.provider,
  });

  final InstitutionData institution;
  final BankLinkProviderType provider;
}

/// Riverpod provider for BankLinkService
final bankLinkServiceProvider = Provider<BankLinkService>((ref) {
  // TODO: Load config from secure storage
  return BankLinkService();
});

/// Provider for current region
final bankLinkRegionProvider = StateProvider<BankLinkRegion>((ref) {
  return BankLinkRegion.usa;
});

/// Provider for available providers in current region
final availableProvidersProvider = Provider<List<BankLinkProvider>>((ref) {
  final service = ref.watch(bankLinkServiceProvider);
  final region = ref.watch(bankLinkRegionProvider);
  return service.getProvidersForRegion(region);
});
