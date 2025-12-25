import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';

/// A search text field widget with search icon and clear button
class AppSearchField extends StatefulWidget {
  /// Creates an AppSearchField
  const AppSearchField({
    super.key,
    this.controller,
    this.focusNode,
    this.hint = 'Search...',
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.autofocus = false,
    this.enabled = true,
    this.showClearButton = true,
    this.borderRadius,
    this.backgroundColor,
  });

  /// Controller for the text field
  final TextEditingController? controller;

  /// Focus node for the text field
  final FocusNode? focusNode;

  /// Hint text
  final String hint;

  /// Called when text changes
  final ValueChanged<String>? onChanged;

  /// Called when search is submitted
  final ValueChanged<String>? onSubmitted;

  /// Called when clear button is pressed
  final VoidCallback? onClear;

  /// Whether to autofocus
  final bool autofocus;

  /// Whether the field is enabled
  final bool enabled;

  /// Whether to show clear button when text is present
  final bool showClearButton;

  /// Custom border radius
  final BorderRadius? borderRadius;

  /// Custom background color
  final Color? backgroundColor;

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _hasText = _controller.text.isNotEmpty;
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  void _onTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  void _onClear() {
    _controller.clear();
    widget.onClear?.call();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: AppDimensions.inputHeightMd,
      child: TextField(
        controller: _controller,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        enabled: widget.enabled,
        textInputAction: TextInputAction.search,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        style: AppTextStyles.bodyMedium.copyWith(
          color: theme.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          hintText: widget.hint,
          filled: true,
          fillColor: widget.backgroundColor ??
              theme.colorScheme.surfaceContainerHighest,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingMd,
            vertical: AppDimensions.spacingSm,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: AppDimensions.iconMd,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          suffixIcon: widget.showClearButton && _hasText
              ? IconButton(
                  icon: Icon(
                    Icons.close,
                    size: AppDimensions.iconMd,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  onPressed: _onClear,
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? AppDimensions.borderRadiusFull,
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? AppDimensions.borderRadiusFull,
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: widget.borderRadius ?? AppDimensions.borderRadiusFull,
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: AppDimensions.borderWidthMedium,
            ),
          ),
        ),
      ),
    );
  }
}
