import 'package:flutter/material.dart';
import '../app_colors.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// Light Theme Color Scheme - BudgetBot Premium
/// ═══════════════════════════════════════════════════════════════════════════
///
/// Warm ivory backgrounds with amethyst primary and champagne gold accents.
/// ═══════════════════════════════════════════════════════════════════════════

const ColorScheme lightColorScheme = ColorScheme.light(
  // Primary - Deep Amethyst
  primary: AppColors.primary,
  onPrimary: AppColors.onPrimary,
  primaryContainer: AppColors.primaryContainer,
  onPrimaryContainer: AppColors.onPrimaryContainer,

  // Secondary - Champagne Gold
  secondary: AppColors.secondary,
  onSecondary: AppColors.onSecondary,
  secondaryContainer: AppColors.secondaryContainer,
  onSecondaryContainer: AppColors.onSecondaryContainer,

  // Tertiary - Soft Coral
  tertiary: AppColors.tertiary,
  onTertiary: AppColors.onTertiary,
  tertiaryContainer: AppColors.tertiaryContainer,
  onTertiaryContainer: AppColors.onTertiaryContainer,

  // Error
  error: AppColors.error,
  onError: AppColors.onError,
  errorContainer: AppColors.errorContainer,

  // Surfaces - Warm ivory tones
  surface: AppColors.surfaceLight,
  onSurface: AppColors.textPrimaryLight,
  surfaceContainerHighest: AppColors.surfaceVariantLight,
  onSurfaceVariant: AppColors.textSecondaryLight,

  // Outline
  outline: AppColors.borderLight,
  outlineVariant: AppColors.dividerLight,

  // Misc
  shadow: AppColors.shadowLight,
  scrim: AppColors.scrimLight,

  // Inverse
  inverseSurface: AppColors.surfaceDark,
  onInverseSurface: AppColors.textPrimaryDark,
  inversePrimary: AppColors.primaryLight,
);
