import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/models.dart';
import '../../data/repositories/auth_repository.dart';

/// Auth state for the ViewModel
class AuthState {
  const AuthState({
    this.user,
    this.userData,
    this.isLoading = false,
    this.error,
  });

  final User? user;
  final UserModel? userData;
  final bool isLoading;
  final String? error;

  bool get isAuthenticated => user != null;

  AuthState copyWith({
    User? user,
    UserModel? userData,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      user: user ?? this.user,
      userData: userData ?? this.userData,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// ViewModel for authentication
class AuthViewModel extends StateNotifier<AuthState> {
  AuthViewModel({AuthRepository? repository})
      : _repository = repository ?? AuthRepository(),
        super(const AuthState(isLoading: true)) {
    _init();
  }

  final AuthRepository _repository;
  bool _isFirstAuthEvent = true;

  void _init() {
    // Listen to auth state changes
    _repository.authStateChanges.listen((user) {
      // On first event, we now know the auth state
      if (_isFirstAuthEvent) {
        _isFirstAuthEvent = false;
        state = state.copyWith(user: user, isLoading: false);
      } else {
        state = state.copyWith(user: user);
      }

      if (user != null) {
        _loadUserData();
      } else {
        state = state.copyWith(userData: null);
      }
    });
  }

  Future<void> _loadUserData() async {
    try {
      final userData = await _repository.getUserData();
      state = state.copyWith(userData: userData);
    } catch (e) {
      // Ignore errors loading user data
    }
  }

  /// Sign in with email and password
  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.signIn(email: email, password: password);
      state = state.copyWith(isLoading: false);
      return true;
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getAuthErrorMessage(e.code),
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred',
      );
      return false;
    }
  }

  /// Sign up with email and password
  Future<bool> signUp({
    required String email,
    required String password,
    String? displayName,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.signUp(
        email: email,
        password: password,
        displayName: displayName,
      );
      state = state.copyWith(isLoading: false);
      return true;
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getAuthErrorMessage(e.code),
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'An unexpected error occurred',
      );
      return false;
    }
  }

  /// Sign out
  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.signOut();
      state = const AuthState();
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to sign out',
      );
    }
  }

  /// Reset password
  Future<bool> resetPassword(String email) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.resetPassword(email);
      state = state.copyWith(isLoading: false);
      return true;
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: _getAuthErrorMessage(e.code),
      );
      return false;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to send reset email',
      );
      return false;
    }
  }

  /// Sign in with biometric (uses cached Firebase session)
  /// This works by checking if the user's Firebase session is still valid
  Future<bool> signInWithBiometric(String email) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      // Check if there's a current user with a valid session
      final currentUser = _repository.currentUser;

      if (currentUser != null && currentUser.email == email) {
        // User session is still valid
        await _loadUserData();
        state = state.copyWith(isLoading: false);
        return true;
      } else {
        // Session expired or different user
        state = state.copyWith(
          isLoading: false,
          error: 'Session expired. Please sign in with your password.',
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Biometric sign in failed',
      );
      return false;
    }
  }

  /// Update user profile
  Future<bool> updateProfile({
    String? displayName,
    String? photoURL,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _repository.updateProfile(
        displayName: displayName,
        photoURL: photoURL,
      );
      await _loadUserData();
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to update profile',
      );
      return false;
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }

  String _getAuthErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No account found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'weak-password':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Invalid email address';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later';
      default:
        return 'Authentication failed';
    }
  }
}

/// Provider for AuthViewModel
final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel();
});

/// Provider for current user ID
final currentUserIdProvider = Provider<String?>((ref) {
  return ref.watch(authViewModelProvider).user?.uid;
});

/// Provider for checking if user is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authViewModelProvider).isAuthenticated;
});
