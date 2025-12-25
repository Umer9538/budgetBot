import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/enums.dart';

part 'micro_task_model.freezed.dart';
part 'micro_task_model.g.dart';

/// Model for micro-tasks (gamified wealth building)
@freezed
class MicroTask with _$MicroTask {
  const factory MicroTask({
    required String id,
    required String userId,
    required TaskType type,
    required String title,
    required String description,
    required int points,
    required TaskStatus status,
    required TaskDifficulty difficulty,
    DateTime? dueDate,
    DateTime? completedAt,
    String? actionUrl,
    String? actionLabel,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
  }) = _MicroTask;

  factory MicroTask.fromJson(Map<String, dynamic> json) =>
      _$MicroTaskFromJson(json);
}

/// Task difficulty levels
enum TaskDifficulty {
  easy,
  medium,
  hard,
}

extension TaskDifficultyExtension on TaskDifficulty {
  String get displayName {
    switch (this) {
      case TaskDifficulty.easy:
        return 'Easy';
      case TaskDifficulty.medium:
        return 'Medium';
      case TaskDifficulty.hard:
        return 'Hard';
    }
  }

  double get pointMultiplier {
    switch (this) {
      case TaskDifficulty.easy:
        return 1.0;
      case TaskDifficulty.medium:
        return 1.5;
      case TaskDifficulty.hard:
        return 2.0;
    }
  }

  String get icon {
    switch (this) {
      case TaskDifficulty.easy:
        return '🟢';
      case TaskDifficulty.medium:
        return '🟡';
      case TaskDifficulty.hard:
        return '🔴';
    }
  }
}

/// Daily challenge model
@freezed
class DailyChallenge with _$DailyChallenge {
  const factory DailyChallenge({
    required String id,
    required String userId,
    required DateTime date,
    required List<MicroTask> tasks,
    required int totalPoints,
    required int earnedPoints,
    required int completedCount,
    required bool bonusEarned,
    DateTime? completedAt,
  }) = _DailyChallenge;

  factory DailyChallenge.fromJson(Map<String, dynamic> json) =>
      _$DailyChallengeFromJson(json);
}

/// Achievement/Badge model
@freezed
class Achievement with _$Achievement {
  const factory Achievement({
    required String id,
    required String name,
    required String description,
    required String icon,
    required AchievementCategory category,
    required int requiredProgress,
    int? currentProgress,
    DateTime? unlockedAt,
    int? bonusPoints,
  }) = _Achievement;

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);
}

enum AchievementCategory {
  savings,
  streak,
  learning,
  budgeting,
  tracking,
  social,
  milestone,
}

extension AchievementCategoryExtension on AchievementCategory {
  String get displayName {
    switch (this) {
      case AchievementCategory.savings:
        return 'Savings';
      case AchievementCategory.streak:
        return 'Streaks';
      case AchievementCategory.learning:
        return 'Learning';
      case AchievementCategory.budgeting:
        return 'Budgeting';
      case AchievementCategory.tracking:
        return 'Tracking';
      case AchievementCategory.social:
        return 'Social';
      case AchievementCategory.milestone:
        return 'Milestones';
    }
  }
}

/// Leaderboard entry
@freezed
class LeaderboardEntry with _$LeaderboardEntry {
  const factory LeaderboardEntry({
    required String odUserId,
    required String displayName,
    required int rank,
    required int points,
    required int level,
    required int streak,
    String? avatarUrl,
  }) = _LeaderboardEntry;

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardEntryFromJson(json);
}

/// Gamification stats
@freezed
class GamificationStats with _$GamificationStats {
  const factory GamificationStats({
    required int totalPoints,
    required int level,
    required int currentStreak,
    required int longestStreak,
    required int tasksCompleted,
    required int achievementsUnlocked,
    required double completionRate,
    required int pointsToNextLevel,
    required UserLevel userLevel,
    @Default([]) List<Achievement> recentAchievements,
  }) = _GamificationStats;

  factory GamificationStats.fromJson(Map<String, dynamic> json) =>
      _$GamificationStatsFromJson(json);
}
