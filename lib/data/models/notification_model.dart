import 'package:cloud_firestore/cloud_firestore.dart';

/// Notification type enum
enum NotificationType {
  budget,
  insight,
  alert,
  transaction,
  goal,
  achievement,
  system,
}

/// Extension for NotificationType
extension NotificationTypeExtension on NotificationType {
  String get value {
    switch (this) {
      case NotificationType.budget:
        return 'budget';
      case NotificationType.insight:
        return 'insight';
      case NotificationType.alert:
        return 'alert';
      case NotificationType.transaction:
        return 'transaction';
      case NotificationType.goal:
        return 'goal';
      case NotificationType.achievement:
        return 'achievement';
      case NotificationType.system:
        return 'system';
    }
  }

  static NotificationType fromString(String value) {
    switch (value) {
      case 'budget':
        return NotificationType.budget;
      case 'insight':
        return NotificationType.insight;
      case 'alert':
        return NotificationType.alert;
      case 'transaction':
        return NotificationType.transaction;
      case 'goal':
        return NotificationType.goal;
      case 'achievement':
        return NotificationType.achievement;
      case 'system':
      default:
        return NotificationType.system;
    }
  }
}

/// Model for in-app notifications stored in Firestore
class NotificationModel {
  final String id;
  final String userId;
  final String title;
  final String message;
  final NotificationType type;
  final DateTime createdAt;
  final bool isRead;
  final String? actionRoute; // Route to navigate when tapped
  final Map<String, dynamic>? data; // Additional data (e.g., budgetId, transactionId)

  const NotificationModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.message,
    required this.type,
    required this.createdAt,
    this.isRead = false,
    this.actionRoute,
    this.data,
  });

  /// Create from Firestore document
  factory NotificationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NotificationModel(
      id: doc.id,
      userId: data['userId'] as String? ?? '',
      title: data['title'] as String? ?? '',
      message: data['message'] as String? ?? '',
      type: NotificationTypeExtension.fromString(data['type'] as String? ?? 'system'),
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      isRead: data['isRead'] as bool? ?? false,
      actionRoute: data['actionRoute'] as String?,
      data: data['data'] as Map<String, dynamic>?,
    );
  }

  /// Convert to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'title': title,
      'message': message,
      'type': type.value,
      'createdAt': Timestamp.fromDate(createdAt),
      'isRead': isRead,
      if (actionRoute != null) 'actionRoute': actionRoute,
      if (data != null) 'data': data,
    };
  }

  /// Copy with modifications
  NotificationModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? message,
    NotificationType? type,
    DateTime? createdAt,
    bool? isRead,
    String? actionRoute,
    Map<String, dynamic>? data,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      message: message ?? this.message,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
      actionRoute: actionRoute ?? this.actionRoute,
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, type: $type, isRead: $isRead)';
  }
}
