import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../app_dimensions.dart';
import '../app_text_styles.dart';

/// Light bottom navigation bar theme
final BottomNavigationBarThemeData lightBottomNavTheme =
    BottomNavigationBarThemeData(
  backgroundColor: AppColors.surfaceLight,
  selectedItemColor: AppColors.primary,
  unselectedItemColor: AppColors.textTertiaryLight,
  type: BottomNavigationBarType.fixed,
  elevation: AppDimensions.elevationNone,
  selectedLabelStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  ),
  unselectedLabelStyle: const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  ),
);

/// Dark bottom navigation bar theme
const BottomNavigationBarThemeData darkBottomNavTheme =
    BottomNavigationBarThemeData(
  backgroundColor: AppColors.surfaceDark,
  selectedItemColor: AppColors.primaryLight,
  unselectedItemColor: AppColors.textTertiaryDark,
  type: BottomNavigationBarType.fixed,
  elevation: AppDimensions.elevationNone,
);

/// Light navigation bar theme (Material 3)
NavigationBarThemeData get lightNavigationBarTheme => NavigationBarThemeData(
      backgroundColor: AppColors.surfaceLight,
      indicatorColor: AppColors.primaryContainer,
      surfaceTintColor: Colors.transparent,
      elevation: AppDimensions.elevationNone,
      height: AppDimensions.bottomNavHeight,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(
            color: AppColors.primary,
            size: AppDimensions.iconLg,
          );
        }
        return const IconThemeData(
          color: AppColors.textTertiaryLight,
          size: AppDimensions.iconLg,
        );
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppTextStyles.labelSmall.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          );
        }
        return AppTextStyles.labelSmall.copyWith(
          color: AppColors.textTertiaryLight,
        );
      }),
    );

/// Dark navigation bar theme (Material 3)
NavigationBarThemeData get darkNavigationBarTheme => NavigationBarThemeData(
      backgroundColor: AppColors.surfaceDark,
      indicatorColor: AppColors.primaryDark,
      surfaceTintColor: Colors.transparent,
      elevation: AppDimensions.elevationNone,
      height: AppDimensions.bottomNavHeight,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(
            color: AppColors.primaryLight,
            size: AppDimensions.iconLg,
          );
        }
        return const IconThemeData(
          color: AppColors.textTertiaryDark,
          size: AppDimensions.iconLg,
        );
      }),
    );
