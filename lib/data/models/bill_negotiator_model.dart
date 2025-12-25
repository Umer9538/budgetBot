import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/enums.dart';

part 'bill_negotiator_model.freezed.dart';
part 'bill_negotiator_model.g.dart';

/// AI Bill Negotiator - automated bill analysis and negotiation
@freezed
class BillNegotiator with _$BillNegotiator {
  const factory BillNegotiator({
    required String id,
    required String userId,
    required List<TrackedBill> trackedBills,
    required List<NegotiationSession> negotiations,
    required NegotiatorStats stats,
    required DateTime lastAnalyzed,
    DateTime? createdAt,
  }) = _BillNegotiator;

  factory BillNegotiator.fromJson(Map<String, dynamic> json) =>
      _$BillNegotiatorFromJson(json);
}

/// A bill being tracked for negotiation
@freezed
class TrackedBill with _$TrackedBill {
  const factory TrackedBill({
    required String id,
    required String name,
    required String provider,
    required BillCategory category,
    required double currentAmount,
    required double marketAverage, // what others pay
    required double potentialSavings,
    required BillPriority negotiationPriority,
    required NegotiationDifficulty difficulty,
    required DateTime lastBillDate,
    required DateTime? contractEndDate,
    required bool hasAutoPay,
    required int loyaltyMonths, // how long customer
    String? accountNumber,
    String? phoneNumber,
    List<String>? previousRates,
    String? notes,
  }) = _TrackedBill;

  factory TrackedBill.fromJson(Map<String, dynamic> json) =>
      _$TrackedBillFromJson(json);
}

/// Category of bill
enum BillCategory {
  internet,
  cable,
  phone,
  insurance,
  utilities,
  subscription,
  gym,
  bankFees,
  creditCard,
  other,
}

extension BillCategoryExtension on BillCategory {
  String get displayName {
    switch (this) {
      case BillCategory.internet:
        return 'Internet';
      case BillCategory.cable:
        return 'Cable/TV';
      case BillCategory.phone:
        return 'Phone';
      case BillCategory.insurance:
        return 'Insurance';
      case BillCategory.utilities:
        return 'Utilities';
      case BillCategory.subscription:
        return 'Subscription';
      case BillCategory.gym:
        return 'Gym/Fitness';
      case BillCategory.bankFees:
        return 'Bank Fees';
      case BillCategory.creditCard:
        return 'Credit Card';
      case BillCategory.other:
        return 'Other';
    }
  }

  String get icon {
    switch (this) {
      case BillCategory.internet:
        return '🌐';
      case BillCategory.cable:
        return '📺';
      case BillCategory.phone:
        return '📱';
      case BillCategory.insurance:
        return '🛡️';
      case BillCategory.utilities:
        return '💡';
      case BillCategory.subscription:
        return '📦';
      case BillCategory.gym:
        return '💪';
      case BillCategory.bankFees:
        return '🏦';
      case BillCategory.creditCard:
        return '💳';
      case BillCategory.other:
        return '📋';
    }
  }
}

/// Priority for negotiation
enum BillPriority {
  high,
  medium,
  low,
}

extension BillPriorityExtension on BillPriority {
  String get displayName {
    switch (this) {
      case BillPriority.high:
        return 'High Priority';
      case BillPriority.medium:
        return 'Medium Priority';
      case BillPriority.low:
        return 'Low Priority';
    }
  }

  String get icon {
    switch (this) {
      case BillPriority.high:
        return '🔴';
      case BillPriority.medium:
        return '🟡';
      case BillPriority.low:
        return '🟢';
    }
  }
}

/// Difficulty of negotiation
enum NegotiationDifficulty {
  easy,
  moderate,
  hard,
}

extension NegotiationDifficultyExtension on NegotiationDifficulty {
  String get displayName {
    switch (this) {
      case NegotiationDifficulty.easy:
        return 'Easy';
      case NegotiationDifficulty.moderate:
        return 'Moderate';
      case NegotiationDifficulty.hard:
        return 'Hard';
    }
  }

  String get description {
    switch (this) {
      case NegotiationDifficulty.easy:
        return 'High success rate, simple process';
      case NegotiationDifficulty.moderate:
        return 'May require persistence';
      case NegotiationDifficulty.hard:
        return 'Competitive market, limited options';
    }
  }
}

