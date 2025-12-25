import 'dart:ui';
import 'package:flutter/material.dart';
import '../app_colors.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// Glassmorphism Decoration Utilities
/// ═══════════════════════════════════════════════════════════════════════════
///
/// Provides premium glass UI effects with:
/// - Frosted glass backgrounds
/// - Subtle borders with gradient edges
/// - Layered shadows for depth
/// - Blur effects
///
/// Usage:
///   Container(
///     decoration: GlassDecoration.card(context),
///     child: ...
///   )
/// ═══════════════════════════════════════════════════════════════════════════

class GlassDecoration {
  GlassDecoration._();

  // ══════════════════════════════════════════════════════════════════════════
  // STANDARD GLASS CARD
  // ══════════════════════════════════════════════════════════════════════════

  /// Standard glass card decoration
  static BoxDecoration card(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark ? AppColors.glassDark : AppColors.glassLight,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: isDark ? AppColors.glassShadowDark : AppColors.glassShadowLight,
          blurRadius: 24,
          offset: const Offset(0, 8),
          spreadRadius: -4,
        ),
        // Inner glow effect
        BoxShadow(
          color: isDark
              ? AppColors.glassHighlightDark
              : AppColors.glassHighlightLight,
          blurRadius: 1,
          offset: const Offset(0, -1),
          spreadRadius: 0,
        ),
      ],
    );
  }

  /// Elevated glass card with stronger effect
  static BoxDecoration cardElevated(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark
          ? AppColors.glassPurpleDark
          : AppColors.glassWarmLight,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(
        color: isDark
            ? AppColors.glassBorderDark
            : AppColors.glassBorderLight,
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: isDark ? AppColors.glassShadowDark : AppColors.glassShadowLight,
          blurRadius: 32,
          offset: const Offset(0, 12),
          spreadRadius: -4,
        ),
        BoxShadow(
          color: (isDark ? AppColors.primary : AppColors.primaryLight)
              .withValues(alpha: 0.1),
          blurRadius: 40,
          offset: const Offset(0, 4),
          spreadRadius: -8,
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SPECIALTY GLASS CARDS
  // ══════════════════════════════════════════════════════════════════════════

  /// Glass card with gold accent
  static BoxDecoration cardGold(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          (isDark ? AppColors.glassDark : AppColors.glassLight),
          (isDark ? AppColors.glassDark : AppColors.glassLight)
              .withValues(alpha: 0.5),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: AppColors.secondary.withValues(alpha: isDark ? 0.3 : 0.2),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.secondary.withValues(alpha: 0.15),
          blurRadius: 24,
          offset: const Offset(0, 8),
          spreadRadius: -4,
        ),
      ],
    );
  }

  /// Glass card with success/green accent
  static BoxDecoration cardSuccess(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark ? AppColors.glassDark : AppColors.glassLight,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: AppColors.success.withValues(alpha: isDark ? 0.3 : 0.2),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.success.withValues(alpha: 0.15),
          blurRadius: 24,
          offset: const Offset(0, 8),
          spreadRadius: -4,
        ),
      ],
    );
  }

  /// Glass card with error/warning accent
  static BoxDecoration cardAlert(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark ? AppColors.glassDark : AppColors.glassLight,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: AppColors.accent.withValues(alpha: isDark ? 0.3 : 0.2),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.accent.withValues(alpha: 0.15),
          blurRadius: 24,
          offset: const Offset(0, 8),
          spreadRadius: -4,
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // COMPACT GLASS ELEMENTS
  // ══════════════════════════════════════════════════════════════════════════

  /// Small glass chip/badge
  static BoxDecoration chip(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark
          ? AppColors.glassDark.withValues(alpha: 0.8)
          : AppColors.glassLight.withValues(alpha: 0.9),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
        width: 1,
      ),
    );
  }

  /// Glass pill/tag
  static BoxDecoration pill(BuildContext context, {Color? accentColor}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accent = accentColor ?? AppColors.primary;
    return BoxDecoration(
      color: accent.withValues(alpha: isDark ? 0.15 : 0.1),
      borderRadius: BorderRadius.circular(100),
      border: Border.all(
        color: accent.withValues(alpha: isDark ? 0.3 : 0.2),
        width: 1,
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // INPUT FIELDS & INTERACTIVE ELEMENTS
  // ══════════════════════════════════════════════════════════════════════════

  /// Glass input field decoration
  static BoxDecoration inputField(BuildContext context, {bool focused = false}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark
          ? AppColors.glassDark.withValues(alpha: 0.4)
          : AppColors.glassLight.withValues(alpha: 0.6),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: focused
            ? AppColors.primary.withValues(alpha: 0.5)
            : (isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight),
        width: focused ? 2 : 1.5,
      ),
    );
  }

  /// Glass button decoration
  static BoxDecoration button(BuildContext context, {bool pressed = false}) {
    return BoxDecoration(
      gradient: pressed ? null : AppColors.primaryGradient,
      color: pressed ? AppColors.primaryDark : null,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: AppColors.primaryLight.withValues(alpha: 0.3),
        width: 1,
      ),
      boxShadow: pressed
          ? []
          : [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.4),
                blurRadius: 16,
                offset: const Offset(0, 4),
                spreadRadius: -4,
              ),
            ],
    );
  }

  /// Secondary glass button
  static BoxDecoration buttonSecondary(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark ? AppColors.glassDark : AppColors.glassLight,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
        width: 1.5,
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // NAVIGATION & CONTAINERS
  // ══════════════════════════════════════════════════════════════════════════

  /// Glass bottom navigation bar
  static BoxDecoration bottomNav(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark
          ? AppColors.glassDark.withValues(alpha: 0.85)
          : AppColors.glassLight.withValues(alpha: 0.9),
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      border: Border(
        top: BorderSide(
          color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
          width: 1,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: isDark ? AppColors.glassShadowDark : AppColors.glassShadowLight,
          blurRadius: 24,
          offset: const Offset(0, -8),
          spreadRadius: -8,
        ),
      ],
    );
  }

  /// Glass app bar
  static BoxDecoration appBar(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark
          ? AppColors.glassDark.withValues(alpha: 0.85)
          : AppColors.glassLight.withValues(alpha: 0.9),
      border: Border(
        bottom: BorderSide(
          color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
          width: 1,
        ),
      ),
    );
  }

  /// Glass modal/bottom sheet
  static BoxDecoration modal(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return BoxDecoration(
      color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      border: Border(
        top: BorderSide(
          color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
          width: 1.5,
        ),
        left: BorderSide(
          color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
          width: 1.5,
        ),
        right: BorderSide(
          color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
          width: 1.5,
        ),
      ),
      boxShadow: [
        BoxShadow(
          color: isDark ? AppColors.glassShadowDark : AppColors.glassShadowLight,
          blurRadius: 32,
          offset: const Offset(0, -12),
          spreadRadius: -8,
        ),
      ],
    );
  }

  // ══════════════════════════════════════════════════════════════════════════
  // SPECIAL EFFECTS
  // ══════════════════════════════════════════════════════════════════════════

  /// Hero card with gradient border
  static BoxDecoration hero(BuildContext context) {
    return BoxDecoration(
      gradient: AppColors.meshGradient,
      borderRadius: BorderRadius.circular(28),
      boxShadow: [
        BoxShadow(
          color: AppColors.primary.withValues(alpha: 0.4),
          blurRadius: 32,
          offset: const Offset(0, 12),
          spreadRadius: -8,
        ),
        BoxShadow(
          color: AppColors.secondary.withValues(alpha: 0.2),
          blurRadius: 48,
          offset: const Offset(0, 16),
          spreadRadius: -12,
        ),
      ],
    );
  }

  /// Stat card with subtle glow
  static BoxDecoration statCard(BuildContext context, {Color? glowColor}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final glow = glowColor ?? AppColors.primary;
    return BoxDecoration(
      color: isDark ? AppColors.glassDark : AppColors.glassLight,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight,
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: glow.withValues(alpha: 0.2),
          blurRadius: 20,
          offset: const Offset(0, 4),
          spreadRadius: -4,
        ),
      ],
    );
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// Glassmorphism Effect Widgets
/// ═══════════════════════════════════════════════════════════════════════════

class GlassEffect {
  GlassEffect._();

  /// Standard blur amount for glass effect
  static const double blurAmount = 24.0;

  /// Strong blur for elevated glass
  static const double blurStrong = 40.0;

  /// Subtle blur for chips/small elements
  static const double blurSubtle = 12.0;

  /// Creates a blur filter for glass effect
  static ImageFilter get blur => ImageFilter.blur(
        sigmaX: blurAmount,
        sigmaY: blurAmount,
      );

  /// Creates a strong blur filter
  static ImageFilter get blurHeavy => ImageFilter.blur(
        sigmaX: blurStrong,
        sigmaY: blurStrong,
      );

  /// Creates a subtle blur filter
  static ImageFilter get blurLight => ImageFilter.blur(
        sigmaX: blurSubtle,
        sigmaY: blurSubtle,
      );
}

/// Gradient border painter for special effects
class GradientBorderPainter extends CustomPainter {
  final Gradient gradient;
  final double strokeWidth;
  final double radius;

  GradientBorderPainter({
    required this.gradient,
    this.strokeWidth = 2,
    this.radius = 20,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
