import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/enums/enums.dart';
import '../../data/models/models.dart';
import '../../data/repositories/notification_repository.dart';
import '../../data/repositories/transaction_repository.dart';
import 'auth_viewmodel.dart';

/// State for transactions
class TransactionsState {
  const TransactionsState({
    this.transactions = const [],
    this.isLoading = false,
    this.error,
    this.summary,
  });

  final List<TransactionModel> transactions;
  final bool isLoading;
  final String? error;
  final TransactionSummary? summary;

  TransactionsState copyWith({
    List<TransactionModel>? transactions,
    bool? isLoading,
    String? error,
    TransactionSummary? summary,
  }) {
    return TransactionsState(
      transactions: transactions ?? this.transactions,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      summary: summary ?? this.summary,
    );
  }
}

/// ViewModel for transactions
class TransactionsViewModel extends StateNotifier<TransactionsState> {
  TransactionsViewModel({
    required String userId,
    TransactionRepository? repository,
    NotificationRepository? notificationRepository,
  })  : _userId = userId,
        _repository = repository ?? TransactionRepository(),
        _notificationRepository = notificationRepository,
        super(const TransactionsState()) {
    _init();
  }

  final String _userId;
  final TransactionRepository _repository;
  final NotificationRepository? _notificationRepository;
  StreamSubscription? _subscription;

  /// Threshold for large transaction notifications (in dollars)
  static const double _largeTransactionThreshold = 100.0;

  void _init() {
    _loadTransactions();
    _loadSummary();
  }

  void _loadTransactions() {
    state = state.copyWith(isLoading: true);
    _subscription?.cancel();
    _subscription = _repository.watchCurrentMonthTransactions(_userId).listen(
      (transactions) {
        state = state.copyWith(
          transactions: transactions,
          isLoading: false,
        );
      },
      onError: (error) {
        state = state.copyWith(
          isLoading: false,
          error: 'Failed to load transactions',
        );
      },
    );
  }

  Future<void> _loadSummary() async {
    try {
      final summary = await _repository.getMonthlyTransactionSummary(_userId);
      state = state.copyWith(summary: summary);
    } catch (e) {
      // Ignore summary errors
    }
  }

  /// Add a new transaction
  Future<bool> addTransaction({
    required double amount,
    required String merchantName,
    required CategoryType category,
    required TransactionType type,
    required DateTime date,
    String? accountId,
    String? notes,
    List<String>? tags,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final transaction = await _repository.addTransaction(
        userId: _userId,
        amount: amount,
        merchantName: merchantName,
        category: category,
        type: type,
        date: date,
        accountId: accountId,
        notes: notes,
        tags: tags,
      );
      await _loadSummary();
      state = state.copyWith(isLoading: false);

      // Create notification for large transactions
      if (amount.abs() >= _largeTransactionThreshold) {
        _createLargeTransactionNotification(
          transactionId: transaction.id,
          merchantName: merchantName,
          amount: amount,
          isExpense: type == TransactionType.expense,
        );
      }

      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to add transaction',
      );
      return false;
    }
  }

  /// Create notification for large transactions
  Future<void> _createLargeTransactionNotification({
    required String transactionId,
    required String merchantName,
    required double amount,
    required bool isExpense,
  }) async {
    if (_notificationRepository == null) return;

    try {
      await _notificationRepository.createLargeTransactionAlert(
        userId: _userId,
        transactionId: transactionId,
        merchantName: merchantName,
        amount: amount,
        isExpense: isExpense,
        threshold: _largeTransactionThreshold,
      );
    } catch (e) {
      debugPrint('Failed to create transaction notification: $e');
    }
  }

  /// Update a transaction
  Future<bool> updateTransaction({
    required String transactionId,
    double? amount,
    String? merchantName,
    CategoryType? category,
    TransactionType? type,
    DateTime? date,
    String? notes,
    List<String>? tags,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.updateTransaction(
        userId: _userId,
        transactionId: transactionId,
        amount: amount,
        merchantName: merchantName,
        category: category,
        type: type,
        date: date,
        notes: notes,
        tags: tags,
      );
      await _loadSummary();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to update transaction',
      );
      return false;
    }
  }

  /// Delete a transaction
  Future<bool> deleteTransaction(String transactionId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.deleteTransaction(
        userId: _userId,
        transactionId: transactionId,
      );
      await _loadSummary();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to delete transaction',
      );
      return false;
    }
  }

  /// Search transactions
  Future<List<TransactionModel>> searchTransactions(String query) async {
    try {
      return await _repository.searchTransactions(
        userId: _userId,
        query: query,
      );
    } catch (e) {
      return [];
    }
  }

  /// Get transactions grouped by date
  Map<String, List<TransactionModel>> get transactionsByDate {
    final grouped = <String, List<TransactionModel>>{};
    for (final transaction in state.transactions) {
      final dateKey = _formatDateKey(transaction.date);
      grouped.putIfAbsent(dateKey, () => []).add(transaction);
    }
    return grouped;
  }

  String _formatDateKey(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final transactionDate = DateTime(date.year, date.month, date.day);

    if (transactionDate == today) return 'Today';
    if (transactionDate == yesterday) return 'Yesterday';
    return '${date.month}/${date.day}/${date.year}';
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Refresh data
  Future<void> refresh() async {
    _loadTransactions();
    await _loadSummary();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

/// Provider for TransactionsViewModel
final transactionsViewModelProvider =
    StateNotifierProvider.autoDispose<TransactionsViewModel, TransactionsState>(
        (ref) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) {
    throw Exception('User not authenticated');
  }
  final notificationRepository = ref.watch(notificationRepositoryProvider);
  return TransactionsViewModel(
    userId: userId,
    notificationRepository: notificationRepository,
  );
});

/// Provider for transactions grouped by date
final transactionsByDateProvider =
    Provider.autoDispose<Map<String, List<TransactionModel>>>((ref) {
  final viewModel = ref.watch(transactionsViewModelProvider.notifier);
  return viewModel.transactionsByDate;
});

/// Provider for monthly transaction summary
final monthlySummaryProvider = Provider.autoDispose<TransactionSummary?>((ref) {
  return ref.watch(transactionsViewModelProvider).summary;
});
