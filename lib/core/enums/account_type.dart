/// Enum representing types of financial accounts
enum AccountType {
  checking,
  savings,
  creditCard,
  investment,
  loan,
  cash,
  crypto,
  other,
}

extension AccountTypeExtension on AccountType {
  String get displayName {
    switch (this) {
      case AccountType.checking:
        return 'Checking';
      case AccountType.savings:
        return 'Savings';
      case AccountType.creditCard:
        return 'Credit Card';
      case AccountType.investment:
        return 'Investment';
      case AccountType.loan:
        return 'Loan';
      case AccountType.cash:
        return 'Cash';
      case AccountType.crypto:
        return 'Cryptocurrency';
      case AccountType.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case AccountType.checking:
        return '🏦';
      case AccountType.savings:
        return '🐷';
      case AccountType.creditCard:
        return '💳';
      case AccountType.investment:
        return '📈';
      case AccountType.loan:
        return '📝';
      case AccountType.cash:
        return '💵';
      case AccountType.crypto:
        return '₿';
      case AccountType.other:
        return '💰';
    }
  }

  bool get isAsset {
    switch (this) {
      case AccountType.checking:
      case AccountType.savings:
      case AccountType.investment:
      case AccountType.cash:
      case AccountType.crypto:
        return true;
      case AccountType.creditCard:
      case AccountType.loan:
      case AccountType.other:
        return false;
    }
  }

  bool get isLiability {
    return !isAsset;
  }
}
