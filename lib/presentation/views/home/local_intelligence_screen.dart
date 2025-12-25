import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../data/models/local_intelligence_model.dart';
import '../../../data/services/local_intelligence_service.dart';
import '../../common/widgets/widgets.dart';

class LocalIntelligenceScreen extends ConsumerStatefulWidget {
  const LocalIntelligenceScreen({super.key});

  @override
  ConsumerState<LocalIntelligenceScreen> createState() =>
      _LocalIntelligenceScreenState();
}

class _LocalIntelligenceScreenState
    extends ConsumerState<LocalIntelligenceScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(currentUserIdProvider);

    if (userId == null) {
      return const Scaffold(
        body: Center(child: Text('Please sign in')),
      );
    }

    final intelligenceAsync = ref.watch(localIntelligenceProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Intelligence'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Benchmark'),
            Tab(text: 'Deals'),
            Tab(text: 'Prices'),
            Tab(text: 'Groups'),
          ],
        ),
      ),
      body: intelligenceAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (intelligence) {
          if (intelligence == null) {
            return _SetupScreen(userId: userId);
          }
          return TabBarView(
            controller: _tabController,
            children: [
              _BenchmarkTab(
                benchmark: intelligence.benchmark,
                profile: intelligence.localProfile,
              ),
              _DealsTab(userId: userId, deals: intelligence.deals),
              _PricesTab(userId: userId, comparisons: intelligence.priceComparisons),
              _GroupsTab(userId: userId, groups: intelligence.savingsGroups),
            ],
          );
        },
      ),
    );
  }
}

class _SetupScreen extends ConsumerStatefulWidget {
  const _SetupScreen({required this.userId});

  final String userId;

