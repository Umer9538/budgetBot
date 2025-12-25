import 'dart:ui';
import 'package:flutter/material.dart';
import '../app_colors.dart';
import 'glass_decorations.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// GlassCard Widget
/// ═══════════════════════════════════════════════════════════════════════════
///
/// A premium glassmorphism card with:
/// - Frosted glass blur effect
/// - Subtle gradient borders
/// - Layered shadows for depth
/// - Responsive to light/dark mode
///
/// Usage:
///   GlassCard(
///     child: YourContent(),
///   )
/// ═══════════════════════════════════════════════════════════════════════════

enum GlassCardVariant {
  /// Standard glass card
  standard,

  /// Elevated with stronger blur
  elevated,

  /// Gold accent border
  gold,

  /// Success/green accent
  success,

  /// Alert/coral accent
  alert,

  /// Hero card with gradient
  hero,
}

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.variant = GlassCardVariant.standard,
    this.padding,
    this.margin,
    this.borderRadius,
    this.onTap,
    this.blur = true,
    this.animateOnHover = false,
  });

  final Widget child;
  final GlassCardVariant variant;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? borderRadius;
  final VoidCallback? onTap;
  final bool blur;
  final bool animateOnHover;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? _getRadiusForVariant();

    Widget card = ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: blur
            ? ImageFilter.blur(
                sigmaX: _getBlurAmount(),
                sigmaY: _getBlurAmount(),
              )
            : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          decoration: _getDecoration(context),
          padding: padding ?? const EdgeInsets.all(16),
          child: child,
        ),
      ),
    );

    if (margin != null) {
      card = Padding(padding: margin!, child: card);
    }

    if (onTap != null) {
      card = GestureDetector(
        onTap: onTap,
        child: card,
      );
    }

    return card;
  }

  double _getRadiusForVariant() {
    switch (variant) {
      case GlassCardVariant.hero:
        return 28;
      case GlassCardVariant.elevated:
        return 24;
      default:
        return 20;
    }
  }

  double _getBlurAmount() {
    switch (variant) {
      case GlassCardVariant.elevated:
      case GlassCardVariant.hero:
        return GlassEffect.blurStrong;
      default:
        return GlassEffect.blurAmount;
    }
  }

  BoxDecoration _getDecoration(BuildContext context) {
    switch (variant) {
      case GlassCardVariant.standard:
        return GlassDecoration.card(context);
      case GlassCardVariant.elevated:
        return GlassDecoration.cardElevated(context);
      case GlassCardVariant.gold:
        return GlassDecoration.cardGold(context);
      case GlassCardVariant.success:
        return GlassDecoration.cardSuccess(context);
      case GlassCardVariant.alert:
        return GlassDecoration.cardAlert(context);
      case GlassCardVariant.hero:
        return GlassDecoration.hero(context);
    }
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// GlassBox - For custom glass layouts (named to avoid conflict with existing widget)
/// ═══════════════════════════════════════════════════════════════════════════

class GlassBox extends StatelessWidget {
  const GlassBox({
    super.key,
    required this.child,
    this.decoration,
    this.padding,
    this.margin,
    this.borderRadius = 20,
    this.blur = true,
    this.blurAmount,
  });

  final Widget child;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final bool blur;
  final double? blurAmount;

  @override
  Widget build(BuildContext context) {
    final sigma = blurAmount ?? GlassEffect.blurAmount;

    Widget container = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: blur
            ? ImageFilter.blur(sigmaX: sigma, sigmaY: sigma)
            : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          decoration: decoration ?? GlassDecoration.card(context),
          padding: padding,
          child: child,
        ),
      ),
    );

    if (margin != null) {
      container = Padding(padding: margin!, child: container);
    }

    return container;
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// GlassChip - Small glass element for tags/badges
/// ═══════════════════════════════════════════════════════════════════════════

class GlassChip extends StatelessWidget {
  const GlassChip({
    super.key,
    required this.label,
    this.icon,
    this.color,
    this.onTap,
  });

  final String label;
  final IconData? icon;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? AppColors.primary;

    Widget chip = ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: GlassEffect.blurSubtle,
          sigmaY: GlassEffect.blurSubtle,
        ),
        child: Container(
          decoration: GlassDecoration.pill(context, accentColor: chipColor),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 14, color: chipColor),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: TextStyle(
                  color: chipColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    if (onTap != null) {
      chip = GestureDetector(onTap: onTap, child: chip);
    }

    return chip;
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// GlassButton - Glass styled button
/// ═══════════════════════════════════════════════════════════════════════════

class GlassButton extends StatefulWidget {
  const GlassButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isPrimary = true,
    this.isLoading = false,
    this.padding,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool isPrimary;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;

  @override
  State<GlassButton> createState() => _GlassButtonState();
}

class _GlassButtonState extends State<GlassButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.isLoading ? null : widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        decoration: widget.isPrimary
            ? GlassDecoration.button(context, pressed: _isPressed)
            : GlassDecoration.buttonSecondary(context),
        padding: widget.padding ??
            const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: widget.isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(
                    widget.isPrimary
                        ? AppColors.onPrimary
                        : AppColors.primary,
                  ),
                ),
              )
            : DefaultTextStyle(
                style: TextStyle(
                  color: widget.isPrimary
                      ? AppColors.onPrimary
                      : AppColors.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                child: widget.child,
              ),
      ),
    );
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// GlassBottomNav - Glass bottom navigation
/// ═══════════════════════════════════════════════════════════════════════════

class GlassBottomNav extends StatelessWidget {
  const GlassBottomNav({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
        child: Container(
          decoration: GlassDecoration.bottomNav(context),
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }
}

/// ═══════════════════════════════════════════════════════════════════════════
/// GlassAppBar - Glass app bar
/// ═══════════════════════════════════════════════════════════════════════════

class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GlassAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
        child: Container(
          decoration: GlassDecoration.appBar(context),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  if (leading != null) leading!,
                  if (centerTitle) const Spacer(),
                  if (title != null)
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.titleLarge!,
                      child: title!,
                    ),
                  if (centerTitle) const Spacer(),
                  if (actions != null) ...actions!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
