import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/notification_model.dart';
import '../services/notification_service.dart';

/// Repository for managing in-app notifications
class NotificationRepository {
  NotificationRepository(this._notificationService);

  final NotificationService _notificationService;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Get notifications collection for a user
  CollectionReference<Map<String, dynamic>> _notificationsCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('notifications');
  }

  /// Stream of notifications for a user (real-time updates)
  Stream<List<NotificationModel>> watchNotifications(String userId) {
    return _notificationsCollection(userId)
        .orderBy('createdAt', descending: true)
        .limit(50) // Limit to last 50 notifications
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => NotificationModel.fromFirestore(doc))
            .toList());
  }

  /// Get all notifications for a user
  Future<List<NotificationModel>> getNotifications(String userId) async {
    try {
      final snapshot = await _notificationsCollection(userId)
          .orderBy('createdAt', descending: true)
          .limit(50)
          .get();

      return snapshot.docs
          .map((doc) => NotificationModel.fromFirestore(doc))
          .toList();
    } catch (e) {
      debugPrint('Error getting notifications: $e');
      return [];
    }
  }

  /// Get unread notification count
  Future<int> getUnreadCount(String userId) async {
    try {
      final snapshot = await _notificationsCollection(userId)
          .where('isRead', isEqualTo: false)
          .count()
          .get();
      return snapshot.count ?? 0;
    } catch (e) {
      debugPrint('Error getting unread count: $e');
      return 0;
    }
  }

  /// Stream of unread count
  Stream<int> watchUnreadCount(String userId) {
    return _notificationsCollection(userId)
        .where('isRead', isEqualTo: false)
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }

  /// Create a new notification
  Future<NotificationModel?> createNotification({
    required String userId,
    required String title,
    required String message,
    required NotificationType type,
    String? actionRoute,
    Map<String, dynamic>? data,
    bool showPushNotification = true,
  }) async {
    try {
      // Check notification settings
      final settings = await getNotificationSettings();
      if (!_shouldShowNotification(type, settings)) {
        debugPrint('Notification skipped due to settings: $type');
        return null;
      }

      final notification = NotificationModel(
        id: '', // Will be set by Firestore
        userId: userId,
        title: title,
        message: message,
        type: type,
        createdAt: DateTime.now(),
        isRead: false,
        actionRoute: actionRoute,
        data: data,
      );

      final docRef = await _notificationsCollection(userId).add(notification.toFirestore());

      // Show push notification if enabled
      if (showPushNotification && settings['push_enabled'] == true) {
        await _notificationService.showNotification(
          id: docRef.id.hashCode,
          title: title,
          body: message,
          payload: actionRoute,
          channel: _getNotificationChannel(type),
        );
      }

      debugPrint('Created notification: $title');
      return notification.copyWith(id: docRef.id);
    } catch (e) {
      debugPrint('Error creating notification: $e');
      return null;
    }
  }

  /// Mark a notification as read
  Future<void> markAsRead(String userId, String notificationId) async {
    try {
      await _notificationsCollection(userId)
          .doc(notificationId)
          .update({'isRead': true});
    } catch (e) {
      debugPrint('Error marking notification as read: $e');
    }
  }

  /// Mark all notifications as read
  Future<void> markAllAsRead(String userId) async {
    try {
      final batch = _firestore.batch();
      final snapshot = await _notificationsCollection(userId)
          .where('isRead', isEqualTo: false)
          .get();

      for (final doc in snapshot.docs) {
        batch.update(doc.reference, {'isRead': true});
      }

      await batch.commit();
    } catch (e) {
      debugPrint('Error marking all as read: $e');
    }
  }

  /// Delete a notification
  Future<void> deleteNotification(String userId, String notificationId) async {
    try {
      await _notificationsCollection(userId).doc(notificationId).delete();
    } catch (e) {
      debugPrint('Error deleting notification: $e');
    }
  }

  /// Delete all notifications
  Future<void> clearAllNotifications(String userId) async {
    try {
      final batch = _firestore.batch();
      final snapshot = await _notificationsCollection(userId).get();

      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    } catch (e) {
      debugPrint('Error clearing notifications: $e');
    }
  }

  /// Delete old notifications (older than 30 days)
  Future<void> cleanupOldNotifications(String userId) async {
    try {
      final cutoff = DateTime.now().subtract(const Duration(days: 30));
      final batch = _firestore.batch();
      final snapshot = await _notificationsCollection(userId)
          .where('createdAt', isLessThan: Timestamp.fromDate(cutoff))
          .get();

      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
      debugPrint('Cleaned up ${snapshot.docs.length} old notifications');
    } catch (e) {
      debugPrint('Error cleaning up notifications: $e');
    }
  }

  // ============ Notification Settings ============

  static const _settingsKey = 'notification_settings';

  /// Get notification settings
  Future<Map<String, bool>> getNotificationSettings() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final settings = prefs.getStringList(_settingsKey);

      if (settings == null) {
        return _defaultSettings;
      }

      final map = <String, bool>{};
      for (final setting in settings) {
        final parts = setting.split(':');
        if (parts.length == 2) {
          map[parts[0]] = parts[1] == 'true';
        }
      }
      return {..._defaultSettings, ...map};
    } catch (e) {
      return _defaultSettings;
    }
  }

  /// Save notification settings
  Future<void> saveNotificationSettings(Map<String, bool> settings) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final list = settings.entries
          .map((e) => '${e.key}:${e.value}')
          .toList();
      await prefs.setStringList(_settingsKey, list);
    } catch (e) {
      debugPrint('Error saving notification settings: $e');
    }
  }

  /// Default notification settings
  static const Map<String, bool> _defaultSettings = {
    'push_enabled': true,
    'budget_alerts': true,
    'transaction_alerts': true,
    'insights': true,
    'goal_updates': true,
    'achievements': true,
    'weekly_summary': true,
  };

  /// Check if notification should be shown based on settings
  bool _shouldShowNotification(NotificationType type, Map<String, bool> settings) {
    switch (type) {
      case NotificationType.budget:
        return settings['budget_alerts'] ?? true;
      case NotificationType.transaction:
        return settings['transaction_alerts'] ?? true;
      case NotificationType.insight:
        return settings['insights'] ?? true;
      case NotificationType.goal:
        return settings['goal_updates'] ?? true;
      case NotificationType.achievement:
        return settings['achievements'] ?? true;
      case NotificationType.alert:
      case NotificationType.system:
        return true; // Always show alerts and system notifications
    }
  }

  /// Get notification channel for type
  NotificationChannel _getNotificationChannel(NotificationType type) {
    switch (type) {
      case NotificationType.budget:
      case NotificationType.alert:
        return NotificationChannel.budgetAlerts;
      case NotificationType.transaction:
        return NotificationChannel.transactions;
      case NotificationType.insight:
      case NotificationType.achievement:
        return NotificationChannel.insights;
      case NotificationType.goal:
      case NotificationType.system:
        return NotificationChannel.reminders;
    }
  }

  // ============ Convenience Methods for Creating Specific Notifications ============

  /// Create budget alert notification
  Future<void> createBudgetAlert({
    required String userId,
    required String budgetId,
    required String budgetName,
    required double percentUsed,
    required double spent,
    required double limit,
  }) async {
    String title;
    String message;

    if (percentUsed >= 1.0) {
      title = 'Budget Exceeded!';
      message = 'You\'ve exceeded your $budgetName budget. Spent \$${spent.toStringAsFixed(2)} of \$${limit.toStringAsFixed(2)}';
    } else if (percentUsed >= 0.9) {
      title = 'Budget Almost Reached';
      message = 'You\'ve used ${(percentUsed * 100).toInt()}% of your $budgetName budget';
    } else if (percentUsed >= 0.75) {
      title = 'Budget Warning';
      message = 'You\'ve used ${(percentUsed * 100).toInt()}% of your $budgetName budget (\$${spent.toStringAsFixed(2)} of \$${limit.toStringAsFixed(2)})';
    } else {
      return; // Don't create notification for less than 75%
    }

    await createNotification(
      userId: userId,
      title: title,
      message: message,
      type: NotificationType.budget,
      actionRoute: '/budgets',
      data: {'budgetId': budgetId, 'percentUsed': percentUsed},
    );
  }

  /// Create large transaction notification
  Future<void> createLargeTransactionAlert({
    required String userId,
    required String transactionId,
    required String merchantName,
    required double amount,
    required bool isExpense,
    double threshold = 100.0,
  }) async {
    if (amount.abs() < threshold) return;

    final sign = isExpense ? '-' : '+';
    await createNotification(
      userId: userId,
      title: isExpense ? 'Large Expense Detected' : 'Large Income Received',
      message: '$merchantName: $sign\$${amount.abs().toStringAsFixed(2)}',
      type: NotificationType.transaction,
      actionRoute: '/transactions',
      data: {'transactionId': transactionId},
    );
  }

  /// Create insight notification
  Future<void> createInsightNotification({
    required String userId,
    required String insightTitle,
    required String insightMessage,
    String? insightId,
  }) async {
    await createNotification(
      userId: userId,
      title: 'New Insight Available',
      message: insightMessage,
      type: NotificationType.insight,
      actionRoute: '/insights',
      data: insightId != null ? {'insightId': insightId} : null,
    );
  }

  /// Create achievement notification
  Future<void> createAchievementNotification({
    required String userId,
    required String achievementTitle,
    required String achievementDescription,
  }) async {
    await createNotification(
      userId: userId,
      title: 'Achievement Unlocked!',
      message: '$achievementTitle - $achievementDescription',
      type: NotificationType.achievement,
      actionRoute: '/insights',
    );
  }

  /// Create goal progress notification
  Future<void> createGoalProgressNotification({
    required String userId,
    required String goalName,
    required double progress,
  }) async {
    String message;
    if (progress >= 1.0) {
      message = 'Congratulations! You\'ve reached your $goalName goal!';
    } else if (progress >= 0.75) {
      message = 'You\'re ${(progress * 100).toInt()}% towards your $goalName goal!';
    } else if (progress >= 0.5) {
      message = 'Halfway there! ${(progress * 100).toInt()}% of your $goalName goal reached';
    } else {
      return; // Don't notify for less than 50%
    }

    await createNotification(
      userId: userId,
      title: 'Goal Progress',
      message: message,
      type: NotificationType.goal,
      actionRoute: '/budgets',
      data: {'goalName': goalName, 'progress': progress},
    );
  }

  /// Create system notification
  Future<void> createSystemNotification({
    required String userId,
    required String title,
    required String message,
  }) async {
    await createNotification(
      userId: userId,
      title: title,
      message: message,
      type: NotificationType.system,
    );
  }
}

/// Provider for NotificationRepository
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final notificationService = ref.watch(notificationServiceProvider);
  return NotificationRepository(notificationService);
});

/// Provider for notifications stream
final notificationsStreamProvider = StreamProvider.family<List<NotificationModel>, String>((ref, userId) {
  final repository = ref.watch(notificationRepositoryProvider);
  return repository.watchNotifications(userId);
});

/// Provider for unread count stream
final unreadNotificationCountProvider = StreamProvider.family<int, String>((ref, userId) {
  final repository = ref.watch(notificationRepositoryProvider);
  return repository.watchUnreadCount(userId);
});

/// Provider for notification settings
final notificationSettingsProvider = FutureProvider<Map<String, bool>>((ref) async {
  final repository = ref.watch(notificationRepositoryProvider);
  return repository.getNotificationSettings();
});
