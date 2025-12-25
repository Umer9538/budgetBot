import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../common/widgets/widgets.dart';

/// Provider for insights stream
final insightsStreamProvider = StreamProvider.family<List<InsightModel>, String>((ref, userId) {
  final repository = ref.watch(insightRepositoryProvider);
  return repository.watchInsights(userId);
});

/// Provider for insight summary
final insightSummaryProvider = FutureProvider.family<InsightSummary, String>((ref, userId) {
  final repository = ref.watch(insightRepositoryProvider);
  return repository.getInsightSummary(userId);
});

/// Provider for generating insights
final generateInsightsProvider = FutureProvider.family<List<InsightModel>, String>((ref, userId) {
  final repository = ref.watch(insightRepositoryProvider);
  return repository.generateInsights(userId: userId);
});

class InsightsScreen extends ConsumerStatefulWidget {
  const InsightsScreen({super.key});

  @override
  ConsumerState<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends ConsumerState<InsightsScreen> {
  bool _isRefreshing = false;
  InsightType? _selectedFilter;

  @override
  void initState() {
    super.initState();
    // Generate insights on first load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshInsights();
    });
  }

  Future<void> _refreshInsights() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      debugPrint('InsightsScreen: No user ID available');
      return;
    }

    debugPrint('InsightsScreen: Starting refresh for user: $userId');
    setState(() => _isRefreshing = true);

    try {
      final repository = ref.read(insightRepositoryProvider);
      final generatedInsights = await repository.refreshInsights(userId);
      debugPrint('InsightsScreen: Refresh complete, ${generatedInsights.length} insights generated');

      if (mounted && generatedInsights.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No insights generated. Add some transactions first to get personalized insights.'),
            duration: Duration(seconds: 4),
          ),
        );
      }
    } catch (e, stack) {
      debugPrint('InsightsScreen: Error refreshing insights: $e');
      debugPrint('InsightsScreen: Stack trace: $stack');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error refreshing insights: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isRefreshing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userId = ref.watch(currentUserIdProvider);

    if (userId == null) {
      return const Scaffold(
        body: Center(child: Text('Please sign in to view insights')),
      );
    }

    final insightsAsync = ref.watch(insightsStreamProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Insights'),
        actions: [
          if (_isRefreshing)
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _refreshInsights,
              tooltip: 'Refresh Insights',
            ),
        ],
      ),
      body: insightsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
              const SizedBox(height: 16),
              Text('Error loading insights', style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              AppButton(
                label: 'Retry',
                onPressed: _refreshInsights,
                variant: AppButtonVariant.secondary,
              ),
            ],
          ),
        ),
        data: (insights) {
          if (insights.isEmpty) {
            return _buildEmptyState(theme);
          }

          // Apply filter
          final filteredInsights = _selectedFilter != null
              ? insights.where((i) => i.type == _selectedFilter).toList()
              : insights;

          // Sort by priority and read status
          filteredInsights.sort((a, b) {
            if (a.isRead != b.isRead) return a.isRead ? 1 : -1;
            return a.priority.sortOrder.compareTo(b.priority.sortOrder);
          });

          return Column(
            children: [
              // Summary Card
              _buildSummaryCard(theme, insights),

              // Filter Chips
              _buildFilterChips(theme, insights),

              // Insights List
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refreshInsights,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppDimensions.spacingMd),
                    itemCount: filteredInsights.length,
                    itemBuilder: (context, index) {
                      return _InsightCard(
                        insight: filteredInsights[index],
                        onDismiss: () => _dismissInsight(filteredInsights[index]),
                        onTap: () => _onInsightTap(filteredInsights[index]),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.auto_awesome,
                size: 64,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            Text(
              'No Insights Yet',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Add some transactions and we\'ll analyze your spending patterns to provide personalized insights.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingXl),
            AppButton(
              label: 'Generate Insights',
              icon: Icons.auto_awesome,
              onPressed: _refreshInsights,
              isLoading: _isRefreshing,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(ThemeData theme, List<InsightModel> insights) {
    final unread = insights.where((i) => !i.isRead).length;
    final highPriority = insights
        .where((i) =>
            i.priority == InsightPriority.high ||
            i.priority == InsightPriority.critical)
        .length;
    final actionable = insights.where((i) => i.actionable && !i.isRead).length;

    return Container(
      margin: const EdgeInsets.all(AppDimensions.spacingMd),
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primaryContainer,
            theme.colorScheme.primaryContainer.withValues(alpha: 0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: AppDimensions.borderRadiusLg,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SummaryItem(
            icon: Icons.notifications_active,
            label: 'New',
            value: unread.toString(),
            color: theme.colorScheme.primary,
          ),
          _SummaryItem(
            icon: Icons.priority_high,
            label: 'Important',
            value: highPriority.toString(),
            color: theme.colorScheme.error,
          ),
          _SummaryItem(
            icon: Icons.touch_app,
            label: 'Actionable',
            value: actionable.toString(),
            color: theme.colorScheme.tertiary,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips(ThemeData theme, List<InsightModel> insights) {
    final types = InsightType.values.where((type) =>
        insights.any((i) => i.type == type)).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacingMd),
      child: Row(
        children: [
          FilterChip(
            label: const Text('All'),
            selected: _selectedFilter == null,
            onSelected: (_) => setState(() => _selectedFilter = null),
          ),
          const SizedBox(width: AppDimensions.spacingSm),
          ...types.map((type) => Padding(
                padding: const EdgeInsets.only(right: AppDimensions.spacingSm),
                child: FilterChip(
                  label: Text(type.displayName),
                  avatar: Icon(_getTypeIcon(type), size: 18),
                  selected: _selectedFilter == type,
                  onSelected: (_) => setState(() =>
                      _selectedFilter = _selectedFilter == type ? null : type),
                ),
              )),
        ],
      ),
    );
  }

  IconData _getTypeIcon(InsightType type) {
    switch (type) {
      case InsightType.pattern:
        return Icons.trending_up;
      case InsightType.anomaly:
        return Icons.warning_amber;
      case InsightType.recommendation:
        return Icons.lightbulb;
      case InsightType.achievement:
        return Icons.emoji_events;
      case InsightType.warning:
        return Icons.error;
      case InsightType.tip:
        return Icons.tips_and_updates;
    }
  }

  Future<void> _dismissInsight(InsightModel insight) async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    try {
      await ref.read(insightRepositoryProvider).dismissInsight(userId, insight.id);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _onInsightTap(InsightModel insight) async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    // Mark as read
    if (!insight.isRead) {
      await ref.read(insightRepositoryProvider).markAsRead(userId, insight.id);
    }

    // Show detail dialog
    if (mounted) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => _InsightDetailSheet(insight: insight),
      );
    }
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({
    required this.insight,
    required this.onDismiss,
    required this.onTap,
  });

  final InsightModel insight;
  final VoidCallback onDismiss;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: Key(insight.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDismiss(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.error,
          borderRadius: AppDimensions.borderRadiusMd,
        ),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
        child: InkWell(
          onTap: onTap,
          borderRadius: AppDimensions.borderRadiusMd,
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.spacingMd),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Type Icon
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: _getTypeColor(theme).withValues(alpha: 0.15),
                    borderRadius: AppDimensions.borderRadiusSm,
                  ),
                  child: Icon(
                    _getTypeIcon(),
                    color: _getTypeColor(theme),
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingMd),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              insight.title,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: insight.isRead
                                    ? theme.colorScheme.onSurfaceVariant
                                    : theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                          if (!insight.isRead)
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        insight.description,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (insight.actionable && insight.action != null) ...[
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _PriorityBadge(priority: insight.priority),
                            const Spacer(),
                            Text(
                              insight.action!.label,
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: theme.colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData _getTypeIcon() {
    switch (insight.type) {
      case InsightType.pattern:
        return Icons.trending_up;
      case InsightType.anomaly:
        return Icons.warning_amber;
      case InsightType.recommendation:
        return Icons.lightbulb;
      case InsightType.achievement:
        return Icons.emoji_events;
      case InsightType.warning:
        return Icons.error;
      case InsightType.tip:
        return Icons.tips_and_updates;
    }
  }

  Color _getTypeColor(ThemeData theme) {
    switch (insight.type) {
      case InsightType.pattern:
        return Colors.blue;
      case InsightType.anomaly:
        return Colors.orange;
      case InsightType.recommendation:
        return Colors.purple;
      case InsightType.achievement:
        return Colors.amber;
      case InsightType.warning:
        return theme.colorScheme.error;
      case InsightType.tip:
        return Colors.teal;
    }
  }
}

class _PriorityBadge extends StatelessWidget {
  const _PriorityBadge({required this.priority});

  final InsightPriority priority;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color color;
    switch (priority) {
      case InsightPriority.critical:
        color = theme.colorScheme.error;
        break;
      case InsightPriority.high:
        color = Colors.orange;
        break;
      case InsightPriority.medium:
        color = Colors.blue;
        break;
      case InsightPriority.low:
        color = Colors.grey;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        priority.displayName,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _InsightDetailSheet extends StatelessWidget {
  const _InsightDetailSheet({required this.insight});

  final InsightModel insight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(AppDimensions.spacingLg),
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.spacingLg),

              // Type badge
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _getTypeColor(theme).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getTypeIcon(),
                          size: 16,
                          color: _getTypeColor(theme),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          insight.type.displayName,
                          style: theme.textTheme.labelMedium?.copyWith(
                            color: _getTypeColor(theme),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  _PriorityBadge(priority: insight.priority),
                ],
              ),
              const SizedBox(height: AppDimensions.spacingMd),

              // Title
              Text(
                insight.title,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppDimensions.spacingMd),

              // Description
              Text(
                insight.description,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.5,
                ),
              ),

              // Data details if available
              if (insight.data != null && insight.data!.isNotEmpty) ...[
                const SizedBox(height: AppDimensions.spacingLg),
                const Divider(),
                const SizedBox(height: AppDimensions.spacingMd),
                Text(
                  'Details',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingSm),
                ...insight.data!.entries
                    .where((e) => e.key != 'aiGenerated')
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _formatKey(e.key),
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                              Text(
                                _formatValue(e.value),
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )),
              ],

              // Action button
              if (insight.actionable && insight.action != null) ...[
                const SizedBox(height: AppDimensions.spacingXl),
                AppButton(
                  label: insight.action!.label,
                  onPressed: () {
                    Navigator.pop(context);
                    // Handle action based on type
                    // This would navigate to relevant screen
                  },
                  isFullWidth: true,
                ),
              ],

              const SizedBox(height: AppDimensions.spacingLg),
            ],
          ),
        );
      },
    );
  }

  IconData _getTypeIcon() {
    switch (insight.type) {
      case InsightType.pattern:
        return Icons.trending_up;
      case InsightType.anomaly:
        return Icons.warning_amber;
      case InsightType.recommendation:
        return Icons.lightbulb;
      case InsightType.achievement:
        return Icons.emoji_events;
      case InsightType.warning:
        return Icons.error;
      case InsightType.tip:
        return Icons.tips_and_updates;
    }
  }

  Color _getTypeColor(ThemeData theme) {
    switch (insight.type) {
      case InsightType.pattern:
        return Colors.blue;
      case InsightType.anomaly:
        return Colors.orange;
      case InsightType.recommendation:
        return Colors.purple;
      case InsightType.achievement:
        return Colors.amber;
      case InsightType.warning:
        return theme.colorScheme.error;
      case InsightType.tip:
        return Colors.teal;
    }
  }

  String _formatKey(String key) {
    // Convert camelCase to Title Case
    return key
        .replaceAllMapped(
          RegExp(r'([A-Z])'),
          (match) => ' ${match.group(1)}',
        )
        .trim()
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  String _formatValue(dynamic value) {
    if (value is double) {
      if (value > 100) {
        return '\$${value.toStringAsFixed(0)}';
      }
      return value.toStringAsFixed(1);
    }
    return value.toString();
  }
}
