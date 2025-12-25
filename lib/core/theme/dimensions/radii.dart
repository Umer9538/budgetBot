import 'package:flutter/material.dart';

/// Border radius constants
class Radii {
  Radii._();

  // Values
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;
  static const double full = 9999.0;

  // BorderRadius objects
  static const BorderRadius radiusXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius radiusSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius radiusMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius radiusLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius radiusXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius radiusXxl = BorderRadius.all(Radius.circular(xxl));
  static const BorderRadius radiusFull = BorderRadius.all(Radius.circular(full));

  // Top only radius
  static const BorderRadius topMd = BorderRadius.only(
    topLeft: Radius.circular(md),
    topRight: Radius.circular(md),
  );

  static const BorderRadius topLg = BorderRadius.only(
    topLeft: Radius.circular(lg),
    topRight: Radius.circular(lg),
  );

  static const BorderRadius topXl = BorderRadius.only(
    topLeft: Radius.circular(xl),
    topRight: Radius.circular(xl),
  );
}
