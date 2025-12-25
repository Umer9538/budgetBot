/// Enum representing micro-task categories
enum TaskType {
  save,
  learn,
  optimize,
  invest,
  track,
}

extension TaskTypeExtension on TaskType {
  String get displayName {
    switch (this) {
      case TaskType.save:
        return 'Save';
      case TaskType.learn:
        return 'Learn';
      case TaskType.optimize:
        return 'Optimize';
      case TaskType.invest:
        return 'Invest';
      case TaskType.track:
        return 'Track';
    }
  }

  String get icon {
    switch (this) {
      case TaskType.save:
        return '💰';
      case TaskType.learn:
        return '📚';
      case TaskType.optimize:
        return '🔍';
      case TaskType.invest:
        return '📈';
      case TaskType.track:
        return '📝';
    }
  }

  String get description {
    switch (this) {
      case TaskType.save:
        return 'Move money to savings, skip purchases';
      case TaskType.learn:
        return 'Read tips, complete quizzes';
      case TaskType.optimize:
        return 'Review subscriptions, check bills';
      case TaskType.invest:
        return 'Check portfolio, learn about investing';
      case TaskType.track:
        return 'Log receipts, verify categories';
    }
  }

  /// Base points range for this task type
  (int min, int max) get pointsRange {
    switch (this) {
      case TaskType.save:
        return (10, 50);
      case TaskType.learn:
        return (5, 20);
      case TaskType.optimize:
        return (15, 30);
      case TaskType.invest:
        return (10, 25);
      case TaskType.track:
        return (5, 15);
    }
  }
}

/// Enum for task status
enum TaskStatus {
  pending,
  inProgress,
  completed,
  skipped,
  expired,
}

extension TaskStatusExtension on TaskStatus {
  String get displayName {
    switch (this) {
      case TaskStatus.pending:
        return 'Pending';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.skipped:
        return 'Skipped';
      case TaskStatus.expired:
        return 'Expired';
    }
  }

  bool get isFinished {
    return this == TaskStatus.completed ||
        this == TaskStatus.skipped ||
        this == TaskStatus.expired;
  }
}

/// Enum for gamification user levels
enum UserLevel {
  beginner,
  intermediate,
  advanced,
  expert,
  master,
}

extension UserLevelExtension on UserLevel {
  String get displayName {
    switch (this) {
      case UserLevel.beginner:
        return 'Beginner';
      case UserLevel.intermediate:
        return 'Intermediate';
      case UserLevel.advanced:
        return 'Advanced';
      case UserLevel.expert:
        return 'Expert';
      case UserLevel.master:
        return 'Master';
    }
  }

  String get icon {
    switch (this) {
      case UserLevel.beginner:
        return '🌱';
      case UserLevel.intermediate:
        return '🌿';
      case UserLevel.advanced:
        return '🌳';
      case UserLevel.expert:
        return '⭐';
      case UserLevel.master:
        return '👑';
    }
  }

  /// Level range (1-5, 6-10, etc.)
  (int min, int max) get levelRange {
    switch (this) {
      case UserLevel.beginner:
        return (1, 5);
      case UserLevel.intermediate:
        return (6, 10);
      case UserLevel.advanced:
        return (11, 20);
      case UserLevel.expert:
        return (21, 35);
      case UserLevel.master:
        return (36, 100);
    }
  }

  static UserLevel fromLevel(int level) {
    if (level <= 5) return UserLevel.beginner;
    if (level <= 10) return UserLevel.intermediate;
    if (level <= 20) return UserLevel.advanced;
    if (level <= 35) return UserLevel.expert;
    return UserLevel.master;
  }
}
