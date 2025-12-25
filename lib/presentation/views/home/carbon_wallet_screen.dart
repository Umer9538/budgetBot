import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../common/widgets/widgets.dart';

/// Provider for carbon wallet stream
final carbonWalletStreamProvider =
    StreamProvider.family<CarbonWallet?, String>((ref, userId) {
  final service = ref.watch(carbonWalletServiceProvider);
  return service.watchLatestReport(userId);
});

class CarbonWalletScreen extends ConsumerStatefulWidget {
  const CarbonWalletScreen({super.key});

  @override
  ConsumerState<CarbonWalletScreen> createState() => _CarbonWalletScreenState();
}

class _CarbonWalletScreenState extends ConsumerState<CarbonWalletScreen> {
  bool _isGenerating = false;

  Future<void> _generateReport() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isGenerating = true);

    try {
      final service = ref.read(carbonWalletServiceProvider);
      await service.generateCarbonReport(userId: userId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Carbon report generated!')),
        );
      }
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userId = ref.watch(currentUserIdProvider);

    if (userId == null) {
      return const Scaffold(
        body: Center(child: Text('Please sign in')),
      );
    }

    final walletAsync = ref.watch(carbonWalletStreamProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carbon Wallet'),
        actions: [
          IconButton(
            icon: _isGenerating
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh),
            onPressed: _isGenerating ? null : _generateReport,
            tooltip: 'Refresh Report',
          ),
        ],
      ),
      body: walletAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (wallet) {
          if (wallet == null) return _buildEmptyState(theme);
          return _CarbonWalletContent(wallet: wallet);
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
                color: Colors.green.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.eco,
                size: 64,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            Text(
              'Track Your Carbon Footprint',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Understand the environmental impact of your spending and discover ways to reduce your carbon footprint.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingXl),
            AppButton(
              label: 'Generate Report',
              icon: Icons.eco,
              onPressed: _generateReport,
              isLoading: _isGenerating,
            ),
          ],
        ),
      ),
    );
  }
}

class _CarbonWalletContent extends StatelessWidget {
  const _CarbonWalletContent({required this.wallet});

  final CarbonWallet wallet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Impact Level Card
          _ImpactLevelCard(
            impactLevel: wallet.impactLevel,
            netCarbon: wallet.netCarbonKg,
          ),
          const SizedBox(height: AppDimensions.spacingMd),

          // Carbon Summary
          Row(
            children: [
              Expanded(
                child: _CarbonStatCard(
                  label: 'Total CO2',
                  value: '${wallet.totalCarbonKg.toStringAsFixed(1)} kg',
                  icon: Icons.cloud,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingSm),
              Expanded(
                child: _CarbonStatCard(
                  label: 'Offset',
                  value: '${wallet.offsetCarbonKg.toStringAsFixed(1)} kg',
                  icon: Icons.park,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingSm),
              Expanded(
                child: _CarbonStatCard(
                  label: 'Net',
                  value: '${wallet.netCarbonKg.toStringAsFixed(1)} kg',
                  icon: Icons.balance,
                  color: wallet.netCarbonKg > 0 ? Colors.orange : Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingMd),

          // Comparison to Average
          Card(
            color: wallet.comparedToAverage > 0
                ? Colors.orange.withValues(alpha: 0.1)
                : Colors.green.withValues(alpha: 0.1),
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacingMd),
              child: Row(
                children: [
                  Icon(
                    wallet.comparedToAverage > 0
                        ? Icons.trending_up
                        : Icons.trending_down,
                    color:
                        wallet.comparedToAverage > 0 ? Colors.orange : Colors.green,
                    size: 32,
                  ),
                  const SizedBox(width: AppDimensions.spacingMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          wallet.comparedToAverage > 0
                              ? '${wallet.comparedToAverage.abs().toStringAsFixed(0)}% above average'
                              : '${wallet.comparedToAverage.abs().toStringAsFixed(0)}% below average',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: wallet.comparedToAverage > 0
                                ? Colors.orange
                                : Colors.green,
                          ),
                        ),
                        Text(
                          wallet.comparedToAverage > 0
                              ? 'Your carbon footprint is higher than average'
                              : 'Great job! You\'re more eco-friendly than average',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacingLg),

          // Category Breakdown
          if (wallet.categoryBreakdown.isNotEmpty) ...[
            Text(
              'Carbon by Category',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            _CategoryBreakdownCard(breakdown: wallet.categoryBreakdown),
            const SizedBox(height: AppDimensions.spacingLg),
          ],

          // Top Emitters
          if (wallet.topEmitters.isNotEmpty) ...[
            Text(
              'Top Carbon Emitters',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            ...wallet.topEmitters.take(5).map((emitter) => _EmitterCard(
                  emitter: emitter,
                )),
            const SizedBox(height: AppDimensions.spacingLg),
          ],

          // Recommendations
          if (wallet.recommendations.isNotEmpty) ...[
            Text(
              'Eco-Friendly Tips',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            ...wallet.recommendations.map((rec) => Card(
                  margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
                  child: ListTile(
                    leading: const Icon(Icons.eco, color: Colors.green),
                    title: Text(rec),
                  ),
                )),
          ],
        ],
      ),
    );
  }
}

class _ImpactLevelCard extends StatelessWidget {
  const _ImpactLevelCard({
    required this.impactLevel,
    required this.netCarbon,
  });

  final CarbonImpactLevel impactLevel;
  final double netCarbon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingLg),
        child: Column(
          children: [
            Text(
              impactLevel.icon,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              impactLevel.displayName,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: _getImpactColor(impactLevel),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              impactLevel.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Color _getImpactColor(CarbonImpactLevel level) {
    switch (level) {
      case CarbonImpactLevel.veryLow:
        return Colors.green;
      case CarbonImpactLevel.low:
        return Colors.lightGreen;
      case CarbonImpactLevel.moderate:
        return Colors.orange;
      case CarbonImpactLevel.high:
        return Colors.deepOrange;
      case CarbonImpactLevel.veryHigh:
        return Colors.red;
    }
  }
}

class _CarbonStatCard extends StatelessWidget {
  const _CarbonStatCard({
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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
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
        ),
      ),
    );
  }
}

class _CategoryBreakdownCard extends StatelessWidget {
  const _CategoryBreakdownCard({required this.breakdown});

  final Map<String, double> breakdown;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sorted = breakdown.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    final total = sorted.fold<double>(0, (sum, e) => sum + e.value);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          children: sorted.take(5).map((entry) {
            final percentage = total > 0 ? (entry.value / total) * 100 : 0;
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
                        '${entry.value.toStringAsFixed(1)} kg',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: percentage / 100,
                    backgroundColor: Colors.green.withValues(alpha: 0.1),
                    color: _getCategoryColor(percentage.toDouble()),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Color _getCategoryColor(double percentage) {
    if (percentage > 40) return Colors.red;
    if (percentage > 25) return Colors.orange;
    return Colors.green;
  }
}

class _EmitterCard extends StatelessWidget {
  const _EmitterCard({required this.emitter});

  final CarbonTransaction emitter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange.withValues(alpha: 0.1),
                borderRadius: AppDimensions.borderRadiusSm,
              ),
              child: const Icon(
                Icons.local_fire_department,
                color: Colors.orange,
              ),
            ),
            const SizedBox(width: AppDimensions.spacingMd),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    emitter.merchantName,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${emitter.amount.toStringAsFixed(2)} spent',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (emitter.alternativeSuggestion != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      emitter.alternativeSuggestion!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.green,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${emitter.carbonKg.toStringAsFixed(1)} kg',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  'CO2',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
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
