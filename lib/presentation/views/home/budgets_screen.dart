import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../common/widgets/widgets.dart';
import '../../viewmodels/viewmodels.dart';

class BudgetsScreen extends ConsumerWidget {
  const BudgetsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(budgetsViewModelProvider);
    final viewModel = ref.read(budgetsViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Budgets'),
      ),
      body: RefreshIndicator(
        onRefresh: () => viewModel.refresh(),
        child: _buildContent(context, theme, state, viewModel),
      ),
      floatingActionButton: AppFab(
        icon: Icons.add,
        tooltip: 'Create Budget',
        onPressed: () => context.push(AppRoutes.addBudget),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ThemeData theme,
    BudgetsState state,
    BudgetsViewModel viewModel,
  ) {
    if (state.isLoading && state.budgets.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null && state.budgets.isEmpty) {
      return Center(child: Text('Error: ${state.error}'));
    }

    if (state.budgets.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pie_chart_outline,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            Text(
              'No budgets yet',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Create a budget to track your spending',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            AppButton(
              label: 'Create Budget',
              onPressed: () => context.push(AppRoutes.addBudget),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: AppDimensions.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Summary Card
          if (state.summary != null)
            _BudgetSummaryCard(summary: state.summary!),
          const SizedBox(height: AppDimensions.spacingLg),

          Text(
            'Your Budgets',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: AppDimensions.spacingSm),

          ...state.budgets.map((budget) => _BudgetCard(
                budget: budget,
                onDelete: () => viewModel.deleteBudget(budget.id),
              )),
        ],
      ),
    );
  }
}

class _BudgetSummaryCard extends StatelessWidget {
  const _BudgetSummaryCard({required this.summary});

  final BudgetSummary summary;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(AppDimensions.spacingLg),
      decoration: BoxDecoration(
        color: isDark
            ? theme.colorScheme.surfaceContainerHighest
            : theme.colorScheme.primaryContainer,
        borderRadius: AppDimensions.borderRadiusLg,
        border: isDark
            ? Border.all(
                color: theme.colorScheme.primary.withOpacity(0.3),
                width: 1,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly Overview',
            style: theme.textTheme.titleSmall?.copyWith(
              color: isDark
                  ? theme.colorScheme.onSurface
                  : theme.colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingMd),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${summary.remaining.toStringAsFixed(2)}',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? theme.colorScheme.onSurface
                          : theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    'Remaining',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? theme.colorScheme.onSurfaceVariant
                          : theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${(summary.percentUsed * 100).toInt()}%',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    'Used',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? theme.colorScheme.onSurfaceVariant
                          : theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingMd),
          ClipRRect(
            borderRadius: AppDimensions.borderRadiusSm,
            child: LinearProgressIndicator(
              value: summary.percentUsed.clamp(0.0, 1.0),
              backgroundColor: isDark
                  ? theme.colorScheme.outline.withOpacity(0.3)
                  : theme.colorScheme.onPrimaryContainer.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation(
                summary.percentUsed > 0.9
                    ? theme.colorScheme.error
                    : theme.colorScheme.primary,
              ),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          Text(
            '\$${summary.totalSpent.toStringAsFixed(2)} of \$${summary.totalBudget.toStringAsFixed(2)}',
            style: theme.textTheme.bodySmall?.copyWith(
              color: isDark
                  ? theme.colorScheme.onSurfaceVariant
                  : theme.colorScheme.onPrimaryContainer.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _BudgetCard extends StatelessWidget {
  const _BudgetCard({
    required this.budget,
    required this.onDelete,
  });

  final BudgetModel budget;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percentUsed = budget.percentUsed;

    Color progressColor;
    if (budget.isExceeded) {
      progressColor = theme.colorScheme.error;
    } else if (budget.isApproaching) {
      progressColor = AppColors.warning;
    } else {
      progressColor = AppColors.success;
    }

    return Dismissible(
      key: Key(budget.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppDimensions.spacingMd),
        margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
        decoration: BoxDecoration(
          color: theme.colorScheme.error,
          borderRadius: AppDimensions.borderRadiusMd,
        ),
        child: Icon(
          Icons.delete,
          color: theme.colorScheme.onError,
        ),
      ),
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete Budget'),
            content: const Text('Are you sure you want to delete this budget?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Delete'),
              ),
            ],
          ),
        );
      },
      onDismissed: (_) => onDelete(),
      child: Card(
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
                      color: budget.category.color.withOpacity(0.15),
                      borderRadius: AppDimensions.borderRadiusSm,
                    ),
                    child: Icon(
                      budget.category.iconData,
                      color: budget.category.color,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spacingSm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          budget.name,
                          style: theme.textTheme.titleSmall,
                        ),
                        Text(
                          budget.category.displayName,
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
                        budget.formattedRemaining,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: budget.isExceeded
                              ? theme.colorScheme.error
                              : null,
                        ),
                      ),
                      Text(
                        'left',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.spacingMd),
              ClipRRect(
                borderRadius: AppDimensions.borderRadiusSm,
                child: LinearProgressIndicator(
                  value: percentUsed.clamp(0.0, 1.0),
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  valueColor: AlwaysStoppedAnimation(progressColor),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: AppDimensions.spacingXs),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${budget.formattedSpent} spent',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    '${budget.percentUsedClamped}%',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: progressColor,
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
}
