import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/models.dart';
import '../../data/repositories/budget_repository.dart';
import '../../data/repositories/transaction_repository.dart';
import 'auth_viewmodel.dart';

/// State for home dashboard
class HomeState {
  const HomeState({
    this.totalBalance = 0.0,
    this.monthlyIncome = 0.0,
    this.monthlyExpenses = 0.0,
    this.recentTransactions = const [],
    this.alertBudgets = const [],
    this.isLoading = false,
    this.error,
  });

  final double totalBalance;
  final double monthlyIncome;
  final double monthlyExpenses;
  final List<TransactionModel> recentTransactions;
  final List<BudgetModel> alertBudgets;
  final bool isLoading;
  final String? error;

  double get netAmount => monthlyIncome - monthlyExpenses;

  HomeState copyWith({
    double? totalBalance,
    double? monthlyIncome,
    double? monthlyExpenses,
    List<TransactionModel>? recentTransactions,
    List<BudgetModel>? alertBudgets,
    bool? isLoading,
    String? error,
  }) {
    return HomeState(
      totalBalance: totalBalance ?? this.totalBalance,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      monthlyExpenses: monthlyExpenses ?? this.monthlyExpenses,
      recentTransactions: recentTransactions ?? this.recentTransactions,
      alertBudgets: alertBudgets ?? this.alertBudgets,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// ViewModel for home dashboard
class HomeViewModel extends StateNotifier<HomeState> {
  HomeViewModel({
    required String userId,
    TransactionRepository? transactionRepository,
    BudgetRepository? budgetRepository,
  })  : _userId = userId,
        _transactionRepository =
            transactionRepository ?? TransactionRepository(),
        _budgetRepository = budgetRepository ?? BudgetRepository(),
        super(const HomeState()) {
    _init();
  }

  final String _userId;
  final TransactionRepository _transactionRepository;
  final BudgetRepository _budgetRepository;

  Future<void> _init() async {
    await refresh();
  }

  /// Refresh all dashboard data
  Future<void> refresh() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      // Load transaction summary
      final summary =
          await _transactionRepository.getMonthlyTransactionSummary(_userId);

      // Load alert budgets
      final alerts = await _budgetRepository.getAlertBudgets(_userId);

      state = state.copyWith(
        monthlyIncome: summary.totalIncome,
        monthlyExpenses: summary.totalExpenses,
        totalBalance: summary.netAmount,
        alertBudgets: alerts,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load dashboard data',
      );
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// Provider for HomeViewModel
final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeState>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) {
    throw Exception('User not authenticated');
  }
  return HomeViewModel(userId: userId);
});

/// Provider for monthly summary data
final homeSummaryProvider = Provider.autoDispose<Map<String, double>>((ref) {
  final state = ref.watch(homeViewModelProvider);
  return {
    'income': state.monthlyIncome,
    'expenses': state.monthlyExpenses,
    'balance': state.totalBalance,
  };
});

/// Provider for home alert budgets
final homeAlertBudgetsProvider = Provider.autoDispose<List<BudgetModel>>((ref) {
  return ref.watch(homeViewModelProvider).alertBudgets;
});
