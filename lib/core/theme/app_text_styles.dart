import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Application typography styles - Neo-Fintech Edition
class AppTextStyles {
  AppTextStyles._();

  /// Font family name for manual use
  static String get fontFamily => GoogleFonts.outfit().fontFamily ?? 'Outfit';

  // Base TextTheme using Outfit
  static TextTheme get _baseTextTheme => GoogleFonts.outfitTextTheme();

  // Display
  static TextStyle get displayLarge => _baseTextTheme.displayLarge!.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.25,
  );
  static TextStyle get displayMedium => _baseTextTheme.displayMedium!.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
  );
  static TextStyle get displaySmall => _baseTextTheme.displaySmall!.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    letterSpacing: 0,
  );

  // Headline
  static TextStyle get headlineLarge => _baseTextTheme.headlineLarge!.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );
  static TextStyle get headlineMedium => _baseTextTheme.headlineMedium!.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );
  static TextStyle get headlineSmall => _baseTextTheme.headlineSmall!.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );

  // Title
  static TextStyle get titleLarge => _baseTextTheme.titleLarge!.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );
  static TextStyle get titleMedium => _baseTextTheme.titleMedium!.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );
  static TextStyle get titleSmall => _baseTextTheme.titleSmall!.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  // Body
  static TextStyle get bodyLarge => _baseTextTheme.bodyLarge!.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.5,
  );
  static TextStyle get bodyMedium => _baseTextTheme.bodyMedium!.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.25,
  );
  static TextStyle get bodySmall => _baseTextTheme.bodySmall!.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
  );

  // Label
  static TextStyle get labelLarge => _baseTextTheme.labelLarge!.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );
  static TextStyle get labelMedium => _baseTextTheme.labelMedium!.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );
  static TextStyle get labelSmall => _baseTextTheme.labelSmall!.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  // Custom Money Styles
  static TextStyle get moneyLarge => displaySmall.copyWith(
    fontWeight: FontWeight.w700,
    letterSpacing: -1.0,
  );
  static TextStyle get moneyMedium => headlineMedium.copyWith(
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );
  static TextStyle get moneySmall => titleLarge.copyWith(
    fontWeight: FontWeight.w700,
    letterSpacing: -0.25,
  );

  // Button Styles
  static TextStyle get buttonLarge => labelLarge.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
  static TextStyle get buttonMedium => labelLarge.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.25,
  );
  static TextStyle get buttonSmall => labelMedium.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
  );

  // Input Styles
  static TextStyle get inputLabel => labelLarge.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );
  static TextStyle get inputHint => bodyMedium.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );
  static TextStyle get inputError => labelSmall.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.4,
  );

  // Caption Style
  static TextStyle get caption => labelSmall.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
  );

  // Text Themes
  static TextTheme get lightTextTheme => _buildTextTheme(
    AppColors.textPrimaryLight,
    AppColors.textSecondaryLight,
    AppColors.textSecondaryLight, // Tertiary mapping
  );

  static TextTheme get darkTextTheme => _buildTextTheme(
    AppColors.textPrimaryDark,
    AppColors.textSecondaryDark,
    AppColors.textSecondaryDark, // Tertiary mapping
  );

  static TextTheme _buildTextTheme(
    Color primary,
    Color secondary,
    Color tertiary,
  ) {
    final base = _baseTextTheme;
    return base.copyWith(
      displayLarge: displayLarge.copyWith(color: primary),
      displayMedium: displayMedium.copyWith(color: primary),
      displaySmall: displaySmall.copyWith(color: primary),
      headlineLarge: headlineLarge.copyWith(color: primary),
      headlineMedium: headlineMedium.copyWith(color: primary),
      headlineSmall: headlineSmall.copyWith(color: primary),
      titleLarge: titleLarge.copyWith(color: primary),
      titleMedium: titleMedium.copyWith(color: primary),
      titleSmall: titleSmall.copyWith(color: primary),
      bodyLarge: bodyLarge.copyWith(color: primary),
      bodyMedium: bodyMedium.copyWith(color: secondary),
      bodySmall: bodySmall.copyWith(color: tertiary),
      labelLarge: labelLarge.copyWith(color: primary),
      labelMedium: labelMedium.copyWith(color: secondary),
      labelSmall: labelSmall.copyWith(color: tertiary),
    );
  }
}
