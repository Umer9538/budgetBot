import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

/// Icon button variants
enum AppIconButtonVariant {
  /// Standard icon button
  standard,
  /// Filled background
  filled,
  /// Filled with tonal color
  tonal,
  /// Outlined with border
  outlined,
}

/// Icon button sizes
enum AppIconButtonSize {
  small,
  medium,
  large,
}

/// A customizable icon button widget
class AppIconButton extends StatelessWidget {
  /// Creates an AppIconButton
  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.variant = AppIconButtonVariant.standard,
    this.size = AppIconButtonSize.medium,
    this.color,
    this.backgroundColor,
    this.tooltip,
    this.enabled = true,
    this.isLoading = false,
    this.badge,
  });

  /// Icon to display
  final IconData icon;

  /// Called when pressed
  final VoidCallback? onPressed;

  /// Button variant
  final AppIconButtonVariant variant;

  /// Button size
  final AppIconButtonSize size;

  /// Custom icon color
  final Color? color;

  /// Custom background color (for filled/tonal variants)
  final Color? backgroundColor;

  /// Tooltip text
  final String? tooltip;

  /// Whether button is enabled
  final bool enabled;

  /// Whether button is in loading state
  final bool isLoading;

  /// Badge widget to show (e.g., notification count)
  final Widget? badge;

  double get _size {
    switch (size) {
      case AppIconButtonSize.small:
        return AppDimensions.buttonHeightSm;
      case AppIconButtonSize.medium:
        return AppDimensions.buttonHeightMd;
      case AppIconButtonSize.large:
        return AppDimensions.buttonHeightLg;
    }
  }

  double get _iconSize {
    switch (size) {
      case AppIconButtonSize.small:
        return AppDimensions.iconSm;
      case AppIconButtonSize.medium:
        return AppDimensions.iconMd;
      case AppIconButtonSize.large:
        return AppDimensions.iconLg;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDisabled = !enabled || isLoading;

    Widget button = _buildButton(context, theme, isDisabled);

    // Add tooltip if provided
    if (tooltip != null) {
      button = Tooltip(
        message: tooltip!,
        child: button,
      );
    }

    // Add badge if provided
    if (badge != null) {
      button = Badge(
        label: badge,
        child: button,
      );
    }

    return button;
  }

  Widget _buildButton(BuildContext context, ThemeData theme, bool isDisabled) {
    final effectiveOnPressed = isDisabled ? null : onPressed;

    // Loading indicator
    Widget iconWidget = isLoading
        ? SizedBox(
            width: _iconSize,
            height: _iconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                _getIconColor(theme, isDisabled),
              ),
            ),
          )
        : Icon(
            icon,
            size: _iconSize,
            color: _getIconColor(theme, isDisabled),
          );

    switch (variant) {
      case AppIconButtonVariant.standard:
        return SizedBox(
          width: _size,
          height: _size,
          child: IconButton(
            onPressed: effectiveOnPressed,
            icon: iconWidget,
            style: IconButton.styleFrom(
              foregroundColor: _getIconColor(theme, isDisabled),
            ),
          ),
        );

      case AppIconButtonVariant.filled:
        return SizedBox(
          width: _size,
          height: _size,
          child: IconButton.filled(
            onPressed: effectiveOnPressed,
            icon: iconWidget,
            style: IconButton.styleFrom(
              backgroundColor: isDisabled
                  ? theme.colorScheme.onSurface.withValues(alpha: 0.12)
                  : backgroundColor ?? theme.colorScheme.primary,
              foregroundColor: isDisabled
                  ? theme.colorScheme.onSurface.withValues(alpha: 0.38)
                  : color ?? theme.colorScheme.onPrimary,
            ),
          ),
        );

      case AppIconButtonVariant.tonal:
        return SizedBox(
          width: _size,
          height: _size,
          child: IconButton.filledTonal(
            onPressed: effectiveOnPressed,
            icon: iconWidget,
            style: IconButton.styleFrom(
              backgroundColor: isDisabled
                  ? theme.colorScheme.onSurface.withValues(alpha: 0.12)
                  : backgroundColor ?? theme.colorScheme.primaryContainer,
              foregroundColor: isDisabled
                  ? theme.colorScheme.onSurface.withValues(alpha: 0.38)
                  : color ?? theme.colorScheme.onPrimaryContainer,
            ),
          ),
        );

      case AppIconButtonVariant.outlined:
        return SizedBox(
          width: _size,
          height: _size,
          child: IconButton.outlined(
            onPressed: effectiveOnPressed,
            icon: iconWidget,
            style: IconButton.styleFrom(
              foregroundColor: isDisabled
                  ? theme.colorScheme.onSurface.withValues(alpha: 0.38)
                  : color ?? theme.colorScheme.primary,
              side: BorderSide(
                color: isDisabled
                    ? theme.colorScheme.onSurface.withValues(alpha: 0.12)
                    : theme.colorScheme.outline,
              ),
            ),
          ),
        );
    }
  }

  Color _getIconColor(ThemeData theme, bool isDisabled) {
    if (isDisabled) {
      return theme.colorScheme.onSurface.withValues(alpha: 0.38);
    }

    if (color != null) return color!;

    switch (variant) {
      case AppIconButtonVariant.standard:
        return theme.colorScheme.onSurfaceVariant;
      case AppIconButtonVariant.filled:
        return theme.colorScheme.onPrimary;
      case AppIconButtonVariant.tonal:
        return theme.colorScheme.onPrimaryContainer;
      case AppIconButtonVariant.outlined:
        return theme.colorScheme.primary;
    }
  }
}
