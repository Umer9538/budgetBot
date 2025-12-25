import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/enums/enums.dart';
import '../models/micro_task_model.dart';

/// Provider for MicroTaskService
final microTaskServiceProvider = Provider<MicroTaskService>((ref) {
  return MicroTaskService();
});

/// Service for gamified micro-tasks (Wealth Builder)
class MicroTaskService {
  MicroTaskService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;
  final _random = Random();

  // Collection references
  CollectionReference _tasksCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('micro_tasks');

  CollectionReference _challengesCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('daily_challenges');

  CollectionReference _achievementsCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('achievements');

  // ===== Daily Challenge Operations =====

  /// Generate daily challenge with tasks
  Future<DailyChallenge> generateDailyChallenge(String userId) async {
    final today = DateTime.now();
    final dateKey = '${today.year}-${today.month}-${today.day}';

    // Check if already exists
    final existing = await _challengesCollection(userId).doc(dateKey).get();
    if (existing.exists) {
      return DailyChallenge.fromJson(existing.data() as Map<String, dynamic>);
    }

    // Generate 3-5 tasks for today
    final tasks = await _generateDailyTasks(userId);
    final totalPoints = tasks.fold<int>(0, (sum, t) => sum + t.points);

    final challenge = DailyChallenge(
      id: dateKey,
      userId: userId,
      date: today,
      tasks: tasks,
      totalPoints: totalPoints,
      earnedPoints: 0,
      completedCount: 0,
      bonusEarned: false,
    );

    // Save to Firestore
    await _challengesCollection(userId).doc(dateKey).set(challenge.toJson());

    return challenge;
  }

  /// Get today's challenge
  Future<DailyChallenge?> getTodayChallenge(String userId) async {
    final today = DateTime.now();
    final dateKey = '${today.year}-${today.month}-${today.day}';

    final doc = await _challengesCollection(userId).doc(dateKey).get();
    if (!doc.exists) return null;

    return DailyChallenge.fromJson(doc.data() as Map<String, dynamic>);
  }

  /// Stream today's challenge
  Stream<DailyChallenge?> watchTodayChallenge(String userId) {
    final today = DateTime.now();
    final dateKey = '${today.year}-${today.month}-${today.day}';

    return _challengesCollection(userId).doc(dateKey).snapshots().map((doc) {
      if (!doc.exists) return null;
      return DailyChallenge.fromJson(doc.data() as Map<String, dynamic>);
    });
  }

  // ===== Task Operations =====

  /// Complete a task
  Future<int> completeTask(String userId, String taskId) async {
    final today = DateTime.now();
    final dateKey = '${today.year}-${today.month}-${today.day}';

    // Get current challenge
    final doc = await _challengesCollection(userId).doc(dateKey).get();
    if (!doc.exists) return 0;

    final challenge = DailyChallenge.fromJson(doc.data() as Map<String, dynamic>);

    // Find and update task
    final updatedTasks = challenge.tasks.map((t) {
      if (t.id == taskId && t.status != TaskStatus.completed) {
        return t.copyWith(
          status: TaskStatus.completed,
          completedAt: DateTime.now(),
        );
      }
      return t;
    }).toList();

    // Calculate new totals
    final completedCount = updatedTasks.where((t) => t.status == TaskStatus.completed).length;
    final earnedPoints = updatedTasks
        .where((t) => t.status == TaskStatus.completed)
        .fold<int>(0, (sum, t) => sum + t.points);

    // Check for bonus (all tasks completed)
    final bonusEarned = completedCount == updatedTasks.length;
    final bonusPoints = bonusEarned ? 50 : 0;

    // Update challenge
    final updatedChallenge = challenge.copyWith(
      tasks: updatedTasks,
      completedCount: completedCount,
      earnedPoints: earnedPoints + bonusPoints,
      bonusEarned: bonusEarned,
      completedAt: bonusEarned ? DateTime.now() : null,
    );

    await _challengesCollection(userId).doc(dateKey).set(updatedChallenge.toJson());

    // Update user gamification stats
    final taskPoints = updatedTasks.firstWhere((t) => t.id == taskId).points;
    await _updateUserStats(userId, taskPoints + bonusPoints);

    // Check for achievements
    await _checkAchievements(userId);

    return taskPoints + bonusPoints;
  }

  /// Skip a task
  Future<void> skipTask(String userId, String taskId) async {
    final today = DateTime.now();
    final dateKey = '${today.year}-${today.month}-${today.day}';

    final doc = await _challengesCollection(userId).doc(dateKey).get();
    if (!doc.exists) return;

    final challenge = DailyChallenge.fromJson(doc.data() as Map<String, dynamic>);

    final updatedTasks = challenge.tasks.map((t) {
      if (t.id == taskId) {
        return t.copyWith(status: TaskStatus.skipped);
      }
      return t;
    }).toList();

    await _challengesCollection(userId).doc(dateKey).update({
      'tasks': updatedTasks.map((t) => t.toJson()).toList(),
    });
  }

