import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final double blur;
  final Color? color;
  final Color? borderColor;
  final VoidCallback? onTap;

  const GlassContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.borderRadius = 24,
    this.blur = 10,
    this.color,
    this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultColor = isDark ? AppColors.glassDark : AppColors.glassLight;
    final defaultBorder = isDark ? AppColors.glassBorderDark : AppColors.glassBorderLight;

    Widget container = Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? defaultColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? defaultBorder,
          width: 1,
        ),
      ),
      child: child,
    );

    if (onTap != null) {
      container = InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(borderRadius),
        child: container,
      );
    }

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: container,
        ),
      ),
    );
  }
}
