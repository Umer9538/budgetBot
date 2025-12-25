import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Application shadow styles
class AppShadows {
  AppShadows._();

  // ============ Light Mode Shadows ============

  /// No shadow
  static const List<BoxShadow> none = [];

  /// Extra small shadow (elevation 1)
  static const List<BoxShadow> xs = [
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
  ];

  /// Small shadow (elevation 2)
  static const List<BoxShadow> sm = [
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  /// Medium shadow (elevation 4)
  static const List<BoxShadow> md = [
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ];

  /// Large shadow (elevation 8)
  static const List<BoxShadow> lg = [
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];

  /// Extra large shadow (elevation 16)
  static const List<BoxShadow> xl = [
    BoxShadow(
      color: AppColors.shadowLight,
      blurRadius: 24,
      offset: Offset(0, 12),
    ),
  ];

  // ============ Card Shadows ============

  /// Card shadow for light mode
  static const List<BoxShadow> cardLight = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
    BoxShadow(
      color: Color(0x0F000000),
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];

  /// Card shadow for dark mode
  static const List<BoxShadow> cardDark = [
    BoxShadow(
      color: Color(0x40000000),
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
    BoxShadow(
      color: Color(0x60000000),
      blurRadius: 12,
      offset: Offset(0, 4),
    ),
  ];

  // ============ Elevated Shadows ============

  /// Elevated card shadow
  static const List<BoxShadow> elevated = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 3,
      offset: Offset(0, 1),
    ),
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 24,
      offset: Offset(0, 12),
    ),
  ];

  // ============ Button Shadows ============

  /// Primary button shadow
  static List<BoxShadow> primaryButton = [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.3),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  /// Success button shadow
  static List<BoxShadow> successButton = [
    BoxShadow(
      color: AppColors.success.withValues(alpha: 0.3),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  /// Error button shadow
  static List<BoxShadow> errorButton = [
    BoxShadow(
      color: AppColors.error.withValues(alpha: 0.3),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  // ============ Input Shadows ============

  /// Focused input shadow
  static List<BoxShadow> inputFocus = [
    BoxShadow(
      color: AppColors.primary.withValues(alpha: 0.2),
      blurRadius: 4,
      offset: const Offset(0, 0),
    ),
  ];

  /// Error input shadow
  static List<BoxShadow> inputError = [
    BoxShadow(
      color: AppColors.error.withValues(alpha: 0.2),
      blurRadius: 4,
      offset: const Offset(0, 0),
    ),
  ];

  // ============ FAB Shadow ============
  static const List<BoxShadow> fab = [
    BoxShadow(
      color: Color(0x33000000),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];

  // ============ Modal/Dialog Shadow ============
  static const List<BoxShadow> modal = [
    BoxShadow(
      color: Color(0x26000000),
      blurRadius: 24,
      offset: Offset(0, 12),
    ),
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 48,
      offset: Offset(0, 24),
    ),
  ];

  // ============ Bottom Sheet Shadow ============
  static const List<BoxShadow> bottomSheet = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 16,
      offset: Offset(0, -4),
    ),
  ];

  // ============ Top Navigation Shadow ============
  static const List<BoxShadow> topNav = [
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];

  // ============ Inner Shadow ============
  static const List<BoxShadow> innerShadow = [
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 4,
      offset: Offset(0, 2),
      blurStyle: BlurStyle.inner,
    ),
  ];
}
