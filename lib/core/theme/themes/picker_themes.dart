import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_dimensions.dart';

/// Light date picker theme
DatePickerThemeData get lightDatePickerTheme => DatePickerThemeData(
      backgroundColor: AppColors.surfaceLight,
      headerBackgroundColor: AppColors.primary,
      headerForegroundColor: AppColors.onPrimary,
      dayForegroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.onPrimary;
        }
        return AppColors.textPrimaryLight;
      }),
      dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return Colors.transparent;
      }),
      todayForegroundColor: WidgetStateProperty.all(AppColors.primary),
      todayBackgroundColor: WidgetStateProperty.all(Colors.transparent),
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusXl,
      ),
    );

/// Light time picker theme
TimePickerThemeData get lightTimePickerTheme => TimePickerThemeData(
      backgroundColor: AppColors.surfaceLight,
      hourMinuteColor: AppColors.surfaceVariantLight,
      hourMinuteTextColor: AppColors.textPrimaryLight,
      dialBackgroundColor: AppColors.surfaceVariantLight,
      dialHandColor: AppColors.primary,
      dialTextColor: AppColors.textPrimaryLight,
      entryModeIconColor: AppColors.textSecondaryLight,
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusXl,
      ),
    );

/// Light drawer theme
const DrawerThemeData lightDrawerTheme = DrawerThemeData(
  backgroundColor: AppColors.surfaceLight,
  elevation: AppDimensions.elevationLg,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(AppDimensions.radiusXl),
      bottomRight: Radius.circular(AppDimensions.radiusXl),
    ),
  ),
);

/// Dark drawer theme
const DrawerThemeData darkDrawerTheme = DrawerThemeData(
  backgroundColor: AppColors.surfaceDark,
  elevation: AppDimensions.elevationLg,
);

/// Light scrollbar theme
ScrollbarThemeData get lightScrollbarTheme => ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(AppColors.neutral400),
      trackColor: WidgetStateProperty.all(Colors.transparent),
      radius: const Radius.circular(AppDimensions.radiusFull),
      thickness: WidgetStateProperty.all(6),
      thumbVisibility: WidgetStateProperty.all(false),
    );

/// Action icons theme
ActionIconThemeData get actionIconTheme => ActionIconThemeData(
      backButtonIconBuilder: (context) =>
          const Icon(Icons.arrow_back_ios_new),
      closeButtonIconBuilder: (context) => const Icon(Icons.close),
    );

/// Page transitions theme
const PageTransitionsTheme pageTransitionsTheme = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  },
);
