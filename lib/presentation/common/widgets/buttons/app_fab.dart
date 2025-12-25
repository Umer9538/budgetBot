import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

/// FAB size variants
enum AppFabSize {
  small,
  regular,
  large,
  extended,
}

/// A customizable Floating Action Button
class AppFab extends StatelessWidget {
  /// Creates an AppFab
  const AppFab({
    super.key,
    required this.icon,
    this.onPressed,
    this.label,
    this.size = AppFabSize.regular,
    this.backgroundColor,
    this.foregroundColor,
    this.tooltip,
    this.heroTag,
    this.isLoading = false,
    this.enabled = true,
  });

  /// Icon to display
  final IconData icon;

  /// Called when pressed
  final VoidCallback? onPressed;

  /// Optional label (for extended FAB)
  final String? label;

  /// FAB size
  final AppFabSize size;

  /// Custom background color
  final Color? backgroundColor;

  /// Custom foreground (icon/text) color
  final Color? foregroundColor;

  /// Tooltip text
  final String? tooltip;

  /// Hero tag for animations
  final Object? heroTag;

  /// Whether FAB is in loading state
  final bool isLoading;

  /// Whether FAB is enabled
  final bool enabled;

  double get _size {
    switch (size) {
      case AppFabSize.small:
        return AppDimensions.fabSizeSmall;
      case AppFabSize.regular:
        return AppDimensions.fabSize;
      case AppFabSize.large:
        return 72;
      case AppFabSize.extended:
        return AppDimensions.fabSize;
    }
  }

  double get _iconSize {
    switch (size) {
      case AppFabSize.small:
        return AppDimensions.iconMd;
      case AppFabSize.regular:
        return AppDimensions.iconLg;
      case AppFabSize.large:
        return AppDimensions.iconXl;
      case AppFabSize.extended:
        return AppDimensions.iconLg;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDisabled = !enabled || isLoading;
    final effectiveOnPressed = isDisabled ? null : onPressed;

    final bgColor = isDisabled
        ? theme.colorScheme.onSurface.withValues(alpha: 0.12)
        : backgroundColor ?? theme.colorScheme.primary;

    final fgColor = isDisabled
        ? theme.colorScheme.onSurface.withValues(alpha: 0.38)
        : foregroundColor ?? theme.colorScheme.onPrimary;

    Widget iconWidget = isLoading
        ? SizedBox(
            width: _iconSize,
            height: _iconSize,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(fgColor),
            ),
          )
        : Icon(icon, size: _iconSize);

    Widget fab;

    // Extended FAB with label
    if (size == AppFabSize.extended && label != null) {
      fab = FloatingActionButton.extended(
        onPressed: effectiveOnPressed,
        heroTag: heroTag,
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        icon: iconWidget,
        label: Text(
          label!,
          style: AppTextStyles.buttonMedium.copyWith(color: fgColor),
        ),
      );
    }
    // Small FAB
    else if (size == AppFabSize.small) {
      fab = FloatingActionButton.small(
        onPressed: effectiveOnPressed,
        heroTag: heroTag,
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        child: iconWidget,
      );
    }
    // Large FAB
    else if (size == AppFabSize.large) {
      fab = FloatingActionButton.large(
        onPressed: effectiveOnPressed,
        heroTag: heroTag,
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        child: iconWidget,
      );
    }
    // Regular FAB
    else {
      fab = FloatingActionButton(
        onPressed: effectiveOnPressed,
        heroTag: heroTag,
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        child: iconWidget,
      );
    }

    // Add tooltip if provided
    if (tooltip != null) {
      return Tooltip(
        message: tooltip!,
        child: fab,
      );
    }

    return fab;
  }
}
