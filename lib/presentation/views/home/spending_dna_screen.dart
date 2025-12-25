import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../common/widgets/widgets.dart';

/// Provider for Spending DNA stream
final spendingDNAStreamProvider =
    StreamProvider.family<SpendingDNA?, String>((ref, userId) {
  final service = ref.watch(spendingDNAServiceProvider);
  return service.watchDNA(userId);
});

class SpendingDNAScreen extends ConsumerStatefulWidget {
  const SpendingDNAScreen({super.key});

  @override
  ConsumerState<SpendingDNAScreen> createState() => _SpendingDNAScreenState();
}

class _SpendingDNAScreenState extends ConsumerState<SpendingDNAScreen> {
  bool _isAnalyzing = false;

  Future<void> _analyzeDNA() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isAnalyzing = true);

    try {
      final service = ref.read(spendingDNAServiceProvider);
      await service.analyzeSpendingDNA(userId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('DNA Analysis complete!')),
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userId = ref.watch(currentUserIdProvider);

    if (userId == null) {
      return const Scaffold(
        body: Center(child: Text('Please sign in')),
      );
    }

    final dnaAsync = ref.watch(spendingDNAStreamProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Spending DNA'),
        actions: [
          IconButton(
            icon: _isAnalyzing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh),
            onPressed: _isAnalyzing ? null : _analyzeDNA,
            tooltip: 'Refresh DNA',
          ),
        ],
      ),
      body: dnaAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (dna) {
          if (dna == null) return _buildEmptyState(theme);
          return _DNAContent(dna: dna);
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
                Icons.fingerprint,
                size: 64,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            Text(
              'Discover Your Spending DNA',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Analyze your unique financial behavior patterns, personality, and habits to get personalized insights.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingXl),
            AppButton(
              label: 'Analyze My DNA',
              icon: Icons.auto_awesome,
              onPressed: _analyzeDNA,
              isLoading: _isAnalyzing,
            ),
          ],
        ),
      ),
    );
  }
}

class _DNAContent extends StatelessWidget {
  const _DNAContent({required this.dna});

  final SpendingDNA dna;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Personality Card
          _PersonalityCard(personality: dna.personality),
          const SizedBox(height: AppDimensions.spacingMd),