  // ===== Gamification Stats =====

  /// Get user's gamification stats
  Future<GamificationStats> getStats(String userId) async {
    final userDoc = await _firestore.collection('users').doc(userId).get();
    final data = userDoc.data() ?? {};
    final gamification = data['gamification'] as Map<String, dynamic>? ?? {};

    final level = gamification['level'] as int? ?? 1;
    final points = gamification['points'] as int? ?? 0;
    final streak = gamification['streak'] as int? ?? 0;

    // Count completed tasks
    final tasksSnapshot = await _firestore
        .collectionGroup('micro_tasks')
        .where('userId', isEqualTo: userId)
        .where('status', isEqualTo: 'completed')
        .count()
        .get();
    final tasksCompleted = tasksSnapshot.count ?? 0;

    // Count achievements
    final achievementsSnapshot = await _achievementsCollection(userId)
        .where('unlockedAt', isNotEqualTo: null)
        .count()
        .get();
    final achievementsUnlocked = achievementsSnapshot.count ?? 0;

    // Calculate completion rate
    final allTasksSnapshot = await _firestore
        .collectionGroup('micro_tasks')
        .where('userId', isEqualTo: userId)
        .count()
        .get();
    final allTasks = allTasksSnapshot.count ?? 1;
    final completionRate = allTasks > 0 ? tasksCompleted / allTasks : 0.0;

    // Points to next level
    final pointsToNext = _pointsForLevel(level + 1) - points;

    // Recent achievements
    final recentSnapshot = await _achievementsCollection(userId)
        .where('unlockedAt', isNotEqualTo: null)
        .orderBy('unlockedAt', descending: true)
        .limit(3)
        .get();
    final recentAchievements = recentSnapshot.docs
        .map((d) => Achievement.fromJson(d.data() as Map<String, dynamic>))
        .toList();

    return GamificationStats(
      totalPoints: points,
      level: level,
      currentStreak: streak,
      longestStreak: gamification['longestStreak'] as int? ?? streak,
      tasksCompleted: tasksCompleted,
      achievementsUnlocked: achievementsUnlocked,
      completionRate: completionRate,
      pointsToNextLevel: pointsToNext.clamp(0, 9999),
      userLevel: UserLevelExtension.fromLevel(level),
      recentAchievements: recentAchievements,
    );
  }

  /// Get leaderboard
  Future<List<LeaderboardEntry>> getLeaderboard({int limit = 10}) async {
    final snapshot = await _firestore
        .collection('users')
        .orderBy('gamification.points', descending: true)
        .limit(limit)
        .get();

    int rank = 0;
    return snapshot.docs.map((doc) {
      rank++;
      final data = doc.data();
      final gamification = data['gamification'] as Map<String, dynamic>? ?? {};

      return LeaderboardEntry(
        odUserId: doc.id,
        displayName: data['displayName'] ?? 'Anonymous',
        rank: rank,
        points: gamification['points'] as int? ?? 0,
        level: gamification['level'] as int? ?? 1,
        streak: gamification['streak'] as int? ?? 0,
        avatarUrl: data['avatarUrl'],
      );
    }).toList();
  }

  // ===== Achievement Operations =====

