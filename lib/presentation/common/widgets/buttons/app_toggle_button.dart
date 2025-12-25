import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

/// A toggle/switch button with optional label
class AppToggleButton extends StatelessWidget {
  /// Creates an AppToggleButton
  const AppToggleButton({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.subtitle,
    this.enabled = true,
    this.activeColor,
    this.inactiveColor,
    this.showAsListTile = true,
    this.leading,
  });

  /// Current toggle value
  final bool value;

  /// Called when toggle changes
  final ValueChanged<bool>? onChanged;

  /// Optional label text
  final String? label;

  /// Optional subtitle text
  final String? subtitle;

  /// Whether toggle is enabled
  final bool enabled;

  /// Custom active track color
  final Color? activeColor;

  /// Custom inactive track color
  final Color? inactiveColor;

  /// Whether to display as a list tile
  final bool showAsListTile;

  /// Optional leading widget
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final switchWidget = Switch(
      value: value,
      onChanged: enabled ? onChanged : null,
      activeColor: theme.colorScheme.onPrimary,
      activeTrackColor: activeColor ?? theme.colorScheme.primary,
      inactiveThumbColor: theme.colorScheme.outline,
      inactiveTrackColor: inactiveColor ?? theme.colorScheme.surfaceContainerHighest,
    );

    // Just the switch
    if (!showAsListTile || label == null) {
      return switchWidget;
    }

    // As a list tile
    return ListTile(
      leading: leading,
      title: Text(
        label!,
        style: AppTextStyles.bodyLarge.copyWith(
          color: enabled
              ? theme.colorScheme.onSurface
              : theme.colorScheme.onSurface.withValues(alpha: 0.38),
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: AppTextStyles.bodySmall.copyWith(
                color: enabled
                    ? theme.colorScheme.onSurfaceVariant
                    : theme.colorScheme.onSurface.withValues(alpha: 0.38),
              ),
            )
          : null,
      trailing: switchWidget,
      onTap: enabled
          ? () => onChanged?.call(!value)
          : null,
      contentPadding: EdgeInsets.zero,
    );
  }
}

/// A group of toggle buttons (like radio buttons but toggle style)
class AppToggleGroup extends StatelessWidget {
  /// Creates an AppToggleGroup
  const AppToggleGroup({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
    this.direction = Axis.horizontal,
    this.borderRadius,
  });

  /// List of option labels
  final List<String> options;

  /// Currently selected index
  final int selectedIndex;

  /// Called when selection changes
  final ValueChanged<int> onChanged;

  /// Layout direction
  final Axis direction;

  /// Custom border radius
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ToggleButtons(
      isSelected: List.generate(
        options.length,
        (index) => index == selectedIndex,
      ),
      onPressed: onChanged,
      borderRadius: borderRadius ?? AppDimensions.borderRadiusMd,
      selectedColor: theme.colorScheme.onPrimary,
      fillColor: theme.colorScheme.primary,
      color: theme.colorScheme.onSurfaceVariant,
      borderColor: theme.colorScheme.outline,
      selectedBorderColor: theme.colorScheme.primary,
      constraints: const BoxConstraints(
        minHeight: AppDimensions.buttonHeightMd,
        minWidth: 80,
      ),
      direction: direction,
      children: options
          .map((option) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.spacingMd,
                ),
                child: Text(
                  option,
                  style: AppTextStyles.labelLarge,
                ),
              ))
          .toList(),
    );
  }
}
