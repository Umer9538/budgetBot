import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

/// Chip button variants
enum AppChipVariant {
  /// Standard chip
  standard,
  /// Filled chip
  filled,
  /// Outlined chip
  outlined,
}

/// A customizable chip/tag button
class AppChipButton extends StatelessWidget {
  /// Creates an AppChipButton
  const AppChipButton({
    super.key,
    required this.label,
    this.onPressed,
    this.onDeleted,
    this.variant = AppChipVariant.standard,
    this.isSelected = false,
    this.icon,
    this.avatar,
    this.enabled = true,
    this.backgroundColor,
    this.selectedColor,
    this.labelColor,
  });

  /// Chip label text
  final String label;

  /// Called when chip is pressed
  final VoidCallback? onPressed;

  /// Called when delete icon is pressed (shows delete icon if not null)
  final VoidCallback? onDeleted;

  /// Chip variant
  final AppChipVariant variant;

  /// Whether chip is selected
  final bool isSelected;

  /// Optional icon at the start
  final IconData? icon;

  /// Optional avatar widget at the start (replaces icon)
  final Widget? avatar;

  /// Whether chip is enabled
  final bool enabled;

  /// Custom background color
  final Color? backgroundColor;

  /// Custom selected background color
  final Color? selectedColor;

  /// Custom label color
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Determine colors based on variant and selection state
    Color bgColor;
    Color textColor;

    if (!enabled) {
      bgColor = theme.colorScheme.onSurface.withValues(alpha: 0.12);
      textColor = theme.colorScheme.onSurface.withValues(alpha: 0.38);
    } else if (isSelected) {
      bgColor = selectedColor ?? theme.colorScheme.primaryContainer;
      textColor = labelColor ?? theme.colorScheme.onPrimaryContainer;
    } else {
      switch (variant) {
        case AppChipVariant.standard:
          bgColor = backgroundColor ?? theme.colorScheme.surfaceContainerHighest;
          textColor = labelColor ?? theme.colorScheme.onSurfaceVariant;
          break;
        case AppChipVariant.filled:
          bgColor = backgroundColor ?? theme.colorScheme.secondaryContainer;
          textColor = labelColor ?? theme.colorScheme.onSecondaryContainer;
          break;
        case AppChipVariant.outlined:
          bgColor = backgroundColor ?? Colors.transparent;
          textColor = labelColor ?? theme.colorScheme.onSurfaceVariant;
          break;
      }
    }

    // Build leading widget
    Widget? leading;
    if (avatar != null) {
      leading = avatar;
    } else if (icon != null) {
      leading = Icon(
        icon,
        size: AppDimensions.iconSm,
        color: textColor,
      );
    }

    // Use ActionChip for tappable, FilterChip for selectable
    if (onPressed != null && onDeleted == null) {
      return FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: enabled ? (_) => onPressed?.call() : null,
        avatar: leading,
        backgroundColor: bgColor,
        selectedColor: selectedColor ?? theme.colorScheme.primaryContainer,
        labelStyle: AppTextStyles.labelMedium.copyWith(color: textColor),
        side: variant == AppChipVariant.outlined && !isSelected
            ? BorderSide(color: theme.colorScheme.outline)
            : BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.borderRadiusFull,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.spacingXs,
        ),
        showCheckmark: false,
      );
    }

    return InputChip(
      label: Text(label),
      isEnabled: enabled,
      onPressed: enabled ? onPressed : null,
      onDeleted: enabled ? onDeleted : null,
      avatar: leading,
      backgroundColor: bgColor,
      selectedColor: selectedColor ?? theme.colorScheme.primaryContainer,
      labelStyle: AppTextStyles.labelMedium.copyWith(color: textColor),
      deleteIconColor: textColor,
      side: variant == AppChipVariant.outlined
          ? BorderSide(color: theme.colorScheme.outline)
          : BorderSide.none,
      shape: RoundedRectangleBorder(
        borderRadius: AppDimensions.borderRadiusFull,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.spacingXs,
      ),
    );
  }
}

/// A group of selectable chip buttons
class AppChipGroup extends StatelessWidget {
  /// Creates an AppChipGroup
  const AppChipGroup({
    super.key,
    required this.chips,
    required this.selectedIndices,
    required this.onSelectionChanged,
    this.variant = AppChipVariant.standard,
    this.multiSelect = false,
    this.spacing = AppDimensions.spacingXs,
    this.runSpacing = AppDimensions.spacingXs,
    this.wrap = true,
  });

  /// List of chip labels
  final List<String> chips;

  /// Currently selected indices
  final Set<int> selectedIndices;

  /// Called when selection changes
  final ValueChanged<Set<int>> onSelectionChanged;

  /// Chip variant
  final AppChipVariant variant;

  /// Whether multiple chips can be selected
  final bool multiSelect;

  /// Horizontal spacing between chips
  final double spacing;

  /// Vertical spacing between chip rows
  final double runSpacing;

  /// Whether to wrap chips to next line
  final bool wrap;

  void _onChipPressed(int index) {
    final newSelection = Set<int>.from(selectedIndices);

    if (multiSelect) {
      if (newSelection.contains(index)) {
        newSelection.remove(index);
      } else {
        newSelection.add(index);
      }
    } else {
      newSelection.clear();
      newSelection.add(index);
    }

    onSelectionChanged(newSelection);
  }

  @override
  Widget build(BuildContext context) {
    final chipWidgets = chips.asMap().entries.map((entry) {
      return AppChipButton(
        label: entry.value,
        variant: variant,
        isSelected: selectedIndices.contains(entry.key),
        onPressed: () => _onChipPressed(entry.key),
      );
    }).toList();

    if (wrap) {
      return Wrap(
        spacing: spacing,
        runSpacing: runSpacing,
        children: chipWidgets,
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: chipWidgets
            .map((chip) => Padding(
                  padding: EdgeInsets.only(right: spacing),
                  child: chip,
                ))
            .toList(),
      ),
    );
  }
}
