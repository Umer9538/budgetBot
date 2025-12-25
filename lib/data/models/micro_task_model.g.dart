// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'micro_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MicroTaskImpl _$$MicroTaskImplFromJson(Map<String, dynamic> json) =>
    _$MicroTaskImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      type: $enumDecode(_$TaskTypeEnumMap, json['type']),
      title: json['title'] as String,
      description: json['description'] as String,
      points: (json['points'] as num).toInt(),
      status: $enumDecode(_$TaskStatusEnumMap, json['status']),
      difficulty: $enumDecode(_$TaskDifficultyEnumMap, json['difficulty']),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      actionUrl: json['actionUrl'] as String?,
      actionLabel: json['actionLabel'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MicroTaskImplToJson(_$MicroTaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'type': _$TaskTypeEnumMap[instance.type]!,
      'title': instance.title,
      'description': instance.description,
      'points': instance.points,
      'status': _$TaskStatusEnumMap[instance.status]!,
      'difficulty': _$TaskDifficultyEnumMap[instance.difficulty]!,
      'dueDate': instance.dueDate?.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'actionUrl': instance.actionUrl,
      'actionLabel': instance.actionLabel,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$TaskTypeEnumMap = {
  TaskType.save: 'save',
  TaskType.learn: 'learn',
  TaskType.optimize: 'optimize',
  TaskType.invest: 'invest',
  TaskType.track: 'track',
};

const _$TaskStatusEnumMap = {
  TaskStatus.pending: 'pending',
  TaskStatus.inProgress: 'inProgress',
  TaskStatus.completed: 'completed',
  TaskStatus.skipped: 'skipped',
  TaskStatus.expired: 'expired',
};

const _$TaskDifficultyEnumMap = {
  TaskDifficulty.easy: 'easy',
  TaskDifficulty.medium: 'medium',
  TaskDifficulty.hard: 'hard',
};

_$DailyChallengeImpl _$$DailyChallengeImplFromJson(Map<String, dynamic> json) =>
    _$DailyChallengeImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => MicroTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPoints: (json['totalPoints'] as num).toInt(),
      earnedPoints: (json['earnedPoints'] as num).toInt(),
      completedCount: (json['completedCount'] as num).toInt(),
      bonusEarned: json['bonusEarned'] as bool,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
    );

Map<String, dynamic> _$$DailyChallengeImplToJson(
  _$DailyChallengeImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'date': instance.date.toIso8601String(),
  'tasks': instance.tasks,
  'totalPoints': instance.totalPoints,
  'earnedPoints': instance.earnedPoints,
  'completedCount': instance.completedCount,
  'bonusEarned': instance.bonusEarned,
  'completedAt': instance.completedAt?.toIso8601String(),
};

_$AchievementImpl _$$AchievementImplFromJson(Map<String, dynamic> json) =>
    _$AchievementImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
      category: $enumDecode(_$AchievementCategoryEnumMap, json['category']),
      requiredProgress: (json['requiredProgress'] as num).toInt(),
      currentProgress: (json['currentProgress'] as num?)?.toInt(),
      unlockedAt: json['unlockedAt'] == null
          ? null
          : DateTime.parse(json['unlockedAt'] as String),
      bonusPoints: (json['bonusPoints'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AchievementImplToJson(_$AchievementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'icon': instance.icon,
      'category': _$AchievementCategoryEnumMap[instance.category]!,
      'requiredProgress': instance.requiredProgress,
      'currentProgress': instance.currentProgress,
      'unlockedAt': instance.unlockedAt?.toIso8601String(),
      'bonusPoints': instance.bonusPoints,
    };

const _$AchievementCategoryEnumMap = {
  AchievementCategory.savings: 'savings',
  AchievementCategory.streak: 'streak',
  AchievementCategory.learning: 'learning',
  AchievementCategory.budgeting: 'budgeting',
  AchievementCategory.tracking: 'tracking',
  AchievementCategory.social: 'social',
  AchievementCategory.milestone: 'milestone',
};

_$LeaderboardEntryImpl _$$LeaderboardEntryImplFromJson(
  Map<String, dynamic> json,
) => _$LeaderboardEntryImpl(
  odUserId: json['odUserId'] as String,
  displayName: json['displayName'] as String,
  rank: (json['rank'] as num).toInt(),
  points: (json['points'] as num).toInt(),
  level: (json['level'] as num).toInt(),
  streak: (json['streak'] as num).toInt(),
  avatarUrl: json['avatarUrl'] as String?,
);

Map<String, dynamic> _$$LeaderboardEntryImplToJson(
  _$LeaderboardEntryImpl instance,
) => <String, dynamic>{
  'odUserId': instance.odUserId,
  'displayName': instance.displayName,
  'rank': instance.rank,
  'points': instance.points,
  'level': instance.level,
  'streak': instance.streak,
  'avatarUrl': instance.avatarUrl,
};

_$GamificationStatsImpl _$$GamificationStatsImplFromJson(
  Map<String, dynamic> json,
) => _$GamificationStatsImpl(
  totalPoints: (json['totalPoints'] as num).toInt(),
  level: (json['level'] as num).toInt(),
  currentStreak: (json['currentStreak'] as num).toInt(),
  longestStreak: (json['longestStreak'] as num).toInt(),
  tasksCompleted: (json['tasksCompleted'] as num).toInt(),
  achievementsUnlocked: (json['achievementsUnlocked'] as num).toInt(),
  completionRate: (json['completionRate'] as num).toDouble(),
  pointsToNextLevel: (json['pointsToNextLevel'] as num).toInt(),
  userLevel: $enumDecode(_$UserLevelEnumMap, json['userLevel']),
  recentAchievements:
      (json['recentAchievements'] as List<dynamic>?)
          ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$$GamificationStatsImplToJson(
  _$GamificationStatsImpl instance,
) => <String, dynamic>{
  'totalPoints': instance.totalPoints,
  'level': instance.level,
  'currentStreak': instance.currentStreak,
  'longestStreak': instance.longestStreak,
  'tasksCompleted': instance.tasksCompleted,
  'achievementsUnlocked': instance.achievementsUnlocked,
  'completionRate': instance.completionRate,
  'pointsToNextLevel': instance.pointsToNextLevel,
  'userLevel': _$UserLevelEnumMap[instance.userLevel]!,
  'recentAchievements': instance.recentAchievements,
};

const _$UserLevelEnumMap = {
  UserLevel.beginner: 'beginner',
  UserLevel.intermediate: 'intermediate',
  UserLevel.advanced: 'advanced',
  UserLevel.expert: 'expert',
  UserLevel.master: 'master',
};