  /// Get all achievements
  Future<List<Achievement>> getAchievements(String userId) async {
    // Initialize default achievements if needed
    await _initializeAchievements(userId);

    final snapshot = await _achievementsCollection(userId).get();
    return snapshot.docs
        .map((d) => Achievement.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  /// Get unlocked achievements
  Future<List<Achievement>> getUnlockedAchievements(String userId) async {
    final snapshot = await _achievementsCollection(userId)
        .where('unlockedAt', isNotEqualTo: null)
        .get();
    return snapshot.docs
        .map((d) => Achievement.fromJson(d.data() as Map<String, dynamic>))
        .toList();
  }

  // ===== Private Methods =====

  Future<List<MicroTask>> _generateDailyTasks(String userId) async {
    final tasks = <MicroTask>[];
    final taskTypes = TaskType.values.toList()..shuffle(_random);

    // Generate 3-5 tasks
    final taskCount = 3 + _random.nextInt(3);

    for (var i = 0; i < taskCount && i < taskTypes.length; i++) {
      final type = taskTypes[i];
      final template = _getTaskTemplate(type);
      final (minPoints, maxPoints) = type.pointsRange;
      final difficulty = TaskDifficulty.values[_random.nextInt(3)];
      final basePoints = minPoints + _random.nextInt(maxPoints - minPoints + 1);
      final points = (basePoints * difficulty.pointMultiplier).round();

      tasks.add(MicroTask(
        id: '${type.name}_${DateTime.now().millisecondsSinceEpoch}_$i',
        userId: userId,
        type: type,
        title: template.title,
        description: template.description,
        points: points,
        status: TaskStatus.pending,
        difficulty: difficulty,
        dueDate: DateTime.now().add(const Duration(hours: 24)),
        actionUrl: template.actionUrl,
        actionLabel: template.actionLabel,
        createdAt: DateTime.now(),
      ));
    }

    return tasks;
  }

  _TaskTemplate _getTaskTemplate(TaskType type) {
    final templates = _taskTemplates[type] ?? [];
    if (templates.isEmpty) {
      return _TaskTemplate(
        title: '${type.displayName} Task',
        description: type.description,
      );
    }
    return templates[_random.nextInt(templates.length)];
  }

  Future<void> _updateUserStats(String userId, int points) async {
    final userRef = _firestore.collection('users').doc(userId);

    await _firestore.runTransaction((transaction) async {
      final doc = await transaction.get(userRef);
      final data = doc.data() ?? {};
      final gamification = data['gamification'] as Map<String, dynamic>? ?? {};

      final currentPoints = gamification['points'] as int? ?? 0;
      final currentLevel = gamification['level'] as int? ?? 1;
      final currentStreak = gamification['streak'] as int? ?? 0;
      final lastActive = gamification['lastActiveDate'] as String?;

      // Update streak
      final today = DateTime.now();
      final todayStr = '${today.year}-${today.month}-${today.day}';
      final yesterday = today.subtract(const Duration(days: 1));
      final yesterdayStr = '${yesterday.year}-${yesterday.month}-${yesterday.day}';

      int newStreak = currentStreak;
      if (lastActive == yesterdayStr) {
        newStreak = currentStreak + 1;
      } else if (lastActive != todayStr) {
        newStreak = 1;
      }

      // Calculate new level
      final newPoints = currentPoints + points;
      int newLevel = currentLevel;
      while (_pointsForLevel(newLevel + 1) <= newPoints) {
        newLevel++;
      }

      transaction.update(userRef, {
        'gamification.points': newPoints,
        'gamification.level': newLevel,
        'gamification.streak': newStreak,
        'gamification.longestStreak': max(
          gamification['longestStreak'] as int? ?? 0,
          newStreak,
        ),
        'gamification.lastActiveDate': todayStr,
      });
    });
  }

  int _pointsForLevel(int level) {
    // Exponential curve: level 2 = 100, level 3 = 250, level 4 = 500...
    return (50 * level * level).round();
  }

  Future<void> _checkAchievements(String userId) async {
    final stats = await getStats(userId);

    // Check streak achievements
    if (stats.currentStreak >= 7) {
      await _unlockAchievement(userId, 'week_warrior');
    }
    if (stats.currentStreak >= 30) {
      await _unlockAchievement(userId, 'monthly_master');
    }

    // Check task completion achievements
    if (stats.tasksCompleted >= 10) {
      await _unlockAchievement(userId, 'task_starter');
    }
    if (stats.tasksCompleted >= 50) {
      await _unlockAchievement(userId, 'task_champion');
    }
    if (stats.tasksCompleted >= 100) {
      await _unlockAchievement(userId, 'task_legend');
    }

    // Check level achievements
    if (stats.level >= 5) {
      await _unlockAchievement(userId, 'rising_star');
    }
    if (stats.level >= 10) {
      await _unlockAchievement(userId, 'finance_pro');
    }
  }

  Future<void> _unlockAchievement(String userId, String achievementId) async {
    final doc = await _achievementsCollection(userId).doc(achievementId).get();
    if (!doc.exists) return;

    final achievement = Achievement.fromJson(doc.data() as Map<String, dynamic>);
    if (achievement.unlockedAt != null) return; // Already unlocked

    await _achievementsCollection(userId).doc(achievementId).update({
      'unlockedAt': FieldValue.serverTimestamp(),
    });

    // Award bonus points
    if (achievement.bonusPoints != null) {
      await _updateUserStats(userId, achievement.bonusPoints!);
    }
  }

  Future<void> _initializeAchievements(String userId) async {
    final snapshot = await _achievementsCollection(userId).limit(1).get();
    if (snapshot.docs.isNotEmpty) return; // Already initialized

    final achievements = [
      const Achievement(
        id: 'first_task',
        name: 'First Steps',
        description: 'Complete your first task',
        icon: '🎯',
        category: AchievementCategory.milestone,
        requiredProgress: 1,
        bonusPoints: 25,
      ),
      const Achievement(
        id: 'task_starter',
        name: 'Task Starter',
        description: 'Complete 10 tasks',
        icon: '⭐',
        category: AchievementCategory.tracking,
        requiredProgress: 10,
        bonusPoints: 50,
      ),
      const Achievement(
        id: 'task_champion',
        name: 'Task Champion',
        description: 'Complete 50 tasks',
        icon: '🏆',
        category: AchievementCategory.tracking,
        requiredProgress: 50,
        bonusPoints: 100,
      ),
      const Achievement(
        id: 'task_legend',
        name: 'Task Legend',
        description: 'Complete 100 tasks',
        icon: '👑',
        category: AchievementCategory.tracking,
        requiredProgress: 100,
        bonusPoints: 200,
      ),
      const Achievement(
        id: 'week_warrior',
        name: 'Week Warrior',
        description: '7 day streak',
        icon: '🔥',
        category: AchievementCategory.streak,
        requiredProgress: 7,
        bonusPoints: 75,
      ),
      const Achievement(
        id: 'monthly_master',
        name: 'Monthly Master',
        description: '30 day streak',
        icon: '💪',
        category: AchievementCategory.streak,
        requiredProgress: 30,
        bonusPoints: 250,
      ),
      const Achievement(
        id: 'rising_star',
        name: 'Rising Star',
        description: 'Reach level 5',
        icon: '🌟',
        category: AchievementCategory.milestone,
        requiredProgress: 5,
        bonusPoints: 100,
      ),
      const Achievement(
        id: 'finance_pro',
        name: 'Finance Pro',
        description: 'Reach level 10',
        icon: '💼',
        category: AchievementCategory.milestone,
        requiredProgress: 10,
        bonusPoints: 250,
      ),
    ];

    for (final achievement in achievements) {
      await _achievementsCollection(userId).doc(achievement.id).set(achievement.toJson());
    }
  }

  // Task templates
  static final Map<TaskType, List<_TaskTemplate>> _taskTemplates = {
    TaskType.save: [
      _TaskTemplate(
        title: 'Skip the coffee',
        description: 'Make coffee at home today and save \$5',
        actionLabel: 'Log Savings',
      ),
      _TaskTemplate(
        title: 'No-spend hour',
        description: 'Go 1 hour without opening shopping apps',
        actionLabel: 'Mark Complete',
      ),
      _TaskTemplate(
        title: 'Round up savings',
        description: 'Transfer \$5 to your savings account',
        actionLabel: 'Transfer Now',
        actionUrl: '/savings',
      ),
    ],
    TaskType.learn: [
      _TaskTemplate(
        title: 'Financial tip',
        description: 'Read today\'s money-saving tip',
        actionLabel: 'Read Tip',
      ),
      _TaskTemplate(
        title: 'Budget basics',
        description: 'Review your budget categories',
        actionLabel: 'View Budgets',
        actionUrl: '/budgets',
      ),
      _TaskTemplate(
        title: 'Know your numbers',
        description: 'Check your net worth trend',
        actionLabel: 'View Report',
      ),
    ],
    TaskType.optimize: [
      _TaskTemplate(
        title: 'Subscription audit',
        description: 'Review one subscription you might not need',
        actionLabel: 'View Subscriptions',
        actionUrl: '/subscriptions',
      ),
      _TaskTemplate(
        title: 'Compare prices',
        description: 'Check if you can save on a regular purchase',
        actionLabel: 'Mark Complete',
      ),
      _TaskTemplate(
        title: 'Unused service?',
        description: 'Identify a service you\'re paying for but not using',
        actionLabel: 'Find Services',
      ),
    ],
    TaskType.invest: [
      _TaskTemplate(
        title: 'Market check',
        description: 'Review your investment portfolio',
        actionLabel: 'View Portfolio',
      ),
      _TaskTemplate(
        title: 'Learn investing',
        description: 'Read about compound interest',
        actionLabel: 'Learn More',
      ),
    ],
    TaskType.track: [
      _TaskTemplate(
        title: 'Log a receipt',
        description: 'Scan or log a receipt from today',
        actionLabel: 'Scan Receipt',
        actionUrl: '/scan',
      ),
      _TaskTemplate(
        title: 'Verify categories',
        description: 'Check if recent transactions are categorized correctly',
        actionLabel: 'View Transactions',
        actionUrl: '/transactions',
      ),
      _TaskTemplate(
        title: 'Add a note',
        description: 'Add context to a recent transaction',
        actionLabel: 'Edit Transaction',
      ),
    ],
  };
}

class _TaskTemplate {
  final String title;
  final String description;
  final String? actionUrl;
  final String? actionLabel;

  _TaskTemplate({
    required this.title,
    required this.description,
    this.actionUrl,
    this.actionLabel,
  });
}
