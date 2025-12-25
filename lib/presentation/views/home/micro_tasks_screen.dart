import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../common/widgets/widgets.dart';

/// Provider for today's challenge
final todayChallengeProvider =
    StreamProvider.family<DailyChallenge?, String>((ref, userId) {
  final service = ref.watch(microTaskServiceProvider);
  return service.watchTodayChallenge(userId);
});

/// Provider for gamification stats
final gamificationStatsProvider =
    FutureProvider.family<GamificationStats, String>((ref, userId) {
  final service = ref.watch(microTaskServiceProvider);
  return service.getStats(userId);
});

/// Provider for leaderboard
final leaderboardProvider = FutureProvider<List<LeaderboardEntry>>((ref) {
  final service = ref.watch(microTaskServiceProvider);
  return service.getLeaderboard();
});

class MicroTasksScreen extends ConsumerStatefulWidget {
  const MicroTasksScreen({super.key});

  @override
  ConsumerState<MicroTasksScreen> createState() => _MicroTasksScreenState();
}

class _MicroTasksScreenState extends ConsumerState<MicroTasksScreen> {
  bool _isGenerating = false;

  Future<void> _generateChallenge() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isGenerating = true);

    try {
      final service = ref.read(microTaskServiceProvider);
      await service.generateDailyChallenge(userId);
      ref.invalidate(todayChallengeProvider(userId));
      ref.invalidate(gamificationStatsProvider(userId));
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isGenerating = false);
    }
  }

  Future<void> _completeTask(String taskId) async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    try {
      final service = ref.read(microTaskServiceProvider);
      final points = await service.completeTask(userId, taskId);

      ref.invalidate(gamificationStatsProvider(userId));

      if (mounted && points > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('+$points points!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userId = ref.watch(currentUserIdProvider);

    if (userId == null) {
      return const Scaffold(
        body: Center(child: Text('Please sign in')),
      );
    }

    final challengeAsync = ref.watch(todayChallengeProvider(userId));
    final statsAsync = ref.watch(gamificationStatsProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Challenges'),
        actions: [
          IconButton(
            icon: const Icon(Icons.leaderboard),
            onPressed: () => _showLeaderboard(context),
            tooltip: 'Leaderboard',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Stats Card
            statsAsync.when(
              loading: () => const Card(
                child: Padding(
                  padding: EdgeInsets.all(AppDimensions.spacingLg),
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
              error: (e, _) => Card(child: Center(child: Text('Error: $e'))),
              data: (stats) => _StatsCard(stats: stats),
            ),
            const SizedBox(height: AppDimensions.spacingMd),

            // Today's Challenge
            Text(
              "Today's Challenge",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),

            challengeAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (challenge) {
                if (challenge == null) {
                  return _buildNoChallengeState(theme);
                }
                return _ChallengeCard(
                  challenge: challenge,
                  onCompleteTask: _completeTask,
                );
              },
            ),
            const SizedBox(height: AppDimensions.spacingLg),

            // Recent Achievements
            statsAsync.when(
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
              data: (stats) {
                if (stats.recentAchievements.isEmpty) {
                  return const SizedBox.shrink();
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Achievements',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacingSm),
                    ...stats.recentAchievements.map(
                      (a) => _AchievementCard(achievement: a),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoChallengeState(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingLg),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.bolt,
                size: 48,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            Text(
              'Ready for a Challenge?',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Complete daily tasks to earn points, level up, and build better financial habits!',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            AppButton(
              label: 'Start Challenge',
              icon: Icons.play_arrow,
              onPressed: _generateChallenge,
              isLoading: _isGenerating,
            ),
          ],
        ),
      ),
    );
  }

  void _showLeaderboard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) {
          return _LeaderboardSheet(scrollController: scrollController);
        },
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  const _StatsCard({required this.stats});

  final GamificationStats stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final levelProgress = stats.pointsToNextLevel > 0
        ? 1 - (stats.pointsToNextLevel / (stats.pointsToNextLevel + stats.totalPoints))
        : 1.0;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          children: [
            // Level and avatar
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.orange.shade700,
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      stats.userLevel.icon,
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Level ${stats.level} - ${stats.userLevel.displayName}',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: levelProgress.clamp(0, 1),
                        backgroundColor: theme.colorScheme.surfaceContainerHighest,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${stats.pointsToNextLevel} pts to next level',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            const Divider(),
            const SizedBox(height: AppDimensions.spacingSm),
            // Stats row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _MiniStat(
                  icon: Icons.star,
                  value: '${stats.totalPoints}',
                  label: 'Points',
                  color: Colors.amber,
                ),
                _MiniStat(
                  icon: Icons.local_fire_department,
                  value: '${stats.currentStreak}',
                  label: 'Streak',
                  color: Colors.orange,
                ),
                _MiniStat(
                  icon: Icons.check_circle,
                  value: '${stats.tasksCompleted}',
                  label: 'Tasks',
                  color: Colors.green,
                ),
                _MiniStat(
                  icon: Icons.emoji_events,
                  value: '${stats.achievementsUnlocked}',
                  label: 'Badges',
                  color: Colors.purple,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  final IconData icon;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(height: 2),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  const _ChallengeCard({
    required this.challenge,
    required this.onCompleteTask,
  });

  final DailyChallenge challenge;
  final Function(String) onCompleteTask;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final allCompleted = challenge.completedCount == challenge.tasks.length;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${challenge.completedCount}/${challenge.tasks.length} Tasks',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: challenge.tasks.isEmpty
                            ? 0
                            : challenge.completedCount / challenge.tasks.length,
                        backgroundColor: theme.colorScheme.surfaceContainerHighest,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingMd),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        '${challenge.earnedPoints}/${challenge.totalPoints}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (allCompleted && challenge.bonusEarned) ...[
              const SizedBox(height: AppDimensions.spacingSm),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.celebration, color: Colors.green, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Bonus earned! +50 points',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: AppDimensions.spacingMd),
            // Tasks list
            ...challenge.tasks.map((task) => _TaskItem(
                  task: task,
                  onComplete: () => onCompleteTask(task.id),
                )),
          ],
        ),
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  const _TaskItem({
    required this.task,
    required this.onComplete,
  });

  final MicroTask task;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompleted = task.status == TaskStatus.completed;
    final isSkipped = task.status == TaskStatus.skipped;

    return Opacity(
      opacity: isCompleted || isSkipped ? 0.6 : 1.0,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isCompleted
              ? Colors.green.withValues(alpha: 0.1)
              : theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isCompleted
                ? Colors.green.withValues(alpha: 0.3)
                : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            // Task type icon
            Text(task.type.icon, style: const TextStyle(fontSize: 24)),
            const SizedBox(width: 12),
            // Task details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          task.title,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            decoration:
                                isCompleted ? TextDecoration.lineThrough : null,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _getDifficultyColor(task.difficulty)
                              .withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${task.difficulty.icon} ${task.points}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    task.description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Action button
            if (isCompleted)
              const Icon(Icons.check_circle, color: Colors.green)
            else if (isSkipped)
              const Icon(Icons.cancel, color: Colors.grey)
            else
              IconButton(
                icon: const Icon(Icons.check_circle_outline),
                color: theme.colorScheme.primary,
                onPressed: onComplete,
              ),
          ],
        ),
      ),
    );
  }

  Color _getDifficultyColor(TaskDifficulty difficulty) {
    switch (difficulty) {
      case TaskDifficulty.easy:
        return Colors.green;
      case TaskDifficulty.medium:
        return Colors.orange;
      case TaskDifficulty.hard:
        return Colors.red;
    }
  }
}

