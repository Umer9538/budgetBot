import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/models.dart';

/// Service for handling Firebase Authentication operations
class AuthService {
  AuthService({
    FirebaseAuth? firebaseAuth,
    FirebaseFirestore? firestore,
  })  : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  // ===== Auth State =====

  /// Stream of auth state changes
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  /// Current Firebase user
  User? get currentUser => _firebaseAuth.currentUser;

  /// Check if user is signed in
  bool get isSignedIn => currentUser != null;

  // ===== Sign In / Sign Up =====

  /// Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Create account with email and password
  Future<UserCredential> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // ===== Password Reset =====

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  /// Send email verification
  Future<void> sendEmailVerification() async {
    await currentUser?.sendEmailVerification();
  }

  // ===== Profile Updates =====

  /// Update display name
  Future<void> updateDisplayName(String displayName) async {
    await currentUser?.updateDisplayName(displayName);
  }

  /// Update photo URL
  Future<void> updatePhotoURL(String photoURL) async {
    await currentUser?.updatePhotoURL(photoURL);
  }

  /// Delete account
  Future<void> deleteAccount() async {
    await currentUser?.delete();
  }

  // ===== Firestore User Operations =====

  /// Collection reference for users
  CollectionReference<Map<String, dynamic>> get _usersCollection =>
      _firestore.collection('users');

  /// Create user document in Firestore
  Future<void> createUserDocument(User user, {String? displayName}) async {
    final userModel = UserModel(
      id: user.uid,
      email: user.email ?? '',
      displayName: displayName ?? user.displayName,
      photoURL: user.photoURL,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _usersCollection.doc(user.uid).set(
          userModel.toJson(),
          SetOptions(merge: true),
        );
  }

  /// Get user data from Firestore
  Future<UserModel?> getUserData(String userId) async {
    final doc = await _usersCollection.doc(userId).get();
    if (!doc.exists) return null;
    return UserModel.fromFirestore(doc);
  }

  /// Stream user data
  Stream<UserModel?> watchUserData(String userId) {
    return _usersCollection.doc(userId).snapshots().map((doc) {
      if (!doc.exists) return null;
      return UserModel.fromFirestore(doc);
    });
  }

  /// Update user profile in Firestore
  Future<void> updateUserProfile({
    required String userId,
    String? displayName,
    String? photoURL,
  }) async {
    await _usersCollection.doc(userId).update({
      if (displayName != null) 'displayName': displayName,
      if (photoURL != null) 'photoURL': photoURL,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Update user preferences
  Future<void> updateUserPreferences({
    required String userId,
    required UserPreferences preferences,
  }) async {
    await _usersCollection.doc(userId).update({
      'preferences': preferences.toJson(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Delete user document
  Future<void> deleteUserDocument(String userId) async {
    await _usersCollection.doc(userId).delete();
  }
}
