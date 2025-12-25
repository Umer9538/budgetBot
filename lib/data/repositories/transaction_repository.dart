import '../../core/enums/enums.dart';
import '../models/models.dart';
import '../services/services.dart';

/// Repository for transactions - abstracts the TransactionService
/// Provides business logic and clean interface for ViewModels
class TransactionRepository {
  TransactionRepository({
    TransactionService? transactionService,
  }) : _transactionService = transactionService ?? TransactionService();

  final TransactionService _transactionService;

  // ===== Read Operations =====

  /// Stream all transactions for a user
  Stream<List<TransactionModel>> watchTransactions(String userId) {
    return _transactionService.watchTransactions(userId);
  }

  /// Stream transactions for current month
  Stream<List<TransactionModel>> watchCurrentMonthTransactions(String userId) {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

    return _transactionService.watchTransactionsByDateRange(
      userId: userId,
      startDate: startOfMonth,
      endDate: endOfMonth,
    );
  }

  /// Stream transactions by category
  Stream<List<TransactionModel>> watchTransactionsByCategory({
    required String userId,
    required CategoryType category,
  }) {
    return _transactionService.watchTransactionsByCategory(
      userId: userId,
      category: category,
    );
  }

  /// Get a single transaction
  Future<TransactionModel?> getTransaction({
    required String userId,
    required String transactionId,
  }) {
    return _transactionService.getTransaction(
      userId: userId,
      transactionId: transactionId,
    );
  }

  // ===== Write Operations =====

  /// Add a new transaction
  Future<TransactionModel> addTransaction({
    required String userId,
    required double amount,
    required String merchantName,
    required CategoryType category,
    required TransactionType type,
    required DateTime date,
    String? accountId,
    String? notes,
    List<String>? tags,
  }) {
    return _transactionService.addTransaction(
      userId: userId,
      amount: amount,
      merchantName: merchantName,
      category: category,
      type: type,
      date: date,
      accountId: accountId,
      notes: notes,
      tags: tags,
    );
  }

  /// Update a transaction
  Future<void> updateTransaction({
    required String userId,
    required String transactionId,
    double? amount,
    String? merchantName,
    CategoryType? category,
    TransactionType? type,
    DateTime? date,
    String? notes,
    List<String>? tags,
  }) {
    return _transactionService.updateTransaction(
      userId: userId,
      transactionId: transactionId,
      amount: amount,
      merchantName: merchantName,
      category: category,
      type: type,
      date: date,
      notes: notes,
      tags: tags,
    );
  }

  /// Delete a transaction
  Future<void> deleteTransaction({
    required String userId,
    required String transactionId,
  }) {
    return _transactionService.deleteTransaction(
      userId: userId,
      transactionId: transactionId,
    );
  }

  // ===== Business Logic =====

  /// Get transaction summary for a period
  Future<TransactionSummary> getTransactionSummary({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final transactions = await _transactionService.getTransactionsByDateRange(
      userId: userId,
      startDate: startDate,
      endDate: endDate,
    );

    double totalIncome = 0;
    double totalExpenses = 0;
    final categoryTotals = <CategoryType, double>{};

    for (final transaction in transactions) {
      if (transaction.type == TransactionType.income) {
        totalIncome += transaction.amount;
      } else if (transaction.type == TransactionType.expense) {
        totalExpenses += transaction.amount;
        categoryTotals[transaction.category] =
            (categoryTotals[transaction.category] ?? 0) + transaction.amount;
      }
    }

    return TransactionSummary(
      totalIncome: totalIncome,
      totalExpenses: totalExpenses,
      netAmount: totalIncome - totalExpenses,
      categoryTotals: categoryTotals,
      transactionCount: transactions.length,
    );
  }

  /// Get monthly transaction summary
  Future<TransactionSummary> getMonthlyTransactionSummary(String userId) {
    final now = DateTime.now();
    final startOfMonth = DateTime(now.year, now.month, 1);
    final endOfMonth = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

    return getTransactionSummary(
      userId: userId,
      startDate: startOfMonth,
      endDate: endOfMonth,
    );
  }

  /// Search transactions
  Future<List<TransactionModel>> searchTransactions({
    required String userId,
    required String query,
  }) {
    return _transactionService.searchTransactions(
      userId: userId,
      query: query,
    );
  }
}

/// Data class for transaction summary
class TransactionSummary {
  const TransactionSummary({
    required this.totalIncome,
    required this.totalExpenses,
    required this.netAmount,
    required this.categoryTotals,
    required this.transactionCount,
  });

  final double totalIncome;
  final double totalExpenses;
  final double netAmount;
  final Map<CategoryType, double> categoryTotals;
  final int transactionCount;

  Map<String, dynamic> toMap() => {
        'totalIncome': totalIncome,
        'totalExpenses': totalExpenses,
        'netAmount': netAmount,
        'categoryTotals': categoryTotals,
        'transactionCount': transactionCount,
      };
}
