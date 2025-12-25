/// Enum representing cashflow health status
enum CashflowStatus {
  healthy,
  watch,
  warning,
  critical,
  crisis,
}

extension CashflowStatusExtension on CashflowStatus {
  String get displayName {
    switch (this) {
      case CashflowStatus.healthy:
        return 'Healthy';
      case CashflowStatus.watch:
        return 'Watch';
      case CashflowStatus.warning:
        return 'Warning';
      case CashflowStatus.critical:
        return 'Critical';
      case CashflowStatus.crisis:
        return 'Crisis';
    }
  }

  String get description {
    switch (this) {
      case CashflowStatus.healthy:
        return 'Balance maintains good buffer';
      case CashflowStatus.watch:
        return 'Balance dropping toward minimum';
      case CashflowStatus.warning:
        return 'Balance will hit minimum threshold';
      case CashflowStatus.critical:
        return 'Balance will go negative soon';
      case CashflowStatus.crisis:
        return 'Balance is or will be negative';
    }
  }

  String get icon {
    switch (this) {
      case CashflowStatus.healthy:
        return '🟢';
      case CashflowStatus.watch:
        return '🟡';
      case CashflowStatus.warning:
        return '🟠';
      case CashflowStatus.critical:
        return '🔴';
      case CashflowStatus.crisis:
        return '⚫';
    }
  }

  bool get requiresAction {
    return this == CashflowStatus.warning ||
        this == CashflowStatus.critical ||
        this == CashflowStatus.crisis;
  }

  bool get shouldNotify {
    return this != CashflowStatus.healthy;
  }

  /// Alert timing in days before predicted crisis
  int? get alertDays {
    switch (this) {
      case CashflowStatus.healthy:
        return null;
      case CashflowStatus.watch:
        return 14;
      case CashflowStatus.warning:
        return 7;
      case CashflowStatus.critical:
        return 3;
      case CashflowStatus.crisis:
        return 0;
    }
  }
}

/// Enum for prediction confidence levels
enum PredictionConfidence {
  veryHigh,
  high,
  medium,
  low,
  veryLow,
}

extension PredictionConfidenceExtension on PredictionConfidence {
  String get displayName {
    switch (this) {
      case PredictionConfidence.veryHigh:
        return 'Very High';
      case PredictionConfidence.high:
        return 'High';
      case PredictionConfidence.medium:
        return 'Medium';
      case PredictionConfidence.low:
        return 'Low';
      case PredictionConfidence.veryLow:
        return 'Very Low';
    }
  }

  /// Confidence percentage range
  (int min, int max) get percentageRange {
    switch (this) {
      case PredictionConfidence.veryHigh:
        return (90, 100);
      case PredictionConfidence.high:
        return (75, 89);
      case PredictionConfidence.medium:
        return (50, 74);
      case PredictionConfidence.low:
        return (25, 49);
      case PredictionConfidence.veryLow:
        return (0, 24);
    }
  }

  static PredictionConfidence fromPercentage(int percentage) {
    if (percentage >= 90) return PredictionConfidence.veryHigh;
    if (percentage >= 75) return PredictionConfidence.high;
    if (percentage >= 50) return PredictionConfidence.medium;
    if (percentage >= 25) return PredictionConfidence.low;
    return PredictionConfidence.veryLow;
  }
}
