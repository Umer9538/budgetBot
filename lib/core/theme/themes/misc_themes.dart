import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_text_styles.dart';

/// Light progress indicator theme
const ProgressIndicatorThemeData lightProgressTheme =
    ProgressIndicatorThemeData(
  color: AppColors.primary,
  linearTrackColor: AppColors.primaryContainer,
  circularTrackColor: AppColors.primaryContainer,
);

/// Dark progress indicator theme
const ProgressIndicatorThemeData darkProgressTheme =
    ProgressIndicatorThemeData(
  color: AppColors.primaryLight,
  linearTrackColor: AppColors.primaryDark,
  circularTrackColor: AppColors.primaryDark,
);

/// Light tab bar theme
TabBarThemeData get lightTabBarTheme => TabBarThemeData(
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.textSecondaryLight,
      indicatorColor: AppColors.primary,
      labelStyle: AppTextStyles.labelLarge,
      unselectedLabelStyle: AppTextStyles.labelLarge,
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: Colors.transparent,
    );

/// Dark tab bar theme
TabBarThemeData get darkTabBarTheme => TabBarThemeData(
      labelColor: AppColors.primaryLight,
      unselectedLabelColor: AppColors.textSecondaryDark,
      indicatorColor: AppColors.primaryLight,
      labelStyle: AppTextStyles.labelLarge,
      unselectedLabelStyle: AppTextStyles.labelLarge,
      indicatorSize: TabBarIndicatorSize.label,
      dividerColor: Colors.transparent,
    );

/// Light tooltip theme
TooltipThemeData get lightTooltipTheme => TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.neutral800,
        borderRadius: AppDimensions.borderRadiusSm,
      ),
      textStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.textPrimaryDark,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingSm,
        vertical: AppDimensions.spacingXs,
      ),
    );

/// Dark tooltip theme
TooltipThemeData get darkTooltipTheme => TooltipThemeData(
      decoration: BoxDecoration(
        color: AppColors.neutral200,
        borderRadius: AppDimensions.borderRadiusSm,
      ),
      textStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.textPrimaryLight,
      ),
    );

/// Light badge theme
const BadgeThemeData lightBadgeTheme = BadgeThemeData(
  backgroundColor: AppColors.error,
  textColor: AppColors.onError,
  smallSize: 8,
  largeSize: 16,
  padding: EdgeInsets.symmetric(horizontal: 4),
  textStyle: TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
  ),
);

/// Dark badge theme
const BadgeThemeData darkBadgeTheme = BadgeThemeData(
  backgroundColor: AppColors.errorLight,
  textColor: AppColors.neutral900,
  smallSize: 8,
  largeSize: 16,
);

/// Light popup menu theme
PopupMenuThemeData get lightPopupMenuTheme => PopupMenuThemeData(
      color: AppColors.surfaceLight,
      elevation: AppDimensions.elevationMd,
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusMd,
      ),
      textStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.textPrimaryLight,
      ),
    );

/// Dark popup menu theme
PopupMenuThemeData get darkPopupMenuTheme => PopupMenuThemeData(
      color: AppColors.surfaceDark,
      elevation: AppDimensions.elevationMd,
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusMd,
      ),
      textStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.textPrimaryDark,
      ),
    );
