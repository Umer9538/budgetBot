import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../core/enums/enums.dart';
import '../models/models.dart';

/// Service for handling budget operations with Firebase
class BudgetService {
  BudgetService({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  /// Get budgets collection for a user
  CollectionReference<Map<String, dynamic>> _budgetsCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('budgets');
  }

  /// Get budgets shared with a user
  CollectionReference<Map<String, dynamic>> _sharedBudgetsCollection() {
    return _firestore.collectionGroup('budgets') as CollectionReference<Map<String, dynamic>>;
  }

  // ===== Read Operations =====

  /// Stream all active budgets for a user
  Stream<List<BudgetModel>> watchBudgets(String userId) {
    return _budgetsCollection(userId)
        .where('isActive', isEqualTo: true)
        .orderBy('name')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => BudgetModel.fromFirestore(doc)).toList());
  }

  /// Stream a single budget
  Stream<BudgetModel?> watchBudget({
    required String userId,
    required String budgetId,
  }) {
    return _budgetsCollection(userId).doc(budgetId).snapshots().map((doc) {
      if (!doc.exists) return null;
      return BudgetModel.fromFirestore(doc);
    });
  }

  /// Get a single budget
  Future<BudgetModel?> getBudget({
    required String userId,
    required String budgetId,
  }) async {
    final doc = await _budgetsCollection(userId).doc(budgetId).get();
    if (!doc.exists) return null;
    return BudgetModel.fromFirestore(doc);
  }

  /// Get budget by category
  Future<BudgetModel?> getBudgetByCategory({
    required String userId,
    required CategoryType category,
  }) async {
    final snapshot = await _budgetsCollection(userId)
        .where('category', isEqualTo: category.name)
        .where('targetType', isEqualTo: BudgetTargetType.category.name)
        .where('isActive', isEqualTo: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;
    return BudgetModel.fromFirestore(snapshot.docs.first);
  }

  /// Get budget by merchant name
  Future<BudgetModel?> getBudgetByMerchant({
    required String userId,
    required String merchantName,
  }) async {
    // First try exact merchant name match
    final snapshot = await _budgetsCollection(userId)
        .where('merchantName', isEqualTo: merchantName)
        .where('targetType', isEqualTo: BudgetTargetType.merchant.name)
        .where('isActive', isEqualTo: true)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return BudgetModel.fromFirestore(snapshot.docs.first);
    }

    // Then check merchant pattern budgets
    final allMerchantBudgets = await _budgetsCollection(userId)
        .where('targetType', isEqualTo: BudgetTargetType.merchant.name)
        .where('isActive', isEqualTo: true)
        .get();

    for (final doc in allMerchantBudgets.docs) {
      final budget = BudgetModel.fromFirestore(doc);
      if (budget.matchesMerchant(merchantName)) {
        return budget;
      }
    }

    return null;
  }

  /// Get all merchant-based budgets
  Future<List<BudgetModel>> getMerchantBudgets(String userId) async {
    final snapshot = await _budgetsCollection(userId)
        .where('targetType', isEqualTo: BudgetTargetType.merchant.name)
        .where('isActive', isEqualTo: true)
        .get();

    return snapshot.docs
        .map((doc) => BudgetModel.fromFirestore(doc))
        .toList();
  }

  /// Get all active budgets (one-time fetch)
  Future<List<BudgetModel>> getBudgets(String userId) async {
    final snapshot = await _budgetsCollection(userId)
        .where('isActive', isEqualTo: true)
        .orderBy('name')
        .get();

    return snapshot.docs
        .map((doc) => BudgetModel.fromFirestore(doc))
        .toList();
  }

  /// Get shared budgets (budgets shared with this user)
  Future<List<BudgetModel>> getSharedBudgets(String userId) async {
    final snapshot = await _firestore
        .collectionGroup('budgets')
        .where('isShared', isEqualTo: true)
        .where('sharedWith', arrayContains: userId)
        .where('isActive', isEqualTo: true)
        .get();

    return snapshot.docs
        .map((doc) => BudgetModel.fromFirestore(doc))
        .toList();
  }

  /// Stream shared budgets
  Stream<List<BudgetModel>> watchSharedBudgets(String userId) {
    return _firestore
        .collectionGroup('budgets')
        .where('isShared', isEqualTo: true)
        .where('sharedWith', arrayContains: userId)
        .where('isActive', isEqualTo: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => BudgetModel.fromFirestore(doc)).toList());
  }

  // ===== Write Operations =====

  /// Create a new budget
  Future<BudgetModel> createBudget({
    required String userId,
    required String name,
    required CategoryType category,
    required double amount,
    required BudgetPeriod period,
    required DateTime startDate,
    DateTime? endDate,
    bool rollover = false,
    List<double>? alertThresholds,
    // Merchant-based budget support
    BudgetTargetType targetType = BudgetTargetType.category,
    String? merchantName,
    List<String>? merchantPatterns,
    // Sharing support
    bool isShared = false,
    List<String>? sharedWith,
    // Template tracking
    String? templateId,
  }) async {
    final docRef = _budgetsCollection(userId).doc();

    final budget = BudgetModel(
      id: docRef.id,
      userId: userId,
      name: name,
      category: category,
      amount: amount,
      period: period,
      startDate: startDate,
      endDate: endDate,
      rollover: rollover,
      alertThresholds: alertThresholds ?? [0.5, 0.75, 0.9, 1.0],
      targetType: targetType,
      merchantName: merchantName,
      merchantPatterns: merchantPatterns ?? [],
      isShared: isShared,
      sharedWith: sharedWith ?? [],
      templateId: templateId,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await docRef.set(budget.toJson());
    return budget;
  }

  /// Create merchant-based budget
  Future<BudgetModel> createMerchantBudget({
    required String userId,
    required String name,
    required String merchantName,
    required double amount,
    required BudgetPeriod period,
    required DateTime startDate,
    List<String>? merchantPatterns,
    bool rollover = false,
  }) async {
    return createBudget(
      userId: userId,
      name: name,
      category: CategoryType.miscellaneous, // Default category for merchant budgets
      amount: amount,
      period: period,
      startDate: startDate,
      targetType: BudgetTargetType.merchant,
      merchantName: merchantName,
      merchantPatterns: merchantPatterns,
      rollover: rollover,
    );
  }

  /// Update a budget
  Future<void> updateBudget({
    required String userId,
    required String budgetId,
    String? name,
    double? amount,
    BudgetPeriod? period,
    DateTime? startDate,
    DateTime? endDate,
    bool? rollover,
    List<double>? alertThresholds,
    bool? isActive,
  }) async {
    final updates = <String, dynamic>{
      'updatedAt': FieldValue.serverTimestamp(),
    };

    if (name != null) updates['name'] = name;
    if (amount != null) updates['amount'] = amount;
    if (period != null) updates['period'] = period.name;
    if (startDate != null) updates['startDate'] = startDate.toIso8601String();
    if (endDate != null) updates['endDate'] = endDate.toIso8601String();
    if (rollover != null) updates['rollover'] = rollover;
    if (alertThresholds != null) updates['alertThresholds'] = alertThresholds;
    if (isActive != null) updates['isActive'] = isActive;

    await _budgetsCollection(userId).doc(budgetId).update(updates);
  }

  /// Update budget spent amount
  Future<void> updateBudgetSpent({
    required String userId,
    required String budgetId,
    required double spent,
  }) async {
    await _budgetsCollection(userId).doc(budgetId).update({
      'spent': spent,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Increment budget spent amount
  Future<void> incrementBudgetSpent({
    required String userId,
    required String budgetId,
    required double amount,
  }) async {
    await _budgetsCollection(userId).doc(budgetId).update({
      'spent': FieldValue.increment(amount),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Soft delete a budget (set isActive to false)
  Future<void> deleteBudget({
    required String userId,
    required String budgetId,
  }) async {
    await _budgetsCollection(userId).doc(budgetId).update({
      'isActive': false,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Permanently delete a budget
  Future<void> permanentlyDeleteBudget({
    required String userId,
    required String budgetId,
  }) async {
    await _budgetsCollection(userId).doc(budgetId).delete();
  }

  /// Reset budget spent amount
  Future<void> resetBudgetSpent({
    required String userId,
    required String budgetId,
    DateTime? newStartDate,
  }) async {
    final updates = <String, dynamic>{
      'spent': 0.0,
      'updatedAt': FieldValue.serverTimestamp(),
    };

    if (newStartDate != null) {
      updates['startDate'] = newStartDate.toIso8601String();
    }

    await _budgetsCollection(userId).doc(budgetId).update(updates);
  }

  // ===== Rollover Operations =====

  /// Reset budget for new period with optional rollover
  Future<void> resetBudgetWithRollover({
    required String userId,
    required String budgetId,
  }) async {
    final budget = await getBudget(userId: userId, budgetId: budgetId);
    if (budget == null) return;

    final now = DateTime.now();
    double rolloverAmount = 0.0;

    // Calculate rollover amount if enabled
    if (budget.rollover && budget.remaining > 0) {
      rolloverAmount = budget.remaining;
      debugPrint('Rolling over \$${rolloverAmount.toStringAsFixed(2)} to next period');
    }

    // Calculate new start date based on period
    final newStartDate = _calculateNextPeriodStart(budget.period, now);

    await _budgetsCollection(userId).doc(budgetId).update({
      'spent': 0.0,
      'rolloverAmount': rolloverAmount,
      'startDate': newStartDate.toIso8601String(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Check and reset all budgets that have ended their period
  Future<int> checkAndResetExpiredBudgets(String userId) async {
    final budgets = await getBudgets(userId);
    int resetCount = 0;

    for (final budget in budgets) {
      if (_shouldResetBudget(budget)) {
        await resetBudgetWithRollover(userId: userId, budgetId: budget.id);
        resetCount++;
      }
    }

    return resetCount;
  }

  /// Check if a budget should be reset based on its period
  bool _shouldResetBudget(BudgetModel budget) {
    final now = DateTime.now();
    final periodEnd = _calculatePeriodEnd(budget.period, budget.startDate);
    return now.isAfter(periodEnd);
  }

  /// Calculate the end of the current period
  DateTime _calculatePeriodEnd(BudgetPeriod period, DateTime startDate) {
    switch (period) {
      case BudgetPeriod.daily:
        return DateTime(startDate.year, startDate.month, startDate.day, 23, 59, 59);
      case BudgetPeriod.weekly:
        return startDate.add(const Duration(days: 7));
      case BudgetPeriod.biWeekly:
        return startDate.add(const Duration(days: 14));
      case BudgetPeriod.monthly:
        return DateTime(startDate.year, startDate.month + 1, startDate.day);
      case BudgetPeriod.quarterly:
        return DateTime(startDate.year, startDate.month + 3, startDate.day);
      case BudgetPeriod.yearly:
        return DateTime(startDate.year + 1, startDate.month, startDate.day);
      case BudgetPeriod.custom:
        return startDate.add(const Duration(days: 30)); // Default for custom
    }
  }

  /// Calculate the start of the next period
  DateTime _calculateNextPeriodStart(BudgetPeriod period, DateTime now) {
    switch (period) {
      case BudgetPeriod.daily:
        return DateTime(now.year, now.month, now.day);
      case BudgetPeriod.weekly:
        // Start of current week (Monday)
        final daysFromMonday = now.weekday - 1;
        return DateTime(now.year, now.month, now.day - daysFromMonday);
      case BudgetPeriod.biWeekly:
        return DateTime(now.year, now.month, now.day);
      case BudgetPeriod.monthly:
        return DateTime(now.year, now.month, 1);
      case BudgetPeriod.quarterly:
        final quarterMonth = ((now.month - 1) ~/ 3) * 3 + 1;
        return DateTime(now.year, quarterMonth, 1);
      case BudgetPeriod.yearly:
        return DateTime(now.year, 1, 1);
      case BudgetPeriod.custom:
        return now;
    }
  }

  // ===== Sharing Operations =====

  /// Share a budget with another user
  Future<void> shareBudget({
    required String userId,
    required String budgetId,
    required String shareWithUserId,
  }) async {
    await _budgetsCollection(userId).doc(budgetId).update({
      'isShared': true,
      'sharedWith': FieldValue.arrayUnion([shareWithUserId]),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Share budget with multiple users
  Future<void> shareBudgetWithMultiple({
    required String userId,
    required String budgetId,
    required List<String> shareWithUserIds,
  }) async {
    await _budgetsCollection(userId).doc(budgetId).update({
      'isShared': true,
      'sharedWith': FieldValue.arrayUnion(shareWithUserIds),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Remove user from shared budget
  Future<void> unshareFromUser({
    required String userId,
    required String budgetId,
    required String removeUserId,
  }) async {
    final budget = await getBudget(userId: userId, budgetId: budgetId);
    if (budget == null) return;

    final newSharedWith = budget.sharedWith.where((id) => id != removeUserId).toList();

    await _budgetsCollection(userId).doc(budgetId).update({
      'sharedWith': newSharedWith,
      'isShared': newSharedWith.isNotEmpty,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Stop sharing a budget entirely
  Future<void> stopSharingBudget({
    required String userId,
    required String budgetId,
  }) async {
    await _budgetsCollection(userId).doc(budgetId).update({
      'isShared': false,
      'sharedWith': [],
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}
