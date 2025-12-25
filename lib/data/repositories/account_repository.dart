import '../../core/enums/enums.dart';
import '../models/models.dart';
import '../services/services.dart';

/// Repository for account operations
class AccountRepository {
  AccountRepository({AccountService? service})
      : _service = service ?? AccountService();

  final AccountService _service;

  /// Create a new account
  /// Returns the account ID on success
  Future<String?> createAccount({
    required String userId,
    required String institutionName,
    required String accountName,
    required AccountType accountType,
    String? mask,
    double currentBalance = 0.0,
    double availableBalance = 0.0,
    String? plaidAccountId,
    String currency = 'USD',
    bool isManual = false,
    String? providerAccountId,
    String? providerType,
    String? accessToken,
    String? institutionId,
  }) async {
    final account = await _service.createAccount(
      userId: userId,
      institutionName: institutionName,
      accountName: accountName,
      accountType: accountType,
      mask: mask,
      currentBalance: currentBalance,
      availableBalance: availableBalance,
      plaidAccountId: plaidAccountId,
      currency: currency,
      isManual: isManual,
      providerAccountId: providerAccountId,
      providerType: providerType,
      accessToken: accessToken,
      institutionId: institutionId,
    );
    return account.id;
  }

  /// Get all accounts for a user
  Future<List<AccountModel>> getAccounts(String userId) {
    return _service.getAccounts(userId);
  }

  /// Watch accounts stream
  Stream<List<AccountModel>> watchAccounts(String userId) {
    return _service.watchAccounts(userId);
  }

  /// Get a single account
  Future<AccountModel?> getAccount(String userId, String accountId) {
    return _service.getAccount(userId, accountId);
  }

  /// Update account
  Future<void> updateAccount({
    required String userId,
    required String accountId,
    String? accountName,
    double? currentBalance,
    double? availableBalance,
    bool? isActive,
    DateTime? lastSynced,
  }) {
    return _service.updateAccount(
      userId: userId,
      accountId: accountId,
      accountName: accountName,
      currentBalance: currentBalance,
      availableBalance: availableBalance,
      isActive: isActive,
      lastSynced: lastSynced,
    );
  }

  /// Delete account
  Future<void> deleteAccount(String userId, String accountId) {
    return _service.deleteAccount(userId, accountId);
  }

  /// Get total balance
  Future<double> getTotalBalance(String userId) {
    return _service.getTotalBalance(userId);
  }

  /// Get accounts by type
  Future<List<AccountModel>> getAccountsByType(String userId, AccountType type) {
    return _service.getAccountsByType(userId, type);
  }

  /// Get account summary
  Future<AccountSummary> getAccountSummary(String userId) async {
    final accounts = await getAccounts(userId);

    double totalBalance = 0;
    double totalAssets = 0;
    double totalLiabilities = 0;

    for (final account in accounts) {
      totalBalance += account.currentBalance;
      if (account.accountType == AccountType.creditCard ||
          account.accountType == AccountType.loan) {
        totalLiabilities += account.currentBalance.abs();
      } else {
        totalAssets += account.currentBalance;
      }
    }

    return AccountSummary(
      totalBalance: totalBalance,
      totalAssets: totalAssets,
      totalLiabilities: totalLiabilities,
      accountCount: accounts.length,
    );
  }
}

/// Summary of all accounts
class AccountSummary {
  const AccountSummary({
    required this.totalBalance,
    required this.totalAssets,
    required this.totalLiabilities,
    required this.accountCount,
  });

  final double totalBalance;
  final double totalAssets;
  final double totalLiabilities;
  final int accountCount;

  double get netWorth => totalAssets - totalLiabilities;
}