          // Score Cards Row
          Row(
            children: [
              Expanded(
                child: _ScoreCard(
                  label: 'Financial Health',
                  score: dna.financialHealthScore,
                  icon: Icons.favorite,
                  color: _getScoreColor(dna.financialHealthScore),
                ),
              ),
              const SizedBox(width: AppDimensions.spacingSm),
              Expanded(
                child: _ScoreCard(
                  label: 'Consistency',
                  score: dna.consistencyScore,
                  icon: Icons.timeline,
                  color: _getScoreColor(dna.consistencyScore),
                ),
              ),
              const SizedBox(width: AppDimensions.spacingSm),
              Expanded(
                child: _ScoreCard(
                  label: 'Savings Rate',
                  score: dna.savingsRate,
                  icon: Icons.savings,
                  color: _getScoreColor(dna.savingsRate),
                  suffix: '%',
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingLg),

          // Behavior Patterns
          Text(
            'Behavior Patterns',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          Card(
            child: Column(
              children: [
                _BehaviorTile(
                  icon: Icons.calendar_today,
                  title: 'Payday Behavior',
                  value: dna.paydayBehavior.displayName,
                  description: _getPaydayDescription(dna.paydayBehavior),
                ),
                const Divider(height: 1),
                _BehaviorTile(
                  icon: Icons.event,
                  title: 'End of Month',
                  value: dna.endOfMonthPattern.displayName,
                  description: _getEndOfMonthDescription(dna.endOfMonthPattern),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.spacingLg),

          // Spending Pattern
          Text(
            'Spending Profile',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          _SpendingProfileCard(profile: dna.patternProfile),
          const SizedBox(height: AppDimensions.spacingLg),

          // Category Affinities
          if (dna.categoryAffinities.isNotEmpty) ...[
            Text(
              'Top Spending Categories',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            _CategoryAffinitiesCard(affinities: dna.categoryAffinities),
            const SizedBox(height: AppDimensions.spacingLg),
          ],

          // Behavioral Traits
          if (dna.traits.isNotEmpty) ...[
            Text(
              'Your Traits',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            ...dna.traits.map((trait) => _TraitCard(trait: trait)),
          ],
        ],
      ),
    );
  }

  Color _getScoreColor(double score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.blue;
    if (score >= 40) return Colors.orange;
    return Colors.red;
  }

  String _getPaydayDescription(PaydayBehavior behavior) {
    switch (behavior) {
      case PaydayBehavior.spender:
        return 'You tend to spend more around payday';
      case PaydayBehavior.saver:
        return 'You save well after receiving income';
      case PaydayBehavior.balanced:
        return 'Your spending is consistent throughout';
    }
  }

  String _getEndOfMonthDescription(EndOfMonthPattern pattern) {
    switch (pattern) {
      case EndOfMonthPattern.tight:
        return 'Spending decreases at month end';
      case EndOfMonthPattern.splurge:
        return 'Spending increases at month end';
      case EndOfMonthPattern.stable:
        return 'Spending stays steady all month';
    }
  }
}

class _PersonalityCard extends StatelessWidget {
  const _PersonalityCard({required this.personality});

  final MoneyPersonality personality;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingLg),
        child: Column(
          children: [
            Text(
              personality.icon,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              personality.displayName,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              personality.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            Wrap(
              spacing: 8,
              children: personality.tips
                  .take(2)
                  .map((tip) => Chip(
                        label: Text(
                          tip,
                          style: theme.textTheme.bodySmall,
                        ),
                        backgroundColor: theme.colorScheme.primaryContainer,
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScoreCard extends StatelessWidget {
  const _ScoreCard({
    required this.label,
    required this.score,
    required this.icon,
    required this.color,
    this.suffix = '',
  });

  final String label;
  final double score;
  final IconData icon;
  final Color color;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              '${score.toStringAsFixed(0)}$suffix',
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
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _BehaviorTile extends StatelessWidget {
  const _BehaviorTile({
    required this.icon,
    required this.title,
    required this.value,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String value;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(icon, color: theme.colorScheme.primary),
      title: Text(title),
      subtitle: Text(description),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          value,
          style: theme.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

class _SpendingProfileCard extends StatelessWidget {
  const _SpendingProfileCard({required this.profile});

  final SpendingPatternProfile profile;

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
                  child: _ProfileStat(
                    label: 'Daily Avg',
                    value: '\$${profile.avgDailySpend.toStringAsFixed(0)}',
                  ),
                ),
                Expanded(
                  child: _ProfileStat(
                    label: 'Weekday',
                    value: '\$${profile.avgWeekdaySpend.toStringAsFixed(0)}',
                  ),
                ),
                Expanded(
                  child: _ProfileStat(
                    label: 'Weekend',
                    value: '\$${profile.avgWeekendSpend.toStringAsFixed(0)}',
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.schedule,
                        size: 16, color: theme.colorScheme.onSurfaceVariant),
                    const SizedBox(width: 4),
                    Text(
                      'Peak: ${profile.peakSpendingDay} ${profile.peakSpendingTime}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.flash_on,
                        size: 16, color: theme.colorScheme.onSurfaceVariant),
                    const SizedBox(width: 4),
                    Text(
                      'Impulse: ${(profile.impulseSpendingRatio * 100).toStringAsFixed(0)}%',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  const _ProfileStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
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

class _CategoryAffinitiesCard extends StatelessWidget {
  const _CategoryAffinitiesCard({required this.affinities});

  final Map<String, double> affinities;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sorted = affinities.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          children: sorted.take(5).map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.key, style: theme.textTheme.bodyMedium),
                      Text(
                        '${entry.value.toStringAsFixed(1)}%',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: entry.value / 100,
                    backgroundColor:
                        theme.colorScheme.primary.withValues(alpha: 0.1),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _TraitCard extends StatelessWidget {
  const _TraitCard({required this.trait});

  final BehavioralTrait trait;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = _getImpactColor(trait.impact);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: AppDimensions.borderRadiusSm,
                  ),
                  child: Icon(
                    _getImpactIcon(trait.impact),
                    color: color,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        trait.name,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        trait.description,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (trait.recommendation != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: AppDimensions.borderRadiusSm,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      size: 16,
                      color: theme.colorScheme.tertiary,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        trait.recommendation!,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Color _getImpactColor(TraitImpact impact) {
    switch (impact) {
      case TraitImpact.positive:
        return Colors.green;
      case TraitImpact.neutral:
        return Colors.blue;
      case TraitImpact.negative:
        return Colors.orange;
    }
  }

  IconData _getImpactIcon(TraitImpact impact) {
    switch (impact) {
      case TraitImpact.positive:
        return Icons.thumb_up;
      case TraitImpact.neutral:
        return Icons.remove;
      case TraitImpact.negative:
        return Icons.thumb_down;
    }
  }
}
