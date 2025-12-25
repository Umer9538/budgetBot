import 'package:freezed_annotation/freezed_annotation.dart';

part 'digital_twin_model.freezed.dart';
part 'digital_twin_model.g.dart';

/// Financial Digital Twin - Monte Carlo simulation model
@freezed
class FinancialDigitalTwin with _$FinancialDigitalTwin {
  const factory FinancialDigitalTwin({
    required String id,
    required String userId,
    required FinancialSnapshot currentSnapshot,
    required List<SimulationScenario> scenarios,
    required List<LifeEvent> projectedLifeEvents,
    required TwinProjection baseProjection,
    required DateTime lastSimulated,
    DateTime? createdAt,
  }) = _FinancialDigitalTwin;

  factory FinancialDigitalTwin.fromJson(Map<String, dynamic> json) =>
      _$FinancialDigitalTwinFromJson(json);
}

/// Current financial snapshot for simulation baseline
@freezed
class FinancialSnapshot with _$FinancialSnapshot {
  const factory FinancialSnapshot({
    required double currentNetWorth,
    required double monthlyIncome,
    required double monthlyExpenses,
    required double savingsRate,
    required double emergencyFundMonths,
    required double debtToIncomeRatio,
    required double investmentBalance,
    required double retirementBalance,
    required Map<String, double> assetAllocation, // asset type -> value
    required Map<String, double> liabilities, // liability type -> value
    required DateTime snapshotDate,
  }) = _FinancialSnapshot;

  factory FinancialSnapshot.fromJson(Map<String, dynamic> json) =>
      _$FinancialSnapshotFromJson(json);
}

/// What-if simulation scenario
@freezed
class SimulationScenario with _$SimulationScenario {
  const factory SimulationScenario({
    required String id,
    required String name,
    required String description,
    required ScenarioType type,
    required List<ScenarioParameter> parameters,
    required TwinProjection projection,
    required double probability, // 0-100 likelihood
    required bool isUserCreated,
    DateTime? createdAt,
  }) = _SimulationScenario;

  factory SimulationScenario.fromJson(Map<String, dynamic> json) =>
      _$SimulationScenarioFromJson(json);
}

/// Type of simulation scenario
enum ScenarioType {
  jobLoss,
  jobChange,
  marriage,
  divorce,
  childBirth,
  homePurchase,
  retirement,
  healthEmergency,
  marketCrash,
  inheritance,
  businessStart,
  relocation,
  custom,
}

extension ScenarioTypeExtension on ScenarioType {
  String get displayName {
    switch (this) {
      case ScenarioType.jobLoss:
        return 'Job Loss';
      case ScenarioType.jobChange:
        return 'Career Change';
      case ScenarioType.marriage:
        return 'Marriage';
      case ScenarioType.divorce:
        return 'Divorce';
      case ScenarioType.childBirth:
        return 'New Child';
      case ScenarioType.homePurchase:
        return 'Home Purchase';
      case ScenarioType.retirement:
        return 'Retirement';
      case ScenarioType.healthEmergency:
        return 'Health Emergency';
      case ScenarioType.marketCrash:
        return 'Market Crash';
      case ScenarioType.inheritance:
        return 'Inheritance';
      case ScenarioType.businessStart:
        return 'Start Business';
      case ScenarioType.relocation:
        return 'Relocation';
      case ScenarioType.custom:
        return 'Custom Scenario';
    }
  }

  String get icon {
    switch (this) {
      case ScenarioType.jobLoss:
        return '💼';
      case ScenarioType.jobChange:
        return '🔄';
      case ScenarioType.marriage:
        return '💒';
      case ScenarioType.divorce:
        return '💔';
      case ScenarioType.childBirth:
        return '👶';
      case ScenarioType.homePurchase:
        return '🏠';
      case ScenarioType.retirement:
        return '🏖️';
      case ScenarioType.healthEmergency:
        return '🏥';
      case ScenarioType.marketCrash:
        return '📉';
      case ScenarioType.inheritance:
        return '💎';
      case ScenarioType.businessStart:
        return '🚀';
      case ScenarioType.relocation:
        return '🚚';
      case ScenarioType.custom:
        return '⚙️';
    }
  }

