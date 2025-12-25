/// Button variants available in the app
enum AppButtonVariant {
  /// Filled button with primary color background
  primary,

  /// Filled button with secondary color background
  secondary,

  /// Outlined button with border
  outlined,

  /// Text-only button
  text,

  /// Filled button with success color
  success,

  /// Filled button with error/danger color
  danger,

  /// Ghost button (transparent with hover effect)
  ghost,
}

/// Button sizes available in the app
enum AppButtonSize {
  small,
  medium,
  large,
}

/// Icon position relative to button label
enum IconPosition {
  start,
  end,
}
