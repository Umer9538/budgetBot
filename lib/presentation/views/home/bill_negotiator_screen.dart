import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../data/models/bill_negotiator_model.dart';
import '../../../data/services/bill_negotiator_service.dart';
import '../../common/widgets/widgets.dart';

class BillNegotiatorScreen extends ConsumerStatefulWidget {
  const BillNegotiatorScreen({super.key});

  @override
  ConsumerState<BillNegotiatorScreen> createState() => _BillNegotiatorScreenState();
}

class _BillNegotiatorScreenState extends ConsumerState<BillNegotiatorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Negotiator'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'My Bills'),
            Tab(text: 'Negotiate'),
            Tab(text: 'Savings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _BillsTab(userId: userId),
          _NegotiateTab(userId: userId),
          _SavingsTab(userId: userId),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddBillDialog(context),
        icon: const Icon(Icons.add),
        label: const Text('Add Bill'),
      ),
    );
  }

  void _showAddBillDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const _AddBillSheet(),
    );
  }
}

class _BillsTab extends ConsumerWidget {
  const _BillsTab({required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final billsAsync = ref.watch(trackedBillsProvider(userId));

    return billsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (bills) {
        if (bills.isEmpty) {
          return _buildEmptyState(context, ref, theme);
        }

        final totalPotentialSavings = bills.fold<double>(
            0, (sum, b) => sum + b.potentialSavings);

        return ListView(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          children: [
            // Savings Summary Card
            Card(
              color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.spacingMd),
                child: Row(
                  children: [
                    Icon(
                      Icons.savings,
                      size: 40,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Potential Monthly Savings',
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          '\$${totalPotentialSavings.toStringAsFixed(2)}',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),

            // Priority Bills Section
            ..._buildPrioritySection(context, bills, BillPriority.high),
            ..._buildPrioritySection(context, bills, BillPriority.medium),
            ..._buildPrioritySection(context, bills, BillPriority.low),
          ],
        );
      },
    );
  }

  List<Widget> _buildPrioritySection(
    BuildContext context,
    List<TrackedBill> bills,
    BillPriority priority,
  ) {
    final filtered = bills.where((b) => b.negotiationPriority == priority).toList();
    if (filtered.isEmpty) return [];

    final theme = Theme.of(context);

    return [
      Padding(
        padding: const EdgeInsets.only(top: AppDimensions.spacingMd, bottom: AppDimensions.spacingSm),
        child: Row(
          children: [
            Text(
              priority.icon,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 8),
            Text(
              priority.displayName,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      ...filtered.map((bill) => _BillCard(bill: bill)),
    ];
  }

  Widget _buildEmptyState(BuildContext context, WidgetRef ref, ThemeData theme) {
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
                Icons.receipt_long,
                size: 64,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            Text(
              'Start Saving on Bills',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Add your recurring bills and let AI help you negotiate better rates.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingXl),
            AppButton(
              label: 'Scan Transactions',
              icon: Icons.auto_awesome,
              onPressed: () async {
                final service = ref.read(billNegotiatorServiceProvider);
                final suggested = await service.analyzeBillsFromTransactions(userId);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Found ${suggested.length} potential bills')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BillCard extends StatelessWidget {
  const _BillCard({required this.bill});

  final TrackedBill bill;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: InkWell(
        onTap: () => _showBillDetails(context),
        borderRadius: AppDimensions.borderRadiusMd,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          child: Row(
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
                    bill.category.icon,
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
                      bill.name,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bill.provider,
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
                    '\$${bill.currentAmount.toStringAsFixed(2)}/mo',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (bill.potentialSavings > 0)
                    Text(
                      'Save \$${bill.potentialSavings.toStringAsFixed(0)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBillDetails(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _BillDetailsSheet(bill: bill),
    );
  }
}

class _NegotiateTab extends ConsumerWidget {
  const _NegotiateTab({required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final billsAsync = ref.watch(trackedBillsProvider(userId));

    return billsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (bills) {
        final negotiableBills = bills.where((b) => b.potentialSavings > 10).toList();

        if (negotiableBills.isEmpty) {
          return Center(
            child: Padding(
              padding: AppDimensions.screenPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: AppDimensions.spacingMd),
                  Text(
                    'All caught up!',
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'No bills need negotiation right now.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          children: [
            Text(
              'Ready to Negotiate',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'These bills have the best savings potential.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            ...negotiableBills.map((bill) => _NegotiationCard(
                  bill: bill,
                  userId: userId,
                )),
          ],
        );
      },
    );
  }
}

class _NegotiationCard extends ConsumerStatefulWidget {
  const _NegotiationCard({required this.bill, required this.userId});

  final TrackedBill bill;
  final String userId;

  @override
  ConsumerState<_NegotiationCard> createState() => _NegotiationCardState();
}

class _NegotiationCardState extends ConsumerState<_NegotiationCard> {
  bool _isStarting = false;

  Future<void> _startNegotiation() async {
    setState(() => _isStarting = true);

    try {
      final service = ref.read(billNegotiatorServiceProvider);
      final session = await service.startNegotiation(
        userId: widget.userId,
        billId: widget.bill.id,
      );

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _NegotiationSessionScreen(
              session: session,
              bill: widget.bill,
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
      if (mounted) setState(() => _isStarting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingMd),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.bill.category.icon,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.bill.name,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Currently: \$${widget.bill.currentAmount.toStringAsFixed(2)}/mo',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Save \$${widget.bill.potentialSavings.toStringAsFixed(0)}',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [
                _InfoChip(
                  label: widget.bill.difficulty.displayName,
                  icon: Icons.speed,
                ),
                const SizedBox(width: 8),
                _InfoChip(
                  label: '${widget.bill.loyaltyMonths}mo customer',
                  icon: Icons.loyalty,
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            AppButton(
              label: 'Start Negotiation',
              icon: Icons.phone,
              onPressed: _startNegotiation,
              isLoading: _isStarting,
            ),
          ],
        ),
      ),
    );
  }
}

class _SavingsTab extends ConsumerWidget {
  const _SavingsTab({required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final statsAsync = ref.watch(negotiatorStatsProvider(userId));

    return statsAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('Error: $e')),
      data: (stats) {
        return ListView(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          children: [
            // Total Savings Card
            Card(
              color: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.spacingLg),
                child: Column(
                  children: [
                    const Icon(Icons.savings, size: 48),
                    const SizedBox(height: 8),
                    Text(
                      '\$${stats.totalSavings.toStringAsFixed(2)}',
                      style: theme.textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text('Total Saved'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),

            // Stats Row
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    label: 'Negotiations',
                    value: stats.totalNegotiations.toString(),
                    icon: Icons.phone,
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingSm),
                Expanded(
                  child: _StatCard(
                    label: 'Success Rate',
                    value: '${stats.successRate.toStringAsFixed(0)}%',
                    icon: Icons.check_circle,
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingSm),
                Expanded(
                  child: _StatCard(
                    label: 'Avg Savings',
                    value: '\$${stats.averageSavingsPerBill.toStringAsFixed(0)}',
                    icon: Icons.trending_up,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacingLg),

            // Recent Wins
            if (stats.recentWins.isNotEmpty) ...[
              Text(
                'Recent Wins',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppDimensions.spacingSm),
              ...stats.recentWins.map((win) => _WinCard(win: win)),
            ],
          ],
        );
      },
    );
  }
}

class _WinCard extends StatelessWidget {
  const _WinCard({required this.win});

  final NegotiationWin win;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.emoji_events, color: Colors.green),
        ),
        title: Text(win.billName),
        subtitle: Text(win.provider),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '+\$${win.savings.toStringAsFixed(0)}',
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${win.date.month}/${win.date.day}',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Widgets

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 4),
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

class _StatCard extends StatelessWidget {
  const _StatCard({
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

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(height: 4),
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(
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
        ),
      ),
    );
  }
}

class _AddBillSheet extends ConsumerStatefulWidget {
  const _AddBillSheet();

  @override
  ConsumerState<_AddBillSheet> createState() => _AddBillSheetState();
}

class _AddBillSheetState extends ConsumerState<_AddBillSheet> {
  final _nameController = TextEditingController();
  final _providerController = TextEditingController();
  final _amountController = TextEditingController();
  BillCategory _selectedCategory = BillCategory.internet;
  bool _isAdding = false;

  @override
  void dispose() {
    _nameController.dispose();
    _providerController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _addBill() async {
    if (_nameController.text.isEmpty || _amountController.text.isEmpty) return;

    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isAdding = true);

    try {
      final service = ref.read(billNegotiatorServiceProvider);
      await service.addBill(
        userId: userId,
        name: _nameController.text,
        provider: _providerController.text.isEmpty
            ? _nameController.text
            : _providerController.text,
        category: _selectedCategory,
        currentAmount: double.parse(_amountController.text),
      );
      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isAdding = false);
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
              'Add Bill',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Bill Name',
                border: OutlineInputBorder(),
                hintText: 'e.g., Internet Service',
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            TextField(
              controller: _providerController,
              decoration: const InputDecoration(
                labelText: 'Provider (optional)',
                border: OutlineInputBorder(),
                hintText: 'e.g., Comcast',
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            DropdownButtonFormField<BillCategory>(
              value: _selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
              items: BillCategory.values.map((c) => DropdownMenuItem(
                    value: c,
                    child: Text('${c.icon} ${c.displayName}'),
                  )).toList(),
              onChanged: (v) => setState(() => _selectedCategory = v ?? BillCategory.other),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: 'Monthly Amount',
                border: OutlineInputBorder(),
                prefixText: '\$ ',
              ),
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            AppButton(
              label: 'Add Bill',
              onPressed: _addBill,
              isLoading: _isAdding,
            ),
          ],
        ),
      ),
    );
  }
}

class _BillDetailsSheet extends StatelessWidget {
  const _BillDetailsSheet({required this.bill});

  final TrackedBill bill;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacingLg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                bill.category.icon,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bill.name,
                      style: theme.textTheme.titleLarge,
                    ),
                    Text(
                      bill.provider,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 32),
          _DetailRow(label: 'Current Amount', value: '\$${bill.currentAmount.toStringAsFixed(2)}/mo'),
          _DetailRow(label: 'Market Average', value: '\$${bill.marketAverage.toStringAsFixed(2)}/mo'),
          _DetailRow(
            label: 'Potential Savings',
            value: '\$${bill.potentialSavings.toStringAsFixed(2)}/mo',
            valueColor: Colors.green,
          ),
          _DetailRow(label: 'Customer Since', value: '${bill.loyaltyMonths} months'),
          _DetailRow(label: 'Difficulty', value: bill.difficulty.displayName),
          if (bill.contractEndDate != null)
            _DetailRow(
              label: 'Contract Ends',
              value: '${bill.contractEndDate!.month}/${bill.contractEndDate!.year}',
            ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          Text(
            value,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _NegotiationSessionScreen extends ConsumerStatefulWidget {
  const _NegotiationSessionScreen({
    required this.session,
    required this.bill,
  });

  final NegotiationSession session;
  final TrackedBill bill;

  @override
  ConsumerState<_NegotiationSessionScreen> createState() =>
      _NegotiationSessionScreenState();
}

class _NegotiationSessionScreenState
    extends ConsumerState<_NegotiationSessionScreen> {
  int _currentStep = 0;
  final _newAmountController = TextEditingController();
  bool _isCompleting = false;

  Future<void> _completeNegotiation(NegotiationStatus status) async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isCompleting = true);

    try {
      final service = ref.read(billNegotiatorServiceProvider);
      await service.completeNegotiation(
        userId: userId,
        sessionId: widget.session.id,
        status: status,
        negotiatedAmount: double.tryParse(_newAmountController.text),
      );
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(status == NegotiationStatus.successful
                ? 'Congratulations on your savings!'
                : 'Better luck next time!'),
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
      if (mounted) setState(() => _isCompleting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final script = widget.session.script;
    final steps = widget.session.steps;

    return Scaffold(
      appBar: AppBar(
        title: Text('Negotiate: ${widget.bill.name}'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        children: [
          // Script Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.spacingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Opening',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                      borderRadius: AppDimensions.borderRadiusSm,
                    ),
                    child: Text(
                      script.opening,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMd),

          // Steps
          Text(
            'Follow These Steps',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          ...steps.asMap().entries.map((entry) {
            final index = entry.key;
            final step = entry.value;
            final isActive = index == _currentStep;
            final isComplete = index < _currentStep;

            return Card(
              margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
              color: isActive
                  ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
                  : null,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: isComplete
                      ? Colors.green
                      : isActive
                          ? theme.colorScheme.primary
                          : theme.colorScheme.surfaceContainerHighest,
                  child: isComplete
                      ? const Icon(Icons.check, color: Colors.white)
                      : Text('${index + 1}'),
                ),
                title: Text(step.instruction),
                subtitle: isActive ? Text(step.suggestedReply) : null,
                trailing: isActive
                    ? IconButton(
                        icon: const Icon(Icons.check),
                        onPressed: () => setState(() => _currentStep++),
                      )
                    : null,
              ),
            );
          }),

          const SizedBox(height: AppDimensions.spacingLg),

          // Result Entry
          if (_currentStep >= steps.length) ...[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.spacingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What was the result?',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacingMd),
                    TextField(
                      controller: _newAmountController,
                      decoration: const InputDecoration(
                        labelText: 'New Monthly Rate (if negotiated)',
                        border: OutlineInputBorder(),
                        prefixText: '\$ ',
                      ),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    ),
                    const SizedBox(height: AppDimensions.spacingMd),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () =>
                                _completeNegotiation(NegotiationStatus.unsuccessful),
                            icon: const Icon(Icons.close),
                            label: const Text('No Luck'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () =>
                                _completeNegotiation(NegotiationStatus.successful),
                            icon: const Icon(Icons.check),
                            label: const Text('Got a Deal!'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
