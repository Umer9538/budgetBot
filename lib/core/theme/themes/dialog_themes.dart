import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_text_styles.dart';

/// Light dialog theme
DialogThemeData get lightDialogTheme => DialogThemeData(
      backgroundColor: AppColors.surfaceLight,
      elevation: AppDimensions.elevationXl,
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusXl,
      ),
      titleTextStyle: AppTextStyles.titleLarge.copyWith(
        color: AppColors.textPrimaryLight,
      ),
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.textSecondaryLight,
      ),
    );

/// Dark dialog theme
DialogThemeData get darkDialogTheme => DialogThemeData(
      backgroundColor: AppColors.surfaceDark,
      elevation: AppDimensions.elevationXl,
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusXl,
      ),
      titleTextStyle: AppTextStyles.titleLarge.copyWith(
        color: AppColors.textPrimaryDark,
      ),
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.textSecondaryDark,
      ),
    );

/// Light bottom sheet theme
const BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
  backgroundColor: AppColors.surfaceLight,
  modalBackgroundColor: AppColors.surfaceLight,
  elevation: AppDimensions.elevationNone,
  shape: RoundedRectangleBorder(
    borderRadius: AppDimensions.borderRadiusTopXl,
  ),
  showDragHandle: true,
  dragHandleColor: AppColors.neutral300,
  dragHandleSize: Size(
    AppDimensions.bottomSheetHandleWidth,
    AppDimensions.bottomSheetHandleHeight,
  ),
);

/// Dark bottom sheet theme
const BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
  backgroundColor: AppColors.surfaceDark,
  modalBackgroundColor: AppColors.surfaceDark,
  elevation: AppDimensions.elevationNone,
  shape: RoundedRectangleBorder(
    borderRadius: AppDimensions.borderRadiusTopXl,
  ),
  showDragHandle: true,
  dragHandleColor: AppColors.neutral600,
  dragHandleSize: Size(
    AppDimensions.bottomSheetHandleWidth,
    AppDimensions.bottomSheetHandleHeight,
  ),
);

/// Light snackbar theme
SnackBarThemeData get lightSnackBarTheme => SnackBarThemeData(
      backgroundColor: AppColors.neutral800,
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.textPrimaryDark,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusMd,
      ),
      behavior: SnackBarBehavior.floating,
      elevation: AppDimensions.elevationMd,
    );

/// Dark snackbar theme
SnackBarThemeData get darkSnackBarTheme => SnackBarThemeData(
      backgroundColor: AppColors.neutral200,
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.textPrimaryLight,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusMd,
      ),
      behavior: SnackBarBehavior.floating,
      elevation: AppDimensions.elevationMd,
    );
