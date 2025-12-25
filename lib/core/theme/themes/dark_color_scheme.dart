import 'package:flutter/material.dart';
import '../app_colors.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// Dark Theme Color Scheme - BudgetBot Premium
/// ═══════════════════════════════════════════════════════════════════════════
///
/// Deep midnight violet backgrounds with glowing amethyst and gold accents.
/// ═══════════════════════════════════════════════════════════════════════════

const ColorScheme darkColorScheme = ColorScheme.dark(
  // Primary - Deep Amethyst (lighter for dark mode)
  primary: AppColors.primaryLight,
  onPrimary: AppColors.neutral900,
  primaryContainer: AppColors.primaryDark,
  onPrimaryContainer: AppColors.primaryLight,

  // Secondary - Champagne Gold
  secondary: AppColors.secondaryLight,
  onSecondary: AppColors.neutral900,
  secondaryContainer: AppColors.secondaryDark,
  onSecondaryContainer: AppColors.secondaryLight,

  // Tertiary - Soft Coral
  tertiary: AppColors.tertiaryLight,
  onTertiary: AppColors.neutral900,
  tertiaryContainer: AppColors.tertiaryDark,
  onTertiaryContainer: AppColors.tertiaryLight,

  // Error
  error: AppColors.errorLight,
  onError: AppColors.neutral900,
  errorContainer: AppColors.errorDark,

  // Surfaces - Deep violet tones
  surface: AppColors.surfaceDark,
  onSurface: AppColors.textPrimaryDark,
  surfaceContainerHighest: AppColors.surfaceVariantDark,
  onSurfaceVariant: AppColors.textSecondaryDark,

  // Outline
  outline: AppColors.borderDark,
  outlineVariant: AppColors.dividerDark,

  // Misc
  shadow: AppColors.shadowDark,
  scrim: AppColors.scrimDark,

  // Inverse
  inverseSurface: AppColors.surfaceLight,
  onInverseSurface: AppColors.textPrimaryLight,
  inversePrimary: AppColors.primaryDark,
);
