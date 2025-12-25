import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_text_styles.dart';

/// Light switch theme
SwitchThemeData get lightSwitchTheme => SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.onPrimary;
        }
        return AppColors.neutral400;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.neutral200;
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    );

/// Dark switch theme
SwitchThemeData get darkSwitchTheme => SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.neutral900;
        }
        return AppColors.neutral500;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryLight;
        }
        return AppColors.neutral700;
      }),
      trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
    );

/// Light checkbox theme
CheckboxThemeData get lightCheckboxTheme => CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(AppColors.onPrimary),
      side: const BorderSide(
        color: AppColors.neutral400,
        width: AppDimensions.borderWidthMedium,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusXs,
      ),
    );

/// Dark checkbox theme
CheckboxThemeData get darkCheckboxTheme => CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryLight;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(AppColors.neutral900),
      side: const BorderSide(
        color: AppColors.neutral500,
        width: AppDimensions.borderWidthMedium,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusXs,
      ),
    );

/// Light radio theme
RadioThemeData get lightRadioTheme => RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.neutral400;
      }),
    );

/// Dark radio theme
RadioThemeData get darkRadioTheme => RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryLight;
        }
        return AppColors.neutral500;
      }),
    );

/// Light slider theme
SliderThemeData get lightSliderTheme => SliderThemeData(
      activeTrackColor: AppColors.primary,
      inactiveTrackColor: AppColors.primaryContainer,
      thumbColor: AppColors.primary,
      overlayColor: AppColors.primary.withValues(alpha: 0.12),
      valueIndicatorColor: AppColors.primary,
      valueIndicatorTextStyle: AppTextStyles.labelMedium.copyWith(
        color: AppColors.onPrimary,
      ),
    );
