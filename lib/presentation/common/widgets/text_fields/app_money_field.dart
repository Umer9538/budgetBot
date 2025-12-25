import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/theme.dart';

/// A specialized text field for entering monetary amounts
class AppMoneyField extends StatefulWidget {
  /// Creates an AppMoneyField
  const AppMoneyField({
    super.key,
    this.controller,
    this.focusNode,
    this.initialValue,
    this.label,
    this.hint,
    this.currencySymbol = '\$',
    this.decimalPlaces = 2,
    this.maxAmount,
    this.enabled = true,
    this.autofocus = false,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.size = AppMoneyFieldSize.large,
    this.showCurrency = true,
    this.textAlign = TextAlign.start,
  });

  /// Controller for the text field
  final TextEditingController? controller;

  /// Focus node
  final FocusNode? focusNode;

  /// Initial monetary value
  final double? initialValue;

  /// Label text
  final String? label;

  /// Hint text
  final String? hint;

  /// Currency symbol
  final String currencySymbol;

  /// Number of decimal places
  final int decimalPlaces;

  /// Maximum allowed amount
  final double? maxAmount;

  /// Whether the field is enabled
  final bool enabled;

  /// Whether to autofocus
  final bool autofocus;

  /// Error text
  final String? errorText;

  /// Called when value changes
  final ValueChanged<double?>? onChanged;

  /// Called when submitted
  final ValueChanged<double?>? onSubmitted;

  /// Size of the field
  final AppMoneyFieldSize size;

  /// Whether to show currency symbol
  final bool showCurrency;

  /// Text alignment
  final TextAlign textAlign;

  @override
  State<AppMoneyField> createState() => _AppMoneyFieldState();
}

class _AppMoneyFieldState extends State<AppMoneyField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
    if (widget.initialValue != null) {
      _controller.text = _formatValue(widget.initialValue!);
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.controller == null) {
      _controller.dispose();
    }
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  String _formatValue(double value) {
    return value.toStringAsFixed(widget.decimalPlaces);
  }

  double? _parseValue(String text) {
    if (text.isEmpty) return null;
    return double.tryParse(text.replaceAll(',', ''));
  }

  void _onChanged(String value) {
    final parsedValue = _parseValue(value);
    widget.onChanged?.call(parsedValue);
  }

  void _onSubmitted(String value) {
    final parsedValue = _parseValue(value);
    widget.onSubmitted?.call(parsedValue);
  }

  TextStyle get _textStyle {
    switch (widget.size) {
      case AppMoneyFieldSize.small:
        return AppTextStyles.moneySmall;
      case AppMoneyFieldSize.medium:
        return AppTextStyles.moneyMedium;
      case AppMoneyFieldSize.large:
        return AppTextStyles.moneyLarge;
    }
  }

  double get _height {
    switch (widget.size) {
      case AppMoneyFieldSize.small:
        return AppDimensions.inputHeightSm;
      case AppMoneyFieldSize.medium:
        return AppDimensions.inputHeightMd;
      case AppMoneyFieldSize.large:
        return AppDimensions.inputHeightLg;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    // Determine border color based on state
    Color borderColor;
    double borderWidth;
    if (hasError) {
      borderColor = theme.colorScheme.error;
      borderWidth = AppDimensions.borderWidthMedium;
    } else if (_isFocused) {
      borderColor = theme.colorScheme.primary;
      borderWidth = AppDimensions.borderWidthMedium;
    } else {
      borderColor = theme.colorScheme.outline;
      borderWidth = AppDimensions.borderWidthThin;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: AppTextStyles.inputLabel.copyWith(
              color: hasError
                  ? theme.colorScheme.error
                  : theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXs),
        ],

        // Money Field
        Container(
          height: _height,
          decoration: BoxDecoration(
            color: theme.inputDecorationTheme.fillColor ??
                   theme.colorScheme.surfaceContainerHighest,
            borderRadius: AppDimensions.borderRadiusMd,
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.showCurrency)
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppDimensions.spacingMd,
                  ),
                  child: Text(
                    widget.currencySymbol,
                    style: _textStyle.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  enabled: widget.enabled,
                  autofocus: widget.autofocus,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  textInputAction: TextInputAction.done,
                  textAlign: widget.textAlign,
                  style: _textStyle.copyWith(
                    color: widget.enabled
                        ? theme.colorScheme.onSurface
                        : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                    if (widget.maxAmount != null)
                      _MaxAmountFormatter(widget.maxAmount!),
                  ],
                  onChanged: _onChanged,
                  onSubmitted: _onSubmitted,
                  decoration: InputDecoration(
                    hintText: widget.hint ?? '0.00',
                    hintStyle: _textStyle.copyWith(
                      color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
                    ),
                    filled: false,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacingSm,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Error Text
        if (hasError) ...[
          const SizedBox(height: AppDimensions.spacingXxs),
          Text(
            widget.errorText!,
            style: AppTextStyles.caption.copyWith(
              color: theme.colorScheme.error,
            ),
          ),
        ],
      ],
    );
  }
}

/// Size variants for money field
enum AppMoneyFieldSize {
  small,
  medium,
  large,
}

/// Input formatter to limit maximum amount
class _MaxAmountFormatter extends TextInputFormatter {
  _MaxAmountFormatter(this.maxAmount);

  final double maxAmount;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;

    final value = double.tryParse(newValue.text);
    if (value == null) return oldValue;
    if (value > maxAmount) return oldValue;

    return newValue;
  }
}
