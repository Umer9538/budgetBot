import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../data/models/digital_twin_model.dart';
import '../../../data/services/digital_twin_service.dart';
import '../../common/widgets/widgets.dart';

class DigitalTwinScreen extends ConsumerStatefulWidget {
  const DigitalTwinScreen({super.key});

  @override
  ConsumerState<DigitalTwinScreen> createState() => _DigitalTwinScreenState();
}

class _DigitalTwinScreenState extends ConsumerState<DigitalTwinScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isInitializing = false;
  String? _selectedScenarioId;

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

  Future<void> _initializeTwin() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isInitializing = true);

    try {
      final service = ref.read(digitalTwinServiceProvider);
      await service.initializeDigitalTwin(userId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Digital Twin created!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isInitializing = false);
    }
  }

  Future<void> _refreshTwin() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isInitializing = true);

    try {
      final service = ref.read(digitalTwinServiceProvider);
      await service.refreshDigitalTwin(userId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Projections updated!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isInitializing = false);
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

    final twinAsync = ref.watch(digitalTwinStreamProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Financial Digital Twin'),
        actions: [
          IconButton(
            icon: _isInitializing
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh),
            onPressed: _isInitializing ? null : _refreshTwin,
            tooltip: 'Refresh Projections',
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Overview'),
            Tab(text: 'Scenarios'),
            Tab(text: 'Life Events'),
            Tab(text: 'Compare'),
          ],
        ),
      ),
      body: twinAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (twin) {
          if (twin == null) return _buildEmptyState(theme);
          return TabBarView(
            controller: _tabController,
            children: [
              _OverviewTab(twin: twin),
              _ScenariosTab(
                twin: twin,
                selectedId: _selectedScenarioId,
                onSelect: (id) => setState(() => _selectedScenarioId = id),
              ),
              _LifeEventsTab(twin: twin),
              _CompareTab(twin: twin),
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
                Icons.timeline,
                size: 64,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            Text(
              'Create Your Digital Twin',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'See your financial future through Monte Carlo simulations. Test life scenarios and make confident decisions.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingXl),
            AppButton(
              label: 'Create Digital Twin',
              icon: Icons.auto_awesome,
              onPressed: _initializeTwin,
              isLoading: _isInitializing,
            ),
          ],
        ),
      ),
    );
  }
}

class _OverviewTab extends StatelessWidget {
  const _OverviewTab({required this.twin});

