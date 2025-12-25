import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

/// A segmented button for selecting between options
class AppSegmentedButton<T> extends StatelessWidget {
  /// Creates an AppSegmentedButton
  const AppSegmentedButton({
    super.key,
    required this.segments,
    required this.selected,
    required this.onSelectionChanged,
    this.multiSelectionEnabled = false,
    this.showSelectedIcon = false,
    this.emptySelectionAllowed = false,
    this.style,
  });

  /// List of segments with value and label
  final List<AppSegment<T>> segments;

  /// Currently selected value(s)
  final Set<T> selected;

  /// Called when selection changes
  final ValueChanged<Set<T>> onSelectionChanged;

  /// Whether multiple segments can be selected
  final bool multiSelectionEnabled;

  /// Whether to show checkmark icon on selected segment
  final bool showSelectedIcon;

  /// Whether empty selection is allowed
  final bool emptySelectionAllowed;

  /// Custom button style
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SegmentedButton<T>(
      segments: segments
          .map((segment) => ButtonSegment<T>(
                value: segment.value,
                label: Text(segment.label),
                icon: segment.icon != null ? Icon(segment.icon) : null,
                enabled: segment.enabled,
              ))
          .toList(),
      selected: selected,
      onSelectionChanged: onSelectionChanged,
      multiSelectionEnabled: multiSelectionEnabled,
      showSelectedIcon: showSelectedIcon,
      emptySelectionAllowed: emptySelectionAllowed,
      style: style ??
          ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return theme.colorScheme.primaryContainer;
              }
              return Colors.transparent;
            }),
            foregroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return theme.colorScheme.onPrimaryContainer;
              }
              return theme.colorScheme.onSurfaceVariant;
            }),
            side: WidgetStateProperty.all(
              BorderSide(color: theme.colorScheme.outline),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: AppDimensions.borderRadiusMd,
              ),
            ),
            textStyle: WidgetStateProperty.all(AppTextStyles.labelLarge),
            minimumSize: WidgetStateProperty.all(
              const Size(0, AppDimensions.buttonHeightMd),
            ),
          ),
    );
  }
}

/// A segment for the segmented button
class AppSegment<T> {
  /// Creates an AppSegment
  const AppSegment({
    required this.value,
    required this.label,
    this.icon,
    this.enabled = true,
  });

  /// The value this segment represents
  final T value;

  /// The label text
  final String label;

  /// Optional icon
  final IconData? icon;

  /// Whether this segment is enabled
  final bool enabled;
}
