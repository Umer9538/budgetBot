import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_text_styles.dart';

/// Light elevated button theme
ElevatedButtonThemeData get lightElevatedButtonTheme => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        disabledBackgroundColor: AppColors.neutral200,
        disabledForegroundColor: AppColors.neutral400,
        elevation: AppDimensions.elevationNone,
        shadowColor: Colors.transparent,
        minimumSize: const Size(
          AppDimensions.buttonMinWidth,
          AppDimensions.buttonHeightMd,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingLg,
          vertical: AppDimensions.spacingSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusMd,
        ),
        textStyle: AppTextStyles.buttonMedium,
      ),
    );

/// Dark elevated button theme
ElevatedButtonThemeData get darkElevatedButtonTheme => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.neutral900,
        disabledBackgroundColor: AppColors.neutral700,
        disabledForegroundColor: AppColors.neutral500,
        elevation: AppDimensions.elevationNone,
        shadowColor: Colors.transparent,
        minimumSize: const Size(
          AppDimensions.buttonMinWidth,
          AppDimensions.buttonHeightMd,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingLg,
          vertical: AppDimensions.spacingSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusMd,
        ),
        textStyle: AppTextStyles.buttonMedium,
      ),
    );

/// Light filled button theme
FilledButtonThemeData get lightFilledButtonTheme => FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        disabledBackgroundColor: AppColors.neutral200,
        disabledForegroundColor: AppColors.neutral400,
        minimumSize: const Size(
          AppDimensions.buttonMinWidth,
          AppDimensions.buttonHeightMd,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingLg,
          vertical: AppDimensions.spacingSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusMd,
        ),
        textStyle: AppTextStyles.buttonMedium,
      ),
    );

/// Light outlined button theme
OutlinedButtonThemeData get lightOutlinedButtonTheme => OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        disabledForegroundColor: AppColors.neutral400,
        minimumSize: const Size(
          AppDimensions.buttonMinWidth,
          AppDimensions.buttonHeightMd,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingLg,
          vertical: AppDimensions.spacingSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusMd,
        ),
        side: const BorderSide(
          color: AppColors.primary,
          width: AppDimensions.borderWidthThin,
        ),
        textStyle: AppTextStyles.buttonMedium,
      ),
    );

/// Dark outlined button theme
OutlinedButtonThemeData get darkOutlinedButtonTheme => OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        disabledForegroundColor: AppColors.neutral500,
        minimumSize: const Size(
          AppDimensions.buttonMinWidth,
          AppDimensions.buttonHeightMd,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingLg,
          vertical: AppDimensions.spacingSm,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusMd,
        ),
        side: const BorderSide(
          color: AppColors.primaryLight,
          width: AppDimensions.borderWidthThin,
        ),
        textStyle: AppTextStyles.buttonMedium,
      ),
    );
