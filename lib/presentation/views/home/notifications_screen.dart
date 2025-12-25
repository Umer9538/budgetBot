import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../data/models/notification_model.dart';
import '../../../data/repositories/notification_repository.dart';
import '../../viewmodels/auth_viewmodel.dart';

/// Extension for NotificationType UI properties
extension NotificationTypeUI on NotificationType {
  IconData get icon {
    switch (this) {
      case NotificationType.budget:
        return Icons.pie_chart;
      case NotificationType.insight:
        return Icons.lightbulb;
      case NotificationType.alert:
        return Icons.warning_amber;
      case NotificationType.transaction:
        return Icons.receipt_long;
      case NotificationType.goal:
        return Icons.flag;
      case NotificationType.achievement:
        return Icons.emoji_events;
      case NotificationType.system:
        return Icons.info;
    }
  }

  Color get color {
    switch (this) {
      case NotificationType.budget:
        return AppColors.primary;
      case NotificationType.insight:
        return AppColors.warning;
      case NotificationType.alert:
        return AppColors.error;
      case NotificationType.transaction:
        return AppColors.success;
      case NotificationType.goal:
        return AppColors.secondary;
      case NotificationType.achievement:
        return Colors.amber;
      case NotificationType.system:
        return AppColors.neutral500;
    }
  }
}

