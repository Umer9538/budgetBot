import 'package:flutter/material.dart';
import '../../../../core/theme/theme.dart';
import 'button_enums.dart';
import 'button_builder.dart';

/// A customizable button widget that follows the app's design system
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.medium,
    this.icon,
    this.iconPosition = IconPosition.start,
    this.isLoading = false,
    this.isFullWidth = false,
    this.enabled = true,
    this.borderRadius,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final IconData? icon;
  final IconPosition iconPosition;
  final bool isLoading;
  final bool isFullWidth;
  final bool enabled;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDisabled = !enabled || isLoading;
    final effectiveOnPressed = isDisabled ? null : onPressed;

    final styleBuilder = ButtonStyleBuilder(
      variant: variant,
      size: size,
      theme: theme,
      isDisabled: isDisabled,
      borderRadius: borderRadius,
    );

    Widget content = isLoading
        ? _buildLoadingContent(styleBuilder.textColor)
        : _buildContent(styleBuilder);

    Widget button = _buildButton(effectiveOnPressed, styleBuilder, content);

    if (isFullWidth) {
      return SizedBox(
        width: double.infinity,
        height: styleBuilder.height,
        child: button,
      );
    }

    return SizedBox(height: styleBuilder.height, child: button);
  }

  Widget _buildButton(
    VoidCallback? onPressed,
    ButtonStyleBuilder styleBuilder,
    Widget content,
  ) {
    final style = styleBuilder.build();
    switch (variant) {
      case AppButtonVariant.primary:
      case AppButtonVariant.secondary:
      case AppButtonVariant.success:
      case AppButtonVariant.danger:
        return ElevatedButton(
            onPressed: onPressed, style: style, child: content);
      case AppButtonVariant.outlined:
        return OutlinedButton(
            onPressed: onPressed, style: style, child: content);
      case AppButtonVariant.text:
      case AppButtonVariant.ghost:
        return TextButton(onPressed: onPressed, style: style, child: content);
    }
  }

  Widget _buildContent(ButtonStyleBuilder styleBuilder) {
    final textStyle = _getTextStyle().copyWith(color: styleBuilder.textColor);
    final iconSize = _getIconSize();

    if (icon == null) {
      return Text(label, style: textStyle);
    }

    final iconWidget = Icon(icon, size: iconSize, color: styleBuilder.textColor);
    final spacing = SizedBox(width: _getIconSpacing());

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: iconPosition == IconPosition.start
          ? [iconWidget, spacing, Text(label, style: textStyle)]
          : [Text(label, style: textStyle), spacing, iconWidget],
    );
  }

  Widget _buildLoadingContent(Color color) {
    return SizedBox(
      width: _getIconSize(),
      height: _getIconSize(),
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }

  TextStyle _getTextStyle() => switch (size) {
        AppButtonSize.small => AppTextStyles.buttonSmall,
        AppButtonSize.medium => AppTextStyles.buttonMedium,
        AppButtonSize.large => AppTextStyles.buttonLarge,
      };

  double _getIconSize() => switch (size) {
        AppButtonSize.small => AppDimensions.iconSm,
        AppButtonSize.medium => AppDimensions.iconMd,
        AppButtonSize.large => AppDimensions.iconLg,
      };

  double _getIconSpacing() => switch (size) {
        AppButtonSize.small => AppDimensions.spacingXxs,
        AppButtonSize.medium => AppDimensions.spacingXs,
        AppButtonSize.large => AppDimensions.spacingSm,
      };
}
