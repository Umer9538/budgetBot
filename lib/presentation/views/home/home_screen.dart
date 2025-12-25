import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../common/widgets/glass_container.dart';
import '../../common/widgets/neo_button.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authState = ref.watch(authViewModelProvider);
    final homeState = ref.watch(homeViewModelProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${authState.user?.displayName?.split(' ').first ?? 'there'}!',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              _getGreeting(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.white70,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: GlassContainer(
              borderRadius: 12,
              padding: const EdgeInsets.all(8),
              blur: 5,
              color: Colors.white.withValues(alpha: 0.1),
              child: const Icon(Icons.notifications_outlined, size: 24, color: Colors.white),
              onTap: () {
                context.push(AppRoutes.notifications);
              },
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.backgroundDark,
              Color(0xFF1E1B4B), // Deep Indigo
            ],
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(homeViewModelProvider.notifier).refresh();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(20, 120, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Balance Card
                _BalanceCard(homeState: homeState),
                const SizedBox(height: 24),

                // Quick Actions
                _QuickActions(),
                const SizedBox(height: 24),

                // Budget Alerts
                if (homeState.alertBudgets.isNotEmpty) ...[
                  _BudgetAlerts(budgets: homeState.alertBudgets),
                  const SizedBox(height: 24),
                ],

                // Recent Transactions Section
                const _RecentTransactionsSection(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: NeoButton(
        text: 'Add',
        icon: Icons.add,
        width: 120,
        onPressed: () => context.push(AppRoutes.addTransaction),
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({required this.homeState});

  final HomeState homeState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GlassContainer(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      borderRadius: 32,
      color: AppColors.primary.withValues(alpha: 0.15),
      borderColor: AppColors.primary.withValues(alpha: 0.3),
      child: homeState.isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.white),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Balance',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$${homeState.netAmount.abs().toStringAsFixed(2)}',
                          style: theme.textTheme.displaySmall?.copyWith(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: homeState.netAmount >= 0 
                            ? AppColors.success.withValues(alpha: 0.2)
                            : AppColors.error.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: homeState.netAmount >= 0 
                              ? AppColors.success.withValues(alpha: 0.5)
                              : AppColors.error.withValues(alpha: 0.5),
                        ),
                      ),
                      child: Text(
                        homeState.netAmount >= 0 ? '+2.4%' : '-1.2%', // Mock data for now
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: homeState.netAmount >= 0 ? AppColors.success : AppColors.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: _BalanceItem(
                        label: 'Income',
                        amount: homeState.monthlyIncome,
                        icon: Icons.arrow_downward_rounded,
                        color: AppColors.success,
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 40,
                      color: Colors.white10,
                    ),
                    Expanded(
                      child: _BalanceItem(
                        label: 'Expenses',
                        amount: homeState.monthlyExpenses,
                        icon: Icons.arrow_upward_rounded,
                        color: AppColors.error,
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

class _BalanceItem extends StatelessWidget {
  const _BalanceItem({
    required this.label,
    required this.amount,
    required this.icon,
    required this.color,
  });

  final String label;
  final double amount;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 16,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 12,
              ),
            ),
            Text(
              '\$${amount.toStringAsFixed(0)}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _QuickActionButton(
          icon: Icons.add_circle_outline,
          label: 'Add',
          onTap: () => context.push(AppRoutes.addTransaction),
        ),
        _QuickActionButton(
          icon: Icons.pie_chart_outline,
          label: 'Budgets',
          onTap: () => context.go(AppRoutes.budgets),
        ),
        _QuickActionButton(
          icon: Icons.receipt_long_outlined,
          label: 'History',
          onTap: () => context.go(AppRoutes.transactions),
        ),
        _QuickActionButton(
          icon: Icons.auto_graph_outlined,
          label: 'Insights',
          onTap: () => context.go(AppRoutes.insights),
        ),
      ],
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlassContainer(
          width: 64,
          height: 64,
          borderRadius: 20,
          color: AppColors.surfaceDark.withValues(alpha: 0.5),
          onTap: onTap,
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _BudgetAlerts extends StatelessWidget {
  const _BudgetAlerts({required this.budgets});

  final List<BudgetModel> budgets;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Budget Alerts',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...budgets.take(3).map((budget) {
          final isExceeded = budget.isExceeded;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GlassContainer(
              padding: const EdgeInsets.all(16),
              borderRadius: 20,
              color: isExceeded
                  ? AppColors.error.withValues(alpha: 0.1)
                  : AppColors.warning.withValues(alpha: 0.1),
              borderColor: isExceeded
                  ? AppColors.error.withValues(alpha: 0.3)
                  : AppColors.warning.withValues(alpha: 0.3),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isExceeded
                          ? AppColors.error.withValues(alpha: 0.2)
                          : AppColors.warning.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isExceeded ? Icons.warning_rounded : Icons.info_outline_rounded,
                      color: isExceeded ? AppColors.error : AppColors.warning,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          budget.name,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          value: budget.percentUsedClamped / 100,
                          backgroundColor: Colors.white10,
                          color: isExceeded ? AppColors.error : AppColors.warning,
                          borderRadius: BorderRadius.circular(4),
                          minHeight: 4,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${budget.percentUsedClamped.toInt()}%',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: isExceeded ? AppColors.error : AppColors.warning,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _RecentTransactionsSection extends ConsumerWidget {
  const _RecentTransactionsSection();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final transactionsState = ref.watch(transactionsViewModelProvider);
    final transactions = transactionsState.transactions.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Transactions',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () => context.go(AppRoutes.transactions),
              child: Text(
                'See All',
                style: TextStyle(color: AppColors.primaryLight),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (transactionsState.isLoading)
          const Center(child: CircularProgressIndicator(color: Colors.white))
        else if (transactions.isEmpty)
          GlassContainer(
            padding: const EdgeInsets.all(32),
            borderRadius: 24,
            color: AppColors.surfaceDark.withValues(alpha: 0.5),
            child: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.receipt_long_outlined,
                    size: 48,
                    color: Colors.white38,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No transactions yet',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          ...transactions.map((transaction) {
            final isExpense = transaction.type == TransactionType.expense;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GlassContainer(
                padding: const EdgeInsets.all(16),
                borderRadius: 20,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: transaction.category.color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        transaction.category.iconData,
                        color: transaction.category.color,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transaction.merchantName,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            transaction.category.displayName,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${isExpense ? '-' : '+'}\$${transaction.amount.toStringAsFixed(2)}',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: isExpense ? Colors.white : AppColors.success,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
      ],
    );
  }
}
