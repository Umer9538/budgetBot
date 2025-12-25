import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/theme.dart';

/// A PIN/OTP input field with individual character boxes
class AppPinField extends StatefulWidget {
  /// Creates an AppPinField
  const AppPinField({
    super.key,
    this.length = 6,
    this.obscureText = false,
    this.autofocus = true,
    this.enabled = true,
    this.onCompleted,
    this.onChanged,
    this.errorText,
    this.boxSize = 48.0,
    this.spacing = 12.0,
  });

  /// Number of PIN digits
  final int length;

  /// Whether to obscure the text
  final bool obscureText;

  /// Whether to autofocus
  final bool autofocus;

  /// Whether the field is enabled
  final bool enabled;

  /// Called when all digits are entered
  final ValueChanged<String>? onCompleted;

  /// Called when value changes
  final ValueChanged<String>? onChanged;

  /// Error text
  final String? errorText;

  /// Size of each box
  final double boxSize;

  /// Spacing between boxes
  final double spacing;

  @override
  State<AppPinField> createState() => _AppPinFieldState();
}

class _AppPinFieldState extends State<AppPinField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.length,
      (_) => TextEditingController(),
    );
    _focusNodes = List.generate(
      widget.length,
      (_) => FocusNode(),
    );

    // Auto focus first field
    if (widget.autofocus && widget.enabled) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNodes[0].requestFocus();
      });
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _value {
    return _controllers.map((c) => c.text).join();
  }

  void _onChanged(int index, String value) {
    if (value.length > 1) {
      // Handle paste
      _handlePaste(value);
      return;
    }

    if (value.isNotEmpty && index < widget.length - 1) {
      // Move to next field
      _focusNodes[index + 1].requestFocus();
    }

    widget.onChanged?.call(_value);

    if (_value.length == widget.length) {
      widget.onCompleted?.call(_value);
    }
  }

  void _handlePaste(String value) {
    // Take only the digits up to length
    final digits = value.replaceAll(RegExp(r'[^0-9]'), '');
    final chars = digits.split('').take(widget.length).toList();

    for (var i = 0; i < widget.length; i++) {
      if (i < chars.length) {
        _controllers[i].text = chars[i];
      } else {
        _controllers[i].clear();
      }
    }

    // Focus last filled or first empty
    final lastIndex = chars.length.clamp(0, widget.length - 1);
    _focusNodes[lastIndex].requestFocus();

    widget.onChanged?.call(_value);

    if (_value.length == widget.length) {
      widget.onCompleted?.call(_value);
    }
  }

  void _onKeyPressed(int index, RawKeyEvent event) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      if (_controllers[index].text.isEmpty && index > 0) {
        // Move to previous field and clear
        _focusNodes[index - 1].requestFocus();
        _controllers[index - 1].clear();
        widget.onChanged?.call(_value);
      }
    }
  }

  /// Clear all fields
  void clear() {
    for (final controller in _controllers) {
      controller.clear();
    }
    _focusNodes[0].requestFocus();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // PIN Boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                right: index < widget.length - 1 ? widget.spacing : 0,
              ),
              child: SizedBox(
                width: widget.boxSize,
                height: widget.boxSize,
                child: RawKeyboardListener(
                  focusNode: FocusNode(),
                  onKey: (event) => _onKeyPressed(index, event),
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    enabled: widget.enabled,
                    obscureText: widget.obscureText,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: AppTextStyles.headlineMedium.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) => _onChanged(index, value),
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderRadius: AppDimensions.borderRadiusMd,
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: AppDimensions.borderRadiusMd,
                        borderSide: hasError
                            ? BorderSide(
                                color: theme.colorScheme.error,
                                width: AppDimensions.borderWidthThin,
                              )
                            : BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: AppDimensions.borderRadiusMd,
                        borderSide: BorderSide(
                          color: hasError
                              ? theme.colorScheme.error
                              : theme.colorScheme.primary,
                          width: AppDimensions.borderWidthMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Error Text
        if (hasError) ...[
          const SizedBox(height: AppDimensions.spacingSm),
          Text(
            widget.errorText!,
            style: AppTextStyles.caption.copyWith(
              color: theme.colorScheme.error,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
