import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../common/widgets/widgets.dart';

/// Provider for family stream
final familyStreamProvider =
    FutureProvider.family<FamilyGroup?, String>((ref, userId) {
  final service = ref.watch(familyServiceProvider);
  return service.getFamilyForUser(userId);
});

/// Provider for family activities
final familyActivitiesProvider =
    StreamProvider.family<List<FamilyActivity>, String>((ref, familyId) {
  final service = ref.watch(familyServiceProvider);
  return service.watchActivities(familyId);
});

class FamilyHubScreen extends ConsumerStatefulWidget {
  const FamilyHubScreen({super.key});

  @override
  ConsumerState<FamilyHubScreen> createState() => _FamilyHubScreenState();
}

class _FamilyHubScreenState extends ConsumerState<FamilyHubScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isCreating = false;

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

  Future<void> _createFamily() async {
    final userId = ref.read(currentUserIdProvider);
    if (userId == null) return;

    final nameController = TextEditingController();

    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Family'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Family Name',
            hintText: 'e.g., The Smiths',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, nameController.text),
            child: const Text('Create'),
          ),
        ],
      ),
    );

    if (result == null || result.isEmpty) return;

    setState(() => _isCreating = true);

    try {
      final service = ref.read(familyServiceProvider);
      await service.createFamily(
        name: result,
        adminUserId: userId,
        adminDisplayName: 'You', // Would come from user profile
      );

      ref.invalidate(familyStreamProvider(userId));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Family created!')),
        );
      }
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
    final theme = Theme.of(context);
    final userId = ref.watch(currentUserIdProvider);

    if (userId == null) {
      return const Scaffold(
        body: Center(child: Text('Please sign in')),
      );
    }

    final familyAsync = ref.watch(familyStreamProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Hub'),
      ),
      body: familyAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (family) {
          if (family == null) return _buildNoFamilyState(theme);
          return _buildFamilyContent(family, theme);
        },
      ),
    );
  }

  Widget _buildNoFamilyState(ThemeData theme) {
    return Center(
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.family_restroom,
                size: 64,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            Text(
              'Family Financial Mesh',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Manage finances together. Set shared budgets, family goals, and allowances for kids.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingXl),
            AppButton(
              label: 'Create Family',
              icon: Icons.add,
              onPressed: _createFamily,
              isLoading: _isCreating,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            OutlinedButton.icon(
              onPressed: () {
                // TODO: Join family with invitation code
              },
              icon: const Icon(Icons.group_add),
              label: const Text('Join Family'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFamilyContent(FamilyGroup family, ThemeData theme) {
    return Column(
      children: [
        // Family header
        Container(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: theme.colorScheme.primary,
                child: Text(
                  family.name.substring(0, 1).toUpperCase(),
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              const SizedBox(width: AppDimensions.spacingMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      family.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${family.members.length} members',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  // TODO: Family settings
                },
              ),
            ],
          ),
        ),
        // Tab bar
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.dashboard), text: 'Overview'),
            Tab(icon: Icon(Icons.account_balance_wallet), text: 'Budgets'),
            Tab(icon: Icon(Icons.flag), text: 'Goals'),
            Tab(icon: Icon(Icons.people), text: 'Members'),
          ],
        ),
        // Tab content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _OverviewTab(family: family),
              _BudgetsTab(family: family),
              _GoalsTab(family: family),
              _MembersTab(family: family),
            ],
          ),
        ),
      ],
    );
  }
}

class _OverviewTab extends ConsumerWidget {
  const _OverviewTab({required this.family});

