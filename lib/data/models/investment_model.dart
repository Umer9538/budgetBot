import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/enums.dart';

part 'investment_model.freezed.dart';
part 'investment_model.g.dart';

/// Investment Guidance - Risk assessment and personalized recommendations
@freezed
class InvestmentProfile with _$InvestmentProfile {
  const factory InvestmentProfile({
    required String id,
    required String userId,
    required RiskAssessment assessment,
    required InvestmentRisk riskProfile,
    required int riskScore, // 1-10
    required List<InvestmentGoal> goals,
    required PortfolioAnalysis? currentPortfolio,
    required List<InvestmentRecommendation> recommendations,
    required DateTime assessedAt,
    required DateTime? nextReassessmentDate,
  }) = _InvestmentProfile;

  factory InvestmentProfile.fromJson(Map<String, dynamic> json) =>
      _$InvestmentProfileFromJson(json);
}

/// Risk assessment questionnaire results
@freezed
class RiskAssessment with _$RiskAssessment {
  const factory RiskAssessment({
    required List<RiskAnswer> answers,
    required int totalScore,
    required BehavioralRiskFactors behavioralFactors,
    required DateTime completedAt,
  }) = _RiskAssessment;

  factory RiskAssessment.fromJson(Map<String, dynamic> json) =>
      _$RiskAssessmentFromJson(json);
}

/// Individual risk questionnaire answer
@freezed
class RiskAnswer with _$RiskAnswer {
  const factory RiskAnswer({
    required String questionId,
    required String question,
    required int selectedOption, // 0-indexed
    required int score, // points for this answer
  }) = _RiskAnswer;

  factory RiskAnswer.fromJson(Map<String, dynamic> json) =>
      _$RiskAnswerFromJson(json);
}

/// Risk questionnaire question
@freezed
class RiskQuestion with _$RiskQuestion {
  const factory RiskQuestion({
    required String id,
    required String question,
    required List<RiskOption> options,
    required String category, // 'time_horizon', 'risk_tolerance', 'experience'
  }) = _RiskQuestion;

  factory RiskQuestion.fromJson(Map<String, dynamic> json) =>
      _$RiskQuestionFromJson(json);
}

/// Risk questionnaire option
@freezed
class RiskOption with _$RiskOption {
  const factory RiskOption({
    required String text,
    required int score,
  }) = _RiskOption;

  factory RiskOption.fromJson(Map<String, dynamic> json) =>
      _$RiskOptionFromJson(json);
}

/// Behavioral risk factors analyzed from spending patterns
@freezed
class BehavioralRiskFactors with _$BehavioralRiskFactors {
  const factory BehavioralRiskFactors({
    required double incomeStability, // 0-1
    required double savingsConsistency, // 0-1
    required double spendingVolatility, // 0-1
    required double emergencyFundMonths, // months of expenses saved
    required double debtToIncomeRatio,
    required bool hasHighInterestDebt,
    String? adjustmentReason,
  }) = _BehavioralRiskFactors;

  factory BehavioralRiskFactors.fromJson(Map<String, dynamic> json) =>
      _$BehavioralRiskFactorsFromJson(json);
}

/// User's investment goal
@freezed
class InvestmentGoal with _$InvestmentGoal {
  const factory InvestmentGoal({
    required String id,
    required String name,
    required double targetAmount,
    required double currentAmount,
    required int timeHorizonYears,
    required GoalPriority priority,
    required GoalType type,
    required DateTime targetDate,
    required double requiredMonthlyContribution,
    required double projectedValue,
    required bool isOnTrack,
  }) = _InvestmentGoal;

  factory InvestmentGoal.fromJson(Map<String, dynamic> json) =>
      _$InvestmentGoalFromJson(json);
}

/// Goal priority level
enum GoalPriority {
  essential,
  important,
  desirable,
}

extension GoalPriorityExtension on GoalPriority {
  String get displayName {
    switch (this) {
      case GoalPriority.essential:
        return 'Essential';
      case GoalPriority.important:
        return 'Important';
      case GoalPriority.desirable:
        return 'Desirable';
    }
  }

