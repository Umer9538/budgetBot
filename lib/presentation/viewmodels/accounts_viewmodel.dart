import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/enums/enums.dart';
import '../../data/models/models.dart';
import '../../data/repositories/account_repository.dart';
import '../../data/services/bank_link/bank_link.dart';
import '../../data/services/sync/background_sync_service.dart';
import 'auth_viewmodel.dart';

/// State for accounts
class AccountsState {
  const AccountsState({
    this.accounts = const [],
    this.isLoading = false,
    this.error,
    this.summary,
  });

  final List<AccountModel> accounts;
  final bool isLoading;
  final String? error;
  final AccountSummary? summary;

  AccountsState copyWith({
    List<AccountModel>? accounts,
    bool? isLoading,
    String? error,
    AccountSummary? summary,
  }) {
    return AccountsState(
      accounts: accounts ?? this.accounts,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      summary: summary ?? this.summary,
    );
  }
}

/// ViewModel for accounts
class AccountsViewModel extends StateNotifier<AccountsState> {
  AccountsViewModel({
    required String userId,
    AccountRepository? repository,
  })  : _userId = userId,
        _repository = repository ?? AccountRepository(),
        super(const AccountsState()) {
    _init();
  }

  final String _userId;
  final AccountRepository _repository;
  StreamSubscription? _subscription;

  void _init() {
    _loadAccounts();
    _loadSummary();
  }

  void _loadAccounts() {
    state = state.copyWith(isLoading: true);
    _subscription?.cancel();
    _subscription = _repository.watchAccounts(_userId).listen(
      (accounts) {
        state = state.copyWith(
          accounts: accounts,
          isLoading: false,
        );
      },
      onError: (error) {
        state = state.copyWith(
          isLoading: false,
          error: 'Failed to load accounts',
        );
      },
    );
  }

  Future<void> _loadSummary() async {
    try {
      final summary = await _repository.getAccountSummary(_userId);
      state = state.copyWith(summary: summary);
    } catch (e) {
      // Ignore summary errors
    }
  }

