import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../data/services/budget_alert_service.dart';

/// Card widget showing budget alert status
class BudgetAlertCard extends StatelessWidget {
  const BudgetAlertCard({
    super.key,
    required this.status,
    this.onTap,
    this.showDailyAllowance = false,
    this.dailyAllowance,
  });

  final BudgetAlertStatus status;
  final VoidCallback? onTap;
  final bool showDailyAllowance;
  final double? dailyAllowance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final alertColor = Color(status.colorValue);
    final remaining = status.limit - status.spent;

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
              // Header row
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: alertColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spacingSm),
                  Expanded(
                    child: Text(
                      status.budgetName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _AlertBadge(alertLevel: status.alertLevel),
                ],
              ),
              const SizedBox(height: AppDimensions.spacingSm),

              // Progress bar
              ClipRRect(
                borderRadius: AppDimensions.borderRadiusSm,
                child: LinearProgressIndicator(
                  value: status.percentUsed.clamp(0.0, 1.0),
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  valueColor: AlwaysStoppedAnimation<Color>(alertColor),
                  minHeight: 8,
                ),
              ),
              const SizedBox(height: AppDimensions.spacingSm),

              // Amount row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$${status.spent.toStringAsFixed(2)} spent',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    '\$${status.limit.toStringAsFixed(2)} limit',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),

              // Remaining or over budget
              const SizedBox(height: AppDimensions.spacingXs),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    status.isOverBudget
                        ? '\$${(-remaining).toStringAsFixed(2)} over budget'
                        : '\$${remaining.toStringAsFixed(2)} remaining',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: status.isOverBudget
                          ? theme.colorScheme.error
                          : theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (showDailyAllowance && dailyAllowance != null && !status.isOverBudget)
                    Text(
                      '\$${dailyAllowance!.toStringAsFixed(2)}/day',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.tertiary,
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

class _AlertBadge extends StatelessWidget {
  const _AlertBadge({required this.alertLevel});

  final AlertLevel alertLevel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color backgroundColor;
    Color textColor;
    String text;
    IconData icon;

    switch (alertLevel) {
      case AlertLevel.safe:
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade700;
        text = 'On Track';
        icon = Icons.check_circle_outline;
      case AlertLevel.caution:
        backgroundColor = Colors.yellow.shade100;
        textColor = Colors.yellow.shade800;
        text = '50%';
        icon = Icons.info_outline;
      case AlertLevel.warning:
        backgroundColor = Colors.orange.shade100;
        textColor = Colors.orange.shade700;
        text = '75%';
        icon = Icons.warning_amber_outlined;
      case AlertLevel.danger:
        backgroundColor = Colors.red.shade100;
        textColor = Colors.red.shade700;
        text = 'Near Limit';
        icon = Icons.error_outline;
      case AlertLevel.exceeded:
        backgroundColor = Colors.purple.shade100;
        textColor = Colors.purple.shade700;
        text = 'Exceeded';
        icon = Icons.dangerous_outlined;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingSm,
        vertical: AppDimensions.spacingXs,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppDimensions.borderRadiusSm,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: textColor),
          const SizedBox(width: 4),
          Text(
            text,
            style: theme.textTheme.labelSmall?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

/// List of budget alert cards
class BudgetAlertsList extends StatelessWidget {
  const BudgetAlertsList({
    super.key,
    required this.alerts,
    this.onAlertTap,
    this.emptyMessage = 'No budget alerts',
  });

  final List<BudgetAlertStatus> alerts;
  final Function(BudgetAlertStatus)? onAlertTap;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (alerts.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingLg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 48,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: AppDimensions.spacingSm),
              Text(
                emptyMessage,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: alerts.length,
      itemBuilder: (context, index) {
        final status = alerts[index];
        return BudgetAlertCard(
          status: status,
          onTap: onAlertTap != null ? () => onAlertTap!(status) : null,
        );
      },
    );
  }
}

/// Compact alert banner for showing at top of screens
class BudgetAlertBanner extends StatelessWidget {
  const BudgetAlertBanner({
    super.key,
    required this.alertCount,
    this.onTap,
  });

  final int alertCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (alertCount == 0) return const SizedBox.shrink();

    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMd,
          vertical: AppDimensions.spacingSm,
        ),
        color: theme.colorScheme.errorContainer,
        child: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              size: 20,
              color: theme.colorScheme.error,
            ),
            const SizedBox(width: AppDimensions.spacingSm),
            Expanded(
              child: Text(
                alertCount == 1
                    ? '1 budget needs attention'
                    : '$alertCount budgets need attention',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onErrorContainer,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: theme.colorScheme.onErrorContainer,
            ),
          ],
        ),
      ),
    );
  }
}
