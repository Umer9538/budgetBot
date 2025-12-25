/// Enum representing the type of financial transaction
enum TransactionType {
  income,
  expense,
  transfer,
}

extension TransactionTypeExtension on TransactionType {
  String get displayName {
    switch (this) {
      case TransactionType.income:
        return 'Income';
      case TransactionType.expense:
        return 'Expense';
      case TransactionType.transfer:
        return 'Transfer';
    }
  }

  String get icon {
    switch (this) {
      case TransactionType.income:
        return '💰';
      case TransactionType.expense:
        return '💸';
      case TransactionType.transfer:
        return '🔄';
    }
  }

  bool get isDebit {
    return this == TransactionType.expense || this == TransactionType.transfer;
  }

  bool get isCredit {
    return this == TransactionType.income;
  }
}