  String get description {
    switch (this) {
      case ScenarioType.jobLoss:
        return 'Simulate losing your job and living on savings';
      case ScenarioType.jobChange:
        return 'Explore income changes from a new career';
      case ScenarioType.marriage:
        return 'Combine finances with a partner';
      case ScenarioType.divorce:
        return 'Split assets and adjust lifestyle';
      case ScenarioType.childBirth:
        return 'Account for childcare and education costs';
      case ScenarioType.homePurchase:
        return 'Model mortgage payments and home equity';
      case ScenarioType.retirement:
        return 'Plan your retirement timeline';
      case ScenarioType.healthEmergency:
        return 'Prepare for unexpected medical expenses';
      case ScenarioType.marketCrash:
        return 'Stress test your portfolio';
      case ScenarioType.inheritance:
        return 'Plan for a windfall';
      case ScenarioType.businessStart:
        return 'Assess startup financial impact';
      case ScenarioType.relocation:
        return 'Compare cost of living in new location';
      case ScenarioType.custom:
        return 'Create your own scenario';
    }
  }
}

/// Parameter for scenario configuration
@freezed
class ScenarioParameter with _$ScenarioParameter {
  const factory ScenarioParameter({
    required String name,
    required String label,
    required ParameterType type,
    required dynamic value,
    dynamic minValue,
    dynamic maxValue,
    List<String>? options,
    String? unit,
    String? description,
  }) = _ScenarioParameter;

  factory ScenarioParameter.fromJson(Map<String, dynamic> json) =>
      _$ScenarioParameterFromJson(json);
}

enum ParameterType {
  currency,
  percentage,
  months,
  years,
  number,
  select,
  toggle,
}

/// Life event for projection timeline
@freezed
class LifeEvent with _$LifeEvent {
  const factory LifeEvent({
    required String id,
    required String name,
    required ScenarioType type,
    required DateTime projectedDate,
    required double financialImpact, // positive or negative
    required double monthlyImpact, // ongoing monthly change
    required int durationMonths, // 0 for one-time
    required double confidence, // 0-100 how likely
    String? notes,
  }) = _LifeEvent;

  factory LifeEvent.fromJson(Map<String, dynamic> json) =>
      _$LifeEventFromJson(json);
}

/// Projection results from Monte Carlo simulation
@freezed
class TwinProjection with _$TwinProjection {
  const factory TwinProjection({
    required String id,
    required int yearsProjected,
    required int simulationRuns, // typically 1000+
    required List<ProjectionYear> yearlyProjections,
    required ProjectionOutcome bestCase, // 95th percentile
    required ProjectionOutcome medianCase, // 50th percentile
    required ProjectionOutcome worstCase, // 5th percentile
    required double successProbability, // % of simulations meeting goals
    required double ruinProbability, // % of simulations going broke
    required DateTime generatedAt,
  }) = _TwinProjection;

  factory TwinProjection.fromJson(Map<String, dynamic> json) =>
      _$TwinProjectionFromJson(json);
}

/// Yearly projection data point
@freezed
class ProjectionYear with _$ProjectionYear {
  const factory ProjectionYear({
    required int year,
    required double medianNetWorth,
    required double lowNetWorth, // 10th percentile
    required double highNetWorth, // 90th percentile
    required double medianIncome,
    required double medianExpenses,
    required double medianSavings,
    required List<String> projectedEvents, // life events in this year
  }) = _ProjectionYear;

  factory ProjectionYear.fromJson(Map<String, dynamic> json) =>
      _$ProjectionYearFromJson(json);
}

/// Outcome summary for a projection percentile
@freezed
class ProjectionOutcome with _$ProjectionOutcome {
  const factory ProjectionOutcome({
    required double finalNetWorth,
    required double totalEarnings,
    required double totalSpending,
    required double totalSaved,
    required double investmentReturns,
    required int retirementAge,
    required bool achievedGoals,
    required List<String> keyMilestones,
  }) = _ProjectionOutcome;

  factory ProjectionOutcome.fromJson(Map<String, dynamic> json) =>
      _$ProjectionOutcomeFromJson(json);
}

/// Comparison between two scenarios
@freezed
class ScenarioComparison with _$ScenarioComparison {
  const factory ScenarioComparison({
    required String scenario1Id,
    required String scenario2Id,
    required double netWorthDifference,
    required double retirementAgeDifference,
    required double successProbabilityDifference,
    required List<String> keyDifferences,
    required String recommendation,
  }) = _ScenarioComparison;

  factory ScenarioComparison.fromJson(Map<String, dynamic> json) =>
      _$ScenarioComparisonFromJson(json);
}
