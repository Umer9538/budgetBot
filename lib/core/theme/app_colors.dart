import 'package:flutter/material.dart';

/// ═══════════════════════════════════════════════════════════════════════════
/// BudgetBot Premium Design System
/// ═══════════════════════════════════════════════════════════════════════════
///
/// Theme: "Midnight Amethyst & Champagne Gold"
///
/// A sophisticated, premium palette that conveys:
/// - Trust & Security (Deep Amethyst tones)
/// - Wealth & Prosperity (Champagne Gold accents)
/// - Warmth & Approachability (Soft Coral highlights)
/// - Modern & Professional (Glass UI aesthetics)
///
/// NO BLUE. Completely unique in the finance app space.
/// ═══════════════════════════════════════════════════════════════════════════

class AppColors {
  AppColors._();

  // ══════════════════════════════════════════════════════════════════════════
  // PRIMARY PALETTE - Deep Amethyst (Luxury & Trust)
  // ══════════════════════════════════════════════════════════════════════════

  /// Main brand color - Rich amethyst purple
  static const Color primary = Color(0xFF8B5CF6);

  /// Lighter variant for highlights
  static const Color primaryLight = Color(0xFFA78BFA);

  /// Darker variant for depth
  static const Color primaryDark = Color(0xFF7C3AED);

  /// Even deeper for emphasis
  static const Color primaryDeep = Color(0xFF6D28D9);

  /// Container background
  static const Color primaryContainer = Color(0xFF4C1D95);

  /// Text on primary
  static const Color onPrimary = Color(0xFFFFFFFF);

  /// Text on primary container
  static const Color onPrimaryContainer = Color(0xFFEDE9FE);

  // ══════════════════════════════════════════════════════════════════════════
  // SECONDARY PALETTE - Champagne Gold (Wealth & Success)
  // ══════════════════════════════════════════════════════════════════════════

  /// Rich champagne gold
  static const Color secondary = Color(0xFFD4A574);

  /// Bright gold highlight
  static const Color secondaryLight = Color(0xFFE8C49A);

  /// Deep burnished gold
  static const Color secondaryDark = Color(0xFFBF8A4E);

  /// Rose gold variant
  static const Color secondaryRose = Color(0xFFE5B8A8);

  /// Container background
  static const Color secondaryContainer = Color(0xFF8B6914);

  /// Text on secondary
  static const Color onSecondary = Color(0xFF1A1625);

  /// Text on secondary container
  static const Color onSecondaryContainer = Color(0xFFFEF7E8);

  // ══════════════════════════════════════════════════════════════════════════
  // ACCENT PALETTE - Soft Coral (Energy & Action)
  // ══════════════════════════════════════════════════════════════════════════

  /// Vibrant coral accent
  static const Color accent = Color(0xFFFF8A80);

  /// Light coral/peach
  static const Color accentLight = Color(0xFFFFAB9E);

  /// Deep coral
  static const Color accentDark = Color(0xFFE57373);

  /// Blush pink variant
  static const Color accentBlush = Color(0xFFFFC1B8);

  // ══════════════════════════════════════════════════════════════════════════
  // TERTIARY - For legacy compatibility
  // ══════════════════════════════════════════════════════════════════════════

  static const Color tertiary = accent;
  static const Color tertiaryLight = accentLight;
  static const Color tertiaryDark = accentDark;
  static const Color tertiaryContainer = Color(0xFF7C2D12);
  static const Color onTertiary = Color(0xFF1A1625);
  static const Color onTertiaryContainer = Color(0xFFFFEDD5);

  // ══════════════════════════════════════════════════════════════════════════
  // BACKGROUNDS - Rich & Warm
  // ══════════════════════════════════════════════════════════════════════════

  /// Dark mode main background - Deep midnight with violet undertone
  static const Color backgroundDark = Color(0xFF0F0A1A);

  /// Light mode main background - Warm ivory cream
  static const Color backgroundLight = Color(0xFFFCF9F6);

  // ══════════════════════════════════════════════════════════════════════════
  // SURFACES - For Cards & Containers
  // ══════════════════════════════════════════════════════════════════════════

  /// Dark mode surface
  static const Color surfaceDark = Color(0xFF1A1325);

  /// Light mode surface
  static const Color surfaceLight = Color(0xFFFFFBF8);

  /// Dark mode elevated surface
  static const Color surfaceVariantDark = Color(0xFF251D35);

  /// Light mode elevated surface
  static const Color surfaceVariantLight = Color(0xFFF5F0EB);