  String get icon {
    switch (this) {
      case GoalPriority.essential:
        return '!';
      case GoalPriority.important:
        return '*';
      case GoalPriority.desirable:
        return '-';
    }
  }
}

/// Type of investment goal
enum GoalType {
  retirement,
  emergencyFund,
  homePurchase,
  education,
  travel,
  wealthBuilding,
  majorPurchase,
  other,
}

extension GoalTypeExtension on GoalType {
  String get displayName {
    switch (this) {
      case GoalType.retirement:
        return 'Retirement';
      case GoalType.emergencyFund:
        return 'Emergency Fund';
      case GoalType.homePurchase:
        return 'Home Purchase';
      case GoalType.education:
        return 'Education';
      case GoalType.travel:
        return 'Travel';
      case GoalType.wealthBuilding:
        return 'Wealth Building';
      case GoalType.majorPurchase:
        return 'Major Purchase';
      case GoalType.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case GoalType.retirement:
        return 'chair';
      case GoalType.emergencyFund:
        return 'shield';
      case GoalType.homePurchase:
        return 'home';
      case GoalType.education:
        return 'school';
      case GoalType.travel:
        return 'flight';
      case GoalType.wealthBuilding:
        return 'trending_up';
      case GoalType.majorPurchase:
        return 'shopping_cart';
      case GoalType.other:
        return 'flag';
    }
  }
}

/// Current portfolio analysis
@freezed
class PortfolioAnalysis with _$PortfolioAnalysis {
  const factory PortfolioAnalysis({
    required double totalValue,
    required List<PortfolioHolding> holdings,
    required Map<String, double> assetAllocation, // asset type -> percentage
    required DiversificationScore diversification,
    required double projectedAnnualReturn,
    required double riskLevel, // 0-1
    required List<PortfolioIssue> issues,
    required DateTime analyzedAt,
  }) = _PortfolioAnalysis;

  factory PortfolioAnalysis.fromJson(Map<String, dynamic> json) =>
      _$PortfolioAnalysisFromJson(json);
}

/// Individual holding in portfolio
@freezed
class PortfolioHolding with _$PortfolioHolding {
  const factory PortfolioHolding({
    required String symbol,
    required String name,
    required AssetType assetType,
    required double shares,
    required double currentPrice,
    required double totalValue,
    required double percentOfPortfolio,
    required double gainLoss,
    required double gainLossPercent,
  }) = _PortfolioHolding;

  factory PortfolioHolding.fromJson(Map<String, dynamic> json) =>
      _$PortfolioHoldingFromJson(json);
}

/// Diversification analysis score
@freezed
class DiversificationScore with _$DiversificationScore {
  const factory DiversificationScore({
    required double overallScore, // 0-100
    required double assetClassScore,
    required double sectorScore,
    required double geographicScore,
    required DiversificationLevel level,
    required List<String> recommendations,
  }) = _DiversificationScore;

  factory DiversificationScore.fromJson(Map<String, dynamic> json) =>
      _$DiversificationScoreFromJson(json);
}

/// Diversification level
enum DiversificationLevel {
  poor,
  fair,
  good,
  excellent,
}

extension DiversificationLevelExtension on DiversificationLevel {
  String get displayName {
    switch (this) {
      case DiversificationLevel.poor:
        return 'Poor';
      case DiversificationLevel.fair:
        return 'Fair';
      case DiversificationLevel.good:
        return 'Good';
      case DiversificationLevel.excellent:
        return 'Excellent';
    }
  }

  String get icon {
    switch (this) {
      case DiversificationLevel.poor:
        return 'warning';
      case DiversificationLevel.fair:
        return 'info';
      case DiversificationLevel.good:
        return 'check_circle';
      case DiversificationLevel.excellent:
        return 'star';
    }
  }
}

