import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../models/security_question_model.dart';

/// Service for managing security questions
class SecurityQuestionsService {
  SecurityQuestionsService({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  /// Get security questions document for a user (stored under user document)
  DocumentReference _securityDoc(String userId) =>
      _firestore.collection('users').doc(userId).collection('settings').doc('security_questions');

  /// Hash an answer for secure storage
  String _hashAnswer(String answer) {
    final normalizedAnswer = answer.toLowerCase().trim();
    final bytes = utf8.encode(normalizedAnswer);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  /// Save security questions for the current user
  Future<void> saveSecurityQuestions({
    required List<Map<String, String>> questionsAndAnswers,
  }) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('User not authenticated');

    final userId = user.uid;
    final userEmail = user.email;

    // Ensure user document has email stored (for password recovery lookup)
    if (userEmail != null) {
      await _firestore.collection('users').doc(userId).set(
        {'email': userEmail.toLowerCase().trim()},
        SetOptions(merge: true),
      );
      debugPrint('Updated user document with email: $userEmail');
    }

    final questions = questionsAndAnswers.map((qa) {
      return UserSecurityQuestion(
        question: qa['question']!,
        answerHash: _hashAnswer(qa['answer']!),
      );
    }).toList();

    final data = UserSecurityData(
      userId: userId,
      questions: questions,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _securityDoc(userId).set(data.toFirestore());
    debugPrint('Security questions saved for user: $userId');
  }

  /// Check if user has security questions set up
  Future<bool> hasSecurityQuestions(String? userId) async {
    if (userId == null) return false;

    final doc = await _securityDoc(userId).get();
    return doc.exists;
  }

  /// Check if current user has security questions
  Future<bool> currentUserHasSecurityQuestions() async {
    return hasSecurityQuestions(_auth.currentUser?.uid);
  }

  /// Get security questions for a user (without answers)
  Future<List<String>> getSecurityQuestions(String email) async {
    debugPrint('=== getSecurityQuestions called for email: $email ===');

    // Find user by email
    final userId = await _getUserIdByEmail(email);
    debugPrint('Found userId: $userId');

    if (userId == null) {
      debugPrint('No user found for email: $email');
      return [];
    }

    try {
      final doc = await _securityDoc(userId).get();
      debugPrint('Security doc exists: ${doc.exists}');

      if (!doc.exists) {
        debugPrint('No security questions document found for userId: $userId');
        return [];
      }

      final data = UserSecurityData.fromJson(doc.data() as Map<String, dynamic>);
      final questions = data.questions.map((q) => q.question).toList();
      debugPrint('Found ${questions.length} security questions');
      return questions;
    } catch (e) {
      debugPrint('Error reading security questions: $e');
      return [];
    }
  }

  /// Verify security question answers
  Future<bool> verifyAnswers({
    required String email,
    required List<Map<String, String>> questionsAndAnswers,
  }) async {
    final userId = await _getUserIdByEmail(email);
    if (userId == null) return false;

    final doc = await _securityDoc(userId).get();
    if (!doc.exists) return false;

    final data = UserSecurityData.fromJson(doc.data() as Map<String, dynamic>);

    // Verify each answer
    for (final qa in questionsAndAnswers) {
      final question = qa['question']!;
      final answer = qa['answer']!;
      final answerHash = _hashAnswer(answer);

      final storedQuestion = data.questions.firstWhere(
        (q) => q.question == question,
        orElse: () => const UserSecurityQuestion(question: '', answerHash: ''),
      );

      if (storedQuestion.answerHash != answerHash) {
        return false;
      }
    }

    return true;
  }

  /// Get user ID by email from Firebase Auth
  Future<String?> _getUserIdByEmail(String email) async {
    final normalizedEmail = email.toLowerCase().trim();
    debugPrint('=== _getUserIdByEmail called for: $normalizedEmail ===');

    try {
      // Query Firestore users collection to find user by email
      final querySnapshot = await _firestore
          .collection('users')
          .where('email', isEqualTo: normalizedEmail)
          .limit(1)
          .get();

      debugPrint('Query returned ${querySnapshot.docs.length} documents');

      if (querySnapshot.docs.isNotEmpty) {
        final userId = querySnapshot.docs.first.id;
        final docData = querySnapshot.docs.first.data();
        debugPrint('Found user: $userId');
        debugPrint('User data keys: ${docData.keys.toList()}');
        return userId;
      }

      debugPrint('No user document found with email: $normalizedEmail');
      return null;
    } catch (e) {
      debugPrint('Error querying user by email: $e');
      return null;
    }
  }

  /// Reset password after security questions verified
  Future<bool> resetPasswordWithSecurityQuestions({
    required String email,
    required String newPassword,
  }) async {
    try {
      // Since we can't directly change password without being signed in,
      // we'll send a password reset email as a fallback
      // In a production app, you'd use Firebase Admin SDK via Cloud Functions
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Update security questions for current user
  Future<void> updateSecurityQuestions({
    required List<Map<String, String>> questionsAndAnswers,
  }) async {
    await saveSecurityQuestions(questionsAndAnswers: questionsAndAnswers);
  }

  /// Delete security questions for current user
  Future<void> deleteSecurityQuestions() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;

    await _securityDoc(userId).delete();
  }
}
