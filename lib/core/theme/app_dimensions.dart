import 'package:flutter/material.dart';
import 'dimensions/dimensions.dart';

/// Application dimensions - consolidated exports
class AppDimensions {
  AppDimensions._();

  // Spacing
  static const double spacingXxs = Spacing.xxs;
  static const double spacingXs = Spacing.xs;
  static const double spacingSm = Spacing.sm;
  static const double spacingMd = Spacing.md;
  static const double spacingLg = Spacing.lg;
  static const double spacingXl = Spacing.xl;
  static const double spacingXxl = Spacing.xxl;
  static const double spacingXxxl = Spacing.xxxl;
  static const double spacingHuge = Spacing.huge;

  // Padding
  static const EdgeInsets screenPadding = Spacing.screen;
  static const EdgeInsets screenPaddingHorizontal = Spacing.screenHorizontal;

  // Border Radius Values
  static const double radiusXs = Radii.xs;
  static const double radiusSm = Radii.sm;
  static const double radiusMd = Radii.md;
  static const double radiusLg = Radii.lg;
  static const double radiusXl = Radii.xl;
  static const double radiusFull = Radii.full;

  // BorderRadius Objects
  static const BorderRadius borderRadiusXs = Radii.radiusXs;
  static const BorderRadius borderRadiusSm = Radii.radiusSm;
  static const BorderRadius borderRadiusMd = Radii.radiusMd;
  static const BorderRadius borderRadiusLg = Radii.radiusLg;
  static const BorderRadius borderRadiusXl = Radii.radiusXl;
  static const BorderRadius borderRadiusFull = Radii.radiusFull;
  static const BorderRadius borderRadiusTopMd = Radii.topMd;
  static const BorderRadius borderRadiusTopXl = Radii.topXl;

  // Icon Sizes
  static const double iconXs = Sizes.iconXs;
  static const double iconSm = Sizes.iconSm;
  static const double iconMd = Sizes.iconMd;
  static const double iconLg = Sizes.iconLg;
  static const double iconXl = Sizes.iconXl;

  // Button Sizes
  static const double buttonHeightSm = Sizes.buttonHeightSm;
  static const double buttonHeightMd = Sizes.buttonHeightMd;
  static const double buttonHeightLg = Sizes.buttonHeightLg;
  static const double buttonMinWidth = Sizes.buttonMinWidth;

  // Input Sizes
  static const double inputHeightSm = Sizes.inputHeightSm;
  static const double inputHeightMd = Sizes.inputHeightMd;
  static const double inputHeightLg = Sizes.inputHeightLg;

  // FAB
  static const double fabSize = Sizes.fabSize;
  static const double fabSizeSmall = Sizes.fabSizeSmall;

  // Layout
  static const double bottomNavHeight = Layout.bottomNavHeight;
  static const double bottomSheetHandleWidth = Layout.bottomSheetHandleWidth;
  static const double bottomSheetHandleHeight = Layout.bottomSheetHandleHeight;

  // Border & Divider
  static const double dividerThickness = Layout.dividerThickness;
  static const double borderWidthThin = Layout.borderWidthThin;
  static const double borderWidthMedium = Layout.borderWidthMedium;
  static const double borderWidthThick = Layout.borderWidthThick;

  // Elevation
  static const double elevationNone = Layout.elevationNone;
  static const double elevationXs = Layout.elevationXs;
  static const double elevationSm = Layout.elevationSm;
  static const double elevationMd = Layout.elevationMd;
  static const double elevationLg = Layout.elevationLg;
  static const double elevationXl = Layout.elevationXl;
}
