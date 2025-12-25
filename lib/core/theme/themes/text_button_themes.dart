import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_text_styles.dart';

/// Light text button theme
TextButtonThemeData get lightTextButtonTheme => TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        disabledForegroundColor: AppColors.neutral400,
        minimumSize: const Size(
          AppDimensions.buttonMinWidth,
          AppDimensions.buttonHeightMd,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMd,
          vertical: AppDimensions.spacingSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusMd,
        ),
        textStyle: AppTextStyles.buttonMedium,
      ),
    );

/// Dark text button theme
TextButtonThemeData get darkTextButtonTheme => TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        disabledForegroundColor: AppColors.neutral500,
        textStyle: AppTextStyles.buttonMedium,
      ),
    );

/// Light icon button theme
IconButtonThemeData get lightIconButtonTheme => IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppColors.textPrimaryLight,
        disabledForegroundColor: AppColors.neutral400,
        minimumSize: const Size(
          AppDimensions.buttonHeightMd,
          AppDimensions.buttonHeightMd,
        ),
        iconSize: AppDimensions.iconLg,
      ),
    );

/// Light FAB theme
const FloatingActionButtonThemeData lightFabTheme =
    FloatingActionButtonThemeData(
  backgroundColor: AppColors.primary,
  foregroundColor: AppColors.onPrimary,
  elevation: AppDimensions.elevationMd,
  focusElevation: AppDimensions.elevationLg,
  hoverElevation: AppDimensions.elevationLg,
  highlightElevation: AppDimensions.elevationLg,
  shape: CircleBorder(),
);

/// Dark FAB theme
const FloatingActionButtonThemeData darkFabTheme =
    FloatingActionButtonThemeData(
  backgroundColor: AppColors.primaryLight,
  foregroundColor: AppColors.neutral900,
  elevation: AppDimensions.elevationMd,
  shape: CircleBorder(),
);