/// A negotiation session for a bill
@freezed
class NegotiationSession with _$NegotiationSession {
  const factory NegotiationSession({
    required String id,
    required String billId,
    required NegotiationStatus status,
    required DateTime startedAt,
    required NegotiationScript script,
    required List<NegotiationStep> steps,
    required double originalAmount,
    double? negotiatedAmount,
    double? savingsAchieved,
    DateTime? completedAt,
    String? notes,
    String? outcome,
  }) = _NegotiationSession;

  factory NegotiationSession.fromJson(Map<String, dynamic> json) =>
      _$NegotiationSessionFromJson(json);
}

/// Status of negotiation
enum NegotiationStatus {
  notStarted,
  inProgress,
  waitingCallback,
  successful,
  partialSuccess,
  unsuccessful,
  cancelled,
}

extension NegotiationStatusExtension on NegotiationStatus {
  String get displayName {
    switch (this) {
      case NegotiationStatus.notStarted:
        return 'Not Started';
      case NegotiationStatus.inProgress:
        return 'In Progress';
      case NegotiationStatus.waitingCallback:
        return 'Waiting Callback';
      case NegotiationStatus.successful:
        return 'Successful';
      case NegotiationStatus.partialSuccess:
        return 'Partial Success';
      case NegotiationStatus.unsuccessful:
        return 'Unsuccessful';
      case NegotiationStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get icon {
    switch (this) {
      case NegotiationStatus.notStarted:
        return '⏳';
      case NegotiationStatus.inProgress:
        return '🔄';
      case NegotiationStatus.waitingCallback:
        return '📞';
      case NegotiationStatus.successful:
        return '✅';
      case NegotiationStatus.partialSuccess:
        return '🟡';
      case NegotiationStatus.unsuccessful:
        return '❌';
      case NegotiationStatus.cancelled:
        return '🚫';
    }
  }
}

/// AI-generated negotiation script
@freezed
class NegotiationScript with _$NegotiationScript {
  const factory NegotiationScript({
    required String id,
    required String opening, // how to start the call
    required List<String> keyPoints, // main negotiation points
    required List<String> competitorMentions, // competitor offers to mention
    required List<String> responseHandlers, // how to handle objections
    required String closingLine, // how to close the deal
    required List<String> escalationPhrases, // if first rep can't help
    required double targetSavings,
    required double minimumAcceptable,
  }) = _NegotiationScript;

  factory NegotiationScript.fromJson(Map<String, dynamic> json) =>
      _$NegotiationScriptFromJson(json);
}

/// Step in negotiation process
@freezed
class NegotiationStep with _$NegotiationStep {
  const factory NegotiationStep({
    required int stepNumber,
    required String instruction,
    required String expectedResponse,
    required String suggestedReply,
    bool? completed,
    String? actualOutcome,
    DateTime? completedAt,
  }) = _NegotiationStep;

  factory NegotiationStep.fromJson(Map<String, dynamic> json) =>
      _$NegotiationStepFromJson(json);
}

/// Overall stats for the bill negotiator
@freezed
class NegotiatorStats with _$NegotiatorStats {
  const factory NegotiatorStats({
    required int totalNegotiations,
    required int successfulNegotiations,
    required double totalSavings,
    required double averageSavingsPerBill,
    required double successRate,
    required Map<BillCategory, double> savingsByCategory,
    required List<NegotiationWin> recentWins,
  }) = _NegotiatorStats;

  factory NegotiatorStats.fromJson(Map<String, dynamic> json) =>
      _$NegotiatorStatsFromJson(json);
}

/// A successful negotiation
@freezed
class NegotiationWin with _$NegotiationWin {
  const factory NegotiationWin({
    required String billName,
    required String provider,
    required double savings,
    required DateTime date,
    required String description,
  }) = _NegotiationWin;

  factory NegotiationWin.fromJson(Map<String, dynamic> json) =>
      _$NegotiationWinFromJson(json);
}

/// Provider information for negotiation
@freezed
class ServiceProvider with _$ServiceProvider {
  const factory ServiceProvider({
    required String id,
    required String name,
    required BillCategory category,
    required String retentionPhone, // specific phone for better service
    required List<String> bestTimesToCall,
    required double averageDiscount,
    required double successRate, // based on community data
    required List<String> knownPromotions,
    required List<String> negotiationTips,
    required DateTime lastUpdated,
  }) = _ServiceProvider;

  factory ServiceProvider.fromJson(Map<String, dynamic> json) =>
      _$ServiceProviderFromJson(json);
}
