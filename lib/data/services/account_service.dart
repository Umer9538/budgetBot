import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/enums/enums.dart';
import '../models/models.dart';

/// Service for account CRUD operations
class AccountService {
  AccountService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _accountsCollection(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('accounts');
  }

  /// Create a new account
  Future<AccountModel> createAccount({
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
    final docRef = _accountsCollection(userId).doc();
    final now = DateTime.now();

    final account = AccountModel(
      id: docRef.id,
      userId: userId,
      plaidAccountId: plaidAccountId,
      institutionName: institutionName,
      accountName: accountName,
      accountType: accountType,
      mask: mask,
      currentBalance: currentBalance,
      availableBalance: availableBalance,
      currency: currency,
      isActive: true,
      isManual: isManual,
      isLinked: !isManual && (accessToken != null || providerAccountId != null),
      providerAccountId: providerAccountId,
      providerType: providerType,
      accessToken: accessToken,
      institutionId: institutionId,
      createdAt: now,
      lastSynced: now,
    );

    await docRef.set(account.toJson());
    return account;
  }

  /// Get all accounts for a user
  Future<List<AccountModel>> getAccounts(String userId) async {
    // Query without orderBy to avoid needing composite index
    final snapshot = await _accountsCollection(userId)
        .where('isActive', isEqualTo: true)
        .get();

    final accounts = snapshot.docs.map((doc) => AccountModel.fromFirestore(doc)).toList();
    // Sort in memory instead
    accounts.sort((a, b) => a.institutionName.compareTo(b.institutionName));
    return accounts;
  }

  /// Watch accounts stream
  Stream<List<AccountModel>> watchAccounts(String userId) {
    // Query without orderBy to avoid needing composite index
    return _accountsCollection(userId)
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((snapshot) {
          final accounts = snapshot.docs.map((doc) => AccountModel.fromFirestore(doc)).toList();
          // Sort in memory instead
          accounts.sort((a, b) => a.institutionName.compareTo(b.institutionName));
          return accounts;
        });
  }

  /// Get a single account
  Future<AccountModel?> getAccount(String userId, String accountId) async {
    final doc = await _accountsCollection(userId).doc(accountId).get();
    if (!doc.exists) return null;
    return AccountModel.fromFirestore(doc);
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
  }) async {
    final updates = <String, dynamic>{};

    if (accountName != null) updates['accountName'] = accountName;
    if (currentBalance != null) updates['currentBalance'] = currentBalance;
    if (availableBalance != null) updates['availableBalance'] = availableBalance;
    if (isActive != null) updates['isActive'] = isActive;
    if (lastSynced != null) {
      updates['lastSynced'] = lastSynced.toIso8601String();
    }

    if (updates.isNotEmpty) {
      await _accountsCollection(userId).doc(accountId).update(updates);
    }
  }

  /// Soft delete account (set isActive to false)
  Future<void> deleteAccount(String userId, String accountId) async {
    await _accountsCollection(userId).doc(accountId).update({
      'isActive': false,
    });
  }

  /// Get total balance across all accounts
  Future<double> getTotalBalance(String userId) async {
    final accounts = await getAccounts(userId);
    return accounts.fold<double>(0.0, (total, account) => total + account.currentBalance);
  }

  /// Get accounts by type
  Future<List<AccountModel>> getAccountsByType(
      String userId, AccountType type) async {
    final snapshot = await _accountsCollection(userId)
        .where('isActive', isEqualTo: true)
        .where('accountType', isEqualTo: type.name)
        .get();

    return snapshot.docs.map((doc) => AccountModel.fromFirestore(doc)).toList();
  }
}
