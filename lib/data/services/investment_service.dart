import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env_config.dart';
import '../../core/enums/enums.dart';
import '../models/models.dart';
import '../models/investment_model.dart';

/// Provider for InvestmentService
final investmentServiceProvider = Provider<InvestmentService>((ref) {
  return InvestmentService();
});

/// Service for investment guidance, risk assessment, and recommendations
class InvestmentService {
  InvestmentService({
    FirebaseFirestore? firestore,
    Dio? dio,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _dio = dio ?? Dio();

  final FirebaseFirestore _firestore;
  final Dio _dio;

  // Collection references
  DocumentReference _profileDocument(String userId) =>
      _firestore.collection('users').doc(userId).collection('investment').doc('profile');

  CollectionReference _goalsCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('investment_goals');

  CollectionReference _dcaPlansCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('dca_plans');

  // ===== Risk Assessment =====

  /// Get the risk assessment questionnaire
  List<RiskQuestion> getRiskQuestionnaire() {
    return [
      const RiskQuestion(
        id: 'q1',
        question: 'What is your investment time horizon?',
        category: 'time_horizon',
        options: [
          RiskOption(text: 'Less than 1 year', score: 1),
          RiskOption(text: '1-3 years', score: 3),
          RiskOption(text: '3-5 years', score: 5),
          RiskOption(text: '5-10 years', score: 7),
          RiskOption(text: 'More than 10 years', score: 10),
        ],
      ),
      const RiskQuestion(
        id: 'q2',
        question: 'If your investment dropped 20% in value, what would you do?',
        category: 'risk_tolerance',
        options: [
          RiskOption(text: 'Sell everything immediately', score: 1),
          RiskOption(text: 'Sell some to reduce exposure', score: 3),
          RiskOption(text: 'Hold and wait for recovery', score: 6),
          RiskOption(text: 'Buy more at the lower price', score: 10),
        ],
      ),
      const RiskQuestion(
        id: 'q3',
        question: 'How would you describe your investment experience?',
        category: 'experience',
        options: [
          RiskOption(text: 'No experience', score: 2),
          RiskOption(text: 'Some experience (1-3 years)', score: 4),
          RiskOption(text: 'Moderate experience (3-7 years)', score: 7),
          RiskOption(text: 'Extensive experience (7+ years)', score: 10),
        ],
      ),
      const RiskQuestion(
        id: 'q4',
        question: 'What is your primary investment goal?',
        category: 'goals',
        options: [
          RiskOption(text: 'Preserve capital and avoid losses', score: 2),
          RiskOption(text: 'Generate steady income', score: 4),
          RiskOption(text: 'Balance between growth and income', score: 6),
          RiskOption(text: 'Maximize long-term growth', score: 9),
        ],
      ),
      const RiskQuestion(
        id: 'q5',
        question: 'How stable is your current income?',
        category: 'stability',
        options: [
          RiskOption(text: 'Very unstable/variable', score: 2),
          RiskOption(text: 'Somewhat variable', score: 4),
          RiskOption(text: 'Mostly stable', score: 7),
          RiskOption(text: 'Very stable with growth potential', score: 10),
        ],
      ),
      const RiskQuestion(
        id: 'q6',
        question: 'How much of your monthly income can you afford to invest?',
        category: 'capacity',
        options: [
          RiskOption(text: 'Less than 5%', score: 2),
          RiskOption(text: '5-10%', score: 4),
          RiskOption(text: '10-20%', score: 7),
          RiskOption(text: 'More than 20%', score: 10),
        ],
      ),
      const RiskQuestion(
        id: 'q7',
        question: 'Do you have an emergency fund covering 3-6 months of expenses?',
        category: 'foundation',
        options: [
          RiskOption(text: 'No emergency fund', score: 1),
          RiskOption(text: 'Less than 3 months', score: 3),
          RiskOption(text: '3-6 months', score: 7),
          RiskOption(text: 'More than 6 months', score: 10),
        ],
      ),
      const RiskQuestion(
        id: 'q8',
        question: 'How would you react to volatility (daily fluctuations)?',
        category: 'risk_tolerance',
        options: [
          RiskOption(text: 'I check daily and get anxious', score: 2),
          RiskOption(text: 'I check weekly with some concern', score: 4),
          RiskOption(text: 'I check monthly, minor fluctuations are fine', score: 7),
          RiskOption(text: 'I rarely check, focused on long-term', score: 10),
        ],
      ),
    ];
  }

  /// Complete risk assessment
  Future<InvestmentProfile> completeRiskAssessment(
    String userId,
    List<RiskAnswer> answers,
  ) async {
    // Calculate total score
    final totalScore = answers.fold<int>(0, (sum, a) => sum + a.score);
    final avgScore = (totalScore / answers.length).round();

    // Analyze behavioral factors from spending
    final behavioralFactors = await _analyzeBehavioralFactors(userId);

    // Adjust score based on behavioral factors
    int adjustedScore = avgScore;
    String? adjustmentReason;

    if (behavioralFactors.hasHighInterestDebt) {
      adjustedScore = (adjustedScore * 0.7).round();
      adjustmentReason = 'Adjusted down due to high-interest debt';
    } else if (behavioralFactors.emergencyFundMonths < 3) {
      adjustedScore = (adjustedScore * 0.8).round();
      adjustmentReason = 'Adjusted down - recommend building emergency fund first';
    } else if (behavioralFactors.savingsConsistency > 0.8 && behavioralFactors.incomeStability > 0.8) {
      adjustedScore = min(10, (adjustedScore * 1.1).round());
      adjustmentReason = 'Adjusted up due to strong financial foundation';
    }

    final assessment = RiskAssessment(
      answers: answers,
      totalScore: adjustedScore,
      behavioralFactors: behavioralFactors.copyWith(adjustmentReason: adjustmentReason),
      completedAt: DateTime.now(),
    );

    // Determine risk profile
    final riskProfile = InvestmentRiskExtension.fromScore(adjustedScore);

    // Generate initial recommendations
    final recommendations = await _generateRecommendations(riskProfile, null);

    final profile = InvestmentProfile(
      id: userId,
      userId: userId,
      assessment: assessment,
      riskProfile: riskProfile,
      riskScore: adjustedScore,
      goals: [],
      currentPortfolio: null,
      recommendations: recommendations,
      assessedAt: DateTime.now(),
      nextReassessmentDate: DateTime.now().add(const Duration(days: 180)),
    );

    // Save to Firestore
    await _profileDocument(userId).set({
      ...profile.toJson(),
      'assessedAt': FieldValue.serverTimestamp(),
    });

    return profile;
  }

  /// Get existing investment profile
  Future<InvestmentProfile?> getProfile(String userId) async {
    final doc = await _profileDocument(userId).get();
    if (!doc.exists) return null;

    return InvestmentProfile.fromJson(doc.data() as Map<String, dynamic>);
  }

  /// Stream investment profile
  Stream<InvestmentProfile?> watchProfile(String userId) {
    return _profileDocument(userId).snapshots().map((doc) {
      if (!doc.exists) return null;
      return InvestmentProfile.fromJson(doc.data() as Map<String, dynamic>);
    });
  }

  /// Check if reassessment is needed
  Future<bool> needsReassessment(String userId) async {
    final profile = await getProfile(userId);
    if (profile == null) return true;

    return profile.nextReassessmentDate != null &&
        DateTime.now().isAfter(profile.nextReassessmentDate!);
  }

  // ===== Investment Goals =====

  /// Add an investment goal
  Future<InvestmentGoal> addGoal(
    String userId, {
    required String name,
    required double targetAmount,
    required int timeHorizonYears,
    required GoalPriority priority,
    required GoalType type,
    double currentAmount = 0,
  }) async {
    final targetDate = DateTime.now().add(Duration(days: timeHorizonYears * 365));

    // Calculate required monthly contribution
    final monthsRemaining = timeHorizonYears * 12;
    final amountNeeded = targetAmount - currentAmount;
    final requiredMonthly = amountNeeded / monthsRemaining;

    // Project value (assuming 7% annual return)
    final projectedValue = _calculateProjectedValue(
      currentAmount,
      requiredMonthly,
      monthsRemaining,
      0.07,
    );

    final goal = InvestmentGoal(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      targetAmount: targetAmount,
      currentAmount: currentAmount,
      timeHorizonYears: timeHorizonYears,
      priority: priority,
      type: type,
      targetDate: targetDate,
      requiredMonthlyContribution: requiredMonthly,
      projectedValue: projectedValue,
      isOnTrack: projectedValue >= targetAmount,
    );

    await _goalsCollection(userId).doc(goal.id).set(goal.toJson());

    return goal;
  }

  /// Get all investment goals
  Future<List<InvestmentGoal>> getGoals(String userId) async {
    final snapshot = await _goalsCollection(userId).get();
    return snapshot.docs
        .map((d) => InvestmentGoal.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  /// Update goal progress
  Future<void> updateGoalProgress(String userId, String goalId, double newAmount) async {
    final doc = await _goalsCollection(userId).doc(goalId).get();
    if (!doc.exists) return;

    final goal = InvestmentGoal.fromJson(doc.data() as Map<String, dynamic>);
    final monthsRemaining = goal.targetDate.difference(DateTime.now()).inDays ~/ 30;

    if (monthsRemaining <= 0) {
      await _goalsCollection(userId).doc(goalId).update({
        'currentAmount': newAmount,
        'isOnTrack': newAmount >= goal.targetAmount,
      });
      return;
    }

    final amountNeeded = goal.targetAmount - newAmount;
    final requiredMonthly = amountNeeded / monthsRemaining;
    final projectedValue = _calculateProjectedValue(newAmount, requiredMonthly, monthsRemaining, 0.07);

    await _goalsCollection(userId).doc(goalId).update({
      'currentAmount': newAmount,
      'requiredMonthlyContribution': requiredMonthly,
      'projectedValue': projectedValue,
      'isOnTrack': projectedValue >= goal.targetAmount,
    });
  }

  // ===== Recommendations =====

  /// Generate personalized recommendations
  Future<List<InvestmentRecommendation>> _generateRecommendations(
    InvestmentRisk riskProfile,
    PortfolioAnalysis? currentPortfolio,
  ) async {
    final recommendations = <InvestmentRecommendation>[];
    final now = DateTime.now();
    final allocation = riskProfile.suggestedAllocation;

    // Bond recommendations based on profile
    if ((allocation['bonds'] ?? 0) > 0) {
      recommendations.add(InvestmentRecommendation(
        id: 'rec_bnd_agg',
        symbol: 'AGG',
        name: 'iShares Core U.S. Aggregate Bond ETF',
        assetType: AssetType.etf,
        recommendationType: RecommendationType.buy,
        reasoning: 'Core bond holding for stability. Low expense ratio and broad diversification across investment-grade bonds.',
        suggestedAllocation: (allocation['bonds'] ?? 0).toDouble(),
        currentPrice: 98.50,
        expenseRatio: 0.03,
        dividendYield: 4.2,
        riskLevel: RiskLevel.low,
        tags: ['Core', 'Bonds', 'Diversified'],
        recommendedAt: now,
        isTaxAdvantaged: false,
      ));
    }

    // Stock recommendations
    if ((allocation['stocks'] ?? 0) > 0) {
      final stockAllocation = (allocation['stocks'] ?? 0).toDouble();

      // US Total Market
      recommendations.add(InvestmentRecommendation(
        id: 'rec_stk_vti',
        symbol: 'VTI',
        name: 'Vanguard Total Stock Market ETF',
        assetType: AssetType.etf,
        recommendationType: RecommendationType.dollarCostAverage,
        reasoning: 'Broad US market exposure at ultra-low cost. Ideal core holding for long-term growth.',
        suggestedAllocation: stockAllocation * 0.6,
        currentPrice: 245.30,
        expenseRatio: 0.03,
        dividendYield: 1.4,
        riskLevel: RiskLevel.moderate,
        tags: ['Core', 'US', 'Large Cap', 'Growth'],
        recommendedAt: now,
        isTaxAdvantaged: false,
      ));

      // International
      recommendations.add(InvestmentRecommendation(
        id: 'rec_stk_vxus',
        symbol: 'VXUS',
        name: 'Vanguard Total International Stock ETF',
        assetType: AssetType.etf,
        recommendationType: RecommendationType.buy,
        reasoning: 'International diversification reduces US-specific risk. Exposure to developed and emerging markets.',
        suggestedAllocation: stockAllocation * 0.25,
        currentPrice: 58.40,
        expenseRatio: 0.07,
        dividendYield: 3.1,
        riskLevel: RiskLevel.moderate,
        tags: ['International', 'Diversification'],
        recommendedAt: now,
        isTaxAdvantaged: false,
      ));

      // Growth tilt for aggressive profiles
      if (riskProfile == InvestmentRisk.aggressive || riskProfile == InvestmentRisk.moderatelyAggressive) {
        recommendations.add(InvestmentRecommendation(
          id: 'rec_stk_vgt',
          symbol: 'VGT',
          name: 'Vanguard Information Technology ETF',
          assetType: AssetType.etf,
          recommendationType: RecommendationType.buy,
          reasoning: 'Tech sector exposure for growth. Higher volatility but strong long-term potential.',
          suggestedAllocation: stockAllocation * 0.15,
          currentPrice: 520.80,
          expenseRatio: 0.10,
          dividendYield: 0.6,
          riskLevel: RiskLevel.high,
          tags: ['Growth', 'Technology', 'Sector'],
          recommendedAt: now,
          isTaxAdvantaged: false,
        ));
      }
    }

    // Tax-advantaged account recommendation
    recommendations.add(InvestmentRecommendation(
      id: 'rec_tax_roth',
      symbol: 'ROTH_IRA',
      name: 'Roth IRA Contribution',
      assetType: AssetType.cash,
      recommendationType: RecommendationType.buy,
      reasoning: 'Tax-free growth and withdrawals in retirement. Prioritize if eligible.',
      suggestedAllocation: 0,
      riskLevel: RiskLevel.low,
      tags: ['Tax-Advantaged', 'Retirement'],
      recommendedAt: now,
      isTaxAdvantaged: true,
      taxAdvantageExplanation: 'Contributions are after-tax, but all growth and qualified withdrawals are tax-free.',
    ));

    // AI-enhanced recommendations
    if (EnvConfig.openAIApiKey.isNotEmpty) {
      try {
        final aiRecs = await _getAIRecommendations(riskProfile, currentPortfolio);
        recommendations.addAll(aiRecs);
      } catch (e) {
        debugPrint('AI recommendations failed: $e');
      }
    }

    return recommendations;
  }

  /// Refresh recommendations
  Future<List<InvestmentRecommendation>> refreshRecommendations(String userId) async {
    final profile = await getProfile(userId);
    if (profile == null) return [];

    final recommendations = await _generateRecommendations(
      profile.riskProfile,
      profile.currentPortfolio,
    );

    await _profileDocument(userId).update({
      'recommendations': recommendations.map((r) => r.toJson()).toList(),
    });

    return recommendations;
  }

  // ===== Portfolio Analysis =====

  /// Analyze portfolio for diversification and issues
  Future<PortfolioAnalysis> analyzePortfolio(
    String userId,
    List<PortfolioHolding> holdings,
  ) async {
    if (holdings.isEmpty) {
      return PortfolioAnalysis(
        totalValue: 0,
        holdings: [],
        assetAllocation: {},
        diversification: const DiversificationScore(
          overallScore: 0,
          assetClassScore: 0,
          sectorScore: 0,
          geographicScore: 0,
          level: DiversificationLevel.poor,
          recommendations: ['Start investing to build your portfolio'],
        ),
        projectedAnnualReturn: 0,
        riskLevel: 0,
        issues: [],
        analyzedAt: DateTime.now(),
      );
    }

    final totalValue = holdings.fold<double>(0, (sum, h) => sum + h.totalValue);

    // Calculate allocation
    final allocation = <String, double>{};
    for (final holding in holdings) {
      final type = holding.assetType.name;
      allocation[type] = (allocation[type] ?? 0) + holding.percentOfPortfolio;
    }

    // Analyze diversification
    final diversification = _analyzeDiversification(holdings, allocation);

    // Identify issues
    final issues = _identifyPortfolioIssues(holdings, allocation);

    // Calculate projected return
    final projectedReturn = _calculateProjectedReturn(holdings);

    // Calculate risk level
    final riskLevel = _calculatePortfolioRisk(holdings);

    final analysis = PortfolioAnalysis(
      totalValue: totalValue,
      holdings: holdings,
      assetAllocation: allocation,
      diversification: diversification,
      projectedAnnualReturn: projectedReturn,
      riskLevel: riskLevel,
      issues: issues,
      analyzedAt: DateTime.now(),
    );

    // Save analysis
    await _profileDocument(userId).update({
      'currentPortfolio': analysis.toJson(),
    });

    return analysis;
  }

  DiversificationScore _analyzeDiversification(
    List<PortfolioHolding> holdings,
    Map<String, double> allocation,
  ) {
    final recommendations = <String>[];

    // Asset class score (higher with more asset types)
    final assetTypes = holdings.map((h) => h.assetType).toSet().length;
    double assetClassScore = min(100, assetTypes * 20).toDouble();

    if (assetTypes < 3) {
      recommendations.add('Consider adding more asset classes for better diversification');
    }

    // Concentration check
    final maxHolding = holdings.map((h) => h.percentOfPortfolio).reduce(max);
    if (maxHolding > 30) {
      assetClassScore -= 20;
      recommendations.add('Single holding exceeds 30% - consider rebalancing');
    }

    // Sector score (simplified - assume moderate diversification)
    final sectorScore = 60.0;

    // Geographic score
    double geographicScore = 50.0;
    final hasInternational = holdings.any((h) =>
        h.name.toLowerCase().contains('international') ||
        h.name.toLowerCase().contains('foreign') ||
        h.symbol.contains('VX') ||
        h.symbol.contains('EFA'));

    if (hasInternational) {
      geographicScore = 80;
    } else {
      recommendations.add('Add international exposure for geographic diversification');
    }

    final overallScore = (assetClassScore + sectorScore + geographicScore) / 3;

    DiversificationLevel level;
    if (overallScore >= 80) {
      level = DiversificationLevel.excellent;
    } else if (overallScore >= 60) {
      level = DiversificationLevel.good;
    } else if (overallScore >= 40) {
      level = DiversificationLevel.fair;
    } else {
      level = DiversificationLevel.poor;
    }

    return DiversificationScore(
      overallScore: overallScore,
      assetClassScore: assetClassScore,
      sectorScore: sectorScore,
      geographicScore: geographicScore,
      level: level,
      recommendations: recommendations,
    );
  }

  List<PortfolioIssue> _identifyPortfolioIssues(
    List<PortfolioHolding> holdings,
    Map<String, double> allocation,
  ) {
    final issues = <PortfolioIssue>[];

    // Check for concentration
    for (final holding in holdings) {
      if (holding.percentOfPortfolio > 25) {
        issues.add(PortfolioIssue(
          title: 'High Concentration in ${holding.symbol}',
          description: '${holding.percentOfPortfolio.toStringAsFixed(1)}% of your portfolio is in a single holding.',
          severity: holding.percentOfPortfolio > 40 ? IssueSeverity.high : IssueSeverity.medium,
          recommendation: 'Consider reducing position to under 20% and diversifying into other assets.',
        ));
      }
    }

    // Check for lack of bonds in moderate/conservative portfolios
    final bondAllocation = allocation['bond'] ?? allocation['etf'] ?? 0;
    if (bondAllocation < 10) {
      issues.add(const PortfolioIssue(
        title: 'Limited Fixed Income',
        description: 'Your portfolio has limited bond exposure for stability.',
        severity: IssueSeverity.low,
        recommendation: 'Consider adding bond ETFs like AGG or BND for stability.',
      ));
    }

    // Check for high expense ratios
    for (final holding in holdings) {
      if (holding.assetType == AssetType.mutualFund || holding.assetType == AssetType.etf) {
        // Note: In real implementation, we'd have expense ratio data
      }
    }

    return issues;
  }

  double _calculateProjectedReturn(List<PortfolioHolding> holdings) {
    // Simplified return projection based on asset types
    double weightedReturn = 0;

    for (final holding in holdings) {
      double expectedReturn;
      switch (holding.assetType) {
        case AssetType.stock:
          expectedReturn = 0.10;
          break;
        case AssetType.etf:
          expectedReturn = 0.08;
          break;
        case AssetType.bond:
          expectedReturn = 0.04;
          break;
        case AssetType.mutualFund:
          expectedReturn = 0.07;
          break;
        case AssetType.crypto:
          expectedReturn = 0.15;
          break;
        case AssetType.realEstate:
          expectedReturn = 0.06;
          break;
        case AssetType.commodity:
          expectedReturn = 0.03;
          break;
        case AssetType.cash:
          expectedReturn = 0.02;
          break;
      }

      weightedReturn += (holding.percentOfPortfolio / 100) * expectedReturn;
    }

    return weightedReturn * 100; // Return as percentage
  }

  double _calculatePortfolioRisk(List<PortfolioHolding> holdings) {
    double weightedRisk = 0;

    for (final holding in holdings) {
      double risk;
      switch (holding.assetType) {
        case AssetType.stock:
          risk = 0.8;
          break;
        case AssetType.etf:
          risk = 0.6;
          break;
        case AssetType.bond:
          risk = 0.2;
          break;
        case AssetType.mutualFund:
          risk = 0.5;
          break;
        case AssetType.crypto:
          risk = 1.0;
          break;
        case AssetType.realEstate:
          risk = 0.4;
          break;
        case AssetType.commodity:
          risk = 0.7;
          break;
        case AssetType.cash:
          risk = 0.0;
          break;
      }

      weightedRisk += (holding.percentOfPortfolio / 100) * risk;
    }

    return weightedRisk;
  }

  // ===== DCA Plans =====

  /// Create a dollar-cost averaging plan
  Future<DCAplan> createDCAPlan(
    String userId, {
    required String symbol,
    required String name,
    required double monthlyAmount,
    required int dayOfMonth,
  }) async {
    final plan = DCAplan(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      symbol: symbol,
      name: name,
      monthlyAmount: monthlyAmount,
      dayOfMonth: dayOfMonth,
      startDate: DateTime.now(),
      endDate: null,
      totalContributions: 0,
      totalInvested: 0,
      currentValue: 0,
      averageCost: 0,
      isActive: true,
    );

    await _dcaPlansCollection(userId).doc(plan.id).set(plan.toJson());

    return plan;
  }

  /// Get all DCA plans
  Future<List<DCAplan>> getDCAPlans(String userId) async {
    final snapshot = await _dcaPlansCollection(userId).get();
    return snapshot.docs.map((d) => DCAplan.fromJson(d.data() as Map<String, dynamic>)).toList();
  }

  // ===== Tax-Advantaged Accounts =====

  /// Get tax-advantaged account recommendations
  List<TaxAdvantageRecommendation> getTaxAdvantageRecommendations(double annualIncome) {
    final recommendations = <TaxAdvantageRecommendation>[];

    // 401(k) recommendation
    recommendations.add(TaxAdvantageRecommendation(
      accountType: TaxAccountType.traditional401k,
      reason: 'Reduce current taxable income and get employer match if available.',
      annualLimit: 23000, // 2024 limit
      currentContribution: 0,
      remainingRoom: 23000,
      potentialTaxSavings: annualIncome > 50000 ? 5520 : 2760, // Assumes 24% or 12% bracket
      eligibilityNotes: const ['Must have employer-sponsored plan', 'Employer match is free money'],
    ));

    // Roth IRA
    if (annualIncome < 161000) {
      // 2024 income limit
      recommendations.add(TaxAdvantageRecommendation(
        accountType: TaxAccountType.rothIRA,
        reason: 'Tax-free growth and withdrawals in retirement.',
        annualLimit: 7000, // 2024 limit
        currentContribution: 0,
        remainingRoom: 7000,
        potentialTaxSavings: 0, // No immediate tax benefit, but tax-free later
        eligibilityNotes: const ['Income limits apply', 'Best if you expect higher taxes in retirement'],
      ));
    }

    // HSA (if eligible)
    recommendations.add(TaxAdvantageRecommendation(
      accountType: TaxAccountType.hsa,
      reason: 'Triple tax advantage: deductible contributions, tax-free growth, tax-free withdrawals for medical.',
      annualLimit: 4150, // 2024 individual limit
      currentContribution: 0,
      remainingRoom: 4150,
      potentialTaxSavings: 996, // Assumes 24% bracket
      eligibilityNotes: const ['Must have HDHP health plan', 'Can invest after minimum balance'],
    ));

    return recommendations;
  }

  // ===== Educational Content =====

  /// Get educational content based on risk profile
  List<InvestmentEducation> getEducationalContent(InvestmentRisk riskProfile) {
    final content = <InvestmentEducation>[];

    // Basics for everyone
    content.add(const InvestmentEducation(
      id: 'edu_basics',
      title: 'Investment Basics',
      content: 'Understanding stocks, bonds, and mutual funds...',
      topic: EducationTopic.basics,
      level: EducationLevel.beginner,
      readTimeMinutes: 5,
      isCompleted: false,
    ));

    content.add(const InvestmentEducation(
      id: 'edu_diversification',
      title: 'Why Diversification Matters',
      content: 'Don\'t put all your eggs in one basket...',
      topic: EducationTopic.diversification,
      level: EducationLevel.beginner,
      readTimeMinutes: 4,
      isCompleted: false,
    ));

    // Risk-appropriate content
    if (riskProfile == InvestmentRisk.conservative || riskProfile == InvestmentRisk.moderatelyConservative) {
      content.add(const InvestmentEducation(
        id: 'edu_bonds',
        title: 'Understanding Bonds and Fixed Income',
        content: 'How bonds provide stability and income...',
        topic: EducationTopic.riskManagement,
        level: EducationLevel.intermediate,
        readTimeMinutes: 6,
        isCompleted: false,
      ));
    }

    if (riskProfile == InvestmentRisk.aggressive || riskProfile == InvestmentRisk.moderatelyAggressive) {
      content.add(const InvestmentEducation(
        id: 'edu_growth',
        title: 'Growth Investing Strategies',
        content: 'Identifying high-growth opportunities...',
        topic: EducationTopic.marketAnalysis,
        level: EducationLevel.intermediate,
        readTimeMinutes: 8,
        isCompleted: false,
      ));
    }

    // Tax content
    content.add(const InvestmentEducation(
      id: 'edu_tax',
      title: 'Tax-Efficient Investing',
      content: 'Maximizing returns after taxes...',
      topic: EducationTopic.taxOptimization,
      level: EducationLevel.intermediate,
      readTimeMinutes: 7,
      isCompleted: false,
    ));

    return content;
  }

  // ===== Private Helper Methods =====

  Future<BehavioralRiskFactors> _analyzeBehavioralFactors(String userId) async {
    final cutoff = DateTime.now().subtract(const Duration(days: 90));

    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .where('date', isGreaterThan: Timestamp.fromDate(cutoff))
        .get();

    final transactions =
        snapshot.docs.map((d) => TransactionModel.fromJson(d.data())).toList();

    if (transactions.isEmpty) {
      return const BehavioralRiskFactors(
        incomeStability: 0.5,
        savingsConsistency: 0.5,
        spendingVolatility: 0.5,
        emergencyFundMonths: 0,
        debtToIncomeRatio: 0,
        hasHighInterestDebt: false,
      );
    }

    // Calculate income stability
    final incomes = transactions.where((t) => t.type == TransactionType.income).toList();
    final incomeVariance = _calculateVariance(incomes.map((t) => t.amount).toList());
    final double incomeStability = 1.0 - min(1.0, incomeVariance / 10000).toDouble();

    // Calculate savings consistency (simplified)
    final expenses = transactions.where((t) => t.type == TransactionType.expense);
    final totalIncome = incomes.fold<double>(0, (sum, t) => sum + t.amount);
    final totalExpense = expenses.fold<double>(0, (sum, t) => sum + t.amount.abs());
    final double savingsRate = totalIncome > 0 ? (totalIncome - totalExpense) / totalIncome : 0.0;
    final double savingsConsistency = savingsRate > 0 ? min(1.0, savingsRate * 3).toDouble() : 0.0;

    // Calculate spending volatility
    final expenseAmounts = expenses.map((t) => t.amount.abs()).toList();
    final spendingVariance = _calculateVariance(expenseAmounts);
    final avgExpense = expenseAmounts.isNotEmpty
        ? expenseAmounts.reduce((a, b) => a + b) / expenseAmounts.length
        : 0.0;
    final double spendingVolatility = avgExpense > 0 ? min(1.0, sqrt(spendingVariance) / avgExpense).toDouble() : 0.0;

    // Estimate emergency fund (simplified)
    final monthlyExpense = totalExpense / 3;
    final estimatedSavings = savingsRate * totalIncome * 6; // 6 months projection
    final emergencyFundMonths = monthlyExpense > 0 ? estimatedSavings / monthlyExpense : 0.0;

    // Check for debt (simplified - look for high recurring payments)
    final hasHighDebt = transactions.any((t) =>
        t.merchantName?.toLowerCase().contains('credit') == true ||
        t.merchantName?.toLowerCase().contains('loan') == true);

    return BehavioralRiskFactors(
      incomeStability: incomeStability,
      savingsConsistency: savingsConsistency,
      spendingVolatility: spendingVolatility,
      emergencyFundMonths: emergencyFundMonths,
      debtToIncomeRatio: totalIncome > 0 ? 0.3 : 0.0, // Placeholder
      hasHighInterestDebt: hasHighDebt,
    );
  }

  double _calculateVariance(List<double> values) {
    if (values.isEmpty) return 0;
    final avg = values.reduce((a, b) => a + b) / values.length;
    return values.fold<double>(0, (sum, v) => sum + (v - avg) * (v - avg)) / values.length;
  }

  double _calculateProjectedValue(
    double currentAmount,
    double monthlyContribution,
    int months,
    double annualRate,
  ) {
    final monthlyRate = annualRate / 12;
    double value = currentAmount;

    for (var i = 0; i < months; i++) {
      value = value * (1 + monthlyRate) + monthlyContribution;
    }

    return value;
  }

  Future<List<InvestmentRecommendation>> _getAIRecommendations(
    InvestmentRisk riskProfile,
    PortfolioAnalysis? portfolio,
  ) async {
    final prompt = '''
Based on this investment profile, suggest 1 specific investment recommendation:

Risk Profile: ${riskProfile.displayName}
Expected Return: ${riskProfile.expectedReturnRange}
Current Portfolio Value: \$${portfolio?.totalValue.toStringAsFixed(0) ?? '0'}

Suggest a specific ETF or fund that would complement this profile.
Format: SYMBOL|Name|Reasoning (one line)
''';

    final response = await _dio.post(
      '${EnvConfig.aiBaseUrl}/chat/completions',
      options: Options(headers: {
        'Authorization': 'Bearer ${EnvConfig.openAIApiKey}',
        'Content-Type': 'application/json',
      }),
      data: {
        'model': 'gpt-4o-mini',
        'messages': [
          {'role': 'system', 'content': 'You are a financial advisor. Always include disclaimer that this is educational only.'},
          {'role': 'user', 'content': prompt},
        ],
        'max_tokens': 100,
      },
    );

    final content = response.data['choices'][0]['message']['content'] as String;
    final parts = content.split('|');

    if (parts.length >= 3) {
      return [
        InvestmentRecommendation(
          id: 'ai_rec_${DateTime.now().millisecondsSinceEpoch}',
          symbol: parts[0].trim(),
          name: parts[1].trim(),
          assetType: AssetType.etf,
          recommendationType: RecommendationType.buy,
          reasoning: parts[2].trim(),
          suggestedAllocation: 10,
          riskLevel: RiskLevel.moderate,
          tags: const ['AI Suggested'],
          recommendedAt: DateTime.now(),
          isTaxAdvantaged: false,
        ),
      ];
    }

    return [];
  }
}