  /// Dark mode card
  static const Color cardDark = Color(0xFF1F1730);

  /// Light mode card
  static const Color cardLight = Color(0xFFFFFFFF);

  // ══════════════════════════════════════════════════════════════════════════
  // GLASSMORPHISM COLORS
  // ══════════════════════════════════════════════════════════════════════════

  /// Dark mode glass background
  static Color glassDark = const Color(0xFF1A1325).withValues(alpha: 0.65);

  /// Light mode glass background
  static Color glassLight = const Color(0xFFFFFFFF).withValues(alpha: 0.70);

  /// Dark mode glass with purple tint
  static Color glassPurpleDark = const Color(0xFF2D1F4A).withValues(alpha: 0.60);

  /// Light mode glass with warm tint
  static Color glassWarmLight = const Color(0xFFFFF8F0).withValues(alpha: 0.75);

  /// Glass border dark
  static Color glassBorderDark = const Color(0xFFFFFFFF).withValues(alpha: 0.08);

  /// Glass border light
  static Color glassBorderLight = const Color(0xFF8B5CF6).withValues(alpha: 0.10);

  /// Glass highlight (top edge glow)
  static Color glassHighlightDark = const Color(0xFFFFFFFF).withValues(alpha: 0.12);
  static Color glassHighlightLight = const Color(0xFFFFFFFF).withValues(alpha: 0.80);

  /// Glass shadow
  static Color glassShadowDark = const Color(0xFF000000).withValues(alpha: 0.40);
  static Color glassShadowLight = const Color(0xFF8B5CF6).withValues(alpha: 0.08);

  // ══════════════════════════════════════════════════════════════════════════
  // TEXT COLORS
  // ══════════════════════════════════════════════════════════════════════════

  /// Dark mode primary text - Soft lavender white
  static const Color textPrimaryDark = Color(0xFFF5F3FF);

  /// Dark mode secondary text
  static const Color textSecondaryDark = Color(0xFFB8A8D4);

  /// Dark mode tertiary text
  static const Color textTertiaryDark = Color(0xFF8B7BA8);

  /// Light mode primary text - Deep charcoal with violet undertone
  static const Color textPrimaryLight = Color(0xFF1A1625);

  /// Light mode secondary text
  static const Color textSecondaryLight = Color(0xFF5C4D6E);

  /// Light mode tertiary text
  static const Color textTertiaryLight = Color(0xFF8B7BA8);

  // ══════════════════════════════════════════════════════════════════════════
  // SEMANTIC COLORS (No Blue!)
  // ══════════════════════════════════════════════════════════════════════════

