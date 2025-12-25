import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// Semantic Colors - BudgetBot Premium Theme
/// ═══════════════════════════════════════════════════════════════════════════
///
/// Meaningful colors for:
/// - Success states (emerald green - growth/money)
/// - Warning states (amber gold - matches theme)
/// - Error states (warm coral red)
/// - Info states (purple - on-brand, NO BLUE!)
/// ═══════════════════════════════════════════════════════════════════════════

class SemanticColors {
  SemanticColors._();

  // ══════════════════════════════════════════════════════════════════════════
  // SUCCESS - Emerald Green
  // ══════════════════════════════════════════════════════════════════════════

  /// Primary success color
  static const Color success = Color(0xFF10B981);

  /// Light success for backgrounds
  static const Color successLight = Color(0xFF34D399);

  /// Dark success for emphasis
  static const Color successDark = Color(0xFF059669);

  /// Success container background
  static const Color successContainer = Color(0xFFD1FAE5);

  /// Text on success
  static const Color onSuccess = Color(0xFFFFFFFF);

  /// Text on success container
  static const Color onSuccessContainer = Color(0xFF064E3B);

  // ══════════════════════════════════════════════════════════════════════════
  // WARNING - Amber Gold
  // ══════════════════════════════════════════════════════════════════════════

  /// Primary warning color
  static const Color warning = Color(0xFFF59E0B);

  /// Light warning for backgrounds
  static const Color warningLight = Color(0xFFFBBF24);

  /// Dark warning for emphasis
  static const Color warningDark = Color(0xFFD97706);

  /// Warning container background
  static const Color warningContainer = Color(0xFFFEF3C7);

  /// Text on warning
  static const Color onWarning = Color(0xFF1A1625);

  /// Text on warning container
  static const Color onWarningContainer = Color(0xFF78350F);

  // ══════════════════════════════════════════════════════════════════════════
  // ERROR - Warm Coral Red
  // ══════════════════════════════════════════════════════════════════════════

  /// Primary error color
  static const Color error = Color(0xFFEF4444);

  /// Light error for backgrounds
  static const Color errorLight = Color(0xFFF87171);

  /// Dark error for emphasis
  static const Color errorDark = Color(0xFFDC2626);

  /// Error container background
  static const Color errorContainer = Color(0xFFFEE2E2);

  /// Text on error
  static const Color onError = Color(0xFFFFFFFF);

  /// Text on error container
  static const Color onErrorContainer = Color(0xFF7F1D1D);

  // ══════════════════════════════════════════════════════════════════════════
  // INFO - Purple (On-brand, NO BLUE!)
  // ══════════════════════════════════════════════════════════════════════════

  /// Primary info color
  static const Color info = Color(0xFFA78BFA);

  /// Light info for backgrounds
  static const Color infoLight = Color(0xFFC4B5FD);

  /// Dark info for emphasis
  static const Color infoDark = Color(0xFF8B5CF6);

  /// Info container background
  static const Color infoContainer = Color(0xFFEDE9FE);

  /// Text on info
  static const Color onInfo = Color(0xFF1A1625);

  /// Text on info container
  static const Color onInfoContainer = Color(0xFF4C1D95);
}
