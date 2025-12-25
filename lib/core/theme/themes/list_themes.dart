import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_text_styles.dart';

/// Light card theme
const CardThemeData lightCardTheme = CardThemeData(
  color: AppColors.cardLight,
  elevation: AppDimensions.elevationNone,
  shadowColor: AppColors.shadowLight,
  surfaceTintColor: Colors.transparent,
);

/// Dark card theme
const CardThemeData darkCardTheme = CardThemeData(
  color: AppColors.cardDark,
  elevation: AppDimensions.elevationNone,
  shadowColor: AppColors.shadowDark,
  surfaceTintColor: Colors.transparent,
);

/// Light divider theme
const DividerThemeData lightDividerTheme = DividerThemeData(
  color: AppColors.dividerLight,
  thickness: AppDimensions.dividerThickness,
  space: AppDimensions.spacingMd,
);

/// Dark divider theme
const DividerThemeData darkDividerTheme = DividerThemeData(
  color: AppColors.dividerDark,
  thickness: AppDimensions.dividerThickness,
  space: AppDimensions.spacingMd,
);

/// Light list tile theme
ListTileThemeData get lightListTileTheme => ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingMd,
        vertical: AppDimensions.spacingXs,
      ),
      minLeadingWidth: AppDimensions.iconLg,
      iconColor: AppColors.textSecondaryLight,
      textColor: AppColors.textPrimaryLight,
      titleTextStyle: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.textPrimaryLight,
      ),
      subtitleTextStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.textSecondaryLight,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusMd,
      ),
    );

/// Dark list tile theme
ListTileThemeData get darkListTileTheme => ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingMd,
        vertical: AppDimensions.spacingXs,
      ),
      iconColor: AppColors.textSecondaryDark,
      textColor: AppColors.textPrimaryDark,
      titleTextStyle: AppTextStyles.bodyLarge.copyWith(
        color: AppColors.textPrimaryDark,
      ),
      subtitleTextStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.textSecondaryDark,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusMd,
      ),
    );
