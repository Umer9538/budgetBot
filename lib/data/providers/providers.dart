import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/repositories.dart';

// Re-export ViewModels for easy access
export '../../presentation/viewmodels/viewmodels.dart';

// ===== REPOSITORY PROVIDERS =====

/// Auth repository provider
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

/// Transaction repository provider
final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepository();
});

/// Budget repository provider
final budgetRepositoryProvider = Provider<BudgetRepository>((ref) {
  return BudgetRepository();
});
