import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';
import 'button_enums.dart';

/// Mixin for button style helpers
mixin ButtonStyleMixin {
  AppButtonSize get size;
  AppButtonVariant get variant;
  BorderRadius? get borderRadius;

  double get buttonHeight {
    switch (size) {
      case AppButtonSize.small:
        return AppDimensions.buttonHeightSm;
      case AppButtonSize.medium:
        return AppDimensions.buttonHeightMd;
      case AppButtonSize.large:
        return AppDimensions.buttonHeightLg;
    }
  }

  EdgeInsets get buttonPadding {
    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingSm,
          vertical: AppDimensions.spacingXs,
        );
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingMd,
          vertical: AppDimensions.spacingSm,
        );
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingLg,
          vertical: AppDimensions.spacingMd,
        );
    }
  }

  TextStyle get buttonTextStyle {
    switch (size) {
      case AppButtonSize.small:
        return AppTextStyles.buttonSmall;
      case AppButtonSize.medium:
        return AppTextStyles.buttonMedium;
      case AppButtonSize.large:
        return AppTextStyles.buttonLarge;
    }
  }

  double get buttonIconSize {
    switch (size) {
      case AppButtonSize.small:
        return AppDimensions.iconSm;
      case AppButtonSize.medium:
        return AppDimensions.iconMd;
      case AppButtonSize.large:
        return AppDimensions.iconLg;
    }
  }

  double get buttonIconSpacing {
    switch (size) {
      case AppButtonSize.small:
        return AppDimensions.spacingXxs;
      case AppButtonSize.medium:
        return AppDimensions.spacingXs;
      case AppButtonSize.large:
        return AppDimensions.spacingSm;
    }
  }

  Color getBackgroundColor(ThemeData theme, bool isDisabled) {
    if (isDisabled) {
      return theme.brightness == Brightness.light
          ? AppColors.neutral200
          : AppColors.neutral700;
    }

    switch (variant) {
      case AppButtonVariant.primary:
        return theme.colorScheme.primary;
      case AppButtonVariant.secondary:
        return theme.colorScheme.secondary;
      case AppButtonVariant.success:
        return AppColors.success;
      case AppButtonVariant.danger:
        return AppColors.error;
      case AppButtonVariant.outlined:
      case AppButtonVariant.text:
      case AppButtonVariant.ghost:
        return Colors.transparent;
    }
  }

  Color getTextColor(ThemeData theme, bool isDisabled) {
    if (isDisabled) {
      return theme.brightness == Brightness.light
          ? AppColors.neutral400
          : AppColors.neutral500;
    }

    switch (variant) {
      case AppButtonVariant.primary:
        return theme.colorScheme.onPrimary;
      case AppButtonVariant.secondary:
        return theme.colorScheme.onSecondary;
      case AppButtonVariant.success:
        return AppColors.onSuccess;
      case AppButtonVariant.danger:
        return AppColors.onError;
      case AppButtonVariant.outlined:
      case AppButtonVariant.text:
        return theme.colorScheme.primary;
      case AppButtonVariant.ghost:
        return theme.colorScheme.onSurface;
    }
  }
}
