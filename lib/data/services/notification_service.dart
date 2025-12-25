import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Service for handling local notifications
class NotificationService {
  NotificationService();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  /// Initialize the notification service
  Future<void> initialize() async {
    if (_isInitialized) return;

    // Initialize timezone
    tz.initializeTimeZones();

    // Android settings
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

    // iOS settings
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    // Combined settings
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    _isInitialized = true;
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) {
    // Handle notification tap - can navigate to specific screen
    // based on payload
    debugPrint('Notification tapped: ${response.payload}');
  }

  /// Request notification permissions (iOS/Android 13+)
  Future<bool> requestPermissions() async {
    if (Platform.isIOS) {
      final result = await _notifications
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      return result ?? false;
    } else if (Platform.isAndroid) {
      final androidPlugin = _notifications.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
      final result = await androidPlugin?.requestNotificationsPermission();
      return result ?? false;
    }
    return true;
  }

  /// Show an immediate notification
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
    NotificationChannel channel = NotificationChannel.budgetAlerts,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: channel.importance,
      priority: channel.priority,
      icon: '@mipmap/ic_launcher',
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.show(id, title, body, details, payload: payload);
  }

  /// Show a budget alert notification
  Future<void> showBudgetAlert({
    required String budgetId,
    required String budgetName,
    required double percentUsed,
    required double spent,
    required double limit,
  }) async {
    final int id = budgetId.hashCode;
    String title;
    String body;

    if (percentUsed >= 1.0) {
      title = 'Budget Exceeded!';
      body =
          'You\'ve exceeded your $budgetName budget. Spent \$${spent.toStringAsFixed(2)} of \$${limit.toStringAsFixed(2)}';
    } else if (percentUsed >= 0.9) {
      title = 'Budget Almost Reached';
      body =
          'You\'ve used ${(percentUsed * 100).toInt()}% of your $budgetName budget (\$${spent.toStringAsFixed(2)} of \$${limit.toStringAsFixed(2)})';
    } else if (percentUsed >= 0.75) {
      title = 'Budget Warning';
      body =
          'You\'ve used ${(percentUsed * 100).toInt()}% of your $budgetName budget';
    } else {
      title = 'Budget Update';
      body =
          'You\'ve used ${(percentUsed * 100).toInt()}% of your $budgetName budget';
    }

    await showNotification(
      id: id,
      title: title,
      body: body,
      payload: 'budget:$budgetId',
      channel: NotificationChannel.budgetAlerts,
    );
  }

  /// Show a transaction notification
  Future<void> showTransactionNotification({
    required String transactionId,
    required String merchantName,
    required double amount,
    required bool isExpense,
  }) async {
    final id = transactionId.hashCode;
    final sign = isExpense ? '-' : '+';
    final title = isExpense ? 'New Expense' : 'New Income';
    final body = '$merchantName: $sign\$${amount.toStringAsFixed(2)}';

    await showNotification(
      id: id,
      title: title,
      body: body,
      payload: 'transaction:$transactionId',
      channel: NotificationChannel.transactions,
    );
  }

  /// Schedule a notification
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
    String? payload,
    NotificationChannel channel = NotificationChannel.reminders,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      channel.id,
      channel.name,
      channelDescription: channel.description,
      importance: channel.importance,
      priority: channel.priority,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload,
    );
  }

  /// Cancel a specific notification
  Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
  }

  /// Cancel all notifications
  Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
  }

  /// Get pending notifications
  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return _notifications.pendingNotificationRequests();
  }
}

/// Notification channels
enum NotificationChannel {
  budgetAlerts(
    id: 'budget_alerts',
    name: 'Budget Alerts',
    description: 'Notifications for budget thresholds and limits',
    importance: Importance.high,
    priority: Priority.high,
  ),
  transactions(
    id: 'transactions',
    name: 'Transactions',
    description: 'Notifications for new transactions',
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
  ),
  reminders(
    id: 'reminders',
    name: 'Reminders',
    description: 'Budget and financial reminders',
    importance: Importance.defaultImportance,
    priority: Priority.defaultPriority,
  ),
  insights(
    id: 'insights',
    name: 'Insights',
    description: 'Financial insights and tips',
    importance: Importance.low,
    priority: Priority.low,
  );

  const NotificationChannel({
    required this.id,
    required this.name,
    required this.description,
    required this.importance,
    required this.priority,
  });

  final String id;
  final String name;
  final String description;
  final Importance importance;
  final Priority priority;
}

/// Riverpod provider for NotificationService
final notificationServiceProvider = Provider<NotificationService>((ref) {
  final service = NotificationService();
  // Initialize asynchronously
  service.initialize();
  return service;
});