/// Issue found in portfolio
@freezed
class PortfolioIssue with _$PortfolioIssue {
  const factory PortfolioIssue({
    required String title,
    required String description,
    required IssueSeverity severity,
    required String recommendation,
  }) = _PortfolioIssue;

  factory PortfolioIssue.fromJson(Map<String, dynamic> json) =>
      _$PortfolioIssueFromJson(json);
}

/// Severity of portfolio issue
enum IssueSeverity {
  low,
  medium,
  high,
  critical,
}

extension IssueSeverityExtension on IssueSeverity {
  String get displayName {
    switch (this) {
      case IssueSeverity.low:
        return 'Low';
      case IssueSeverity.medium:
        return 'Medium';
      case IssueSeverity.high:
        return 'High';
      case IssueSeverity.critical:
        return 'Critical';
    }
  }

  String get icon {
    switch (this) {
      case IssueSeverity.low:
        return 'info';
      case IssueSeverity.medium:
        return 'warning';
      case IssueSeverity.high:
        return 'error';
      case IssueSeverity.critical:
        return 'dangerous';
    }
  }
}

/// Investment recommendation
@freezed
class InvestmentRecommendation with _$InvestmentRecommendation {
  const factory InvestmentRecommendation({
    required String id,
    required String symbol,
    required String name,
    required AssetType assetType,
    required RecommendationType recommendationType,
    required String reasoning,
    required double suggestedAllocation, // percentage
    double? currentPrice,
    double? expenseRatio, // for ETFs/mutual funds
    double? dividendYield,
    required RiskLevel riskLevel,
    required List<String> tags,
    required DateTime recommendedAt,
    required bool isTaxAdvantaged,
    String? taxAdvantageExplanation,
  }) = _InvestmentRecommendation;

  factory InvestmentRecommendation.fromJson(Map<String, dynamic> json) =>
      _$InvestmentRecommendationFromJson(json);
}

/// Type of recommendation
enum RecommendationType {
  buy,
  hold,
  increasPosition,
  reducePosition,
  dollarCostAverage,
}

extension RecommendationTypeExtension on RecommendationType {
  String get displayName {
    switch (this) {
      case RecommendationType.buy:
        return 'Buy';
      case RecommendationType.hold:
        return 'Hold';
      case RecommendationType.increasPosition:
        return 'Increase Position';
      case RecommendationType.reducePosition:
        return 'Reduce Position';
      case RecommendationType.dollarCostAverage:
        return 'Dollar Cost Average';
    }
  }

  String get icon {
    switch (this) {
      case RecommendationType.buy:
        return 'add_shopping_cart';
      case RecommendationType.hold:
        return 'pause';
      case RecommendationType.increasPosition:
        return 'trending_up';
      case RecommendationType.reducePosition:
        return 'trending_down';
      case RecommendationType.dollarCostAverage:
        return 'calendar_today';
    }
  }
}

/// Risk level of investment
enum RiskLevel {
  veryLow,
  low,
  moderate,
  high,
  veryHigh,
}

extension RiskLevelExtension on RiskLevel {
  String get displayName {
    switch (this) {
      case RiskLevel.veryLow:
        return 'Very Low';
      case RiskLevel.low:
        return 'Low';
      case RiskLevel.moderate:
        return 'Moderate';
      case RiskLevel.high:
        return 'High';
      case RiskLevel.veryHigh:
        return 'Very High';
    }
  }

  String get icon {
    switch (this) {
      case RiskLevel.veryLow:
        return 'check';
      case RiskLevel.low:
        return 'check_circle';
      case RiskLevel.moderate:
        return 'swap_horiz';
      case RiskLevel.high:
        return 'warning';
      case RiskLevel.veryHigh:
        return 'local_fire_department';
    }
  }
}

/// Dollar cost averaging plan
@freezed
class DCAplan with _$DCAplan {
  const factory DCAplan({
    required String id,
    required String symbol,
    required String name,
    required double monthlyAmount,
    required int dayOfMonth,
    required DateTime startDate,
    required DateTime? endDate,
    required int totalContributions,
    required double totalInvested,
    required double currentValue,
    required double averageCost,
    required bool isActive,
  }) = _DCAplan;

