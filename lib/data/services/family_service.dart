import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/enums/enums.dart';
import '../models/family_model.dart';

/// Provider for FamilyService
final familyServiceProvider = Provider<FamilyService>((ref) {
  return FamilyService();
});

/// Service for managing Family Financial Mesh
class FamilyService {
  FamilyService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  // Collection references
  CollectionReference get _familiesCollection => _firestore.collection('families');

  CollectionReference _activitiesCollection(String familyId) =>
      _familiesCollection.doc(familyId).collection('activities');

  // ===== Family CRUD =====

  /// Create a new family
  Future<FamilyGroup> createFamily({
    required String name,
    required String adminUserId,
    required String adminDisplayName,
    String? adminAvatarUrl,
  }) async {
    final familyId = DateTime.now().millisecondsSinceEpoch.toString();

    final adminMember = FamilyMember(
      odUserId: adminUserId,
      displayName: adminDisplayName,
      role: FamilyRole.admin,
      joinedAt: DateTime.now(),
      avatarUrl: adminAvatarUrl,
      visibleCategories: CategoryType.values.map((c) => c.name).toList(),
    );

    final family = FamilyGroup(
      id: familyId,
      name: name,
      adminUserId: adminUserId,
      members: [adminMember],
      settings: const FamilySettings(),
      sharedBudgets: [],
      goals: [],
      allowances: [],
      createdAt: DateTime.now(),
    );

    await _familiesCollection.doc(familyId).set({
      ...family.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    // Update user's family reference
    await _firestore.collection('users').doc(adminUserId).update({
      'familyId': familyId,
    });

    return family;
  }

  /// Get family by ID
  Future<FamilyGroup?> getFamily(String familyId) async {
    final doc = await _familiesCollection.doc(familyId).get();
    if (!doc.exists) return null;

    return FamilyGroup.fromJson(doc.data() as Map<String, dynamic>);
  }

  /// Stream family
  Stream<FamilyGroup?> watchFamily(String familyId) {
    return _familiesCollection.doc(familyId).snapshots().map((doc) {
      if (!doc.exists) return null;
      return FamilyGroup.fromJson(doc.data() as Map<String, dynamic>);
    });
  }

  /// Get family for a user
  Future<FamilyGroup?> getFamilyForUser(String userId) async {
    final userDoc = await _firestore.collection('users').doc(userId).get();
    final familyId = userDoc.data()?['familyId'] as String?;

    if (familyId == null) return null;

    return getFamily(familyId);
  }

  /// Update family settings
  Future<void> updateSettings(String familyId, FamilySettings settings) async {
    await _familiesCollection.doc(familyId).update({
      'settings': settings.toJson(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // ===== Member Management =====

  /// Invite member to family
  Future<void> inviteMember({
    required String familyId,
    required String email,
    required FamilyRole role,
  }) async {
    // Create invitation record
    await _firestore.collection('family_invitations').add({
      'familyId': familyId,
      'email': email,
      'role': role.name,
      'status': 'pending',
      'createdAt': FieldValue.serverTimestamp(),
      'expiresAt': Timestamp.fromDate(DateTime.now().add(const Duration(days: 7))),
    });

    // TODO: Send invitation email via Cloud Function
  }

  /// Add member directly
  Future<void> addMember({
    required String familyId,
    required String odUserId,
    required String displayName,
    required FamilyRole role,
    String? avatarUrl,
    double? monthlyAllowance,
  }) async {
    final member = FamilyMember(
      odUserId: odUserId,
      displayName: displayName,
      role: role,
      joinedAt: DateTime.now(),
      avatarUrl: avatarUrl,
      visibleCategories: _getDefaultVisibleCategories(role),
      monthlyAllowance: monthlyAllowance,
    );

    await _familiesCollection.doc(familyId).update({
      'members': FieldValue.arrayUnion([member.toJson()]),
      'updatedAt': FieldValue.serverTimestamp(),
    });

    // Update user's family reference
    await _firestore.collection('users').doc(odUserId).update({
      'familyId': familyId,
    });

    // Log activity
    await _logActivity(
      familyId: familyId,
      memberUserId: odUserId,
      memberName: displayName,
      type: FamilyActivityType.memberJoined,
      description: '$displayName joined the family',
    );
  }

  /// Remove member from family
  Future<void> removeMember(String familyId, String odUserId) async {
    final family = await getFamily(familyId);
    if (family == null) return;

    final updatedMembers = family.members
        .where((m) => m.odUserId != odUserId)
        .map((m) => m.toJson())
        .toList();

    await _familiesCollection.doc(familyId).update({
      'members': updatedMembers,
      'updatedAt': FieldValue.serverTimestamp(),
    });

    // Remove user's family reference
    await _firestore.collection('users').doc(odUserId).update({
      'familyId': FieldValue.delete(),
    });
  }

  /// Update member role
  Future<void> updateMemberRole(
    String familyId,
    String odUserId,
    FamilyRole newRole,
  ) async {
    final family = await getFamily(familyId);
    if (family == null) return;

    final updatedMembers = family.members.map((m) {
      if (m.odUserId == odUserId) {
        return m.copyWith(
          role: newRole,
          visibleCategories: _getDefaultVisibleCategories(newRole),
        );
      }
      return m;
    }).map((m) => m.toJson()).toList();

    await _familiesCollection.doc(familyId).update({
      'members': updatedMembers,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // ===== Shared Budgets =====

  /// Create shared budget
  Future<SharedBudget> createSharedBudget({
    required String familyId,
    required String name,
    required CategoryType category,
    required double limit,
    required BudgetPeriod period,
    required List<String> memberIds,
  }) async {
    final budget = SharedBudget(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      category: category,
      limit: limit,
      spent: 0,
      period: period,
      memberIds: memberIds,
      startDate: DateTime.now(),
    );

    await _familiesCollection.doc(familyId).update({
      'sharedBudgets': FieldValue.arrayUnion([budget.toJson()]),
      'updatedAt': FieldValue.serverTimestamp(),
    });

    return budget;
  }

  /// Update shared budget spending
  Future<void> updateBudgetSpending(
    String familyId,
    String budgetId,
    double amount,
    String memberUserId,
    String memberName,
  ) async {
    final family = await getFamily(familyId);
    if (family == null) return;

    final updatedBudgets = family.sharedBudgets.map((b) {
      if (b.id == budgetId) {
        return b.copyWith(spent: b.spent + amount);
      }
      return b;
    }).map((b) => b.toJson()).toList();

    await _familiesCollection.doc(familyId).update({
      'sharedBudgets': updatedBudgets,
      'updatedAt': FieldValue.serverTimestamp(),
    });

    // Log activity
    await _logActivity(
      familyId: familyId,
      memberUserId: memberUserId,
      memberName: memberName,
      type: FamilyActivityType.sharedExpense,
      description: '$memberName spent \$${amount.toStringAsFixed(2)} on shared budget',
      amount: amount,
      relatedId: budgetId,
    );
  }

  // ===== Family Goals =====

  /// Create family goal
  Future<FamilyGoal> createGoal({
    required String familyId,
    required String title,
    required String description,
    required double targetAmount,
    required DateTime targetDate,
    String? icon,
  }) async {
    final goal = FamilyGoal(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      targetAmount: targetAmount,
      currentAmount: 0,
      targetDate: targetDate,
      status: FamilyGoalStatus.active,
      contributions: [],
      icon: icon,
    );

    await _familiesCollection.doc(familyId).update({
      'goals': FieldValue.arrayUnion([goal.toJson()]),
      'updatedAt': FieldValue.serverTimestamp(),
    });

    return goal;
  }

  /// Contribute to goal
  Future<void> contributeToGoal({
    required String familyId,
    required String goalId,
    required String odUserId,
    required String displayName,
    required double amount,
    String? note,
  }) async {
    final family = await getFamily(familyId);
    if (family == null) return;

    final contribution = GoalContribution(
      odUserId: odUserId,
      displayName: displayName,
      amount: amount,
      date: DateTime.now(),
      note: note,
    );

    final updatedGoals = family.goals.map((g) {
      if (g.id == goalId) {
        final newAmount = g.currentAmount + amount;
        final newStatus = newAmount >= g.targetAmount
            ? FamilyGoalStatus.completed
            : g.status;

        return g.copyWith(
          currentAmount: newAmount,
          status: newStatus,
          contributions: [...g.contributions, contribution],
        );
      }
      return g;
    }).map((g) => g.toJson()).toList();

    await _familiesCollection.doc(familyId).update({
      'goals': updatedGoals,
      'updatedAt': FieldValue.serverTimestamp(),
    });

    // Log activity
    await _logActivity(
      familyId: familyId,
      memberUserId: odUserId,
      memberName: displayName,
      type: FamilyActivityType.goalContribution,
      description: '$displayName contributed \$${amount.toStringAsFixed(2)} to goal',
      amount: amount,
      relatedId: goalId,
    );

    // Check if goal completed
    final updatedGoal = (await getFamily(familyId))?.goals.firstWhere((g) => g.id == goalId);
    if (updatedGoal?.status == FamilyGoalStatus.completed) {
      await _logActivity(
        familyId: familyId,
        memberUserId: odUserId,
        memberName: 'Family',
        type: FamilyActivityType.goalCompleted,
        description: 'Goal "${updatedGoal!.title}" has been completed!',
        relatedId: goalId,
      );
    }
  }

  // ===== Allowances =====

  /// Create allowance for a member
  Future<Allowance> createAllowance({
    required String familyId,
    required String recipientUserId,
    required String recipientName,
    required double amount,
    required AllowanceFrequency frequency,
    List<AllowanceRule>? rules,
  }) async {
    final allowance = Allowance(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      recipientUserId: recipientUserId,
      recipientName: recipientName,
      amount: amount,
      frequency: frequency,
      nextPaymentDate: _calculateNextPaymentDate(frequency),
      rules: rules ?? [],
    );

    await _familiesCollection.doc(familyId).update({
      'allowances': FieldValue.arrayUnion([allowance.toJson()]),
      'updatedAt': FieldValue.serverTimestamp(),
    });

    return allowance;
  }

  /// Process allowance payment
  Future<void> processAllowancePayment(
    String familyId,
    String allowanceId,
  ) async {
    final family = await getFamily(familyId);
    if (family == null) return;

    final updatedAllowances = family.allowances.map((a) {
      if (a.id == allowanceId) {
        return a.copyWith(
          lastPaidDate: DateTime.now(),
          nextPaymentDate: _calculateNextPaymentDate(a.frequency),
          spentThisPeriod: 0, // Reset spending
        );
      }
      return a;
    }).map((a) => a.toJson()).toList();

    await _familiesCollection.doc(familyId).update({
      'allowances': updatedAllowances,
      'updatedAt': FieldValue.serverTimestamp(),
    });

    // Find the allowance to log activity
    final allowance = family.allowances.firstWhere((a) => a.id == allowanceId);

    await _logActivity(
      familyId: familyId,
      memberUserId: allowance.recipientUserId,
      memberName: allowance.recipientName,
      type: FamilyActivityType.allowanceReceived,
      description: '${allowance.recipientName} received \$${allowance.amount.toStringAsFixed(2)} allowance',
      amount: allowance.amount,
      relatedId: allowanceId,
    );
  }

  /// Update allowance spending
  Future<void> updateAllowanceSpending(
    String familyId,
    String allowanceId,
    double amount,
  ) async {
    final family = await getFamily(familyId);
    if (family == null) return;

    final updatedAllowances = family.allowances.map((a) {
      if (a.id == allowanceId) {
        return a.copyWith(
          spentThisPeriod: (a.spentThisPeriod ?? 0) + amount,
        );
      }
      return a;
    }).map((a) => a.toJson()).toList();

    await _familiesCollection.doc(familyId).update({
      'allowances': updatedAllowances,
      'updatedAt': FieldValue.serverTimestamp(),
    });

    final allowance = family.allowances.firstWhere((a) => a.id == allowanceId);

    await _logActivity(
      familyId: familyId,
      memberUserId: allowance.recipientUserId,
      memberName: allowance.recipientName,
      type: FamilyActivityType.allowanceSpent,
      description: '${allowance.recipientName} spent \$${amount.toStringAsFixed(2)}',
      amount: amount,
      relatedId: allowanceId,
    );
  }

  // ===== Activity Feed =====

  /// Get family activity feed
  Future<List<FamilyActivity>> getActivities(
    String familyId, {
    int limit = 50,
  }) async {
    final snapshot = await _activitiesCollection(familyId)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .get();

    return snapshot.docs
        .map((d) => FamilyActivity.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  /// Stream activity feed
  Stream<List<FamilyActivity>> watchActivities(
    String familyId, {
    int limit = 20,
  }) {
    return _activitiesCollection(familyId)
        .orderBy('timestamp', descending: true)
        .limit(limit)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((d) => FamilyActivity.fromJson(d.data() as Map<String, dynamic>))
            .toList());
  }

  // ===== Private Methods =====

  List<String> _getDefaultVisibleCategories(FamilyRole role) {
    switch (role) {
      case FamilyRole.admin:
        return CategoryType.values.map((c) => c.name).toList();
      case FamilyRole.adult:
        return CategoryType.values.map((c) => c.name).toList();
      case FamilyRole.teen:
        return [
          CategoryType.groceries.name,
          CategoryType.restaurants.name,
          CategoryType.coffeeShops.name,
          CategoryType.streamingServices.name,
          CategoryType.gaming.name,
          CategoryType.clothing.name,
          CategoryType.publicTransit.name,
        ];
      case FamilyRole.child:
        return [
          CategoryType.groceries.name,
          CategoryType.coffeeShops.name,
          CategoryType.streamingServices.name,
          CategoryType.gaming.name,
        ];
      case FamilyRole.viewer:
        return [];
    }
  }

  DateTime _calculateNextPaymentDate(AllowanceFrequency frequency) {
    final now = DateTime.now();
    switch (frequency) {
      case AllowanceFrequency.daily:
        return DateTime(now.year, now.month, now.day + 1);
      case AllowanceFrequency.weekly:
        return now.add(const Duration(days: 7));
      case AllowanceFrequency.biWeekly:
        return now.add(const Duration(days: 14));
      case AllowanceFrequency.monthly:
        return DateTime(now.year, now.month + 1, now.day);
    }
  }

  Future<void> _logActivity({
    required String familyId,
    required String memberUserId,
    required String memberName,
    required FamilyActivityType type,
    required String description,
    double? amount,
    String? relatedId,
  }) async {
    final activity = FamilyActivity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      familyId: familyId,
      memberUserId: memberUserId,
      memberName: memberName,
      type: type,
      description: description,
      timestamp: DateTime.now(),
      amount: amount,
      relatedId: relatedId,
    );

    await _activitiesCollection(familyId).doc(activity.id).set({
      ...activity.toJson(),
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
