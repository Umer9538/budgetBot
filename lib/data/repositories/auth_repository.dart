import 'package:firebase_auth/firebase_auth.dart';

import '../models/models.dart';
import '../services/services.dart';

/// Repository for authentication - abstracts the AuthService
/// Provides a clean interface for ViewModels
class AuthRepository {
  AuthRepository({
    AuthService? authService,
  }) : _authService = authService ?? AuthService();

  final AuthService _authService;

  // ===== Auth State =====

  /// Stream of auth state changes
  Stream<User?> get authStateChanges => _authService.authStateChanges;

  /// Current user
  User? get currentUser => _authService.currentUser;

  /// Current user ID
  String? get currentUserId => currentUser?.uid;

  /// Check if user is signed in
  bool get isSignedIn => _authService.isSignedIn;

  // ===== Authentication =====

  /// Sign in with email and password
  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    return _authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Create account and user document
  Future<UserCredential> signUp({
    required String email,
    required String password,
    String? displayName,
  }) async {
    final credential = await _authService.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Update display name if provided
    if (displayName != null && credential.user != null) {
      await _authService.updateDisplayName(displayName);
    }

    // Create user document in Firestore
    if (credential.user != null) {
      await _authService.createUserDocument(
        credential.user!,
        displayName: displayName,
      );
    }

    return credential;
  }

  /// Sign out
  Future<void> signOut() async {
    await _authService.signOut();
  }

  /// Send password reset email
  Future<void> resetPassword(String email) async {
    await _authService.sendPasswordResetEmail(email);
  }

  // ===== User Data =====

  /// Get user data
  Future<UserModel?> getUserData() async {
    final userId = currentUserId;
    if (userId == null) return null;
    return _authService.getUserData(userId);
  }

  /// Stream user data
  Stream<UserModel?> watchUserData() {
    final userId = currentUserId;
    if (userId == null) return Stream.value(null);
    return _authService.watchUserData(userId);
  }

  /// Update user profile
  Future<void> updateProfile({
    String? displayName,
    String? photoURL,
  }) async {
    final userId = currentUserId;
    if (userId == null) throw Exception('No user signed in');

    // Update Firebase Auth profile
    if (displayName != null) {
      await _authService.updateDisplayName(displayName);
    }
    if (photoURL != null) {
      await _authService.updatePhotoURL(photoURL);
    }

    // Update Firestore document
    await _authService.updateUserProfile(
      userId: userId,
      displayName: displayName,
      photoURL: photoURL,
    );
  }

  /// Update user preferences
  Future<void> updatePreferences(UserPreferences preferences) async {
    final userId = currentUserId;
    if (userId == null) throw Exception('No user signed in');

    await _authService.updateUserPreferences(
      userId: userId,
      preferences: preferences,
    );
  }

  /// Delete account
  Future<void> deleteAccount() async {
    final userId = currentUserId;
    if (userId == null) throw Exception('No user signed in');

    // Delete Firestore document first
    await _authService.deleteUserDocument(userId);

    // Then delete Firebase Auth account
    await _authService.deleteAccount();
  }
}
