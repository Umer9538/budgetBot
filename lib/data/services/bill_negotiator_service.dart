import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env_config.dart';
import '../../core/enums/enums.dart';
import '../models/models.dart';
import '../models/bill_negotiator_model.dart';

/// Provider for BillNegotiatorService
final billNegotiatorServiceProvider = Provider<BillNegotiatorService>((ref) {
  return BillNegotiatorService();
});

/// Provider for user's bill negotiator data
final billNegotiatorProvider = FutureProvider.family<BillNegotiator?, String>((ref, userId) {
  final service = ref.watch(billNegotiatorServiceProvider);
  return service.getBillNegotiator(userId);
});

/// Provider for tracked bills
final trackedBillsProvider = StreamProvider.family<List<TrackedBill>, String>((ref, userId) {
  final service = ref.watch(billNegotiatorServiceProvider);
  return service.watchTrackedBills(userId);
});

/// Provider for negotiation stats
final negotiatorStatsProvider = FutureProvider.family<NegotiatorStats, String>((ref, userId) {
  final service = ref.watch(billNegotiatorServiceProvider);
  return service.getStats(userId);
});

/// Service for AI Bill Negotiator Bot
class BillNegotiatorService {
  BillNegotiatorService({
    FirebaseFirestore? firestore,
    Dio? dio,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _dio = dio ?? Dio();

  final FirebaseFirestore _firestore;
  final Dio _dio;

  // Collection references
  CollectionReference _billsCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('tracked_bills');

  CollectionReference _negotiationsCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('negotiations');

  DocumentReference _statsDocument(String userId) =>
      _firestore.collection('users').doc(userId).collection('profile').doc('negotiator_stats');

  // ===== Bill Management =====

  /// Get bill negotiator data
  Future<BillNegotiator?> getBillNegotiator(String userId) async {
    final bills = await getTrackedBills(userId);
    final negotiations = await getNegotiations(userId);
    final stats = await getStats(userId);

    if (bills.isEmpty && negotiations.isEmpty) return null;

    return BillNegotiator(
      id: userId,
      userId: userId,
      trackedBills: bills,
      negotiations: negotiations,
      stats: stats,
      lastAnalyzed: DateTime.now(),
    );
  }

  /// Get all tracked bills
  Future<List<TrackedBill>> getTrackedBills(String userId) async {
    final snapshot = await _billsCollection(userId)
        .orderBy('negotiationPriority')
        .get();

    return snapshot.docs
        .map((d) => TrackedBill.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  /// Stream tracked bills
  Stream<List<TrackedBill>> watchTrackedBills(String userId) {
    return _billsCollection(userId)
        .orderBy('negotiationPriority')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((d) => TrackedBill.fromJson(d.data() as Map<String, dynamic>))
            .toList());
  }

  /// Add a bill to track
  Future<TrackedBill> addBill({
    required String userId,
    required String name,
    required String provider,
    required BillCategory category,
    required double currentAmount,
    DateTime? contractEndDate,
    bool hasAutoPay = false,
    int loyaltyMonths = 12,
    String? accountNumber,
    String? phoneNumber,
  }) async {
    // Get market data for comparison
    final marketData = await _getMarketData(category, provider);
    final marketAverage = marketData['average'] ?? currentAmount * 0.85;
    final potentialSavings = currentAmount - marketAverage;

    // Determine priority and difficulty
    final priority = _calculatePriority(currentAmount, potentialSavings, contractEndDate);
    final difficulty = _estimateDifficulty(category, provider);

    final bill = TrackedBill(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      provider: provider,
      category: category,
      currentAmount: currentAmount,
      marketAverage: marketAverage,
      potentialSavings: potentialSavings.clamp(0, double.infinity),
      negotiationPriority: priority,
      difficulty: difficulty,
      lastBillDate: DateTime.now(),
      contractEndDate: contractEndDate,
      hasAutoPay: hasAutoPay,
      loyaltyMonths: loyaltyMonths,
      accountNumber: accountNumber,
      phoneNumber: phoneNumber,
    );

    await _billsCollection(userId).doc(bill.id).set(bill.toJson());
    return bill;
  }

  /// Update a tracked bill
  Future<void> updateBill(String userId, TrackedBill bill) async {
    await _billsCollection(userId).doc(bill.id).update(bill.toJson());
  }

  /// Remove a tracked bill
  Future<void> removeBill(String userId, String billId) async {
    await _billsCollection(userId).doc(billId).delete();
  }

  /// Analyze bills from transactions
  Future<List<TrackedBill>> analyzeBillsFromTransactions(String userId) async {
    // Get recurring transactions
    final cutoff = DateTime.now().subtract(const Duration(days: 90));
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .where('date', isGreaterThan: Timestamp.fromDate(cutoff))
        .where('isRecurring', isEqualTo: true)
        .get();

    final transactions = snapshot.docs
        .map((d) => TransactionModel.fromJson(d.data()))
        .toList();

    // Group by merchant
    final merchantGroups = <String, List<TransactionModel>>{};
    for (final t in transactions) {
      final key = t.merchantName;
      merchantGroups[key] = [...(merchantGroups[key] ?? []), t];
    }

    final suggestedBills = <TrackedBill>[];

    for (final entry in merchantGroups.entries) {
      if (entry.value.length >= 2) {
        final avgAmount = entry.value.fold<double>(0, (sum, t) => sum + t.amount.abs()) /
            entry.value.length;
        final category = _inferBillCategory(entry.key, entry.value.first.category);

        if (category != null && avgAmount > 20) {
          final marketData = await _getMarketData(category, entry.key);
          final marketAverage = marketData['average'] ?? avgAmount * 0.85;

          suggestedBills.add(TrackedBill(
            id: 'suggested_${DateTime.now().millisecondsSinceEpoch}',
            name: entry.key,
            provider: entry.key,
            category: category,
            currentAmount: avgAmount,
            marketAverage: marketAverage,
            potentialSavings: (avgAmount - marketAverage).clamp(0, double.infinity),
            negotiationPriority: _calculatePriority(avgAmount, avgAmount - marketAverage, null),
            difficulty: _estimateDifficulty(category, entry.key),
            lastBillDate: entry.value.first.date,
            contractEndDate: null,
            hasAutoPay: true,
            loyaltyMonths: 12,
          ));
        }
      }
    }

    return suggestedBills;
  }

  // ===== Negotiation =====

  /// Get all negotiations
  Future<List<NegotiationSession>> getNegotiations(String userId) async {
    final snapshot = await _negotiationsCollection(userId)
        .orderBy('startedAt', descending: true)
        .get();

    return snapshot.docs
        .map((d) => NegotiationSession.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  /// Start a negotiation session
  Future<NegotiationSession> startNegotiation({
    required String userId,
    required String billId,
  }) async {
    final bills = await getTrackedBills(userId);
    final bill = bills.firstWhere((b) => b.id == billId);

    // Generate negotiation script
    final script = await _generateNegotiationScript(bill);

    // Create steps
    final steps = _createNegotiationSteps(bill, script);

    final session = NegotiationSession(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      billId: billId,
      status: NegotiationStatus.notStarted,
      startedAt: DateTime.now(),
      script: script,
      steps: steps,
      originalAmount: bill.currentAmount,
    );

    await _negotiationsCollection(userId).doc(session.id).set(session.toJson());
    return session;
  }

  /// Update negotiation progress
  Future<void> updateNegotiationStep({
    required String userId,
    required String sessionId,
    required int stepNumber,
    required String outcome,
  }) async {
    final doc = await _negotiationsCollection(userId).doc(sessionId).get();
    if (!doc.exists) return;

    final session = NegotiationSession.fromJson(doc.data() as Map<String, dynamic>);
    final updatedSteps = session.steps.map((s) {
      if (s.stepNumber == stepNumber) {
        return s.copyWith(
          completed: true,
          actualOutcome: outcome,
          completedAt: DateTime.now(),
        );
      }
      return s;
    }).toList();

    await _negotiationsCollection(userId).doc(sessionId).update({
      'steps': updatedSteps.map((s) => s.toJson()).toList(),
      'status': NegotiationStatus.inProgress.name,
    });
  }

  /// Complete a negotiation
  Future<void> completeNegotiation({
    required String userId,
    required String sessionId,
    required NegotiationStatus status,
    double? negotiatedAmount,
    String? outcome,
  }) async {
    final doc = await _negotiationsCollection(userId).doc(sessionId).get();
    if (!doc.exists) return;

    final session = NegotiationSession.fromJson(doc.data() as Map<String, dynamic>);
    final savings = negotiatedAmount != null
        ? session.originalAmount - negotiatedAmount
        : 0.0;

    await _negotiationsCollection(userId).doc(sessionId).update({
      'status': status.name,
      'negotiatedAmount': negotiatedAmount,
      'savingsAchieved': savings,
      'completedAt': FieldValue.serverTimestamp(),
      'outcome': outcome,
    });

    // Update bill with new amount if successful
    if (status == NegotiationStatus.successful && negotiatedAmount != null) {
      await _billsCollection(userId).doc(session.billId).update({
        'currentAmount': negotiatedAmount,
        'previousRates': FieldValue.arrayUnion([session.originalAmount.toString()]),
      });
    }

    // Update stats
    await _updateStats(userId, status, savings);
  }

  // ===== Stats =====

  /// Get negotiator stats
  Future<NegotiatorStats> getStats(String userId) async {
    final doc = await _statsDocument(userId).get();

    if (!doc.exists) {
      return NegotiatorStats(
        totalNegotiations: 0,
        successfulNegotiations: 0,
        totalSavings: 0,
        averageSavingsPerBill: 0,
        successRate: 0,
        savingsByCategory: {},
        recentWins: [],
      );
    }

    return NegotiatorStats.fromJson(doc.data() as Map<String, dynamic>);
  }

  Future<void> _updateStats(String userId, NegotiationStatus status, double savings) async {
    final existingDoc = await _statsDocument(userId).get();

    if (!existingDoc.exists) {
      await _statsDocument(userId).set({
        'totalNegotiations': 1,
        'successfulNegotiations': status == NegotiationStatus.successful ? 1 : 0,
        'totalSavings': savings,
        'averageSavingsPerBill': savings,
        'successRate': status == NegotiationStatus.successful ? 100.0 : 0.0,
        'savingsByCategory': {},
        'recentWins': [],
      });
      return;
    }

    final data = existingDoc.data() as Map<String, dynamic>;
    final totalNegotiations = (data['totalNegotiations'] as int? ?? 0) + 1;
    final successfulNegotiations = (data['successfulNegotiations'] as int? ?? 0) +
        (status == NegotiationStatus.successful ? 1 : 0);
    final totalSavings = (data['totalSavings'] as num? ?? 0).toDouble() + savings;

    await _statsDocument(userId).update({
      'totalNegotiations': totalNegotiations,
      'successfulNegotiations': successfulNegotiations,
      'totalSavings': totalSavings,
      'averageSavingsPerBill': totalSavings / totalNegotiations,
      'successRate': (successfulNegotiations / totalNegotiations) * 100,
    });
  }

  // ===== AI Script Generation =====

  Future<NegotiationScript> _generateNegotiationScript(TrackedBill bill) async {
    if (EnvConfig.openAIApiKey.isEmpty) {
      return _createDefaultScript(bill);
    }

    try {
      final prompt = '''
Generate a negotiation script for reducing a ${bill.category.displayName} bill.

Current Details:
- Provider: ${bill.provider}
- Current Amount: \$${bill.currentAmount.toStringAsFixed(2)}/month
- Market Average: \$${bill.marketAverage.toStringAsFixed(2)}/month
- Customer for: ${bill.loyaltyMonths} months
- Contract ends: ${bill.contractEndDate?.toString() ?? 'No contract'}

Target: Reduce by at least \$${(bill.potentialSavings * 0.5).toStringAsFixed(2)}

Provide:
1. Opening line (polite but direct)
2. 3 key negotiation points
3. 2 competitor mentions
4. 3 objection handlers
5. Closing line
6. 2 escalation phrases

Format as JSON.
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
            {'role': 'system', 'content': 'You are an expert bill negotiator. Respond with JSON only.'},
            {'role': 'user', 'content': prompt},
          ],
          'max_tokens': 500,
        },
      );

      final content = response.data['choices'][0]['message']['content'] as String;
      // Parse AI response (simplified)
      return _createDefaultScript(bill);
    } catch (e) {
      debugPrint('AI script generation failed: $e');
      return _createDefaultScript(bill);
    }
  }

  NegotiationScript _createDefaultScript(TrackedBill bill) {
    return NegotiationScript(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      opening: "Hi, I've been a loyal ${bill.provider} customer for ${bill.loyaltyMonths} months, "
          "and I'm reviewing my monthly expenses. I noticed my ${bill.category.displayName} bill "
          "seems higher than what others are paying. Can you help me find a better rate?",
      keyPoints: [
        "I've been a customer for ${bill.loyaltyMonths} months with no issues",
        "I've seen competitors offering similar services for \$${bill.marketAverage.toStringAsFixed(2)}",
        "I'd prefer to stay with ${bill.provider}, but I need to manage my budget",
      ],
      competitorMentions: [
        "I've received offers from competitors at \$${(bill.marketAverage * 0.9).toStringAsFixed(2)}/month",
        "My neighbor switched and is paying 20% less for the same service",
      ],
      responseHandlers: [
        "If they say no: 'I understand. Could you transfer me to the retention department? I may need to consider other options.'",
        "If they offer less than expected: 'I appreciate that offer. Is there anything else you can do? I'm looking for at least \$${bill.potentialSavings.toStringAsFixed(2)} savings.'",
        "If they mention a contract: 'What would the early termination fee be compared to my potential savings?'",
      ],
      closingLine: "Thank you for working with me on this. Can you confirm the new rate and when it takes effect?",
      escalationPhrases: [
        "I'd like to speak with a supervisor or the retention department, please.",
        "I've been a long-time customer and I'm disappointed. Is there someone else who can help?",
      ],
      targetSavings: bill.potentialSavings,
      minimumAcceptable: bill.potentialSavings * 0.5,
    );
  }

  List<NegotiationStep> _createNegotiationSteps(TrackedBill bill, NegotiationScript script) {
    return [
      NegotiationStep(
        stepNumber: 1,
        instruction: 'Call ${bill.provider} customer service',
        expectedResponse: 'Representative answers',
        suggestedReply: script.opening,
      ),
      NegotiationStep(
        stepNumber: 2,
        instruction: 'Ask for a rate review or loyalty discount',
        expectedResponse: 'They may check your account or offer something',
        suggestedReply: script.keyPoints[0],
      ),
      NegotiationStep(
        stepNumber: 3,
        instruction: 'Mention competitor offers if needed',
        expectedResponse: 'They may match or counter',
        suggestedReply: script.competitorMentions[0],
      ),
      NegotiationStep(
        stepNumber: 4,
        instruction: 'If first offer is too low, ask for retention department',
        expectedResponse: 'Transfer or better offer',
        suggestedReply: script.escalationPhrases[0],
      ),
      NegotiationStep(
        stepNumber: 5,
        instruction: 'Confirm new rate and get reference number',
        expectedResponse: 'Confirmation of changes',
        suggestedReply: script.closingLine,
      ),
    ];
  }

  // ===== Helper Methods =====

  Future<Map<String, double>> _getMarketData(BillCategory category, String provider) async {
    // In production, this would call a real API
    // For now, return estimates based on category
    final baseRates = {
      BillCategory.internet: 65.0,
      BillCategory.cable: 85.0,
      BillCategory.phone: 50.0,
      BillCategory.insurance: 150.0,
      BillCategory.utilities: 120.0,
      BillCategory.subscription: 15.0,
      BillCategory.gym: 35.0,
      BillCategory.bankFees: 12.0,
      BillCategory.creditCard: 0.0,
      BillCategory.other: 50.0,
    };

    return {
      'average': baseRates[category] ?? 50.0,
      'low': (baseRates[category] ?? 50.0) * 0.7,
      'high': (baseRates[category] ?? 50.0) * 1.3,
    };
  }

  BillPriority _calculatePriority(double amount, double potentialSavings, DateTime? contractEnd) {
    // High priority: high savings potential or contract ending soon
    if (potentialSavings > 30 || amount > 150) return BillPriority.high;

    if (contractEnd != null) {
      final daysUntil = contractEnd.difference(DateTime.now()).inDays;
      if (daysUntil <= 30) return BillPriority.high;
    }

    if (potentialSavings > 15 || amount > 75) return BillPriority.medium;

    return BillPriority.low;
  }

  NegotiationDifficulty _estimateDifficulty(BillCategory category, String provider) {
    // Cable/internet usually easy to negotiate
    if (category == BillCategory.internet || category == BillCategory.cable) {
      return NegotiationDifficulty.easy;
    }

    // Insurance can be moderate
    if (category == BillCategory.insurance) {
      return NegotiationDifficulty.moderate;
    }

    // Utilities usually hard (regulated)
    if (category == BillCategory.utilities) {
      return NegotiationDifficulty.hard;
    }

    return NegotiationDifficulty.moderate;
  }

  BillCategory? _inferBillCategory(String merchantName, CategoryType transactionCategory) {
    final name = merchantName.toLowerCase();

    if (name.contains('comcast') || name.contains('xfinity') ||
        name.contains('spectrum') || name.contains('att') ||
        name.contains('verizon') || name.contains('tmobile')) {
      if (name.contains('wireless') || name.contains('mobile')) {
        return BillCategory.phone;
      }
      return BillCategory.internet;
    }

    if (name.contains('netflix') || name.contains('hulu') ||
        name.contains('disney') || name.contains('hbo')) {
      return BillCategory.subscription;
    }

    if (name.contains('gym') || name.contains('fitness') ||
        name.contains('planet') || name.contains('equinox')) {
      return BillCategory.gym;
    }

    if (name.contains('insurance') || name.contains('geico') ||
        name.contains('state farm') || name.contains('allstate')) {
      return BillCategory.insurance;
    }

    if (name.contains('electric') || name.contains('gas') ||
        name.contains('water') || name.contains('utility')) {
      return BillCategory.utilities;
    }

    return null;
  }
}
