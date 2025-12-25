import 'package:flutter/material.dart';
import 'display_styles.dart';

/// Monospace font family
const String kFontFamilyMono = 'JetBrains Mono';

/// Custom app-specific text styles
class CustomStyles {
  CustomStyles._();

  // Money/Currency Styles
  static const TextStyle moneyLarge = TextStyle(
    fontFamily: kFontFamilyMono,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static const TextStyle moneyMedium = TextStyle(
    fontFamily: kFontFamilyMono,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
    height: 1.25,
  );

  static const TextStyle moneySmall = TextStyle(
    fontFamily: kFontFamilyMono,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    height: 1.5,
  );

  // Button Styles
  static const TextStyle buttonLarge = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    height: 1.5,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
    height: 1.43,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    height: 1.33,
  );

  // Input Styles
  static const TextStyle inputText = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    height: 1.5,
  );

  static const TextStyle inputLabel = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
    height: 1.43,
  );

  static const TextStyle inputHint = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
    height: 1.5,
  );

  static const TextStyle inputError = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
    height: 1.33,
  );
}