class _AchievementCard extends StatelessWidget {
  const _AchievementCard({required this.achievement});

  final Achievement achievement;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUnlocked = achievement.unlockedAt != null;

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: isUnlocked
                ? Colors.amber.withValues(alpha: 0.2)
                : theme.colorScheme.surfaceContainerHighest,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              achievement.icon,
              style: TextStyle(
                fontSize: 24,
                color: isUnlocked ? null : Colors.grey,
              ),
            ),
          ),
        ),
        title: Text(
          achievement.name,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(achievement.description),
        trailing: isUnlocked
            ? const Icon(Icons.check_circle, color: Colors.green)
            : Text(
                '+${achievement.bonusPoints ?? 0}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
      ),
    );
  }
}

class _LeaderboardSheet extends ConsumerWidget {
  const _LeaderboardSheet({required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final leaderboardAsync = ref.watch(leaderboardProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          child: Row(
            children: [
              const Icon(Icons.leaderboard, color: Colors.amber),
              const SizedBox(width: 8),
              Text(
                'Leaderboard',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: leaderboardAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (entries) {
              if (entries.isEmpty) {
                return const Center(child: Text('No entries yet'));
              }
              return ListView.builder(
                controller: scrollController,
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final entry = entries[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: _getRankColor(entry.rank),
                      child: Text(
                        '${entry.rank}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(entry.displayName),
                    subtitle: Text(
                      'Level ${entry.level} • ${entry.streak} day streak',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${entry.points}',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return Colors.amber;
      case 2:
        return Colors.grey.shade400;
      case 3:
        return Colors.brown.shade300;
      default:
        return Colors.blueGrey;
    }
  }
}
