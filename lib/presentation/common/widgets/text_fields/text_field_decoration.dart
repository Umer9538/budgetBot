import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';
import 'text_field_enums.dart';

/// Builder class for text field decorations
class TextFieldDecorationBuilder {
  TextFieldDecorationBuilder({
    required this.size,
    required this.theme,
    required this.hasError,
    this.hint,
    this.filled = true,
    this.borderRadius,
    this.contentPadding,
    this.showCounter = false,
    this.prefixIcon,
    this.prefix,
    this.suffix,
    this.suffixIcon,
  });

  final AppTextFieldSize size;
  final ThemeData theme;
  final bool hasError;
  final String? hint;
  final bool filled;
  final BorderRadius? borderRadius;
  final EdgeInsets? contentPadding;
  final bool showCounter;
  final IconData? prefixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? suffixIcon;

  double get height {
    switch (size) {
      case AppTextFieldSize.small:
        return AppDimensions.inputHeightSm;
      case AppTextFieldSize.medium:
        return AppDimensions.inputHeightMd;
      case AppTextFieldSize.large:
        return AppDimensions.inputHeightLg;
    }
  }

  EdgeInsets get padding {
    if (contentPadding != null) return contentPadding!;

    switch (size) {
      case AppTextFieldSize.small:
        return const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingSm,
          vertical: AppDimensions.spacingXs,
        );
      case AppTextFieldSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMd,
          vertical: AppDimensions.spacingSm,
        );
      case AppTextFieldSize.large:
        return const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMd,
          vertical: AppDimensions.spacingMd,
        );
    }
  }

  TextStyle get textStyle {
    switch (size) {
      case AppTextFieldSize.small:
        return AppTextStyles.bodySmall;
      case AppTextFieldSize.medium:
        return AppTextStyles.bodyMedium;
      case AppTextFieldSize.large:
        return AppTextStyles.bodyLarge;
    }
  }

  BorderRadius get radius => borderRadius ?? AppDimensions.borderRadiusMd;

  InputDecoration build() {
    return InputDecoration(
      hintText: hint,
      filled: filled,
      contentPadding: padding,
      counterText: showCounter ? null : '',
      prefixIcon: prefix ??
          (prefixIcon != null
              ? Icon(prefixIcon, size: AppDimensions.iconMd)
              : null),
      suffixIcon: suffix ?? suffixIcon,
      border: OutlineInputBorder(borderRadius: radius),
      enabledBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: hasError
            ? BorderSide(
                color: theme.colorScheme.error,
                width: AppDimensions.borderWidthThin,
              )
            : BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(
          color: hasError ? theme.colorScheme.error : theme.colorScheme.primary,
          width: AppDimensions.borderWidthMedium,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(
          color: theme.colorScheme.error,
          width: AppDimensions.borderWidthThin,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: radius,
        borderSide: BorderSide(
          color: theme.colorScheme.error,
          width: AppDimensions.borderWidthMedium,
        ),
      ),
    );
  }
}
