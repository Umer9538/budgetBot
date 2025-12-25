import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_text_styles.dart';

/// Light input decoration theme
InputDecorationTheme get lightInputDecorationTheme => InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceVariantLight,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingMd,
        vertical: AppDimensions.spacingSm,
      ),
      border: OutlineInputBorder(
        borderRadius: AppDimensions.borderRadiusMd,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppDimensions.borderRadiusMd,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppDimensions.borderRadiusMd,
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: AppDimensions.borderWidthMedium,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppDimensions.borderRadiusMd,
        borderSide: const BorderSide(
          color: AppColors.error,
          width: AppDimensions.borderWidthThin,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppDimensions.borderRadiusMd,
        borderSide: const BorderSide(
          color: AppColors.error,
          width: AppDimensions.borderWidthMedium,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: AppDimensions.borderRadiusMd,
        borderSide: BorderSide.none,
      ),
      labelStyle: AppTextStyles.inputLabel.copyWith(
        color: AppColors.textSecondaryLight,
      ),
      floatingLabelStyle: AppTextStyles.inputLabel.copyWith(
        color: AppColors.primary,
      ),
      hintStyle: AppTextStyles.inputHint.copyWith(
        color: AppColors.textTertiaryLight,
      ),
      errorStyle: AppTextStyles.inputError.copyWith(
        color: AppColors.error,
      ),
      prefixIconColor: AppColors.textSecondaryLight,
      suffixIconColor: AppColors.textSecondaryLight,
    );

/// Dark input decoration theme
InputDecorationTheme get darkInputDecorationTheme => InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceVariantDark,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingMd,
        vertical: AppDimensions.spacingSm,
      ),
      border: OutlineInputBorder(
        borderRadius: AppDimensions.borderRadiusMd,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: AppDimensions.borderRadiusMd,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: AppDimensions.borderRadiusMd,
        borderSide: const BorderSide(
          color: AppColors.primaryLight,
          width: AppDimensions.borderWidthMedium,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: AppDimensions.borderRadiusMd,
        borderSide: const BorderSide(
          color: AppColors.errorLight,
          width: AppDimensions.borderWidthThin,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: AppDimensions.borderRadiusMd,
        borderSide: const BorderSide(
          color: AppColors.errorLight,
          width: AppDimensions.borderWidthMedium,
        ),
      ),
      labelStyle: AppTextStyles.inputLabel.copyWith(
        color: AppColors.textSecondaryDark,
      ),
      floatingLabelStyle: AppTextStyles.inputLabel.copyWith(
        color: AppColors.primaryLight,
      ),
      hintStyle: AppTextStyles.inputHint.copyWith(
        color: AppColors.textTertiaryDark,
      ),
      errorStyle: AppTextStyles.inputError.copyWith(
        color: AppColors.errorLight,
      ),
      prefixIconColor: AppColors.textSecondaryDark,
      suffixIconColor: AppColors.textSecondaryDark,
    );