/// Notifications screen
class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  Map<String, bool> _settings = {};
  bool _settingsLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final repository = ref.read(notificationRepositoryProvider);
    final settings = await repository.getNotificationSettings();
    if (mounted) {
      setState(() {
        _settings = settings;
        _settingsLoaded = true;
      });
    }
  }

  Future<void> _updateSetting(String key, bool value) async {
    setState(() {
      _settings[key] = value;
    });
    final repository = ref.read(notificationRepositoryProvider);
    await repository.saveNotificationSettings(_settings);
  }

  @override
  Widget build(BuildContext context) {
    final userId = ref.watch(currentUserIdProvider);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundDark,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundDark,
          elevation: 0,
          title: const Text(
            'Notifications',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            if (userId != null)
              TextButton(
                onPressed: () async {
                  final repository = ref.read(notificationRepositoryProvider);
                  final messenger = ScaffoldMessenger.of(context);
                  await repository.markAllAsRead(userId);
                  if (mounted) {
                    messenger.showSnackBar(
                      const SnackBar(content: Text('All notifications marked as read')),
                    );
                  }
                },
                child: Text(
                  'Mark all read',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
          ],
          bottom: TabBar(
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.neutral500,
            tabs: const [
              Tab(text: 'All'),
              Tab(text: 'Settings'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Notifications List Tab
            userId != null
                ? _NotificationsListTab(userId: userId)
                : const Center(
                    child: Text(
                      'Please sign in to view notifications',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
            // Settings Tab
            _settingsLoaded
                ? _NotificationSettingsTab(
                    settings: _settings,
                    onSettingChanged: _updateSetting,
                  )
                : const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}

class _NotificationsListTab extends ConsumerWidget {
  final String userId;

  const _NotificationsListTab({required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(notificationsStreamProvider(userId));

    return notificationsAsync.when(
      data: (notifications) {
        if (notifications.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.notifications_off_outlined,
                  size: 64,
                  color: AppColors.neutral500,
                ),
                const SizedBox(height: AppDimensions.spacingMd),
                Text(
                  'No notifications yet',
                  style: TextStyle(
                    color: AppColors.neutral500,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingSm),
                Text(
                  'You\'ll see budget alerts, insights, and more here',
                  style: TextStyle(
                    color: AppColors.neutral600,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        final unread = notifications.where((n) => !n.isRead).toList();
        final read = notifications.where((n) => n.isRead).toList();

        return RefreshIndicator(
          onRefresh: () async {
            // Trigger refresh by invalidating the provider
            ref.invalidate(notificationsStreamProvider(userId));
          },
          child: ListView(
            padding: const EdgeInsets.all(AppDimensions.spacingMd),
            children: [
              if (unread.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    bottom: AppDimensions.spacingSm,
                  ),
                  child: Row(
                    children: [
                      Text(
                        'New',
                        style: TextStyle(
                          color: AppColors.neutral400,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${unread.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...unread.map((n) => _NotificationCard(
                      notification: n,
                      userId: userId,
                    )),
                const SizedBox(height: AppDimensions.spacingMd),
              ],
              if (read.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4,
                    bottom: AppDimensions.spacingSm,
                  ),
                  child: Text(
                    'Earlier',
                    style: TextStyle(
                      color: AppColors.neutral400,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                ...read.map((n) => _NotificationCard(
                      notification: n,
                      userId: userId,
                    )),
              ],
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: AppColors.error),
            const SizedBox(height: AppDimensions.spacingMd),
            Text(
              'Failed to load notifications',
              style: TextStyle(color: AppColors.neutral400),
            ),
            TextButton(
              onPressed: () => ref.invalidate(notificationsStreamProvider(userId)),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationCard extends ConsumerWidget {
  final NotificationModel notification;
  final String userId;

  const _NotificationCard({
    required this.notification,
    required this.userId,
  });

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final diff = now.difference(timestamp);

    if (diff.inMinutes < 1) {
      return 'Just now';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}h ago';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}d ago';
    } else {
      return '${timestamp.day}/${timestamp.month}/${timestamp.year}';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: Key(notification.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppDimensions.spacingMd),
        color: AppColors.error,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) async {
        final repository = ref.read(notificationRepositoryProvider);
        await repository.deleteNotification(userId, notification.id);
      },
      child: GestureDetector(
        onTap: () async {
          // Mark as read
          if (!notification.isRead) {
            final repository = ref.read(notificationRepositoryProvider);
            await repository.markAsRead(userId, notification.id);
          }

          // Navigate if action route is set
          if (notification.actionRoute != null && context.mounted) {
            Navigator.of(context).pop();
            // Use GoRouter to navigate
            // context.push(notification.actionRoute!);
          }
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
          decoration: BoxDecoration(
            color: notification.isRead
                ? AppColors.surfaceDark
                : AppColors.surfaceDark.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
            border: notification.isRead
                ? null
                : Border.all(
                    color: notification.type.color.withValues(alpha: 0.3),
                    width: 1,
                  ),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacingMd,
              vertical: AppDimensions.spacingSm,
            ),
            leading: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: notification.type.color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
              ),
              child: Icon(
                notification.type.icon,
                color: notification.type.color,
                size: 22,
              ),
            ),
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    notification.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                          notification.isRead ? FontWeight.normal : FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (!notification.isRead)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  notification.message,
                  style: TextStyle(
                    color: AppColors.neutral400,
                    fontSize: 13,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  _formatTimestamp(notification.createdAt),
                  style: TextStyle(
                    color: AppColors.neutral500,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationSettingsTab extends StatelessWidget {
  final Map<String, bool> settings;
  final Function(String, bool) onSettingChanged;

  const _NotificationSettingsTab({
    required this.settings,
    required this.onSettingChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      children: [
        _SettingsSection(
          title: 'General',
          children: [
            _SettingsTile(
              icon: Icons.notifications,
              title: 'Push Notifications',
              subtitle: 'Receive push notifications',
              value: settings['push_enabled'] ?? true,
              onChanged: (value) => onSettingChanged('push_enabled', value),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacingMd),
        _SettingsSection(
          title: 'Alerts',
          children: [
            _SettingsTile(
              icon: Icons.pie_chart,
              title: 'Budget Alerts',
              subtitle: 'When you\'re close to budget limits',
              value: settings['budget_alerts'] ?? true,
              onChanged: (value) => onSettingChanged('budget_alerts', value),
            ),
            _SettingsTile(
              icon: Icons.receipt_long,
              title: 'Transaction Alerts',
              subtitle: 'For large or unusual transactions',
              value: settings['transaction_alerts'] ?? true,
              onChanged: (value) => onSettingChanged('transaction_alerts', value),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacingMd),
        _SettingsSection(
          title: 'Updates',
          children: [
            _SettingsTile(
              icon: Icons.lightbulb,
              title: 'Insights',
              subtitle: 'New money-saving insights',
              value: settings['insights'] ?? true,
              onChanged: (value) => onSettingChanged('insights', value),
            ),
            _SettingsTile(
              icon: Icons.flag,
              title: 'Goal Updates',
              subtitle: 'Progress towards your goals',
              value: settings['goal_updates'] ?? true,
              onChanged: (value) => onSettingChanged('goal_updates', value),
            ),
            _SettingsTile(
              icon: Icons.emoji_events,
              title: 'Achievements',
              subtitle: 'When you unlock achievements',
              value: settings['achievements'] ?? true,
              onChanged: (value) => onSettingChanged('achievements', value),
            ),
            _SettingsTile(
              icon: Icons.calendar_today,
              title: 'Weekly Summary',
              subtitle: 'Weekly spending overview',
              value: settings['weekly_summary'] ?? true,
              onChanged: (value) => onSettingChanged('weekly_summary', value),
            ),
          ],
        ),
      ],
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 4,
            bottom: AppDimensions.spacingSm,
          ),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.neutral400,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: Icon(icon, color: AppColors.primary),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: AppColors.neutral500,
          fontSize: 12,
        ),
      ),
      value: value,
      onChanged: onChanged,
      activeTrackColor: AppColors.primary.withValues(alpha: 0.5),
      activeThumbColor: AppColors.primary,
    );
  }
}
