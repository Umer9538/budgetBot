import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../common/widgets/widgets.dart';

/// Provider for emotional spending analysis stream
final emotionalAnalysisStreamProvider =
    StreamProvider.family<EmotionalSpendingAnalysis?, String>((ref, userId) {
  final service = ref.watch(emotionalSpendingServiceProvider);
  return service.watchLatestAnalysis(userId);
});

/// Provider for mood entries (future-based)
final moodEntriesProvider =
    FutureProvider.family<List<MoodEntry>, String>((ref, userId) {
  final service = ref.watch(emotionalSpendingServiceProvider);
  return service.getMoodEntries(userId);
});

class EmotionalSpendingScreen extends ConsumerStatefulWidget {
  const EmotionalSpendingScreen({super.key});

  @override
  ConsumerState<EmotionalSpendingScreen> createState() =>
      _EmotionalSpendingScreenState();
}

class _EmotionalSpendingScreenState
    extends ConsumerState<EmotionalSpendingScreen> {
  bool _isAnalyzing = false;

  Future<void> _runAnalysis() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isAnalyzing = true);

    try {
      final service = ref.read(emotionalSpendingServiceProvider);
      await service.analyzeEmotionalSpending(userId: userId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Analysis complete!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isAnalyzing = false);
    }
  }

  Future<void> _recordMood() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    final result = await showModalBottomSheet<MoodType>(
      context: context,
      builder: (context) => const _MoodPickerSheet(),
    );

    if (result != null && mounted) {
      final noteController = TextEditingController();
      final stressLevel = ValueNotifier<int>(5);

      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Feeling ${result.displayName}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: noteController,
                decoration: const InputDecoration(
                  labelText: 'Add a note (optional)',
                  hintText: "What's on your mind?",
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ValueListenableBuilder<int>(
                valueListenable: stressLevel,
                builder: (context, value, _) => Column(
                  children: [
                    Text('Stress Level: $value'),
                    Slider(
                      value: value.toDouble(),
                      min: 0,
                      max: 10,
                      divisions: 10,
                      label: value.toString(),
                      onChanged: (v) => stressLevel.value = v.round(),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Save'),
            ),
          ],
        ),
      );

      if (confirmed == true) {
        try {
          final service = ref.read(emotionalSpendingServiceProvider);
          // Create a general mood entry (linked to a placeholder transaction)
          await service.recordMood(
            userId: userId,
            transactionId: 'mood_${DateTime.now().millisecondsSinceEpoch}',
            mood: result,
            stressLevel: stressLevel.value,
            note: noteController.text.isEmpty ? null : noteController.text,
          );
          ref.invalidate(moodEntriesProvider(userId));
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Mood recorded!')),
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

    final analysisAsync = ref.watch(emotionalAnalysisStreamProvider(userId));
    final moodAsync = ref.watch(moodEntriesProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emotional Spending'),
        actions: [
          IconButton(
            icon: _isAnalyzing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh),
            onPressed: _isAnalyzing ? null : _runAnalysis,
            tooltip: 'Analyze Spending',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mood Check-in Card
            _MoodCheckInCard(onRecordMood: _recordMood),
            const SizedBox(height: AppDimensions.spacingMd),

            // Analysis Results
            analysisAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => _buildEmptyState(theme),
              data: (analysis) {
                if (analysis == null) return _buildEmptyState(theme);
                return _AnalysisResultsSection(analysis: analysis);
              },
            ),

            const SizedBox(height: AppDimensions.spacingLg),

            // Recent Mood History
            Text(
              'Recent Moods',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            moodAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Error: $e'),
              data: (moods) {
                if (moods.isEmpty) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimensions.spacingMd),
                      child: Text(
                        'No mood entries yet. Tap "How are you feeling?" to start tracking.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  );
                }
                return _MoodHistoryList(moods: moods.take(10).toList());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingLg),
        child: Column(
          children: [
            Icon(
              Icons.psychology,
              size: 64,
              color: theme.colorScheme.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            Text(
              'No Analysis Yet',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Track your moods and spending to discover patterns between your emotions and purchases.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            AppButton(
              label: 'Run Analysis',
              icon: Icons.auto_awesome,
              onPressed: _runAnalysis,
              isLoading: _isAnalyzing,
            ),
          ],
        ),
      ),
    );
  }
}

class _MoodCheckInCard extends StatelessWidget {
  const _MoodCheckInCard({required this.onRecordMood});

  final VoidCallback onRecordMood;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: InkWell(
        onTap: onRecordMood,
        borderRadius: AppDimensions.borderRadiusMd,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: AppDimensions.borderRadiusSm,
                ),
                child: Icon(
                  Icons.mood,
                  color: theme.colorScheme.primary,
                  size: 32,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'How are you feeling?',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Tap to record your current mood',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MoodPickerSheet extends StatelessWidget {
  const _MoodPickerSheet();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacingLg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'How are you feeling?',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingLg),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: MoodType.values.map((mood) {
              return InkWell(
                onTap: () => Navigator.pop(context, mood),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 80,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        mood.icon,
                        style: const TextStyle(fontSize: 32),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mood.displayName,
                        style: theme.textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: AppDimensions.spacingLg),
        ],
      ),
    );
  }
}

class _AnalysisResultsSection extends StatelessWidget {
  const _AnalysisResultsSection({required this.analysis});

  final EmotionalSpendingAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profile = analysis.profile;
    final score = profile.emotionalSpendingScore;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Summary Card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.spacingMd),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.insights, color: theme.colorScheme.primary),
                    const SizedBox(width: 8),
                    Text(
                      'Emotional Spending Summary',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacingMd),
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        label: 'Emotional Spend',
                        value:
                            '\$${(analysis.totalEmotionalSpending ?? 0).toStringAsFixed(0)}',
                        icon: Icons.sentiment_dissatisfied,
                        color: Colors.orange,
                      ),
                    ),
                    const SizedBox(width: AppDimensions.spacingSm),
                    Expanded(
                      child: _StatCard(
                        label: '% of Total',
                        value:
                            '${(analysis.percentageOfTotal ?? 0).toStringAsFixed(1)}%',
                        icon: Icons.pie_chart,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Risk Level
        const SizedBox(height: AppDimensions.spacingMd),
        Card(
          color: _getRiskColor(score).withValues(alpha: 0.1),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.spacingMd),
            child: Row(
              children: [
                Icon(
                  _getRiskIcon(score),
                  color: _getRiskColor(score),
                  size: 32,
                ),
                const SizedBox(width: AppDimensions.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Risk Level: ${_getRiskLabel(score)}',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: _getRiskColor(score),
                        ),
                      ),
                      Text(
                        _getRiskDescription(score),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Dominant Mood
        const SizedBox(height: AppDimensions.spacingMd),
        Card(
          child: ListTile(
            leading: Text(
              profile.dominantMood.icon,
              style: const TextStyle(fontSize: 32),
            ),
            title: const Text('Dominant Mood'),
            subtitle: Text(profile.dominantMood.displayName),
            trailing: profile.isHighRiskSpender
                ? Chip(
                    label: const Text('High Risk'),
                    backgroundColor: Colors.red.withValues(alpha: 0.2),
                    labelStyle: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  )
                : null,
          ),
        ),

        // Patterns
        if (analysis.patterns.isNotEmpty) ...[
          const SizedBox(height: AppDimensions.spacingLg),
          Text(
            'Spending Patterns',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          ...analysis.patterns.take(3).map((pattern) => Card(
                margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor:
                        theme.colorScheme.primary.withValues(alpha: 0.1),
                    child: Text(pattern.type.icon),
                  ),
                  title: Text(pattern.type.displayName),
                  subtitle: Text(pattern.description),
                  trailing: Text(
                    '\$${pattern.avgAmount.toStringAsFixed(0)}',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
              )),
        ],

        // Triggers
        if (analysis.triggers.isNotEmpty) ...[
          const SizedBox(height: AppDimensions.spacingLg),
          Text(
            'Top Spending Triggers',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          ...analysis.triggers.take(3).map((trigger) => Card(
                margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orange.withValues(alpha: 0.1),
                    child: const Icon(Icons.warning, color: Colors.orange),
                  ),
                  title: Text(trigger.type.displayName),
                  subtitle: Text(trigger.description),
                  trailing: Text(
                    '+${trigger.avgSpendIncrease.toStringAsFixed(0)}%',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ),
              )),
        ],

        // Recommendations
        if (analysis.recommendations.isNotEmpty) ...[
          const SizedBox(height: AppDimensions.spacingLg),
          Text(
            'Recommendations',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          ...analysis.recommendations.take(3).map((rec) => Card(
                margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
                child: ListTile(
                  leading: Icon(
                    Icons.lightbulb,
                    color: theme.colorScheme.tertiary,
                  ),
                  title: Text(rec),
                ),
              )),
        ],
      ],
    );
  }

  Color _getRiskColor(double score) {
    if (score < 30) return Colors.green;
    if (score < 50) return Colors.orange;
    if (score < 70) return Colors.deepOrange;
    return Colors.red;
  }

  IconData _getRiskIcon(double score) {
    if (score < 30) return Icons.check_circle;
    if (score < 50) return Icons.info;
    if (score < 70) return Icons.warning;
    return Icons.error;
  }

  String _getRiskLabel(double score) {
    if (score < 30) return 'Low';
    if (score < 50) return 'Moderate';
    if (score < 70) return 'High';
    return 'Critical';
  }

  String _getRiskDescription(double score) {
    if (score < 30) return 'Your emotional spending is well controlled.';
    if (score < 50) return 'Some emotional patterns detected. Stay mindful.';
    if (score < 70) return 'Significant emotional spending. Consider strategies.';
    return 'High emotional spending impact. Action recommended.';
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: AppDimensions.borderRadiusSm,
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

class _MoodHistoryList extends StatelessWidget {
  const _MoodHistoryList({required this.moods});

  final List<MoodEntry> moods;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: moods
          .map((mood) => Card(
                margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
                child: ListTile(
                  leading: Text(
                    mood.mood.icon,
                    style: const TextStyle(fontSize: 28),
                  ),
                  title: Text(mood.mood.displayName),
                  subtitle: mood.note != null
                      ? Text(
                          mood.note!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : null,
                  trailing: Text(
                    _formatDate(mood.recordedAt ?? DateTime.now()),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}d ago';
    } else {
      return '${date.month}/${date.day}';
    }
  }
}
