import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';
import 'button_enums.dart';

/// Builder class for button styles
class ButtonStyleBuilder {
  ButtonStyleBuilder({
    required this.variant,
    required this.size,
    required this.theme,
    required this.isDisabled,
    this.borderRadius,
  });

  final AppButtonVariant variant;
  final AppButtonSize size;
  final ThemeData theme;
  final bool isDisabled;
  final BorderRadius? borderRadius;

  double get height {
    switch (size) {
      case AppButtonSize.small:
        return AppDimensions.buttonHeightSm;
      case AppButtonSize.medium:
        return AppDimensions.buttonHeightMd;
      case AppButtonSize.large:
        return AppDimensions.buttonHeightLg;
    }
  }

  EdgeInsets get padding {
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

  Color get textColor {
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

  BorderSide? get borderSide {
    if (variant != AppButtonVariant.outlined) return null;

    if (isDisabled) {
      return BorderSide(
        color: theme.brightness == Brightness.light
            ? AppColors.neutral300
            : AppColors.neutral600,
        width: AppDimensions.borderWidthThin,
      );
    }

    return BorderSide(
      color: theme.colorScheme.primary,
      width: AppDimensions.borderWidthThin,
    );
  }

  ButtonStyle build() {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(_backgroundColor),
      foregroundColor: WidgetStateProperty.all(textColor),
      padding: WidgetStateProperty.all(padding),
      minimumSize: WidgetStateProperty.all(
        Size(AppDimensions.buttonMinWidth, height),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: borderRadius ?? AppDimensions.borderRadiusMd,
          side: borderSide ?? BorderSide.none,
        ),
      ),
      elevation: WidgetStateProperty.all(AppDimensions.elevationNone),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return textColor.withValues(alpha: 0.12);
        }
        if (states.contains(WidgetState.hovered)) {
          return textColor.withValues(alpha: 0.08);
        }
        return null;
      }),
    );
  }

  Color get _backgroundColor {
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
}
