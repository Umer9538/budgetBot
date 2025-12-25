import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../common/widgets/widgets.dart';

/// Provider for cashflow prediction stream
final cashflowPredictionProvider = StreamProvider.family<CashflowPrediction?, String>((ref, userId) {
  final repository = ref.watch(cashflowRepositoryProvider);
  return repository.watchLatestPrediction(userId);
});

/// Provider for recurring transactions
final recurringTransactionsProvider = StreamProvider.family<List<RecurringTransaction>, String>((ref, userId) {
  final repository = ref.watch(cashflowRepositoryProvider);
  return repository.watchRecurringTransactions(userId);
});

class CashflowScreen extends ConsumerStatefulWidget {
  const CashflowScreen({super.key});

  @override
  ConsumerState<CashflowScreen> createState() => _CashflowScreenState();
}

class _CashflowScreenState extends ConsumerState<CashflowScreen> {
  bool _isRefreshing = false;
  int _selectedDays = 30;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshPrediction();
    });
  }

  Future<void> _refreshPrediction() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    setState(() => _isRefreshing = true);

    try {
      await ref.read(cashflowRepositoryProvider).generatePrediction(
            userId: userId,
            daysAhead: _selectedDays,
          );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
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
        body: Center(child: Text('Please sign in')),
      );
    }

    final predictionAsync = ref.watch(cashflowPredictionProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cashflow Forecast'),
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
              onPressed: _refreshPrediction,
            ),
        ],
      ),
      body: predictionAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _buildErrorState(theme, error),
        data: (prediction) {
          if (prediction == null) {
            return _buildEmptyState(theme);
          }
          return _buildContent(theme, prediction);
        },
      ),
    );
  }

  Widget _buildErrorState(ThemeData theme, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: theme.colorScheme.error),
          const SizedBox(height: 16),
          Text('Error loading prediction', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          AppButton(
            label: 'Retry',
            onPressed: _refreshPrediction,
            variant: AppButtonVariant.secondary,
          ),
        ],
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
                Icons.trending_up,
                size: 64,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            Text(
              'No Cashflow Prediction',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Generate a prediction to see your upcoming cashflow and detect potential shortfalls.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingXl),
            AppButton(
              label: 'Generate Prediction',
              icon: Icons.auto_graph,
              onPressed: _refreshPrediction,
              isLoading: _isRefreshing,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(ThemeData theme, CashflowPrediction prediction) {
    return RefreshIndicator(
      onRefresh: _refreshPrediction,
      child: SingleChildScrollView(
        padding: AppDimensions.screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Card
            _CashflowStatusCard(prediction: prediction),
            const SizedBox(height: AppDimensions.spacingLg),

            // Period Selector
            _buildPeriodSelector(theme),
            const SizedBox(height: AppDimensions.spacingLg),

            // Balance Chart
            _BalanceChart(
              projections: prediction.dailyProjections,
              currentBalance: prediction.currentBalance,
            ),
            const SizedBox(height: AppDimensions.spacingLg),

            // Crisis Alert (if applicable)
            if (prediction.needsAttention)
              _CrisisAlertCard(prediction: prediction),

            // Upcoming Events
            if (prediction.upcomingEvents.isNotEmpty) ...[
              const SizedBox(height: AppDimensions.spacingLg),
              _buildSectionHeader(theme, 'Upcoming Events'),
              const SizedBox(height: AppDimensions.spacingSm),
              _UpcomingEventsList(events: prediction.upcomingEvents.take(10).toList()),
            ],

            // Recommendations
            if (prediction.recommendations.isNotEmpty) ...[
              const SizedBox(height: AppDimensions.spacingLg),
              _buildSectionHeader(theme, 'Recommendations'),
              const SizedBox(height: AppDimensions.spacingSm),
              _RecommendationsList(recommendations: prediction.recommendations),
            ],

            const SizedBox(height: AppDimensions.spacingXl),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodSelector(ThemeData theme) {
    return Row(
      children: [
        Text('Forecast Period:', style: theme.textTheme.titleSmall),
        const SizedBox(width: AppDimensions.spacingMd),
        SegmentedButton<int>(
          segments: const [
            ButtonSegment(value: 7, label: Text('7 Days')),
            ButtonSegment(value: 14, label: Text('14 Days')),
            ButtonSegment(value: 30, label: Text('30 Days')),
          ],
          selected: {_selectedDays},
          onSelectionChanged: (selected) {
            setState(() => _selectedDays = selected.first);
            _refreshPrediction();
          },
        ),
      ],
    );
  }

  Widget _buildSectionHeader(ThemeData theme, String title) {
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class _CashflowStatusCard extends StatelessWidget {
  const _CashflowStatusCard({required this.prediction});

  final CashflowPrediction prediction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = _getStatusColor(prediction.status);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.15),
                    borderRadius: AppDimensions.borderRadiusMd,
                  ),
                  child: Icon(
                    _getStatusIcon(prediction.status),
                    color: statusColor,
                    size: 32,
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        prediction.status.displayName,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        prediction.status.description,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                _ConfidenceBadge(confidence: prediction.confidence),
              ],
            ),
            const Divider(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _BalanceInfo(
                  label: 'Current',
                  amount: prediction.currentBalance,
                  theme: theme,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                _BalanceInfo(
                  label: 'Projected',
                  amount: prediction.predictedBalance,
                  theme: theme,
                  highlight: true,
                ),
                if (prediction.lowestProjectedBalance < prediction.currentBalance) ...[
                  Icon(
                    Icons.arrow_downward,
                    color: theme.colorScheme.error,
                  ),
                  _BalanceInfo(
                    label: 'Lowest',
                    amount: prediction.lowestProjectedBalance,
                    theme: theme,
                    isWarning: prediction.lowestProjectedBalance < 100,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(CashflowStatus status) {
    switch (status) {
      case CashflowStatus.healthy:
        return Colors.green;
      case CashflowStatus.watch:
        return Colors.amber;
      case CashflowStatus.warning:
        return Colors.orange;
      case CashflowStatus.critical:
        return Colors.deepOrange;
      case CashflowStatus.crisis:
        return Colors.red;
    }
  }

  IconData _getStatusIcon(CashflowStatus status) {
    switch (status) {
      case CashflowStatus.healthy:
        return Icons.check_circle;
      case CashflowStatus.watch:
        return Icons.visibility;
      case CashflowStatus.warning:
        return Icons.warning;
      case CashflowStatus.critical:
        return Icons.error;
      case CashflowStatus.crisis:
        return Icons.crisis_alert;
    }
  }
}

class _BalanceInfo extends StatelessWidget {
  const _BalanceInfo({
    required this.label,
    required this.amount,
    required this.theme,
    this.highlight = false,
    this.isWarning = false,
  });

  final String label;
  final double amount;
  final ThemeData theme;
  final bool highlight;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '\$${amount.toStringAsFixed(0)}',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: isWarning
                ? theme.colorScheme.error
                : highlight
                    ? theme.colorScheme.primary
                    : null,
          ),
        ),
      ],
    );
  }
}

class _ConfidenceBadge extends StatelessWidget {
  const _ConfidenceBadge({required this.confidence});

  final PredictionConfidence confidence;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final (min, max) = confidence.percentageRange;
    final avg = (min + max) ~/ 2;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.auto_graph, size: 14, color: theme.colorScheme.primary),
          const SizedBox(width: 4),
          Text(
            '$avg%',
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _CrisisAlertCard extends StatelessWidget {
  const _CrisisAlertCard({required this.prediction});

  final CashflowPrediction prediction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCritical = prediction.status == CashflowStatus.crisis ||
        prediction.status == CashflowStatus.critical;

    return Card(
      color: isCritical
          ? theme.colorScheme.errorContainer
          : theme.colorScheme.tertiaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isCritical ? Icons.crisis_alert : Icons.warning,
                  color: isCritical
                      ? theme.colorScheme.onErrorContainer
                      : theme.colorScheme.onTertiaryContainer,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    isCritical ? 'Crisis Alert' : 'Cashflow Warning',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isCritical
                          ? theme.colorScheme.onErrorContainer
                          : theme.colorScheme.onTertiaryContainer,
                    ),
                  ),
                ),
                if (prediction.daysUntilCrisis != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isCritical
                          ? theme.colorScheme.error
                          : theme.colorScheme.tertiary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${prediction.daysUntilCrisis} days',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              prediction.crisisReason ?? 'Your balance is projected to drop significantly.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isCritical
                    ? theme.colorScheme.onErrorContainer
                    : theme.colorScheme.onTertiaryContainer,
              ),
            ),
            if (prediction.crisisAmount != null) ...[
              const SizedBox(height: 8),
              Text(
                'Projected shortfall: \$${prediction.crisisAmount!.toStringAsFixed(2)}',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isCritical
                      ? theme.colorScheme.onErrorContainer
                      : theme.colorScheme.onTertiaryContainer,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _BalanceChart extends StatelessWidget {
  const _BalanceChart({
    required this.projections,
    required this.currentBalance,
  });

  final List<DailyBalance> projections;
  final double currentBalance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (projections.isEmpty) {
      return const SizedBox.shrink();
    }

    // Find min and max for scaling
    final balances = projections.map((p) => p.balance).toList();
    final minBalance = balances.reduce((a, b) => a < b ? a : b);
    final maxBalance = balances.reduce((a, b) => a > b ? a : b);
    final range = maxBalance - minBalance;
    final padding = range * 0.1;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Balance Projection',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            SizedBox(
              height: 150,
              child: CustomPaint(
                size: const Size(double.infinity, 150),
                painter: _BalanceChartPainter(
                  projections: projections,
                  minBalance: minBalance - padding,
                  maxBalance: maxBalance + padding,
                  lineColor: theme.colorScheme.primary,
                  dangerColor: theme.colorScheme.error,
                  gridColor: theme.colorScheme.outlineVariant,
                ),
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  '${projections.length} days',
                  style: theme.textTheme.labelSmall?.copyWith(
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

class _BalanceChartPainter extends CustomPainter {
  _BalanceChartPainter({
    required this.projections,
    required this.minBalance,
    required this.maxBalance,
    required this.lineColor,
    required this.dangerColor,
    required this.gridColor,
  });

  final List<DailyBalance> projections;
  final double minBalance;
  final double maxBalance;
  final Color lineColor;
  final Color dangerColor;
  final Color gridColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (projections.isEmpty) return;

    final range = maxBalance - minBalance;
    if (range == 0) return;

    // Draw grid
    final gridPaint = Paint()
      ..color = gridColor
      ..strokeWidth = 0.5;

    for (int i = 0; i <= 4; i++) {
      final y = size.height * i / 4;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Draw zero line if visible
    if (minBalance < 0 && maxBalance > 0) {
      final zeroY = size.height - ((0 - minBalance) / range * size.height);
      final zeroPaint = Paint()
        ..color = dangerColor.withValues(alpha: 0.5)
        ..strokeWidth = 1;
      canvas.drawLine(Offset(0, zeroY), Offset(size.width, zeroY), zeroPaint);
    }

    // Draw balance line
    final linePaint = Paint()
      ..color = lineColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final dangerPaint = Paint()
      ..color = dangerColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final dangerPath = Path();
    bool inDanger = false;

    for (int i = 0; i < projections.length; i++) {
      final x = size.width * i / (projections.length - 1);
      final y = size.height - ((projections[i].balance - minBalance) / range * size.height);

      final isDanger = projections[i].balance < 0;

      if (i == 0) {
        if (isDanger) {
          dangerPath.moveTo(x, y);
          inDanger = true;
        } else {
          path.moveTo(x, y);
        }
      } else {
        if (isDanger && !inDanger) {
          // Transition to danger
          path.lineTo(x, y);
          dangerPath.moveTo(x, y);
          inDanger = true;
        } else if (!isDanger && inDanger) {
          // Transition out of danger
          dangerPath.lineTo(x, y);
          path.moveTo(x, y);
          inDanger = false;
        } else if (isDanger) {
          dangerPath.lineTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
    }

    canvas.drawPath(path, linePaint);
    canvas.drawPath(dangerPath, dangerPaint);

    // Draw dots at start and end
    final dotPaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.fill;

    final startY = size.height - ((projections.first.balance - minBalance) / range * size.height);
    final endY = size.height - ((projections.last.balance - minBalance) / range * size.height);

    canvas.drawCircle(Offset(0, startY), 4, dotPaint);
    canvas.drawCircle(Offset(size.width, endY), 4,
        projections.last.balance < 0 ? (Paint()..color = dangerColor) : dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _UpcomingEventsList extends StatelessWidget {
  const _UpcomingEventsList({required this.events});

  final List<CashflowEvent> events;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: events.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final event = events[index];
          return ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: event.isIncome
                    ? Colors.green.withValues(alpha: 0.15)
                    : Colors.red.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                event.isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                color: event.isIncome ? Colors.green : Colors.red,
                size: 20,
              ),
            ),
            title: Text(
              event.name,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              '${_formatDate(event.date)}${event.isRecurring ? ' • ${event.recurringPattern}' : ''}',
              style: theme.textTheme.bodySmall,
            ),
            trailing: Text(
              event.formattedAmount,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: event.isIncome ? Colors.green : Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = date.difference(DateTime(now.year, now.month, now.day)).inDays;

    if (diff == 0) return 'Today';
    if (diff == 1) return 'Tomorrow';
    if (diff < 7) return 'In $diff days';

    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                   'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[date.month - 1]} ${date.day}';
  }
}

class _RecommendationsList extends StatelessWidget {
  const _RecommendationsList({required this.recommendations});

  final List<String> recommendations;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: recommendations.map((rec) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    size: 20,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      rec,
                      style: theme.textTheme.bodyMedium,
                    ),
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
