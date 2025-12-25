import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env_config.dart';
import '../../core/enums/enums.dart';
import '../models/models.dart';
import '../models/digital_twin_model.dart';

/// Provider for DigitalTwinService
final digitalTwinServiceProvider = Provider<DigitalTwinService>((ref) {
  return DigitalTwinService();
});

/// Provider for user's digital twin
final digitalTwinProvider = FutureProvider.family<FinancialDigitalTwin?, String>((ref, userId) {
  final service = ref.watch(digitalTwinServiceProvider);
  return service.getDigitalTwin(userId);
});

/// Provider for streaming digital twin updates
final digitalTwinStreamProvider = StreamProvider.family<FinancialDigitalTwin?, String>((ref, userId) {
  final service = ref.watch(digitalTwinServiceProvider);
  return service.watchDigitalTwin(userId);
});

/// Service for Financial Digital Twin - Monte Carlo simulation
class DigitalTwinService {
  DigitalTwinService({
    FirebaseFirestore? firestore,
    Dio? dio,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _dio = dio ?? Dio();

  final FirebaseFirestore _firestore;
  final Dio _dio;
  final _random = Random();

  // Collection reference
  DocumentReference _twinDocument(String userId) =>
      _firestore.collection('users').doc(userId).collection('profile').doc('digital_twin');

  CollectionReference _scenariosCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('scenarios');

  // ===== Digital Twin Management =====

  /// Get or create digital twin
  Future<FinancialDigitalTwin?> getDigitalTwin(String userId) async {
    final doc = await _twinDocument(userId).get();
    if (!doc.exists) return null;

    return FinancialDigitalTwin.fromJson(doc.data() as Map<String, dynamic>);
  }

  /// Stream digital twin updates
  Stream<FinancialDigitalTwin?> watchDigitalTwin(String userId) {
    return _twinDocument(userId).snapshots().map((doc) {
      if (!doc.exists) return null;
      return FinancialDigitalTwin.fromJson(doc.data() as Map<String, dynamic>);
    });
  }

  /// Initialize digital twin from current financial data
  Future<FinancialDigitalTwin> initializeDigitalTwin(String userId) async {
    // Get current financial snapshot
    final snapshot = await _buildFinancialSnapshot(userId);

    // Create base projection
    final baseProjection = await _runMonteCarloSimulation(
      snapshot: snapshot,
      yearsToProject: 30,
      runs: 1000,
      lifeEvents: [],
    );

    // Create default scenarios
    final defaultScenarios = await _createDefaultScenarios(snapshot);

    final twin = FinancialDigitalTwin(
      id: userId,
      userId: userId,
      currentSnapshot: snapshot,
      scenarios: defaultScenarios,
      projectedLifeEvents: [],
      baseProjection: baseProjection,
      lastSimulated: DateTime.now(),
      createdAt: DateTime.now(),
    );

    // Save to Firestore
    await _twinDocument(userId).set({
      ...twin.toJson(),
      'lastSimulated': FieldValue.serverTimestamp(),
    });

    return twin;
  }

  /// Update digital twin with latest data
  Future<FinancialDigitalTwin> refreshDigitalTwin(String userId) async {
    final existing = await getDigitalTwin(userId);
    if (existing == null) {
      return initializeDigitalTwin(userId);
    }

    // Update snapshot
    final snapshot = await _buildFinancialSnapshot(userId);

    // Re-run base projection
    final baseProjection = await _runMonteCarloSimulation(
      snapshot: snapshot,
      yearsToProject: 30,
      runs: 1000,
      lifeEvents: existing.projectedLifeEvents,
    );

    // Update scenarios
    final updatedScenarios = <SimulationScenario>[];
    for (final scenario in existing.scenarios) {
      final projection = await _runMonteCarloSimulation(
        snapshot: snapshot,
        yearsToProject: 30,
        runs: 500,
        lifeEvents: existing.projectedLifeEvents,
        scenarioType: scenario.type,
        parameters: scenario.parameters,
      );
      updatedScenarios.add(scenario.copyWith(projection: projection));
    }

    final updated = existing.copyWith(
      currentSnapshot: snapshot,
      baseProjection: baseProjection,
      scenarios: updatedScenarios,
      lastSimulated: DateTime.now(),
    );

    await _twinDocument(userId).set({
      ...updated.toJson(),
      'lastSimulated': FieldValue.serverTimestamp(),
    });

    return updated;
  }

  // ===== Scenario Management =====

  /// Create a custom scenario
  Future<SimulationScenario> createScenario({
    required String userId,
    required String name,
    required String description,
    required ScenarioType type,
    required List<ScenarioParameter> parameters,
  }) async {
    final twin = await getDigitalTwin(userId);
    if (twin == null) {
      throw Exception('Digital twin not initialized');
    }

    // Run simulation for this scenario
    final projection = await _runMonteCarloSimulation(
      snapshot: twin.currentSnapshot,
      yearsToProject: 30,
      runs: 500,
      lifeEvents: twin.projectedLifeEvents,
      scenarioType: type,
      parameters: parameters,
    );

    final scenario = SimulationScenario(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      description: description,
      type: type,
      parameters: parameters,
      projection: projection,
      probability: _estimateScenarioProbability(type),
      isUserCreated: true,
      createdAt: DateTime.now(),
    );

    // Add to twin
    final updatedScenarios = [...twin.scenarios, scenario];
    await _twinDocument(userId).update({
      'scenarios': updatedScenarios.map((s) => s.toJson()).toList(),
    });

    return scenario;
  }

  /// Delete a scenario
  Future<void> deleteScenario(String userId, String scenarioId) async {
    final twin = await getDigitalTwin(userId);
    if (twin == null) return;

    final updatedScenarios = twin.scenarios.where((s) => s.id != scenarioId).toList();
    await _twinDocument(userId).update({
      'scenarios': updatedScenarios.map((s) => s.toJson()).toList(),
    });
  }

  /// Compare two scenarios
  Future<ScenarioComparison> compareScenarios(
    String userId,
    String scenario1Id,
    String scenario2Id,
  ) async {
    final twin = await getDigitalTwin(userId);
    if (twin == null) {
      throw Exception('Digital twin not initialized');
    }

    SimulationScenario? scenario1;
    SimulationScenario? scenario2;

    // Check if comparing to baseline
    if (scenario1Id == 'baseline') {
      scenario1 = SimulationScenario(
        id: 'baseline',
        name: 'Current Path',
        description: 'Your current financial trajectory',
        type: ScenarioType.custom,
        parameters: [],
        projection: twin.baseProjection,
        probability: 100,
        isUserCreated: false,
      );
    } else {
      scenario1 = twin.scenarios.firstWhere((s) => s.id == scenario1Id);
    }

    if (scenario2Id == 'baseline') {
      scenario2 = SimulationScenario(
        id: 'baseline',
        name: 'Current Path',
        description: 'Your current financial trajectory',
        type: ScenarioType.custom,
        parameters: [],
        projection: twin.baseProjection,
        probability: 100,
        isUserCreated: false,
      );
    } else {
      scenario2 = twin.scenarios.firstWhere((s) => s.id == scenario2Id);
    }

    final p1 = scenario1.projection;
    final p2 = scenario2.projection;

    final keyDifferences = <String>[];

    final netWorthDiff = p1.medianCase.finalNetWorth - p2.medianCase.finalNetWorth;
    if (netWorthDiff.abs() > 10000) {
      final betterScenario = netWorthDiff > 0 ? scenario1.name : scenario2.name;
      keyDifferences.add(
        '$betterScenario leads to \$${netWorthDiff.abs().toStringAsFixed(0)} more net worth',
      );
    }

    final retirementDiff = p1.medianCase.retirementAge - p2.medianCase.retirementAge;
    if (retirementDiff != 0) {
      final betterScenario = retirementDiff < 0 ? scenario1.name : scenario2.name;
      keyDifferences.add(
        '$betterScenario allows ${retirementDiff.abs()} years earlier retirement',
      );
    }

    final successDiff = p1.successProbability - p2.successProbability;
    if (successDiff.abs() > 5) {
      final betterScenario = successDiff > 0 ? scenario1.name : scenario2.name;
      keyDifferences.add(
        '$betterScenario has ${successDiff.abs().toStringAsFixed(0)}% higher success rate',
      );
    }

    // Generate recommendation
    String recommendation;
    if (p1.successProbability > p2.successProbability && p1.medianCase.finalNetWorth > p2.medianCase.finalNetWorth) {
      recommendation = '${scenario1.name} appears to be the stronger financial path.';
    } else if (p2.successProbability > p1.successProbability && p2.medianCase.finalNetWorth > p1.medianCase.finalNetWorth) {
      recommendation = '${scenario2.name} appears to be the stronger financial path.';
    } else {
      recommendation = 'Both scenarios have trade-offs. Consider your priorities.';
    }

    return ScenarioComparison(
      scenario1Id: scenario1Id,
      scenario2Id: scenario2Id,
      netWorthDifference: netWorthDiff,
      retirementAgeDifference: retirementDiff.toDouble(),
      successProbabilityDifference: successDiff,
      keyDifferences: keyDifferences,
      recommendation: recommendation,
    );
  }

  // ===== Life Events =====

  /// Add a projected life event
  Future<void> addLifeEvent({
    required String userId,
    required String name,
    required ScenarioType type,
    required DateTime projectedDate,
    required double financialImpact,
    required double monthlyImpact,
    required int durationMonths,
    required double confidence,
    String? notes,
  }) async {
    final twin = await getDigitalTwin(userId);
    if (twin == null) {
      throw Exception('Digital twin not initialized');
    }

    final event = LifeEvent(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      type: type,
      projectedDate: projectedDate,
      financialImpact: financialImpact,
      monthlyImpact: monthlyImpact,
      durationMonths: durationMonths,
      confidence: confidence,
      notes: notes,
    );

    final updatedEvents = [...twin.projectedLifeEvents, event];
    await _twinDocument(userId).update({
      'projectedLifeEvents': updatedEvents.map((e) => e.toJson()).toList(),
    });

    // Refresh projections with new event
    await refreshDigitalTwin(userId);
  }

  /// Remove a life event
  Future<void> removeLifeEvent(String userId, String eventId) async {
    final twin = await getDigitalTwin(userId);
    if (twin == null) return;

    final updatedEvents = twin.projectedLifeEvents.where((e) => e.id != eventId).toList();
    await _twinDocument(userId).update({
      'projectedLifeEvents': updatedEvents.map((e) => e.toJson()).toList(),
    });

    // Refresh projections
    await refreshDigitalTwin(userId);
  }

  // ===== Private Methods =====

  Future<FinancialSnapshot> _buildFinancialSnapshot(String userId) async {
    // Get transactions from last 90 days
    final cutoff = DateTime.now().subtract(const Duration(days: 90));
    final transactionsSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .where('date', isGreaterThan: Timestamp.fromDate(cutoff))
        .get();

    final transactions = transactionsSnapshot.docs
        .map((d) => TransactionModel.fromJson(d.data()))
        .toList();

    // Calculate monthly averages
    final expenses = transactions.where((t) => t.type == TransactionType.expense);
    final income = transactions.where((t) => t.type == TransactionType.income);

    final totalExpenses = expenses.fold<double>(0, (sum, t) => sum + t.amount.abs());
    final totalIncome = income.fold<double>(0, (sum, t) => sum + t.amount.abs());

    // Extrapolate to monthly
    final monthlyExpenses = totalExpenses / 3;
    final monthlyIncome = totalIncome / 3;

    // Get accounts for balances
    final accountsSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('accounts')
        .get();

    double totalAssets = 0;
    double investmentBalance = 0;
    double retirementBalance = 0;
    double totalLiabilities = 0;
    final assetAllocation = <String, double>{};
    final liabilities = <String, double>{};

    for (final doc in accountsSnapshot.docs) {
      final data = doc.data();
      final balance = (data['balance'] as num?)?.toDouble() ?? 0;
      final type = data['type'] as String? ?? 'checking';

      if (type == 'credit' || type == 'loan') {
        totalLiabilities += balance.abs();
        liabilities[type] = (liabilities[type] ?? 0) + balance.abs();
      } else {
        totalAssets += balance;
        assetAllocation[type] = (assetAllocation[type] ?? 0) + balance;

        if (type == 'investment') {
          investmentBalance += balance;
        } else if (type == 'retirement') {
          retirementBalance += balance;
        }
      }
    }

    final savingsRate = monthlyIncome > 0 ? (monthlyIncome - monthlyExpenses) / monthlyIncome : 0.0;
    final emergencyFundMonths = monthlyExpenses > 0
        ? (totalAssets - investmentBalance - retirementBalance) / monthlyExpenses
        : 0.0;
    final debtToIncome = monthlyIncome > 0 ? totalLiabilities / (monthlyIncome * 12) : 0.0;

    return FinancialSnapshot(
      currentNetWorth: totalAssets - totalLiabilities,
      monthlyIncome: monthlyIncome,
      monthlyExpenses: monthlyExpenses,
      savingsRate: savingsRate,
      emergencyFundMonths: emergencyFundMonths.clamp(0, 24),
      debtToIncomeRatio: debtToIncome,
      investmentBalance: investmentBalance,
      retirementBalance: retirementBalance,
      assetAllocation: assetAllocation,
      liabilities: liabilities,
      snapshotDate: DateTime.now(),
    );
  }

  Future<TwinProjection> _runMonteCarloSimulation({
    required FinancialSnapshot snapshot,
    required int yearsToProject,
    required int runs,
    required List<LifeEvent> lifeEvents,
    ScenarioType? scenarioType,
    List<ScenarioParameter>? parameters,
  }) async {
    final yearlyProjections = <ProjectionYear>[];
    final finalNetWorths = <double>[];
    final retirementAges = <int>[];
    var successfulRuns = 0;
    var ruinRuns = 0;

    // Simulation parameters
    final avgMarketReturn = 0.07;
    final marketVolatility = 0.15;
    final inflationRate = 0.03;
    final incomeGrowth = 0.02;

    // Apply scenario adjustments
    double incomeMultiplier = 1.0;
    double expenseMultiplier = 1.0;
    double oneTimeImpact = 0.0;

    if (scenarioType != null) {
      switch (scenarioType) {
        case ScenarioType.jobLoss:
          incomeMultiplier = 0.0;
          // Assume 6 months unemployment
          break;
        case ScenarioType.jobChange:
          final salaryChange = _getParameterValue(parameters, 'salary_change') ?? 10.0;
          incomeMultiplier = 1.0 + (salaryChange / 100);
          break;
        case ScenarioType.marriage:
          incomeMultiplier = 1.5; // Dual income
          expenseMultiplier = 1.3; // Some economies of scale
          oneTimeImpact = -20000; // Wedding cost
          break;
        case ScenarioType.childBirth:
          expenseMultiplier = 1.3;
          oneTimeImpact = -15000;
          break;
        case ScenarioType.homePurchase:
          oneTimeImpact = -60000; // Down payment
          expenseMultiplier = 1.1; // Mortgage higher than rent
          break;
        case ScenarioType.retirement:
          incomeMultiplier = 0.0;
          expenseMultiplier = 0.7;
          break;
        case ScenarioType.healthEmergency:
          oneTimeImpact = -25000;
          expenseMultiplier = 1.2;
          break;
        case ScenarioType.marketCrash:
          // Handled in simulation
          break;
        case ScenarioType.inheritance:
          final amount = _getParameterValue(parameters, 'amount') ?? 50000.0;
          oneTimeImpact = amount;
          break;
        default:
          break;
      }
    }

    // Run multiple simulations
    for (var run = 0; run < runs; run++) {
      var netWorth = snapshot.currentNetWorth + oneTimeImpact;
      var monthlyIncome = snapshot.monthlyIncome * incomeMultiplier;
      var monthlyExpenses = snapshot.monthlyExpenses * expenseMultiplier;
      var investmentBalance = snapshot.investmentBalance;
      var retirementAge = 65;
      var reachedGoal = false;
      var wentBankrupt = false;

      for (var year = 1; year <= yearsToProject; year++) {
        // Market crash scenario
        double yearReturn;
        if (scenarioType == ScenarioType.marketCrash && year <= 2) {
          yearReturn = -0.20 + _random.nextGaussian() * 0.10;
        } else {
          yearReturn = avgMarketReturn + _random.nextGaussian() * marketVolatility;
        }

        // Apply life events for this year
        for (final event in lifeEvents) {
          final eventYear = event.projectedDate.year - DateTime.now().year;
          if (eventYear == year) {
            netWorth += event.financialImpact;
            monthlyExpenses += event.monthlyImpact;
          }
        }

        // Investment returns
        investmentBalance *= (1 + yearReturn);

        // Annual savings
        final annualSavings = (monthlyIncome - monthlyExpenses) * 12;
        investmentBalance += annualSavings * 0.5; // Half to investments

        // Update net worth
        netWorth = investmentBalance + (snapshot.retirementBalance * pow(1 + yearReturn, year));

        // Inflation adjustment
        monthlyExpenses *= (1 + inflationRate);
        monthlyIncome *= (1 + incomeGrowth);

        // Check retirement
        if (investmentBalance > monthlyExpenses * 12 * 25 && !reachedGoal) {
          retirementAge = 30 + year; // Assuming starting age 30
          reachedGoal = true;
        }

        // Check bankruptcy
        if (netWorth < -50000) {
          wentBankrupt = true;
          break;
        }
      }

      finalNetWorths.add(netWorth);
      retirementAges.add(retirementAge);
      if (reachedGoal) successfulRuns++;
      if (wentBankrupt) ruinRuns++;
    }

    // Sort for percentiles
    finalNetWorths.sort();
    retirementAges.sort();

    // Build yearly projections (simplified)
    for (var year = 1; year <= yearsToProject; year += 5) {
      yearlyProjections.add(ProjectionYear(
        year: DateTime.now().year + year,
        medianNetWorth: snapshot.currentNetWorth * pow(1.05, year),
        lowNetWorth: snapshot.currentNetWorth * pow(1.02, year),
        highNetWorth: snapshot.currentNetWorth * pow(1.08, year),
        medianIncome: snapshot.monthlyIncome * 12 * pow(1.02, year),
        medianExpenses: snapshot.monthlyExpenses * 12 * pow(1.03, year),
        medianSavings: (snapshot.monthlyIncome - snapshot.monthlyExpenses) * 12,
        projectedEvents: lifeEvents
            .where((e) => e.projectedDate.year == DateTime.now().year + year)
            .map((e) => e.name)
            .toList(),
      ));
    }

    return TwinProjection(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      yearsProjected: yearsToProject,
      simulationRuns: runs,
      yearlyProjections: yearlyProjections,
      bestCase: ProjectionOutcome(
        finalNetWorth: finalNetWorths[(runs * 0.95).floor()],
        totalEarnings: snapshot.monthlyIncome * 12 * yearsToProject * 1.5,
        totalSpending: snapshot.monthlyExpenses * 12 * yearsToProject * 1.2,
        totalSaved: (snapshot.monthlyIncome - snapshot.monthlyExpenses) * 12 * yearsToProject,
        investmentReturns: finalNetWorths[(runs * 0.95).floor()] - snapshot.currentNetWorth,
        retirementAge: retirementAges[(runs * 0.05).floor()],
        achievedGoals: true,
        keyMilestones: ['Early retirement possible', 'Wealth accumulation on track'],
      ),
      medianCase: ProjectionOutcome(
        finalNetWorth: finalNetWorths[(runs * 0.5).floor()],
        totalEarnings: snapshot.monthlyIncome * 12 * yearsToProject * 1.2,
        totalSpending: snapshot.monthlyExpenses * 12 * yearsToProject,
        totalSaved: (snapshot.monthlyIncome - snapshot.monthlyExpenses) * 12 * yearsToProject * 0.8,
        investmentReturns: finalNetWorths[(runs * 0.5).floor()] - snapshot.currentNetWorth,
        retirementAge: retirementAges[(runs * 0.5).floor()],
        achievedGoals: successfulRuns > runs / 2,
        keyMilestones: ['Standard retirement timeline', 'Goals achievable with discipline'],
      ),
      worstCase: ProjectionOutcome(
        finalNetWorth: finalNetWorths[(runs * 0.05).floor()],
        totalEarnings: snapshot.monthlyIncome * 12 * yearsToProject * 0.8,
        totalSpending: snapshot.monthlyExpenses * 12 * yearsToProject * 1.3,
        totalSaved: (snapshot.monthlyIncome - snapshot.monthlyExpenses) * 12 * yearsToProject * 0.3,
        investmentReturns: finalNetWorths[(runs * 0.05).floor()] - snapshot.currentNetWorth,
        retirementAge: retirementAges[(runs * 0.95).floor()],
        achievedGoals: false,
        keyMilestones: ['May need to adjust goals', 'Build emergency fund'],
      ),
      successProbability: (successfulRuns / runs) * 100,
      ruinProbability: (ruinRuns / runs) * 100,
      generatedAt: DateTime.now(),
    );
  }

  Future<List<SimulationScenario>> _createDefaultScenarios(FinancialSnapshot snapshot) async {
    final scenarios = <SimulationScenario>[];

    // Job Loss scenario
    final jobLossProjection = await _runMonteCarloSimulation(
      snapshot: snapshot,
      yearsToProject: 30,
      runs: 500,
      lifeEvents: [],
      scenarioType: ScenarioType.jobLoss,
    );

    scenarios.add(SimulationScenario(
      id: 'job_loss',
      name: 'Job Loss',
      description: 'What if you lose your job for 6 months?',
      type: ScenarioType.jobLoss,
      parameters: [
        const ScenarioParameter(
          name: 'duration_months',
          label: 'Unemployment Duration',
          type: ParameterType.months,
          value: 6,
          minValue: 1,
          maxValue: 24,
        ),
      ],
      projection: jobLossProjection,
      probability: 15,
      isUserCreated: false,
    ));

    // Market Crash scenario
    final crashProjection = await _runMonteCarloSimulation(
      snapshot: snapshot,
      yearsToProject: 30,
      runs: 500,
      lifeEvents: [],
      scenarioType: ScenarioType.marketCrash,
    );

    scenarios.add(SimulationScenario(
      id: 'market_crash',
      name: 'Market Crash',
      description: 'How would a 40% market crash affect you?',
      type: ScenarioType.marketCrash,
      parameters: [
        const ScenarioParameter(
          name: 'crash_percent',
          label: 'Market Drop',
          type: ParameterType.percentage,
          value: 40,
          minValue: 10,
          maxValue: 60,
        ),
      ],
      projection: crashProjection,
      probability: 20,
      isUserCreated: false,
    ));

    // Early Retirement scenario
    final retirementProjection = await _runMonteCarloSimulation(
      snapshot: snapshot,
      yearsToProject: 30,
      runs: 500,
      lifeEvents: [],
      scenarioType: ScenarioType.retirement,
    );

    scenarios.add(SimulationScenario(
      id: 'early_retirement',
      name: 'Early Retirement',
      description: 'Can you retire at 55?',
      type: ScenarioType.retirement,
      parameters: [
        const ScenarioParameter(
          name: 'target_age',
          label: 'Target Age',
          type: ParameterType.years,
          value: 55,
          minValue: 40,
          maxValue: 70,
        ),
      ],
      projection: retirementProjection,
      probability: 50,
      isUserCreated: false,
    ));

    return scenarios;
  }

  double _estimateScenarioProbability(ScenarioType type) {
    switch (type) {
      case ScenarioType.jobLoss:
        return 15;
      case ScenarioType.jobChange:
        return 60;
      case ScenarioType.marriage:
        return 50;
      case ScenarioType.divorce:
        return 20;
      case ScenarioType.childBirth:
        return 40;
      case ScenarioType.homePurchase:
        return 60;
      case ScenarioType.retirement:
        return 90;
      case ScenarioType.healthEmergency:
        return 30;
      case ScenarioType.marketCrash:
        return 20;
      case ScenarioType.inheritance:
        return 25;
      case ScenarioType.businessStart:
        return 15;
      case ScenarioType.relocation:
        return 30;
      case ScenarioType.custom:
        return 50;
    }
  }

  double? _getParameterValue(List<ScenarioParameter>? parameters, String name) {
    if (parameters == null) return null;
    try {
      final param = parameters.firstWhere((p) => p.name == name);
      return (param.value as num?)?.toDouble();
    } catch (_) {
      return null;
    }
  }
}

/// Extension to add gaussian random
extension RandomExtension on Random {
  double nextGaussian() {
    // Box-Muller transform
    double u1, u2;
    do {
      u1 = nextDouble();
      u2 = nextDouble();
    } while (u1 <= 1e-10);

    return sqrt(-2 * log(u1)) * cos(2 * pi * u2);
  }
}
