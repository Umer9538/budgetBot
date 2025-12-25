import 'package:flutter/material.dart';

/// Category and chart colors
class CategoryColors {
  CategoryColors._();

  // Category Colors (No blue shades)
  static const Color income = Color(0xFF22C55E);
  static const Color housing = Color(0xFF7C3AED); // Purple
  static const Color transportation = Color(0xFF9333EA); // Deep purple
  static const Color food = Color(0xFFF59E0B);
  static const Color shopping = Color(0xFFEC4899);
  static const Color entertainment = Color(0xFFA855F7); // Purple
  static const Color health = Color(0xFF059669); // Deep emerald green
  static const Color financial = Color(0xFFC2410C); // Deep orange/burgundy
  static const Color other = Color(0xFF71717A);

  // Category colors list for charts
  static const List<Color> palette = [
    income,
    housing,
    transportation,
    food,
    shopping,
    entertainment,
    health,
    financial,
    other,
  ];

  // Chart palette (No blue shades)
  static const List<Color> chartPalette = [
    Color(0xFF7C3AED), // Purple
    Color(0xFF10B981), // Emerald green
    Color(0xFFF59E0B), // Gold
    Color(0xFFEF4444), // Red
    Color(0xFFA855F7), // Purple
    Color(0xFF9333EA), // Deep purple
    Color(0xFFEC4899), // Pink
    Color(0xFF059669), // Deep emerald
    Color(0xFFF97316), // Coral
    Color(0xFFC2410C), // Deep orange
  ];

  // Mood Colors (No blue shades)
  static const Color moodHappy = Color(0xFF22C55E);
  static const Color moodCalm = Color(0xFF7C3AED); // Purple (calm)
  static const Color moodNeutral = Color(0xFF71717A);
  static const Color moodStressed = Color(0xFFF59E0B);
  static const Color moodAnxious = Color(0xFFF97316);
  static const Color moodSad = Color(0xFF9333EA); // Deep purple
  static const Color moodExcited = Color(0xFFEC4899);
  static const Color moodTired = Color(0xFFA855F7); // Purple
  static const Color moodFrustrated = Color(0xFFEF4444);

  // Status Colors
  static const Color statusActive = Color(0xFF22C55E);
  static const Color statusPending = Color(0xFFF59E0B);
  static const Color statusInactive = Color(0xFF71717A);
  static const Color statusCancelled = Color(0xFFEF4444);
}