  /// Success - Emerald (money/growth association)
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFF34D399);
  static const Color successDark = Color(0xFF059669);
  static const Color successContainer = Color(0xFFD1FAE5);
  static const Color onSuccess = Color(0xFFFFFFFF);

  /// Warning - Amber gold (matches our theme)
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFBBF24);
  static const Color warningDark = Color(0xFFD97706);
  static const Color warningContainer = Color(0xFFFEF3C7);
  static const Color onWarning = Color(0xFF1A1625);

  /// Error - Coral red (warm, not harsh)
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFF87171);
  static const Color errorDark = Color(0xFFDC2626);
  static const Color errorContainer = Color(0xFFFEE2E2);
  static const Color onError = Color(0xFFFFFFFF);

  /// Info - Purple (on-brand, no blue!)
  static const Color info = Color(0xFFA78BFA);
  static const Color infoLight = Color(0xFFC4B5FD);
  static const Color infoDark = Color(0xFF8B5CF6);
  static const Color infoContainer = Color(0xFFEDE9FE);
  static const Color onInfo = Color(0xFF1A1625);

  // ══════════════════════════════════════════════════════════════════════════
  // NEUTRAL PALETTE - Warm Grays with Violet Undertone
  // ══════════════════════════════════════════════════════════════════════════

  static const Color neutral50 = Color(0xFFFCF9F6);   // Warm ivory
  static const Color neutral100 = Color(0xFFF5F0EB);  // Soft cream
  static const Color neutral200 = Color(0xFFE8E0D8);  // Light warm gray
  static const Color neutral300 = Color(0xFFD4C8BC);  // Medium warm gray
  static const Color neutral400 = Color(0xFFB8A8D4);  // Lavender gray
  static const Color neutral500 = Color(0xFF8B7BA8);  // Muted violet
  static const Color neutral600 = Color(0xFF6B5B7D);  // Deep violet gray
  static const Color neutral700 = Color(0xFF4A3D5C);  // Dark violet gray
  static const Color neutral800 = Color(0xFF2D2240);  // Very dark violet
  static const Color neutral900 = Color(0xFF1A1625);  // Near black violet
  static const Color transparent = Colors.transparent;

  // ══════════════════════════════════════════════════════════════════════════
  // BORDERS & DIVIDERS
  // ══════════════════════════════════════════════════════════════════════════

  static const Color borderLight = Color(0xFFE8E0D8);
  static const Color borderDark = Color(0xFF3D3050);
  static const Color dividerLight = Color(0xFFF0E8E0);
  static const Color dividerDark = Color(0xFF2D2240);

  // ══════════════════════════════════════════════════════════════════════════
  // SHADOWS & OVERLAYS
  // ══════════════════════════════════════════════════════════════════════════

  static const Color shadowLight = Color(0x148B5CF6);  // Subtle purple shadow
  static const Color shadowDark = Color(0x66000000);
  static const Color scrimLight = Color(0x52000000);
  static const Color scrimDark = Color(0x99000000);

  // ══════════════════════════════════════════════════════════════════════════
  // PREMIUM GRADIENTS
  // ══════════════════════════════════════════════════════════════════════════

  /// Main brand gradient - Amethyst flow
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF8B5CF6), Color(0xFFA78BFA)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Deep brand gradient - For headers/hero sections
  static const LinearGradient primaryDeepGradient = LinearGradient(
    colors: [Color(0xFF6D28D9), Color(0xFF8B5CF6)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Gold gradient - For premium elements
  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFD4A574), Color(0xFFE8C49A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Rose gold gradient - For special highlights
  static const LinearGradient roseGoldGradient = LinearGradient(
    colors: [Color(0xFFE5B8A8), Color(0xFFFFC1B8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Accent gradient - For CTAs
  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFFF8A80), Color(0xFFFFAB9E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Success gradient
  static const LinearGradient successGradient = LinearGradient(
    colors: [Color(0xFF10B981), Color(0xFF34D399)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Dark background gradient - Subtle depth
  static const LinearGradient darkSurfaceGradient = LinearGradient(
    colors: [Color(0xFF1A1325), Color(0xFF0F0A1A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Light background gradient - Warm glow
  static const LinearGradient lightSurfaceGradient = LinearGradient(
    colors: [Color(0xFFFFFBF8), Color(0xFFFCF9F6)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Glass shimmer gradient (for card edges)
  static const LinearGradient glassShimmerGradient = LinearGradient(
    colors: [
      Color(0x00FFFFFF),
      Color(0x20FFFFFF),
      Color(0x00FFFFFF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Mesh gradient for hero backgrounds
  static const LinearGradient meshGradient = LinearGradient(
    colors: [
      Color(0xFF6D28D9),
      Color(0xFF8B5CF6),
      Color(0xFFD4A574),
    ],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ══════════════════════════════════════════════════════════════════════════
  // CATEGORY COLORS (Finance-specific)
  // ══════════════════════════════════════════════════════════════════════════

  static const Color categoryIncome = Color(0xFF10B981);       // Emerald - Money coming in
  static const Color categoryHousing = Color(0xFF8B5CF6);      // Primary purple
  static const Color categoryTransportation = Color(0xFF7C3AED); // Deep purple
  static const Color categoryFood = Color(0xFFD4A574);          // Champagne gold
  static const Color categoryShopping = Color(0xFFFF8A80);      // Coral
  static const Color categoryEntertainment = Color(0xFFEC4899); // Pink
  static const Color categoryHealth = Color(0xFF14B8A6);        // Teal (not blue!)
  static const Color categoryFinancial = Color(0xFFD97706);     // Amber
  static const Color categoryOther = Color(0xFF8B7BA8);         // Muted violet

  static const List<Color> categoryColorPalette = [
    categoryIncome,
    categoryHousing,
    categoryTransportation,
    categoryFood,
    categoryShopping,
    categoryEntertainment,
    categoryHealth,
    categoryFinancial,
    categoryOther,
  ];

  static const List<Color> chartPalette = [
    Color(0xFF8B5CF6), // Primary purple
    Color(0xFFD4A574), // Gold
    Color(0xFF10B981), // Emerald
    Color(0xFFFF8A80), // Coral
    Color(0xFFEC4899), // Pink
    Color(0xFF14B8A6), // Teal
    Color(0xFFD97706), // Amber
    Color(0xFFA78BFA), // Light purple
    Color(0xFFE5B8A8), // Rose gold
  ];
}