  factory DCAplan.fromJson(Map<String, dynamic> json) =>
      _$DCAplanFromJson(json);
}

/// Tax-advantaged account recommendation
@freezed
class TaxAdvantageRecommendation with _$TaxAdvantageRecommendation {
  const factory TaxAdvantageRecommendation({
    required TaxAccountType accountType,
    required String reason,
    required double annualLimit,
    required double currentContribution,
    required double remainingRoom,
    required double potentialTaxSavings,
    required List<String> eligibilityNotes,
  }) = _TaxAdvantageRecommendation;

  factory TaxAdvantageRecommendation.fromJson(Map<String, dynamic> json) =>
      _$TaxAdvantageRecommendationFromJson(json);
}

/// Tax-advantaged account type
enum TaxAccountType {
  traditional401k,
  roth401k,
  traditionalIRA,
  rothIRA,
  hsa,
  plan529,
  sep,
}

extension TaxAccountTypeExtension on TaxAccountType {
  String get displayName {
    switch (this) {
      case TaxAccountType.traditional401k:
        return 'Traditional 401(k)';
      case TaxAccountType.roth401k:
        return 'Roth 401(k)';
      case TaxAccountType.traditionalIRA:
        return 'Traditional IRA';
      case TaxAccountType.rothIRA:
        return 'Roth IRA';
      case TaxAccountType.hsa:
        return 'HSA';
      case TaxAccountType.plan529:
        return '529 Plan';
      case TaxAccountType.sep:
        return 'SEP IRA';
    }
  }

  String get description {
    switch (this) {
      case TaxAccountType.traditional401k:
        return 'Pre-tax contributions, taxed on withdrawal';
      case TaxAccountType.roth401k:
        return 'After-tax contributions, tax-free growth';
      case TaxAccountType.traditionalIRA:
        return 'Tax-deductible contributions, taxed on withdrawal';
      case TaxAccountType.rothIRA:
        return 'After-tax, tax-free growth and withdrawal';
      case TaxAccountType.hsa:
        return 'Triple tax advantage for healthcare';
      case TaxAccountType.plan529:
        return 'Tax-free growth for education expenses';
      case TaxAccountType.sep:
        return 'High limit retirement for self-employed';
    }
  }
}

/// Educational content for investment learning
@freezed
class InvestmentEducation with _$InvestmentEducation {
  const factory InvestmentEducation({
    required String id,
    required String title,
    required String content,
    required EducationTopic topic,
    required EducationLevel level,
    required int readTimeMinutes,
    required bool isCompleted,
  }) = _InvestmentEducation;

  factory InvestmentEducation.fromJson(Map<String, dynamic> json) =>
      _$InvestmentEducationFromJson(json);
}

/// Education topic
enum EducationTopic {
  basics,
  diversification,
  riskManagement,
  taxOptimization,
  retirement,
  marketAnalysis,
}

extension EducationTopicExtension on EducationTopic {
  String get displayName {
    switch (this) {
      case EducationTopic.basics:
        return 'Investing Basics';
      case EducationTopic.diversification:
        return 'Diversification';
      case EducationTopic.riskManagement:
        return 'Risk Management';
      case EducationTopic.taxOptimization:
        return 'Tax Optimization';
      case EducationTopic.retirement:
        return 'Retirement Planning';
      case EducationTopic.marketAnalysis:
        return 'Market Analysis';
    }
  }
}

/// Education difficulty level
enum EducationLevel {
  beginner,
  intermediate,
  advanced,
}

extension EducationLevelExtension on EducationLevel {
  String get displayName {
    switch (this) {
      case EducationLevel.beginner:
        return 'Beginner';
      case EducationLevel.intermediate:
        return 'Intermediate';
      case EducationLevel.advanced:
        return 'Advanced';
    }
  }
}