  /// Create a manual account
  Future<bool> createManualAccount({
    required String accountName,
    required AccountType accountType,
    double currentBalance = 0.0,
    String institution = 'Manual',
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.createAccount(
        userId: _userId,
        institutionName: institution,
        accountName: accountName,
        accountType: accountType,
        currentBalance: currentBalance,
        isManual: true,
      );
      await _loadSummary();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to create account',
      );
      return false;
    }
  }

  /// Link account via Plaid with full flow
  Future<LinkAccountResult> linkBankAccount({
    BankLinkProviderType? preferredProvider,
    String? institutionId,
    bool importHistory = true,
    int historyMonths = 24,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final bankLinkService = BankLinkService();

      // Launch the bank link flow
      final result = await bankLinkService.launchLinkFlow(
        userId: _userId,
        preferredProvider: preferredProvider,
        institutionId: institutionId,
      );

      if (!result.success || result.accounts == null) {
        state = state.copyWith(
          isLoading: false,
          error: result.error ?? 'Failed to link account',
        );
        return LinkAccountResult(
          success: false,
          error: result.error,
        );
      }

      // Create accounts in Firestore
      int accountsLinked = 0;
      int transactionsImported = 0;

      for (final linkedAccount in result.accounts!) {
        // Create the account
        final accountId = await _repository.createAccount(
          userId: _userId,
          institutionName: result.institutionName ?? linkedAccount.institutionName ?? 'Unknown',
          accountName: linkedAccount.name,
          accountType: linkedAccount.type,
          mask: linkedAccount.mask,
          currentBalance: linkedAccount.currentBalance,
          availableBalance: linkedAccount.availableBalance,
          providerAccountId: linkedAccount.providerAccountId,
          providerType: (preferredProvider ?? BankLinkProviderType.plaid).name,
          accessToken: result.accessToken,
          institutionId: result.institutionId,
          isManual: false,
        );

        accountsLinked++;

        // Import historical transactions if requested
        if (importHistory && result.accessToken != null && accountId != null) {
          try {
            final account = AccountModel(
              id: accountId,
              userId: _userId,
              institutionName: result.institutionName ?? 'Unknown',
              accountName: linkedAccount.name,
              accountType: linkedAccount.type,
              currentBalance: linkedAccount.currentBalance,
              providerAccountId: linkedAccount.providerAccountId,
              providerType: (preferredProvider ?? BankLinkProviderType.plaid).name,
              accessToken: result.accessToken,
            );

            final syncService = BackgroundSyncService();
            final imported = await syncService.importHistoricalTransactions(
              userId: _userId,
              account: account,
              monthsBack: historyMonths,
            );
            transactionsImported += imported;
          } catch (e) {
            debugPrint('Error importing history for account: $e');
          }
        }
      }

      // Schedule background sync for this user
      final syncService = BackgroundSyncService();
      await syncService.schedulePeriodicSync(userId: _userId);

      await _loadSummary();
      state = state.copyWith(isLoading: false);

      return LinkAccountResult(
        success: true,
        accountsLinked: accountsLinked,
        transactionsImported: transactionsImported,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to link account: $e',
      );
      return LinkAccountResult(
        success: false,
        error: e.toString(),
      );
    }
  }

  /// Link account via Plaid (simple version)
  Future<bool> linkPlaidAccount({
    required String plaidAccountId,
    required String institutionName,
    required String accountName,
    required AccountType accountType,
    String? mask,
    double currentBalance = 0.0,
    double availableBalance = 0.0,
    String? accessToken,
    String? providerType,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.createAccount(
        userId: _userId,
        institutionName: institutionName,
        accountName: accountName,
        accountType: accountType,
        mask: mask,
        currentBalance: currentBalance,
        availableBalance: availableBalance,
        providerAccountId: plaidAccountId,
        accessToken: accessToken,
        providerType: providerType ?? 'plaid',
        isManual: false,
      );
      await _loadSummary();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to link account',
      );
      return false;
    }
  }

  /// Update account
  Future<bool> updateAccount({
    required String accountId,
    String? accountName,
    double? currentBalance,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.updateAccount(
        userId: _userId,
        accountId: accountId,
        accountName: accountName,
        currentBalance: currentBalance,
      );
      await _loadSummary();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to update account',
      );
      return false;
    }
  }

  /// Delete account
  Future<bool> deleteAccount(String accountId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.deleteAccount(_userId, accountId);
      await _loadSummary();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to delete account',
      );
      return false;
    }
  }

  /// Sync account (update last synced time)
  Future<void> syncAccount(String accountId) async {
    await _repository.updateAccount(
      userId: _userId,
      accountId: accountId,
      lastSynced: DateTime.now(),
    );
  }

  /// Get accounts by type
  List<AccountModel> getAccountsByType(AccountType type) {
    return state.accounts.where((a) => a.accountType == type).toList();
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Refresh data
  Future<void> refresh() async {
    _loadAccounts();
    await _loadSummary();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

/// Provider for AccountsViewModel
final accountsViewModelProvider =
    StateNotifierProvider.autoDispose<AccountsViewModel, AccountsState>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) {
    throw Exception('User not authenticated');
  }
  return AccountsViewModel(userId: userId);
});

/// Provider for account summary
final accountSummaryProvider = Provider.autoDispose<AccountSummary?>((ref) {
  return ref.watch(accountsViewModelProvider).summary;
});

/// Provider for total balance
final totalBalanceProvider = Provider.autoDispose<double>((ref) {
  return ref.watch(accountsViewModelProvider).summary?.totalBalance ?? 0.0;
});

/// Result of linking a bank account
class LinkAccountResult {
  const LinkAccountResult({
    required this.success,
    this.error,
    this.accountsLinked = 0,
    this.transactionsImported = 0,
  });

  final bool success;
  final String? error;
  final int accountsLinked;
  final int transactionsImported;
}
