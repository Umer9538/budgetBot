import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service for handling biometric authentication
class BiometricService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  static const String _biometricEnabledKey = 'biometric_enabled';
  static const String _biometricUserEmailKey = 'biometric_user_email';

  /// Check if device supports biometrics
  Future<bool> isDeviceSupported() async {
    try {
      return await _localAuth.isDeviceSupported();
    } on PlatformException {
      return false;
    }
  }

  /// Check if biometrics are available and enrolled
  Future<bool> canCheckBiometrics() async {
    try {
      return await _localAuth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  /// Get available biometric types
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } on PlatformException {
      return [];
    }
  }

  /// Check if biometrics are available (device supported + enrolled)
  Future<bool> isBiometricAvailable() async {
    final isSupported = await isDeviceSupported();
    final canCheck = await canCheckBiometrics();
    return isSupported && canCheck;
  }

  /// Authenticate using biometrics
  Future<bool> authenticate({
    String reason = 'Please authenticate to access BudgetBot',
  }) async {
    try {
      final isAvailable = await isBiometricAvailable();
      if (!isAvailable) {
        return false;
      }

      return await _localAuth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false, // Allow PIN/Pattern as fallback
          useErrorDialogs: true,
        ),
      );
    } on PlatformException catch (e) {
      print('Biometric authentication error: ${e.message}');
      return false;
    }
  }

  /// Authenticate with biometric only (no PIN fallback)
  Future<bool> authenticateBiometricOnly({
    String reason = 'Please use biometrics to authenticate',
  }) async {
    try {
      final isAvailable = await isBiometricAvailable();
      if (!isAvailable) {
        return false;
      }

      return await _localAuth.authenticate(
        localizedReason: reason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
          useErrorDialogs: true,
        ),
      );
    } on PlatformException catch (e) {
      print('Biometric authentication error: ${e.message}');
      return false;
    }
  }

  /// Check if biometric login is enabled for the app
  Future<bool> isBiometricEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_biometricEnabledKey) ?? false;
  }

  /// Enable/disable biometric login
  Future<void> setBiometricEnabled(bool enabled, {String? userEmail}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_biometricEnabledKey, enabled);

    if (enabled && userEmail != null) {
      await prefs.setString(_biometricUserEmailKey, userEmail);
    } else if (!enabled) {
      await prefs.remove(_biometricUserEmailKey);
    }
  }

  /// Get the email of user who enabled biometrics
  Future<String?> getBiometricUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_biometricUserEmailKey);
  }

  /// Get a human-readable name for the available biometric type
  Future<String> getBiometricTypeName() async {
    final biometrics = await getAvailableBiometrics();

    if (biometrics.contains(BiometricType.face)) {
      return 'Face ID';
    } else if (biometrics.contains(BiometricType.fingerprint)) {
      return 'Fingerprint';
    } else if (biometrics.contains(BiometricType.iris)) {
      return 'Iris';
    } else if (biometrics.contains(BiometricType.strong)) {
      return 'Biometrics';
    } else if (biometrics.contains(BiometricType.weak)) {
      return 'Biometrics';
    }

    return 'Biometrics';
  }

  /// Cancel any ongoing authentication
  Future<bool> cancelAuthentication() async {
    try {
      return await _localAuth.stopAuthentication();
    } on PlatformException {
      return false;
    }
  }
}
