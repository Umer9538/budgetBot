/// Enum representing investment risk profiles
enum InvestmentRisk {
  conservative,
  moderatelyConservative,
  moderate,
  moderatelyAggressive,
  aggressive,
}

extension InvestmentRiskExtension on InvestmentRisk {
  String get displayName {
    switch (this) {
      case InvestmentRisk.conservative:
        return 'Conservative';
      case InvestmentRisk.moderatelyConservative:
        return 'Moderately Conservative';
      case InvestmentRisk.moderate:
        return 'Moderate';
      case InvestmentRisk.moderatelyAggressive:
        return 'Moderately Aggressive';
      case InvestmentRisk.aggressive:
        return 'Aggressive';
    }
  }

  String get description {
    switch (this) {
      case InvestmentRisk.conservative:
        return 'Prioritize capital preservation with minimal risk';
      case InvestmentRisk.moderatelyConservative:
        return 'Slight growth focus with emphasis on stability';
      case InvestmentRisk.moderate:
        return 'Balanced approach between growth and stability';
      case InvestmentRisk.moderatelyAggressive:
        return 'Growth-oriented with tolerance for volatility';
      case InvestmentRisk.aggressive:
        return 'Maximum growth potential, high risk tolerance';
    }
  }

  /// Score from 1-10
  int get riskScore {
    switch (this) {
      case InvestmentRisk.conservative:
        return 2;
      case InvestmentRisk.moderatelyConservative:
        return 4;
      case InvestmentRisk.moderate:
        return 5;
      case InvestmentRisk.moderatelyAggressive:
        return 7;
      case InvestmentRisk.aggressive:
        return 9;
    }
  }

  /// Suggested allocation percentages
  Map<String, int> get suggestedAllocation {
    switch (this) {
      case InvestmentRisk.conservative:
        return {'bonds': 80, 'stocks': 15, 'cash': 5};
      case InvestmentRisk.moderatelyConservative:
        return {'bonds': 60, 'stocks': 35, 'cash': 5};
      case InvestmentRisk.moderate:
        return {'bonds': 40, 'stocks': 55, 'cash': 5};
      case InvestmentRisk.moderatelyAggressive:
        return {'bonds': 20, 'stocks': 75, 'cash': 5};
      case InvestmentRisk.aggressive:
        return {'bonds': 5, 'stocks': 90, 'cash': 5};
    }
  }

  /// Expected annual return range
  String get expectedReturnRange {
    switch (this) {
      case InvestmentRisk.conservative:
        return '3-5%';
      case InvestmentRisk.moderatelyConservative:
        return '4-6%';
      case InvestmentRisk.moderate:
        return '5-8%';
      case InvestmentRisk.moderatelyAggressive:
        return '7-10%';
      case InvestmentRisk.aggressive:
        return '8-12%+';
    }
  }

  static InvestmentRisk fromScore(int score) {
    if (score <= 2) return InvestmentRisk.conservative;
    if (score <= 4) return InvestmentRisk.moderatelyConservative;
    if (score <= 6) return InvestmentRisk.moderate;
    if (score <= 8) return InvestmentRisk.moderatelyAggressive;
    return InvestmentRisk.aggressive;
  }
}

/// Enum for investment asset types
enum AssetType {
  stock,
  bond,
  etf,
  mutualFund,
  crypto,
  realEstate,
  commodity,
  cash,
}

extension AssetTypeExtension on AssetType {
  String get displayName {
    switch (this) {
      case AssetType.stock:
        return 'Stock';
      case AssetType.bond:
        return 'Bond';
      case AssetType.etf:
        return 'ETF';
      case AssetType.mutualFund:
        return 'Mutual Fund';
      case AssetType.crypto:
        return 'Cryptocurrency';
      case AssetType.realEstate:
        return 'Real Estate';
      case AssetType.commodity:
        return 'Commodity';
      case AssetType.cash:
        return 'Cash';
    }
  }

  String get icon {
    switch (this) {
      case AssetType.stock:
        return '📈';
      case AssetType.bond:
        return '📜';
      case AssetType.etf:
        return '📊';
      case AssetType.mutualFund:
        return '💼';
      case AssetType.crypto:
        return '₿';
      case AssetType.realEstate:
        return '🏢';
      case AssetType.commodity:
        return '🥇';
      case AssetType.cash:
        return '💵';
    }
  }
}
