import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../common/widgets/widgets.dart';

/// Provider for subscriptions stream
final subscriptionsStreamProvider =
    StreamProvider.family<List<Subscription>, String>((ref, userId) {
  final service = ref.watch(subscriptionDecayServiceProvider);
  return service.watchSubscriptions(userId);
});

/// Provider for decay analysis
final decayAnalysisProvider =
    FutureProvider.family<SubscriptionDecayAnalysis?, String>((ref, userId) {
  final service = ref.watch(subscriptionDecayServiceProvider);
  return service.getLatestAnalysis(userId);
});

class SubscriptionDecayScreen extends ConsumerStatefulWidget {
  const SubscriptionDecayScreen({super.key});

  @override
  ConsumerState<SubscriptionDecayScreen> createState() =>
      _SubscriptionDecayScreenState();
}

class _SubscriptionDecayScreenState
    extends ConsumerState<SubscriptionDecayScreen> {
  bool _isAnalyzing = false;
  bool _isDetecting = false;

  Future<void> _analyzeDecay() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isAnalyzing = true);

    try {
      final service = ref.read(subscriptionDecayServiceProvider);
      await service.analyzeDecay(userId);
      ref.invalidate(decayAnalysisProvider(userId));
      ref.invalidate(subscriptionsStreamProvider(userId));

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

  Future<void> _detectSubscriptions() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isDetecting = true);

    try {
      final service = ref.read(subscriptionDecayServiceProvider);
      final detected = await service.detectSubscriptions(userId);
      ref.invalidate(subscriptionsStreamProvider(userId));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              detected.isEmpty
                  ? 'No new subscriptions found'
                  : 'Found ${detected.length} subscriptions!',
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isDetecting = false);
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

    final subscriptionsAsync = ref.watch(subscriptionsStreamProvider(userId));
    final analysisAsync = ref.watch(decayAnalysisProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscriptions'),
        actions: [
          IconButton(
            icon: _isDetecting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.search),
            onPressed: _isDetecting ? null : _detectSubscriptions,
            tooltip: 'Detect Subscriptions',
          ),
          IconButton(
            icon: _isAnalyzing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.analytics),
            onPressed: _isAnalyzing ? null : _analyzeDecay,
            tooltip: 'Analyze Usage',
          ),
        ],
      ),
      body: subscriptionsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (subscriptions) {
          if (subscriptions.isEmpty) {
            return _buildEmptyState(theme);
          }
          return _buildSubscriptionList(
            theme,
            subscriptions,
            analysisAsync.valueOrNull,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddSubscriptionDialog(context),
        child: const Icon(Icons.add),
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
                color: Colors.purple.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.subscriptions,
                size: 64,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            Text(
              'Track Your Subscriptions',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Monitor subscription usage and find ones you might not need anymore.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingXl),
            AppButton(
              label: 'Detect Subscriptions',
              icon: Icons.search,
              onPressed: _detectSubscriptions,
              isLoading: _isDetecting,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            OutlinedButton.icon(
              onPressed: () => _showAddSubscriptionDialog(context),
              icon: const Icon(Icons.add),
              label: const Text('Add Manually'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionList(
    ThemeData theme,
    List<Subscription> subscriptions,
    SubscriptionDecayAnalysis? analysis,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary card
          if (analysis != null) _SummaryCard(analysis: analysis),
          if (analysis != null)
            const SizedBox(height: AppDimensions.spacingMd),

          // Savings potential
          if (analysis != null && analysis.potentialSavings > 0) ...[
            Card(
              color: Colors.green.withValues(alpha: 0.1),
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.spacingMd),
                child: Row(
                  children: [
                    const Icon(Icons.savings, color: Colors.green, size: 32),
                    const SizedBox(width: AppDimensions.spacingMd),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Potential Annual Savings',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${analysis.potentialSavings.toStringAsFixed(0)}',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
          ],

          // Recommendations
          if (analysis != null && analysis.recommendations.isNotEmpty) ...[
            Text(
              'Recommendations',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            ...analysis.recommendations.map((rec) => Card(
                  margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
                  child: ListTile(
                    leading: const Icon(Icons.lightbulb, color: Colors.amber),
                    title: Text(rec),
                  ),
                )),
            const SizedBox(height: AppDimensions.spacingMd),
          ],

          // Subscriptions list
          Text(
            'Your Subscriptions',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          ...subscriptions.map((sub) => _SubscriptionCard(
                subscription: sub,
                decayItem: analysis?.items.firstWhere(
                  (i) => i.subscription.id == sub.id,
                  orElse: () => SubscriptionDecayItem(
                    subscription: sub,
                    decayStatus: sub.decayStatus,
                    usageScore: sub.usageScore ?? 100,
                    valueScore: 100,
                    daysSinceLastUse: 0,
                    monthlyEquivalent: sub.frequency.monthlyEquivalent(sub.amount),
                    recommendation: '',
                  ),
                ),
                onCancel: () => _cancelSubscription(sub),
                onRecordUsage: () => _recordUsage(sub),
              )),
        ],
      ),
    );
  }

  Future<void> _cancelSubscription(Subscription subscription) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Subscription?'),
        content: Text(
          'Are you sure you want to mark "${subscription.name}" as cancelled?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Yes, Cancel'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    try {
      final service = ref.read(subscriptionDecayServiceProvider);
      await service.cancelSubscription(userId, subscription.id);
      ref.invalidate(subscriptionsStreamProvider(userId));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Subscription cancelled')),
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

  Future<void> _recordUsage(Subscription subscription) async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    try {
      final service = ref.read(subscriptionDecayServiceProvider);
      await service.recordUsage(userId, subscription.id);
      ref.invalidate(subscriptionsStreamProvider(userId));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usage recorded!')),
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

  void _showAddSubscriptionDialog(BuildContext context) {
    final nameController = TextEditingController();
    final amountController = TextEditingController();
    BillingFrequency selectedFrequency = BillingFrequency.monthly;
    CategoryType selectedCategory = CategoryType.streamingServices;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add Subscription'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'e.g., Netflix',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: amountController,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$ ',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<BillingFrequency>(
                  value: selectedFrequency,
                  decoration: const InputDecoration(labelText: 'Frequency'),
                  items: BillingFrequency.values
                      .where((f) => f != BillingFrequency.oneTime)
                      .map((f) => DropdownMenuItem(
                            value: f,
                            child: Text(f.displayName),
                          ))
                      .toList(),
                  onChanged: (v) {
                    if (v != null) {
                      setDialogState(() => selectedFrequency = v);
                    }
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<CategoryType>(
                  value: selectedCategory,
                  decoration: const InputDecoration(labelText: 'Category'),
                  items: CategoryType.values
                      .map((c) => DropdownMenuItem(
                            value: c,
                            child: Text(c.displayName),
                          ))
                      .toList(),
                  onChanged: (v) {
                    if (v != null) {
                      setDialogState(() => selectedCategory = v);
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                final name = nameController.text.trim();
                final amount = double.tryParse(amountController.text) ?? 0;

                if (name.isEmpty || amount <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in all fields'),
                    ),
                  );
                  return;
                }

                Navigator.pop(context);

                final userId = ref.read(currentUserIdProvider);
                if (userId == null) return;

                try {
                  final service = ref.read(subscriptionDecayServiceProvider);
                  await service.addSubscription(
                    userId: userId,
                    name: name,
                    amount: amount,
                    frequency: selectedFrequency,
                    category: selectedCategory,
                  );
                  ref.invalidate(subscriptionsStreamProvider(userId));

                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Subscription added!')),
                    );
                  }
                } catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.analysis});

  final SubscriptionDecayAnalysis analysis;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _SummaryStat(
                    label: 'Monthly Spend',
                    value: '\$${analysis.totalMonthlySpend.toStringAsFixed(0)}',
                    color: theme.colorScheme.primary,
                  ),
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: theme.dividerColor,
                ),
                Expanded(
                  child: _SummaryStat(
                    label: 'At Risk',
                    value: '${analysis.atRiskSubscriptions}',
                    color: Colors.orange,
                  ),
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: theme.dividerColor,
                ),
                Expanded(
                  child: _SummaryStat(
                    label: 'Unused',
                    value: '${analysis.abandonedSubscriptions}',
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryStat extends StatelessWidget {
  const _SummaryStat({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
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
    );
  }
}

class _SubscriptionCard extends StatelessWidget {
  const _SubscriptionCard({
    required this.subscription,
    required this.decayItem,
    required this.onCancel,
    required this.onRecordUsage,
  });

  final Subscription subscription;
  final SubscriptionDecayItem? decayItem;
  final VoidCallback onCancel;
  final VoidCallback onRecordUsage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final decayStatus = decayItem?.decayStatus ?? subscription.decayStatus;
    final usageScore = decayItem?.usageScore ?? subscription.usageScore ?? 100;
    final monthlyEquiv = subscription.frequency.monthlyEquivalent(subscription.amount);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: _getDecayColor(decayStatus).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      subscription.category.icon,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingMd),
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              subscription.name,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _getDecayColor(decayStatus)
                                  .withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  decayStatus.icon,
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  decayStatus.displayName,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: _getDecayColor(decayStatus),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${subscription.amount.toStringAsFixed(2)}/${subscription.frequency.displayName.toLowerCase()}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (subscription.frequency != BillingFrequency.monthly)
                        Text(
                          '(\$${monthlyEquiv.toStringAsFixed(2)}/month)',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            // Usage bar
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Usage Score',
                            style: theme.textTheme.bodySmall,
                          ),
                          Text(
                            '${usageScore.toStringAsFixed(0)}%',
                            style: theme.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      LinearProgressIndicator(
                        value: usageScore / 100,
                        backgroundColor: theme.colorScheme.surfaceContainerHighest,
                        color: _getDecayColor(decayStatus),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Recommendation
            if (decayItem?.recommendation.isNotEmpty ?? false) ...[
              const SizedBox(height: AppDimensions.spacingSm),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _getDecayColor(decayStatus).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 16,
                      color: _getDecayColor(decayStatus),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        decayItem!.recommendation,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: _getDecayColor(decayStatus),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            // Actions
            const SizedBox(height: AppDimensions.spacingSm),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: onRecordUsage,
                  icon: const Icon(Icons.check, size: 16),
                  label: const Text('Used Today'),
                ),
                if (decayStatus.shouldWarn)
                  TextButton.icon(
                    onPressed: onCancel,
                    icon: const Icon(Icons.cancel, size: 16),
                    label: const Text('Cancel'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getDecayColor(DecayStatus status) {
    switch (status) {
      case DecayStatus.active:
        return Colors.green;
      case DecayStatus.declining:
        return Colors.orange;
      case DecayStatus.dormant:
        return Colors.deepOrange;
      case DecayStatus.abandoned:
        return Colors.red;
    }
  }
}
