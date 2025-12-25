import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import '../services/services.dart';

/// Provider for InsightRepository
final insightRepositoryProvider = Provider<InsightRepository>((ref) {
  final insightService = ref.watch(insightServiceProvider);
  return InsightRepository(insightService: insightService);
});

/// Repository for insights - abstracts the InsightService
/// Provides business logic and clean interface for ViewModels
class InsightRepository {
  InsightRepository({
    required InsightService insightService,
  }) : _insightService = insightService;

  final InsightService _insightService;

  // ===== Read Operations =====

  /// Stream all active insights for a user
  Stream<List<InsightModel>> watchInsights(String userId) {
    return _insightService.watchInsights(userId);
  }

  /// Get all active insights
  Future<List<InsightModel>> getInsights(String userId) {
    return _insightService.getInsights(userId);
  }

  /// Get unread insights count
  Future<int> getUnreadCount(String userId) {
    return _insightService.getUnreadCount(userId);
  }

  /// Get insights by type
  Future<List<InsightModel>> getInsightsByType(String userId, InsightType type) async {
    final insights = await _insightService.getInsights(userId);
    return insights.where((i) => i.type == type).toList();
  }

  /// Get high priority insights
  Future<List<InsightModel>> getHighPriorityInsights(String userId) async {
    final insights = await _insightService.getInsights(userId);
    return insights
        .where((i) =>
            i.priority == InsightPriority.high ||
            i.priority == InsightPriority.critical)
        .toList();
  }

  // ===== Write Operations =====

  /// Mark insight as read
  Future<void> markAsRead(String userId, String insightId) {
    return _insightService.markAsRead(userId, insightId);
  }

  /// Dismiss an insight
  Future<void> dismissInsight(String userId, String insightId) {
    return _insightService.dismissInsight(userId, insightId);
  }

  /// Mark all insights as read
  Future<void> markAllAsRead(String userId) async {
    final insights = await _insightService.getInsights(userId);
    for (final insight in insights.where((i) => !i.isRead)) {
      await _insightService.markAsRead(userId, insight.id);
    }
  }

  // ===== Insight Generation =====

  /// Generate new insights based on spending data
  Future<List<InsightModel>> generateInsights({
    required String userId,
    int analysisMonths = 3,
    bool useAI = true,
  }) {
    return _insightService.generateInsights(
      userId: userId,
      analysisMonths: analysisMonths,
      useAI: useAI,
    );
  }

  /// Refresh insights (cleanup old + generate new)
  Future<List<InsightModel>> refreshInsights(String userId) async {
    // Cleanup expired insights
    await _insightService.cleanupExpiredInsights(userId);

    // Generate new insights
    return generateInsights(userId: userId);
  }

  // ===== Business Logic =====

  /// Get insight summary for dashboard
  Future<InsightSummary> getInsightSummary(String userId) async {
    final insights = await _insightService.getInsights(userId);

    final unread = insights.where((i) => !i.isRead).length;
    final highPriority = insights
        .where((i) =>
            i.priority == InsightPriority.high ||
            i.priority == InsightPriority.critical)
        .length;

    final byType = <InsightType, int>{};
    for (final insight in insights) {
      byType[insight.type] = (byType[insight.type] ?? 0) + 1;
    }

    return InsightSummary(
      totalInsights: insights.length,
      unreadCount: unread,
      highPriorityCount: highPriority,
      insightsByType: byType,
      hasActionable: insights.any((i) => i.actionable && !i.isRead),
    );
  }

  /// Get the most important insight for quick display
  Future<InsightModel?> getMostImportantInsight(String userId) async {
    final insights = await _insightService.getInsights(userId);
    if (insights.isEmpty) return null;

    // Sort by priority and read status
    final sorted = insights.toList()
      ..sort((a, b) {
        // Unread first
        if (a.isRead != b.isRead) {
          return a.isRead ? 1 : -1;
        }
        // Then by priority
        return a.priority.sortOrder.compareTo(b.priority.sortOrder);
      });

    return sorted.first;
  }
}

/// Data class for insight summary
class InsightSummary {
  const InsightSummary({
    required this.totalInsights,
    required this.unreadCount,
    required this.highPriorityCount,
    required this.insightsByType,
    required this.hasActionable,
  });

  final int totalInsights;
  final int unreadCount;
  final int highPriorityCount;
  final Map<InsightType, int> insightsByType;
  final bool hasActionable;

  bool get hasUnread => unreadCount > 0;
  bool get hasHighPriority => highPriorityCount > 0;
}
