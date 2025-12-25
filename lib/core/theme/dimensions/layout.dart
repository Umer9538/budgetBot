import 'package:flutter/material.dart';

/// Layout constants (app bar, bottom nav, etc.)
class Layout {
  Layout._();

  // App Bar
  static const double appBarHeight = 56.0;
  static const double appBarHeightLg = 64.0;

  // Bottom Navigation
  static const double bottomNavHeight = 80.0;
  static const double bottomNavItemWidth = 64.0;

  // Bottom Sheet
  static const double bottomSheetHandleWidth = 40.0;
  static const double bottomSheetHandleHeight = 4.0;
  static const double bottomSheetMinHeight = 200.0;
  static const double bottomSheetMaxHeightRatio = 0.9;

  // Card
  static const double cardMinHeight = 80.0;
  static const double cardMaxWidth = 400.0;

  // Max Widths
  static const double maxContentWidth = 600.0;
  static const double maxFormWidth = 400.0;
  static const double maxDialogWidth = 320.0;

  // Divider
  static const double dividerThickness = 1.0;
  static const double dividerThicknessBold = 2.0;

  // Border Width
  static const double borderWidthThin = 1.0;
  static const double borderWidthMedium = 1.5;
  static const double borderWidthThick = 2.0;

  // Elevation
  static const double elevationNone = 0.0;
  static const double elevationXs = 1.0;
  static const double elevationSm = 2.0;
  static const double elevationMd = 4.0;
  static const double elevationLg = 8.0;
  static const double elevationXl = 16.0;

  // Breakpoints
  static const double breakpointMobile = 480.0;
  static const double breakpointTablet = 768.0;
  static const double breakpointDesktop = 1024.0;
  static const double breakpointWide = 1440.0;

  // Animation
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
  static const Curve animationCurve = Curves.easeInOut;
}

/// Extension for responsive sizing
extension ResponsiveLayout on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  bool get isMobile => screenWidth < Layout.breakpointTablet;
  bool get isTablet =>
      screenWidth >= Layout.breakpointTablet &&
      screenWidth < Layout.breakpointDesktop;
  bool get isDesktop => screenWidth >= Layout.breakpointDesktop;
}
