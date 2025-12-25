import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/theme.dart';
import 'text_field_enums.dart';
import 'text_field_decoration.dart';

/// A customizable text field widget that follows the app's design system
class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onEditingComplete,
    this.size = AppTextFieldSize.medium,
    this.showCounter = false,
    this.filled = true,
    this.borderRadius,
    this.contentPadding,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final AppTextFieldSize size;
  final bool showCounter;
  final bool filled;
  final BorderRadius? borderRadius;
  final EdgeInsets? contentPadding;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = widget.errorText?.isNotEmpty ?? false;

    final decorationBuilder = TextFieldDecorationBuilder(
      size: widget.size,
      theme: theme,
      hasError: hasError,
      hint: widget.hint,
      filled: widget.filled,
      borderRadius: widget.borderRadius,
      contentPadding: widget.contentPadding,
      showCounter: widget.showCounter,
      prefixIcon: widget.prefixIcon,
      prefix: widget.prefix,
      suffix: widget.suffix,
      suffixIcon: _buildSuffixIcon(theme, hasError),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) _buildLabel(theme, hasError),
        _buildTextField(theme, decorationBuilder),
        if (widget.helperText != null || hasError)
          _buildHelperText(theme, hasError),
      ],
    );
  }

  Widget _buildLabel(ThemeData theme, bool hasError) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spacingXs),
      child: Text(
        widget.label!,
        style: AppTextStyles.inputLabel.copyWith(
          color: hasError
              ? theme.colorScheme.error
              : theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildTextField(
      ThemeData theme, TextFieldDecorationBuilder decorationBuilder) {
    return SizedBox(
      height: widget.maxLines > 1 ? null : decorationBuilder.height,
      child: TextFormField(
        controller: widget.controller,
        initialValue: widget.initialValue,
        focusNode: widget.focusNode,
        obscureText: _obscureText,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        autofocus: widget.autofocus,
        autocorrect: widget.autocorrect,
        enableSuggestions: widget.enableSuggestions,
        maxLines: widget.obscureText ? 1 : widget.maxLines,
        minLines: widget.minLines,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onSubmitted,
        onTap: widget.onTap,
        onEditingComplete: widget.onEditingComplete,
        style: decorationBuilder.textStyle.copyWith(
          color: widget.enabled
              ? theme.colorScheme.onSurface
              : theme.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
        decoration: decorationBuilder.build(),
      ),
    );
  }

  Widget _buildHelperText(ThemeData theme, bool hasError) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimensions.spacingXxs),
      child: Text(
        hasError ? widget.errorText! : widget.helperText!,
        style: AppTextStyles.caption.copyWith(
          color: hasError
              ? theme.colorScheme.error
              : theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon(ThemeData theme, bool hasError) {
    if (widget.obscureText) {
      return IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          size: AppDimensions.iconMd,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        onPressed: () => setState(() => _obscureText = !_obscureText),
      );
    }

    if (hasError) {
      return Icon(
        Icons.error_outline,
        size: AppDimensions.iconMd,
        color: theme.colorScheme.error,
      );
    }

    if (widget.suffixIcon != null) {
      return Icon(widget.suffixIcon, size: AppDimensions.iconMd);
    }

    return null;
  }
}