  final FamilyGroup family;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final activitiesAsync = ref.watch(familyActivitiesProvider(family.id));

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Quick stats
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  label: 'Shared Budgets',
                  value: '${family.sharedBudgets.length}',
                  icon: Icons.account_balance_wallet,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingSm),
              Expanded(
                child: _StatCard(
                  label: 'Active Goals',
                  value: '${family.goals.where((g) => g.status == FamilyGoalStatus.active).length}',
                  icon: Icons.flag,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingSm),
              Expanded(
                child: _StatCard(
                  label: 'Allowances',
                  value: '${family.allowances.length}',
                  icon: Icons.card_giftcard,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingLg),

          // Activity Feed
          Text(
            'Recent Activity',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          activitiesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text('Error: $e'),
            data: (activities) {
              if (activities.isEmpty) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimensions.spacingLg),
                    child: Center(
                      child: Text(
                        'No recent activity',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Column(
                children: activities.take(10).map((activity) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
                    child: ListTile(
                      leading: Text(
                        activity.type.icon,
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(activity.description),
                      subtitle: Text(
                        _formatTimeAgo(activity.timestamp),
                        style: theme.textTheme.bodySmall,
                      ),
                      trailing: activity.amount != null
                          ? Text(
                              '\$${activity.amount!.toStringAsFixed(2)}',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : null,
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  String _formatTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    return '${dateTime.day}/${dateTime.month}';
  }
}

class _BudgetsTab extends StatelessWidget {
  const _BudgetsTab({required this.family});

  final FamilyGroup family;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (family.sharedBudgets.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            Text(
              'No shared budgets yet',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            FilledButton.icon(
              onPressed: () {
                // TODO: Create shared budget
              },
              icon: const Icon(Icons.add),
              label: const Text('Create Shared Budget'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      itemCount: family.sharedBudgets.length,
      itemBuilder: (context, index) {
        final budget = family.sharedBudgets[index];
        final progress = budget.limit > 0 ? budget.spent / budget.limit : 0.0;
        final isOverBudget = progress > 1;

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
                      budget.category.icon,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: AppDimensions.spacingSm),
                    Expanded(
                      child: Text(
                        budget.name,
                        style: theme.textTheme.titleMedium?.copyWith(
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
                        color: isOverBudget
                            ? Colors.red.withValues(alpha: 0.1)
                            : Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${(progress * 100).toStringAsFixed(0)}%',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isOverBudget ? Colors.red : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacingMd),
                LinearProgressIndicator(
                  value: progress.clamp(0, 1),
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  color: isOverBudget ? Colors.red : theme.colorScheme.primary,
                ),
                const SizedBox(height: AppDimensions.spacingSm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${budget.spent.toStringAsFixed(2)} spent',
                      style: theme.textTheme.bodySmall,
                    ),
                    Text(
                      '\$${budget.limit.toStringAsFixed(2)} limit',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _GoalsTab extends StatelessWidget {
  const _GoalsTab({required this.family});

  final FamilyGroup family;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (family.goals.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.flag_outlined,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            Text(
              'No family goals yet',
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            FilledButton.icon(
              onPressed: () {
                // TODO: Create family goal
              },
              icon: const Icon(Icons.add),
              label: const Text('Create Goal'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      itemCount: family.goals.length,
      itemBuilder: (context, index) {
        final goal = family.goals[index];
        final progress = goal.targetAmount > 0
            ? goal.currentAmount / goal.targetAmount
            : 0.0;

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
                      goal.status.icon,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(width: AppDimensions.spacingSm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            goal.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            goal.description,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacingMd),
                LinearProgressIndicator(
                  value: progress.clamp(0, 1),
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  color: goal.status == FamilyGoalStatus.completed
                      ? Colors.green
                      : theme.colorScheme.primary,
                ),
                const SizedBox(height: AppDimensions.spacingSm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${goal.currentAmount.toStringAsFixed(0)} / \$${goal.targetAmount.toStringAsFixed(0)}',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Target: ${goal.targetDate.day}/${goal.targetDate.month}/${goal.targetDate.year}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                if (goal.contributions.isNotEmpty) ...[
                  const SizedBox(height: AppDimensions.spacingSm),
                  const Divider(),
                  Text(
                    'Recent contributions:',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  ...goal.contributions.take(3).map((c) => Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(c.displayName, style: theme.textTheme.bodySmall),
                            Text(
                              '+\$${c.amount.toStringAsFixed(2)}',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MembersTab extends StatelessWidget {
  const _MembersTab({required this.family});

  final FamilyGroup family;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      itemCount: family.members.length + 1, // +1 for add button
      itemBuilder: (context, index) {
        if (index == family.members.length) {
          return Card(
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.add),
              ),
              title: const Text('Invite Member'),
              subtitle: const Text('Add a family member'),
              onTap: () {
                // TODO: Invite member
              },
            ),
          );
        }

        final member = family.members[index];
        final isAdmin = member.odUserId == family.adminUserId;

        return Card(
          margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  member.avatarUrl != null ? NetworkImage(member.avatarUrl!) : null,
              child: member.avatarUrl == null
                  ? Text(member.displayName.substring(0, 1).toUpperCase())
                  : null,
            ),
            title: Row(
              children: [
                Text(member.displayName),
                if (isAdmin) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.amber.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Admin',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.amber.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            subtitle: Text(member.role.displayName),
            trailing: member.role.hasAllowance
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${member.monthlyAllowance?.toStringAsFixed(0) ?? '0'}/mo',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (member.spentThisMonth != null)
                        Text(
                          'Spent: \$${member.spentThisMonth!.toStringAsFixed(0)}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                    ],
                  )
                : null,
          ),
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
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
