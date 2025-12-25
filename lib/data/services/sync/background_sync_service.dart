import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

import '../../../core/enums/enums.dart';
import '../../models/models.dart';
import '../bank_link/bank_link.dart';
import '../categorization/ai_categorization_service.dart';

/// Background sync task names
const String kSyncAccountsTask = 'com.budgetbot.sync_accounts';
const String kSyncAllTask = 'com.budgetbot.sync_all';

/// Callback dispatcher for WorkManager (must be top-level function)
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    debugPrint('Background task started: $task');

    try {
      final syncService = BackgroundSyncService();

      switch (task) {
        case kSyncAccountsTask:
          final userId = inputData?['userId'] as String?;
          if (userId != null) {
            await syncService.syncAllAccounts(userId);
          }
          break;
        case kSyncAllTask:
          final userId = inputData?['userId'] as String?;
          if (userId != null) {
            await syncService.performFullSync(userId);
          }
          break;
        default:
          debugPrint('Unknown task: $task');
      }

      return true;
    } catch (e) {
      debugPrint('Background task error: $e');
      return false;
    }
  });
}

/// Service for managing background sync of bank accounts
class BackgroundSyncService {
  BackgroundSyncService({
    FirebaseFirestore? firestore,
    BankLinkService? bankLinkService,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _bankLinkService = bankLinkService ?? BankLinkService();

  final FirebaseFirestore _firestore;
  final BankLinkService _bankLinkService;

  static const String _lastSyncKey = 'last_sync_timestamp';
  static const Duration _syncInterval = Duration(hours: 4);
  static const Duration _minimumSyncInterval = Duration(minutes: 15);

  /// Initialize WorkManager for background tasks
  static Future<void> initialize() async {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: kDebugMode,
    );
  }

  /// Schedule periodic background sync for a user
  Future<void> schedulePeriodicSync({
    required String userId,
    Duration interval = const Duration(hours: 4),
  }) async {
    // Cancel any existing tasks first
    await Workmanager().cancelByUniqueName('$kSyncAccountsTask-$userId');

    // Schedule new periodic task
    await Workmanager().registerPeriodicTask(
      '$kSyncAccountsTask-$userId',
      kSyncAccountsTask,
      frequency: interval,
      inputData: {'userId': userId},
      constraints: Constraints(
        networkType: NetworkType.connected,
        requiresBatteryNotLow: true,
      ),
      existingWorkPolicy: ExistingPeriodicWorkPolicy.replace,
      backoffPolicy: BackoffPolicy.exponential,
      initialDelay: const Duration(minutes: 5),
    );

    debugPrint('Scheduled periodic sync every ${interval.inHours} hours for user: $userId');
  }

  /// Cancel scheduled sync for a user
  Future<void> cancelPeriodicSync(String userId) async {
    await Workmanager().cancelByUniqueName('$kSyncAccountsTask-$userId');
    debugPrint('Cancelled periodic sync for user: $userId');
  }

  /// Trigger immediate sync
  Future<void> triggerImmediateSync(String userId) async {
    await Workmanager().registerOneOffTask(
      '${kSyncAllTask}_${DateTime.now().millisecondsSinceEpoch}',
      kSyncAllTask,
      inputData: {'userId': userId},
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );
    debugPrint('Triggered immediate sync for user: $userId');
  }

  /// Check if sync is needed based on last sync time
  Future<bool> shouldSync() async {
    final prefs = await SharedPreferences.getInstance();
    final lastSync = prefs.getInt(_lastSyncKey);

    if (lastSync == null) return true;

    final lastSyncTime = DateTime.fromMillisecondsSinceEpoch(lastSync);
    final timeSinceLastSync = DateTime.now().difference(lastSyncTime);

    return timeSinceLastSync > _minimumSyncInterval;
  }

  /// Update last sync timestamp
  Future<void> _updateLastSyncTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastSyncKey, DateTime.now().millisecondsSinceEpoch);
  }

  /// Sync all linked accounts for a user
  Future<SyncResult> syncAllAccounts(String userId) async {
    final result = SyncResult();

    try {
      // Get all linked accounts
      final accountsSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('accounts')
          .where('isLinked', isEqualTo: true)
          .get();

      if (accountsSnapshot.docs.isEmpty) {
        debugPrint('No linked accounts to sync');
        return result;
      }

      for (final doc in accountsSnapshot.docs) {
        final account = AccountModel.fromFirestore(doc);

        if (account.accessToken == null || account.providerType == null) {
          continue;
        }

        try {
          // Sync this account
          final accountResult = await _syncAccount(userId, account);
          result.merge(accountResult);

          // Update last synced time
          await _firestore
              .collection('users')
              .doc(userId)
              .collection('accounts')
              .doc(account.id)
              .update({
            'lastSynced': FieldValue.serverTimestamp(),
          });
        } catch (e) {
          debugPrint('Error syncing account ${account.id}: $e');
          result.errors.add('Failed to sync ${account.accountName}: $e');
        }
      }

      await _updateLastSyncTime();
      result.success = true;

    } catch (e) {
      debugPrint('Error in syncAllAccounts: $e');
      result.errors.add('Sync failed: $e');
    }

    return result;
  }

  /// Sync a single account
  Future<SyncResult> _syncAccount(String userId, AccountModel account) async {
    final result = SyncResult();

    final providerType = BankLinkProviderType.values.firstWhere(
      (t) => t.name == account.providerType,
      orElse: () => BankLinkProviderType.plaid,
    );

    // Get new transactions since last sync
    final startDate = account.lastSynced ?? DateTime.now().subtract(const Duration(days: 30));
    final endDate = DateTime.now();

    final transactions = await _bankLinkService.getTransactions(
      providerType: providerType,
      accessToken: account.accessToken!,
      accountId: account.providerAccountId ?? account.id,
      startDate: startDate,
      endDate: endDate,
    );

    // Process and save new transactions
    for (final tx in transactions) {
      await _processTransaction(userId, account, tx);
      result.transactionsSynced++;
    }

    // Update account balances
    final refreshedAccounts = await _bankLinkService.refreshBalances(
      providerType: providerType,
      accessToken: account.accessToken!,
    );

    for (final refreshed in refreshedAccounts) {
      if (refreshed.providerAccountId == (account.providerAccountId ?? account.id)) {
        await _firestore
            .collection('users')
            .doc(userId)
            .collection('accounts')
            .doc(account.id)
            .update({
          'currentBalance': refreshed.currentBalance,
          'availableBalance': refreshed.availableBalance,
        });
        result.balancesUpdated++;
        break;
      }
    }

    return result;
  }

  /// Process a transaction from provider
  Future<void> _processTransaction(
    String userId,
    AccountModel account,
    ProviderTransactionData tx,
  ) async {
    // Check if transaction already exists
    final existingQuery = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .where('plaidTransactionId', isEqualTo: tx.providerTransactionId)
        .limit(1)
        .get();

    if (existingQuery.docs.isNotEmpty) {
      // Update existing transaction if pending status changed
      final existing = TransactionModel.fromFirestore(existingQuery.docs.first);
      if (existing.isPending && !tx.pending) {
        await _firestore
            .collection('users')
            .doc(userId)
            .collection('transactions')
            .doc(existing.id)
            .update({
          'isPending': false,
          'updatedAt': FieldValue.serverTimestamp(),
        });
      }
      return;
    }

    // Categorize the transaction using AI
    final category = await _categorizeTransaction(tx);

    // Create new transaction
    final docRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .doc();

    final transaction = TransactionModel(
      id: docRef.id,
      userId: userId,
      accountId: account.id,
      plaidTransactionId: tx.providerTransactionId,
      amount: tx.amount.abs(),
      currency: tx.currency,
      date: tx.date,
      merchantName: tx.merchantName ?? tx.name,
      category: category,
      type: tx.amount < 0 ? TransactionType.expense : TransactionType.income,
      isManual: false,
      isPending: tx.pending,
      location: tx.location != null
          ? TransactionLocation(
              lat: tx.location!['lat'] as double?,
              lng: tx.location!['lon'] as double?,
              address: tx.location!['address'] as String?,
              city: tx.location!['city'] as String?,
              country: tx.location!['country'] as String?,
            )
          : null,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await docRef.set(transaction.toJson());
  }

  /// Categorize transaction using AI or fallback to rule-based
  Future<CategoryType> _categorizeTransaction(ProviderTransactionData tx) async {
    // Try AI categorization first
    try {
      final aiService = AICategoryService();
      final category = await aiService.categorizeTransaction(
        merchantName: tx.merchantName ?? tx.name,
        amount: tx.amount,
        plaidCategory: tx.category,
      );
      if (category != null) return category;
    } catch (e) {
      debugPrint('AI categorization failed: $e');
    }

    // Fallback to Plaid category mapping
    return _mapPlaidCategory(tx.category);
  }

  /// Map Plaid category to our CategoryType
  CategoryType _mapPlaidCategory(String? plaidCategory) {
    if (plaidCategory == null) return CategoryType.miscellaneous;

    final lower = plaidCategory.toLowerCase();

    // Food & Dining
    if (lower.contains('restaurant') || lower.contains('food') || lower.contains('dining')) {
      return CategoryType.restaurants;
    }
    if (lower.contains('grocery') || lower.contains('supermarket')) {
      return CategoryType.groceries;
    }
    if (lower.contains('coffee')) {
      return CategoryType.coffeeShops;
    }
    if (lower.contains('fast food') || lower.contains('delivery')) {
      return CategoryType.foodDelivery;
    }

    // Transportation
    if (lower.contains('gas') || lower.contains('fuel') || lower.contains('petroleum')) {
      return CategoryType.fuel;
    }
    if (lower.contains('uber') || lower.contains('lyft') || lower.contains('taxi')) {
      return CategoryType.rideShare;
    }
    if (lower.contains('transit') || lower.contains('subway') || lower.contains('bus')) {
      return CategoryType.publicTransit;
    }

    // Shopping
    if (lower.contains('clothing') || lower.contains('apparel')) {
      return CategoryType.clothing;
    }
    if (lower.contains('electronics')) {
      return CategoryType.electronics;
    }
    if (lower.contains('amazon') || lower.contains('online shopping')) {
      return CategoryType.onlineShopping;
    }

    // Entertainment
    if (lower.contains('streaming') || lower.contains('netflix') || lower.contains('spotify')) {
      return CategoryType.streamingServices;
    }
    if (lower.contains('gaming') || lower.contains('game')) {
      return CategoryType.gaming;
    }

    // Health
    if (lower.contains('pharmacy') || lower.contains('drugstore')) {
      return CategoryType.pharmacy;
    }
    if (lower.contains('medical') || lower.contains('doctor') || lower.contains('hospital')) {
      return CategoryType.medical;
    }
    if (lower.contains('gym') || lower.contains('fitness')) {
      return CategoryType.fitness;
    }

    // Housing
    if (lower.contains('rent') || lower.contains('mortgage')) {
      return CategoryType.rentMortgage;
    }
    if (lower.contains('utility') || lower.contains('electric') || lower.contains('water')) {
      return CategoryType.utilities;
    }

    // Financial
    if (lower.contains('insurance')) {
      return CategoryType.insurance;
    }
    if (lower.contains('bank fee') || lower.contains('atm')) {
      return CategoryType.fees;
    }

    // Income
    if (lower.contains('payroll') || lower.contains('salary') || lower.contains('direct deposit')) {
      return CategoryType.salary;
    }
    if (lower.contains('transfer') && lower.contains('in')) {
      return CategoryType.otherIncome;
    }

    return CategoryType.miscellaneous;
  }

  /// Perform full sync including historical import
  Future<SyncResult> performFullSync(String userId) async {
    final result = await syncAllAccounts(userId);

    // Additional sync tasks can be added here
    // e.g., sync budgets, update insights, etc.

    return result;
  }

  /// Import historical transactions for a newly linked account
  Future<int> importHistoricalTransactions({
    required String userId,
    required AccountModel account,
    int monthsBack = 24,
  }) async {
    if (account.accessToken == null) return 0;

    int imported = 0;

    try {
      final providerType = BankLinkProviderType.values.firstWhere(
        (t) => t.name == account.providerType,
        orElse: () => BankLinkProviderType.plaid,
      );

      // Get Plaid provider for historical import
      final plaidProvider = _bankLinkService.getProvider(providerType);
      if (plaidProvider is! PlaidProvider) {
        debugPrint('Historical import only supported for Plaid');
        return 0;
      }

      // Get all historical transactions
      final transactions = await plaidProvider.getAllTransactions(
        accessToken: account.accessToken!,
        monthsBack: monthsBack,
      );

      debugPrint('Found ${transactions.length} historical transactions');

      // Process each transaction
      for (final tx in transactions) {
        await _processTransaction(userId, account, tx);
        imported++;
      }

      debugPrint('Imported $imported historical transactions');
    } catch (e) {
      debugPrint('Error importing historical transactions: $e');
    }

    return imported;
  }
}

/// Result of a sync operation
class SyncResult {
  bool success = false;
  int transactionsSynced = 0;
  int balancesUpdated = 0;
  List<String> errors = [];

  void merge(SyncResult other) {
    transactionsSynced += other.transactionsSynced;
    balancesUpdated += other.balancesUpdated;
    errors.addAll(other.errors);
  }

  @override
  String toString() {
    return 'SyncResult(success: $success, transactions: $transactionsSynced, balances: $balancesUpdated, errors: ${errors.length})';
  }
}

/// Riverpod provider for BackgroundSyncService
final backgroundSyncServiceProvider = Provider<BackgroundSyncService>((ref) {
  return BackgroundSyncService();
});

/// Provider for sync status
final lastSyncProvider = FutureProvider<DateTime?>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final lastSync = prefs.getInt('last_sync_timestamp');
  if (lastSync == null) return null;
  return DateTime.fromMillisecondsSinceEpoch(lastSync);
});
