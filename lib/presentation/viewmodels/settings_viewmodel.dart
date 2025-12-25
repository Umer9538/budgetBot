import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Settings state
class SettingsState {
  const SettingsState({
    this.themeMode = ThemeMode.dark,
    this.isLoading = false,
  });

  final ThemeMode themeMode;
  final bool isLoading;

  SettingsState copyWith({
    ThemeMode? themeMode,
    bool? isLoading,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

/// ViewModel for app settings
class SettingsViewModel extends StateNotifier<SettingsState> {
  SettingsViewModel() : super(const SettingsState()) {
    _init();
  }

  static const String _boxName = 'settings';
  static const String _themeModeKey = 'themeMode';

  late Box _box;

  Future<void> _init() async {
    state = state.copyWith(isLoading: true);
    _box = await Hive.openBox(_boxName);

    // Load saved theme mode
    final savedThemeMode = _box.get(_themeModeKey, defaultValue: 'dark');
    state = state.copyWith(
      themeMode: _themeModeFromString(savedThemeMode),
      isLoading: false,
    );
  }

  /// Set theme mode
  Future<void> setThemeMode(ThemeMode mode) async {
    state = state.copyWith(themeMode: mode);
    await _box.put(_themeModeKey, _themeModeToString(mode));
  }

  /// Toggle between light and dark (skipping system)
  Future<void> toggleTheme() async {
    final newMode = state.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    await setThemeMode(newMode);
  }

  ThemeMode _themeModeFromString(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }
}

/// Provider for SettingsViewModel
final settingsViewModelProvider =
    StateNotifierProvider<SettingsViewModel, SettingsState>((ref) {
  return SettingsViewModel();
});

/// Provider for current theme mode
final themeModeProvider = Provider<ThemeMode>((ref) {
  return ref.watch(settingsViewModelProvider).themeMode;
});
