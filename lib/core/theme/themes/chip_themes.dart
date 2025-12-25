import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_text_styles.dart';

/// Light chip theme
ChipThemeData get lightChipTheme => ChipThemeData(
      backgroundColor: AppColors.surfaceVariantLight,
      deleteIconColor: AppColors.textSecondaryLight,
      disabledColor: AppColors.neutral200,
      selectedColor: AppColors.primaryContainer,
      secondarySelectedColor: AppColors.primaryContainer,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingSm,
        vertical: AppDimensions.spacingXxs,
      ),
      labelStyle: AppTextStyles.labelMedium.copyWith(
        color: AppColors.textPrimaryLight,
      ),
      secondaryLabelStyle: AppTextStyles.labelMedium.copyWith(
        color: AppColors.textSecondaryLight,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusFull,
      ),
      side: BorderSide.none,
    );

/// Dark chip theme
ChipThemeData get darkChipTheme => ChipThemeData(
      backgroundColor: AppColors.surfaceVariantDark,
      deleteIconColor: AppColors.textSecondaryDark,
      disabledColor: AppColors.neutral700,
      selectedColor: AppColors.primaryDark,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingSm,
        vertical: AppDimensions.spacingXxs,
      ),
      labelStyle: AppTextStyles.labelMedium.copyWith(
        color: AppColors.textPrimaryDark,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusFull,
      ),
      side: BorderSide.none,
    );
