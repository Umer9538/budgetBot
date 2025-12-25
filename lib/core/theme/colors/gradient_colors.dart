import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// Gradient Colors - BudgetBot Premium Theme
/// ═══════════════════════════════════════════════════════════════════════════
///
/// Premium gradients for:
/// - Hero sections & headers
/// - Buttons & CTAs
/// - Cards & backgrounds
/// - Special effects
/// ═══════════════════════════════════════════════════════════════════════════

class GradientColors {
  GradientColors._();

  // ══════════════════════════════════════════════════════════════════════════
  // PRIMARY GRADIENTS
  // ══════════════════════════════════════════════════════════════════════════

  /// Main brand gradient - Amethyst flow
  static const LinearGradient primary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF8B5CF6), Color(0xFFA78BFA)],
  );

  /// Deep primary gradient - For headers
  static const LinearGradient primaryDeep = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF6D28D9), Color(0xFF8B5CF6)],
  );

  /// Vertical primary
  static const LinearGradient primaryVertical = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF8B5CF6), Color(0xFFA78BFA)],
  );

  // ══════════════════════════════════════════════════════════════════════════
  // SECONDARY GRADIENTS
  // ══════════════════════════════════════════════════════════════════════════

  /// Gold gradient - Premium elements
  static const LinearGradient gold = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFD4A574), Color(0xFFE8C49A)],
  );

  /// Rose gold gradient - Special highlights
  static const LinearGradient roseGold = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE5B8A8), Color(0xFFFFC1B8)],
  );

  /// Champagne gradient - Subtle gold
  static const LinearGradient champagne = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFBF8A4E), Color(0xFFD4A574)],
  );

  // ══════════════════════════════════════════════════════════════════════════
  // ACCENT GRADIENTS
  // ══════════════════════════════════════════════════════════════════════════

  /// Coral gradient - For CTAs
  static const LinearGradient coral = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF8A80), Color(0xFFFFAB9E)],
  );

  /// Blush gradient - Soft accent
  static const LinearGradient blush = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFC1B8), Color(0xFFFFE5E0)],
  );

  // ══════════════════════════════════════════════════════════════════════════
  // SEMANTIC GRADIENTS
  // ══════════════════════════════════════════════════════════════════════════

  /// Success gradient - Emerald
  static const LinearGradient success = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF10B981), Color(0xFF34D399)],
  );

  /// Warning gradient - Amber
  static const LinearGradient warning = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFF59E0B), Color(0xFFFBBF24)],
  );

  /// Error gradient - Red
  static const LinearGradient error = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFEF4444), Color(0xFFF87171)],
  );

  /// Info gradient - Purple (on-brand)
  static const LinearGradient info = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFA78BFA), Color(0xFFC4B5FD)],
  );

  // ══════════════════════════════════════════════════════════════════════════
  // BACKGROUND GRADIENTS
  // ══════════════════════════════════════════════════════════════════════════

  /// Dark surface gradient
  static const LinearGradient darkSurface = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1A1325), Color(0xFF0F0A1A)],
  );

  /// Light surface gradient
  static const LinearGradient lightSurface = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFFBF8), Color(0xFFFCF9F6)],
  );

  /// Card light gradient
  static const LinearGradient cardLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFFFFFF), Color(0xFFFFFBF8)],
  );

  /// Card dark gradient
  static const LinearGradient cardDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1F1730), Color(0xFF1A1325)],
  );

  // ══════════════════════════════════════════════════════════════════════════
  // SPECIAL EFFECTS
  // ══════════════════════════════════════════════════════════════════════════

  /// Mesh gradient - Hero backgrounds
  static const LinearGradient mesh = LinearGradient(
    colors: [
      Color(0xFF6D28D9),
      Color(0xFF8B5CF6),
      Color(0xFFD4A574),
    ],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Aurora gradient - Special sections
  static const LinearGradient aurora = LinearGradient(
    colors: [
      Color(0xFF8B5CF6),
      Color(0xFFEC4899),
      Color(0xFFD4A574),
    ],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Glass shimmer - Card edges
  static const LinearGradient glassShimmer = LinearGradient(
    colors: [
      Color(0x00FFFFFF),
      Color(0x20FFFFFF),
      Color(0x00FFFFFF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Frosted overlay - Glass effect
  static const LinearGradient frosted = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x40FFFFFF),
      Color(0x10FFFFFF),
    ],
  );

  /// Premium glow - For highlights
  static const RadialGradient glow = RadialGradient(
    colors: [
      Color(0x408B5CF6),
      Color(0x008B5CF6),
    ],
    radius: 0.8,
  );

  /// Gold glow - For special elements
  static const RadialGradient goldGlow = RadialGradient(
    colors: [
      Color(0x40D4A574),
      Color(0x00D4A574),
    ],
    radius: 0.8,
  );
}
