import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../app_colors.dart';
import '../app_dimensions.dart';

/// Light theme app bar
final AppBarTheme lightAppBarTheme = AppBarTheme(
  elevation: AppDimensions.elevationNone,
  scrolledUnderElevation: AppDimensions.elevationXs,
  backgroundColor: AppColors.surfaceLight,
  foregroundColor: AppColors.textPrimaryLight,
  surfaceTintColor: Colors.transparent,
  centerTitle: true,
  systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ),
  titleTextStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryLight,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.textPrimaryLight,
    size: AppDimensions.iconLg,
  ),
);

/// Dark theme app bar
final AppBarTheme darkAppBarTheme = AppBarTheme(
  elevation: AppDimensions.elevationNone,
  scrolledUnderElevation: AppDimensions.elevationXs,
  backgroundColor: AppColors.surfaceDark,
  foregroundColor: AppColors.textPrimaryDark,
  surfaceTintColor: Colors.transparent,
  centerTitle: true,
  systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  ),
  titleTextStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryDark,
  ),
  iconTheme: const IconThemeData(
    color: AppColors.textPrimaryDark,
    size: AppDimensions.iconLg,
  ),
);