  @override
  ConsumerState<_SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends ConsumerState<_SetupScreen> {
  final _zipController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  bool _isSettingUp = false;

  @override
  void dispose() {
    _zipController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  Future<void> _setup() async {
    if (_zipController.text.isEmpty) return;

    setState(() => _isSettingUp = true);

    try {
      final service = ref.read(localIntelligenceServiceProvider);
      await service.setupLocalProfile(
        userId: widget.userId,
        zipCode: _zipController.text,
        city: _cityController.text,
        state: _stateController.text,
      );
      // Refresh deals
      await service.refreshLocalDeals(widget.userId);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSettingUp = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: SingleChildScrollView(
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
                Icons.location_on,
                size: 64,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            Text(
              'Set Up Local Intelligence',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Get hyperlocal price comparisons, neighborhood benchmarks, and community deals.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingXl),
            TextField(
              controller: _zipController,
              decoration: const InputDecoration(
                labelText: 'ZIP Code',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _cityController,
                    decoration: const InputDecoration(
                      labelText: 'City',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingSm),
                Expanded(
                  child: TextField(
                    controller: _stateController,
                    decoration: const InputDecoration(
                      labelText: 'State',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacingXl),
            AppButton(
              label: 'Get Started',
              onPressed: _setup,
              isLoading: _isSettingUp,
            ),
          ],
        ),
      ),
    );
  }
}

class _BenchmarkTab extends StatelessWidget {
  const _BenchmarkTab({required this.benchmark, required this.profile});

  final NeighborhoodBenchmark benchmark;
  final LocalProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      children: [
        // Location Card
        Card(
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.spacingMd),
            child: Row(
              children: [
                Icon(Icons.location_on, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        benchmark.neighborhoodName,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${benchmark.householdsCompared} households compared',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${benchmark.userOverallRank.toStringAsFixed(0)}th',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _getRankColor(benchmark.userOverallRank),
                      ),
                    ),
                    Text(
                      'percentile',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spacingMd),

        // Insights
        if (benchmark.insights.isNotEmpty) ...[
          Text(
            'Insights',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          ...benchmark.insights.map((insight) => _InsightCard(insight: insight)),
          const SizedBox(height: AppDimensions.spacingMd),
        ],

        // Category Benchmarks
        Text(
          'Spending by Category',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingSm),
        ...benchmark.categoryBenchmarks.entries
            .map((e) => _CategoryBenchmarkCard(
                  name: e.key,
                  benchmark: e.value,
                )),
      ],
    );
  }

  Color _getRankColor(double percentile) {
    if (percentile <= 30) return Colors.green;
    if (percentile <= 60) return Colors.blue;
    if (percentile <= 80) return Colors.orange;
    return Colors.red;
  }
}

class _InsightCard extends StatelessWidget {
  const _InsightCard({required this.insight});

  final BenchmarkInsight insight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Row(
          children: [
            Text(
              insight.type.icon,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    insight.title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    insight.description,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (insight.potentialImpact > 0)
                    Text(
                      '\$${insight.potentialImpact.toStringAsFixed(0)}/mo potential',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryBenchmarkCard extends StatelessWidget {
  const _CategoryBenchmarkCard({
    required this.name,
    required this.benchmark,
  });

  final String name;
  final CategoryBenchmark benchmark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  benchmark.categoryName,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      benchmark.comparison.icon,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      benchmark.comparison.displayName,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Spending',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        '\$${benchmark.userSpending.toStringAsFixed(0)}/mo',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Neighborhood Avg',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        '\$${benchmark.neighborhoodAverage.toStringAsFixed(0)}/mo',
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                if (benchmark.potentialSavings > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Save \$${benchmark.potentialSavings.toStringAsFixed(0)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: benchmark.percentile / 100,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
            ),
            const SizedBox(height: 4),
            Text(
              '${benchmark.percentile.toStringAsFixed(0)}th percentile',
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

class _DealsTab extends ConsumerWidget {
  const _DealsTab({required this.userId, required this.deals});

  final String userId;
  final List<LocalDeal> deals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    if (deals.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_offer,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            Text(
              'No deals found',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              'Check back later for local deals',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            AppButton(
              label: 'Refresh Deals',
              icon: Icons.refresh,
              onPressed: () async {
                final service = ref.read(localIntelligenceServiceProvider);
                await service.refreshLocalDeals(userId);
              },
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Local Deals',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton.icon(
              onPressed: () async {
                final service = ref.read(localIntelligenceServiceProvider);
                await service.refreshLocalDeals(userId);
              },
              icon: const Icon(Icons.refresh, size: 16),
              label: const Text('Refresh'),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacingSm),
        ...deals.map((deal) => _DealCard(deal: deal)),
        const SizedBox(height: AppDimensions.spacingMd),
        OutlinedButton.icon(
          onPressed: () => _showReportDealDialog(context, ref),
          icon: const Icon(Icons.add),
          label: const Text('Report a Deal'),
        ),
      ],
    );
  }

  void _showReportDealDialog(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _ReportDealSheet(userId: userId),
    );
  }
}

class _DealCard extends StatelessWidget {
  const _DealCard({required this.deal});

  final LocalDeal deal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final daysLeft = deal.validUntil.difference(DateTime.now()).inDays;

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
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                    borderRadius: AppDimensions.borderRadiusSm,
                  ),
                  child: Center(
                    child: Text(
                      deal.source.icon,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        deal.title,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        deal.storeName,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '-${deal.savingsPercent.toStringAsFixed(0)}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              deal.description,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 14,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  '${deal.distanceMiles.toStringAsFixed(1)} mi',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 16),
                Icon(
                  Icons.schedule,
                  size: 14,
                  color: daysLeft <= 2 ? Colors.orange : theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  daysLeft <= 0 ? 'Expires today' : '$daysLeft days left',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: daysLeft <= 2 ? Colors.orange : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      '\$${deal.originalPrice.toStringAsFixed(2)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '\$${deal.dealPrice.toStringAsFixed(2)}',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
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

class _PricesTab extends ConsumerStatefulWidget {
  const _PricesTab({required this.userId, required this.comparisons});

  final String userId;
  final List<PriceComparison> comparisons;

  @override
  ConsumerState<_PricesTab> createState() => _PricesTabState();
}

class _PricesTabState extends ConsumerState<_PricesTab> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      children: [
        Text(
          'Price Comparisons',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'See how your purchases compare to local prices.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingMd),
        if (widget.comparisons.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacingXl),
              child: Column(
                children: [
                  Icon(
                    Icons.compare_arrows,
                    size: 48,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppDimensions.spacingSm),
                  Text(
                    'No price comparisons yet',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ...widget.comparisons.map((c) => _PriceComparisonCard(comparison: c)),
        const SizedBox(height: AppDimensions.spacingMd),
        OutlinedButton.icon(
          onPressed: () => _showCompareDialog(context),
          icon: const Icon(Icons.add),
          label: const Text('Compare a Price'),
        ),
      ],
    );
  }

  void _showCompareDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _ComparePriceSheet(userId: widget.userId),
    );
  }
}

class _PriceComparisonCard extends StatelessWidget {
  const _PriceComparisonCard({required this.comparison});

  final PriceComparison comparison;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final didOverpay = comparison.userPaidPrice > comparison.bestPrice;

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    comparison.itemName,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (didOverpay)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Overpaid \$${comparison.potentialSavings.toStringAsFixed(2)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Good deal!',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _PriceStat(label: 'You Paid', value: '\$${comparison.userPaidPrice.toStringAsFixed(2)}'),
                const SizedBox(width: 16),
                _PriceStat(label: 'Best Price', value: '\$${comparison.bestPrice.toStringAsFixed(2)}'),
                const SizedBox(width: 16),
                _PriceStat(label: 'Average', value: '\$${comparison.averagePrice.toStringAsFixed(2)}'),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Best at: ${comparison.bestPriceLocation}',
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

class _PriceStat extends StatelessWidget {
  const _PriceStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _GroupsTab extends ConsumerWidget {
  const _GroupsTab({required this.userId, required this.groups});

  final String userId;
  final List<CommunitySavingsGroup> groups;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      children: [
        Text(
          'Community Savings Groups',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Join local groups to save together.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingMd),
        if (groups.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacingXl),
              child: Column(
                children: [
                  Icon(
                    Icons.groups,
                    size: 48,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppDimensions.spacingSm),
                  Text(
                    'No groups in your area yet',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingMd),
                  Text(
                    'Be the first to create one!',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          )
        else
          ...groups.map((g) => _GroupCard(group: g, userId: userId)),
        const SizedBox(height: AppDimensions.spacingMd),
        OutlinedButton.icon(
          onPressed: () => _showCreateGroupDialog(context, ref),
          icon: const Icon(Icons.add),
          label: const Text('Create a Group'),
        ),
      ],
    );
  }

  void _showCreateGroupDialog(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _CreateGroupSheet(userId: userId),
    );
  }
}

class _GroupCard extends ConsumerWidget {
  const _GroupCard({required this.group, required this.userId});

  final CommunitySavingsGroup group;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

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
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                    borderRadius: AppDimensions.borderRadiusSm,
                  ),
                  child: Center(
                    child: Text(
                      group.type.icon,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        group.name,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        group.type.displayName,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${group.memberCount}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'members',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(group.description),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${group.totalSaved.toStringAsFixed(0)} saved by group',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.green,
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final service = ref.read(localIntelligenceServiceProvider);
                    await service.joinSavingsGroup(userId, group.id);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Joined group!')),
                      );
                    }
                  },
                  child: const Text('Join'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Bottom Sheets

class _ReportDealSheet extends ConsumerStatefulWidget {
  const _ReportDealSheet({required this.userId});

  final String userId;

  @override
  ConsumerState<_ReportDealSheet> createState() => _ReportDealSheetState();
}

class _ReportDealSheetState extends ConsumerState<_ReportDealSheet> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _storeController = TextEditingController();
  final _addressController = TextEditingController();
  final _originalPriceController = TextEditingController();
  final _dealPriceController = TextEditingController();
  CategoryType _category = CategoryType.groceries;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _storeController.dispose();
    _addressController.dispose();
    _originalPriceController.dispose();
    _dealPriceController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_titleController.text.isEmpty) return;

    setState(() => _isSubmitting = true);

    try {
      final service = ref.read(localIntelligenceServiceProvider);
      await service.reportDeal(
        userId: widget.userId,
        title: _titleController.text,
        description: _descController.text,
        storeName: _storeController.text,
        storeAddress: _addressController.text,
        originalPrice: double.tryParse(_originalPriceController.text) ?? 0,
        dealPrice: double.tryParse(_dealPriceController.text) ?? 0,
        category: _category,
        validUntil: DateTime.now().add(const Duration(days: 7)),
      );
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.spacingLg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Report a Deal',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Deal Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            TextField(
              controller: _storeController,
              decoration: const InputDecoration(
                labelText: 'Store Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _originalPriceController,
                    decoration: const InputDecoration(
                      labelText: 'Original Price',
                      border: OutlineInputBorder(),
                      prefixText: '\$ ',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingSm),
                Expanded(
                  child: TextField(
                    controller: _dealPriceController,
                    decoration: const InputDecoration(
                      labelText: 'Deal Price',
                      border: OutlineInputBorder(),
                      prefixText: '\$ ',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            AppButton(
              label: 'Submit Deal',
              onPressed: _submit,
              isLoading: _isSubmitting,
            ),
          ],
        ),
      ),
    );
  }
}

class _ComparePriceSheet extends ConsumerStatefulWidget {
  const _ComparePriceSheet({required this.userId});

  final String userId;

  @override
  ConsumerState<_ComparePriceSheet> createState() => _ComparePriceSheetState();
}

class _ComparePriceSheetState extends ConsumerState<_ComparePriceSheet> {
  final _itemController = TextEditingController();
  final _priceController = TextEditingController();
  CategoryType _category = CategoryType.groceries;
  bool _isComparing = false;

  @override
  void dispose() {
    _itemController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _compare() async {
    if (_itemController.text.isEmpty || _priceController.text.isEmpty) return;

    setState(() => _isComparing = true);

    try {
      final service = ref.read(localIntelligenceServiceProvider);
      await service.comparePrice(
        userId: widget.userId,
        itemName: _itemController.text,
        category: _category,
        userPaidPrice: double.parse(_priceController.text),
      );
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isComparing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.spacingLg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Compare a Price',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            TextField(
              controller: _itemController,
              decoration: const InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Price You Paid',
                border: OutlineInputBorder(),
                prefixText: '\$ ',
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            AppButton(
              label: 'Compare',
              onPressed: _compare,
              isLoading: _isComparing,
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateGroupSheet extends ConsumerStatefulWidget {
  const _CreateGroupSheet({required this.userId});

  final String userId;

  @override
  ConsumerState<_CreateGroupSheet> createState() => _CreateGroupSheetState();
}

class _CreateGroupSheetState extends ConsumerState<_CreateGroupSheet> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  GroupType _type = GroupType.dealSharing;
  bool _isCreating = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _create() async {
    if (_nameController.text.isEmpty) return;

    setState(() => _isCreating = true);

    try {
      final service = ref.read(localIntelligenceServiceProvider);
      await service.createSavingsGroup(
        userId: widget.userId,
        name: _nameController.text,
        description: _descController.text,
        type: _type,
        categories: [],
      );
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isCreating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.spacingLg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Savings Group',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Group Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            DropdownButtonFormField<GroupType>(
              value: _type,
              decoration: const InputDecoration(
                labelText: 'Group Type',
                border: OutlineInputBorder(),
              ),
              items: GroupType.values.map((t) => DropdownMenuItem(
                    value: t,
                    child: Text('${t.icon} ${t.displayName}'),
                  )).toList(),
              onChanged: (v) => setState(() => _type = v ?? GroupType.dealSharing),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            TextField(
              controller: _descController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            AppButton(
              label: 'Create Group',
              onPressed: _create,
              isLoading: _isCreating,
            ),
          ],
        ),
      ),
    );
  }
}
