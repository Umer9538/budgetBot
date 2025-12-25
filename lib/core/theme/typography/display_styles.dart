import 'package:flutter/material.dart';

/// Font family constant
const String kFontFamily = 'Inter';

/// Display text styles (large headlines)
class DisplayStyles {
  DisplayStyles._();

  static const TextStyle displayLarge = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    height: 1.12,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 45,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.16,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: kFontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    letterSpacing: 0,
    height: 1.22,
  );
}