  final FinancialDigitalTwin twin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final projection = twin.baseProjection;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current Snapshot Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Snapshot',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingMd),
                  Row(
                    children: [
                      Expanded(
                        child: _StatItem(
                          label: 'Net Worth',
                          value: '\$${_formatNumber(twin.currentSnapshot.currentNetWorth)}',
                          icon: Icons.account_balance,
                        ),
                      ),
                      Expanded(
                        child: _StatItem(
                          label: 'Monthly Income',
                          value: '\$${_formatNumber(twin.currentSnapshot.monthlyIncome)}',
                          icon: Icons.trending_up,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spacingSm),
                  Row(
                    children: [
                      Expanded(
                        child: _StatItem(
                          label: 'Savings Rate',
                          value: '${(twin.currentSnapshot.savingsRate * 100).toStringAsFixed(1)}%',
                          icon: Icons.savings,
                        ),
                      ),
                      Expanded(
                        child: _StatItem(
                          label: 'Emergency Fund',
                          value: '${twin.currentSnapshot.emergencyFundMonths.toStringAsFixed(1)} mo',
                          icon: Icons.shield,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacingLg),

          // Success Probability
          Text(
            'Projection Summary',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          Row(
            children: [
              Expanded(
                child: _ProbabilityCard(
                  label: 'Success Rate',
                  value: projection.successProbability,
                  color: Colors.green,
                  icon: Icons.check_circle,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingSm),
              Expanded(
                child: _ProbabilityCard(
                  label: 'Risk of Ruin',
                  value: projection.ruinProbability,
                  color: Colors.red,
                  icon: Icons.warning,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingLg),

          // Outcome Scenarios
          Text(
            'Projected Outcomes (${projection.yearsProjected} years)',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          _OutcomeCard(
            label: 'Best Case (95th)',
            outcome: projection.bestCase,
            color: Colors.green,
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          _OutcomeCard(
            label: 'Median (50th)',
            outcome: projection.medianCase,
            color: Colors.blue,
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          _OutcomeCard(
            label: 'Worst Case (5th)',
            outcome: projection.worstCase,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

  String _formatNumber(double value) {
    if (value.abs() >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value.abs() >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)}K';
    }
    return value.toStringAsFixed(0);
  }
}

class _ScenariosTab extends ConsumerWidget {
  const _ScenariosTab({
    required this.twin,
    required this.selectedId,
    required this.onSelect,
  });

  final FinancialDigitalTwin twin;
  final String? selectedId;
  final Function(String?) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      children: [
        Text(
          'What-If Scenarios',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingSm),
        Text(
          'Explore how different life events would affect your financial future.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingMd),
        ...twin.scenarios.map((scenario) => _ScenarioCard(
              scenario: scenario,
              isSelected: selectedId == scenario.id,
              onTap: () => onSelect(scenario.id == selectedId ? null : scenario.id),
            )),
        const SizedBox(height: AppDimensions.spacingMd),
        OutlinedButton.icon(
          onPressed: () => _showAddScenarioDialog(context, ref),
          icon: const Icon(Icons.add),
          label: const Text('Create Custom Scenario'),
        ),
      ],
    );
  }

  void _showAddScenarioDialog(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _AddScenarioSheet(twin: twin),
    );
  }
}

class _ScenarioCard extends StatelessWidget {
  const _ScenarioCard({
    required this.scenario,
    required this.isSelected,
    required this.onTap,
  });

  final SimulationScenario scenario;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppDimensions.borderRadiusMd,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    scenario.type.icon,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          scenario.name,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          scenario.description,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isSelected ? Icons.expand_less : Icons.expand_more,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              if (isSelected) ...[
                const Divider(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: _MiniStat(
                        label: 'Success Rate',
                        value: '${scenario.projection.successProbability.toStringAsFixed(0)}%',
                      ),
                    ),
                    Expanded(
                      child: _MiniStat(
                        label: 'Final Net Worth',
                        value: '\$${(scenario.projection.medianCase.finalNetWorth / 1000).toStringAsFixed(0)}K',
                      ),
                    ),
                    Expanded(
                      child: _MiniStat(
                        label: 'Retirement Age',
                        value: '${scenario.projection.medianCase.retirementAge}',
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _LifeEventsTab extends ConsumerWidget {
  const _LifeEventsTab({required this.twin});

  final FinancialDigitalTwin twin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      children: [
        Text(
          'Projected Life Events',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingSm),
        Text(
          'Add major life events to see their impact on your projections.',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingMd),
        if (twin.projectedLifeEvents.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacingXl),
              child: Column(
                children: [
                  Icon(
                    Icons.event_note,
                    size: 48,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(height: AppDimensions.spacingSm),
                  Text(
                    'No life events planned',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ...twin.projectedLifeEvents.map((event) => _LifeEventCard(event: event)),
        const SizedBox(height: AppDimensions.spacingMd),
        OutlinedButton.icon(
          onPressed: () => _showAddEventDialog(context, ref),
          icon: const Icon(Icons.add),
          label: const Text('Add Life Event'),
        ),
      ],
    );
  }

  void _showAddEventDialog(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _AddLifeEventSheet(twin: twin),
    );
  }
}

class _LifeEventCard extends StatelessWidget {
  const _LifeEventCard({required this.event});

  final LifeEvent event;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: ListTile(
        leading: Text(
          event.type.icon,
          style: const TextStyle(fontSize: 24),
        ),
        title: Text(event.name),
        subtitle: Text(
          '${_formatDate(event.projectedDate)} • ${event.financialImpact >= 0 ? '+' : ''}\$${event.financialImpact.toStringAsFixed(0)}',
        ),
        trailing: CircularProgressIndicator(
          value: event.confidence / 100,
          strokeWidth: 3,
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.year}';
  }
}

class _CompareTab extends ConsumerStatefulWidget {
  const _CompareTab({required this.twin});

  final FinancialDigitalTwin twin;

  @override
  ConsumerState<_CompareTab> createState() => _CompareTabState();
}

class _CompareTabState extends ConsumerState<_CompareTab> {
  String _scenario1 = 'baseline';
  String _scenario2 = '';
  ScenarioComparison? _comparison;
  bool _isComparing = false;

  @override
  void initState() {
    super.initState();
    if (widget.twin.scenarios.isNotEmpty) {
      _scenario2 = widget.twin.scenarios.first.id;
    }
  }

  Future<void> _compare() async {
    if (_scenario2.isEmpty) return;

    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isComparing = true);

    try {
      final service = ref.read(digitalTwinServiceProvider);
      final comparison = await service.compareScenarios(
        userId,
        _scenario1,
        _scenario2,
      );
      setState(() => _comparison = comparison);
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
    final theme = Theme.of(context);
    final allScenarios = [
      const DropdownMenuItem(value: 'baseline', child: Text('Current Path')),
      ...widget.twin.scenarios.map((s) =>
          DropdownMenuItem(value: s.id, child: Text(s.name))),
    ];

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      children: [
        Text(
          'Compare Scenarios',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingMd),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: _scenario1,
                decoration: const InputDecoration(
                  labelText: 'Scenario 1',
                  border: OutlineInputBorder(),
                ),
                items: allScenarios,
                onChanged: (v) => setState(() => _scenario1 = v ?? 'baseline'),
              ),
            ),
            const SizedBox(width: AppDimensions.spacingSm),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: _scenario2.isEmpty ? null : _scenario2,
                decoration: const InputDecoration(
                  labelText: 'Scenario 2',
                  border: OutlineInputBorder(),
                ),
                items: allScenarios.where((s) => s.value != _scenario1).toList(),
                onChanged: (v) => setState(() => _scenario2 = v ?? ''),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacingMd),
        AppButton(
          label: 'Compare',
          onPressed: _compare,
          isLoading: _isComparing,
        ),
        if (_comparison != null) ...[
          const SizedBox(height: AppDimensions.spacingLg),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Comparison Results',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingMd),
                  _ComparisonRow(
                    label: 'Net Worth Difference',
                    value: '\$${(_comparison!.netWorthDifference / 1000).toStringAsFixed(0)}K',
                    isPositive: _comparison!.netWorthDifference > 0,
                  ),
                  _ComparisonRow(
                    label: 'Retirement Age Difference',
                    value: '${_comparison!.retirementAgeDifference.toStringAsFixed(0)} years',
                    isPositive: _comparison!.retirementAgeDifference < 0,
                  ),
                  _ComparisonRow(
                    label: 'Success Rate Difference',
                    value: '${_comparison!.successProbabilityDifference.toStringAsFixed(0)}%',
                    isPositive: _comparison!.successProbabilityDifference > 0,
                  ),
                  const Divider(height: 24),
                  Text(
                    'Key Differences',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ..._comparison!.keyDifferences.map((d) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          children: [
                            const Icon(Icons.check, size: 16),
                            const SizedBox(width: 8),
                            Expanded(child: Text(d)),
                          ],
                        ),
                      )),
                  const SizedBox(height: AppDimensions.spacingMd),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                      borderRadius: AppDimensions.borderRadiusSm,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.lightbulb, color: theme.colorScheme.primary),
                        const SizedBox(width: 8),
                        Expanded(child: Text(_comparison!.recommendation)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// Helper Widgets

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ],
    );
  }
}

class _ProbabilityCard extends StatelessWidget {
  const _ProbabilityCard({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  final String label;
  final double value;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              '${value.toStringAsFixed(0)}%',
              style: theme.textTheme.headlineSmall?.copyWith(
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
      ),
    );
  }
}

class _OutcomeCard extends StatelessWidget {
  const _OutcomeCard({
    required this.label,
    required this.outcome,
    required this.color,
  });

  final String label;
  final ProjectionOutcome outcome;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${(outcome.finalNetWorth / 1000).toStringAsFixed(0)}K net worth • Retire at ${outcome.retirementAge}',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
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

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.label, required this.value});

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
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _ComparisonRow extends StatelessWidget {
  const _ComparisonRow({
    required this.label,
    required this.value,
    required this.isPositive,
  });

  final String label;
  final String value;
  final bool isPositive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Row(
            children: [
              Icon(
                isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
                color: isPositive ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 4),
              Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isPositive ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AddScenarioSheet extends ConsumerStatefulWidget {
  const _AddScenarioSheet({required this.twin});

  final FinancialDigitalTwin twin;

  @override
  ConsumerState<_AddScenarioSheet> createState() => _AddScenarioSheetState();
}

class _AddScenarioSheetState extends ConsumerState<_AddScenarioSheet> {
  ScenarioType _selectedType = ScenarioType.custom;
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  bool _isCreating = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _create() async {
    if (_nameController.text.isEmpty) return;

    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isCreating = true);

    try {
      final service = ref.read(digitalTwinServiceProvider);
      await service.createScenario(
        userId: userId,
        name: _nameController.text,
        description: _descController.text,
        type: _selectedType,
        parameters: [],
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
              'Create Scenario',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            DropdownButtonFormField<ScenarioType>(
              value: _selectedType,
              decoration: const InputDecoration(
                labelText: 'Scenario Type',
                border: OutlineInputBorder(),
              ),
              items: ScenarioType.values.map((t) => DropdownMenuItem(
                    value: t,
                    child: Text('${t.icon} ${t.displayName}'),
                  )).toList(),
              onChanged: (v) => setState(() {
                _selectedType = v ?? ScenarioType.custom;
                _nameController.text = v?.displayName ?? '';
                _descController.text = v?.description ?? '';
              }),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
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
              label: 'Create Scenario',
              onPressed: _create,
              isLoading: _isCreating,
            ),
          ],
        ),
      ),
    );
  }
}

class _AddLifeEventSheet extends ConsumerStatefulWidget {
  const _AddLifeEventSheet({required this.twin});

  final FinancialDigitalTwin twin;

  @override
  ConsumerState<_AddLifeEventSheet> createState() => _AddLifeEventSheetState();
}

class _AddLifeEventSheetState extends ConsumerState<_AddLifeEventSheet> {
  ScenarioType _selectedType = ScenarioType.childBirth;
  final _nameController = TextEditingController();
  final _impactController = TextEditingController(text: '0');
  DateTime _projectedDate = DateTime.now().add(const Duration(days: 365));
  double _confidence = 50;
  bool _isCreating = false;

  @override
  void dispose() {
    _nameController.dispose();
    _impactController.dispose();
    super.dispose();
  }

  Future<void> _create() async {
    if (_nameController.text.isEmpty) return;

    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isCreating = true);

    try {
      final service = ref.read(digitalTwinServiceProvider);
      await service.addLifeEvent(
        userId: userId,
        name: _nameController.text,
        type: _selectedType,
        projectedDate: _projectedDate,
        financialImpact: double.tryParse(_impactController.text) ?? 0,
        monthlyImpact: 0,
        durationMonths: 0,
        confidence: _confidence,
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
              'Add Life Event',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            DropdownButtonFormField<ScenarioType>(
              value: _selectedType,
              decoration: const InputDecoration(
                labelText: 'Event Type',
                border: OutlineInputBorder(),
              ),
              items: ScenarioType.values.map((t) => DropdownMenuItem(
                    value: t,
                    child: Text('${t.icon} ${t.displayName}'),
                  )).toList(),
              onChanged: (v) => setState(() {
                _selectedType = v ?? ScenarioType.custom;
                _nameController.text = v?.displayName ?? '';
              }),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Event Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            TextField(
              controller: _impactController,
              decoration: const InputDecoration(
                labelText: 'Financial Impact (\$)',
                border: OutlineInputBorder(),
                helperText: 'Negative for costs, positive for windfalls',
              ),
              keyboardType: const TextInputType.numberWithOptions(signed: true),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            Text('Confidence: ${_confidence.toStringAsFixed(0)}%'),
            Slider(
              value: _confidence,
              min: 0,
              max: 100,
              divisions: 20,
              onChanged: (v) => setState(() => _confidence = v),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            AppButton(
              label: 'Add Event',
              onPressed: _create,
              isLoading: _isCreating,
            ),
          ],
        ),
      ),
    );
  }
}
