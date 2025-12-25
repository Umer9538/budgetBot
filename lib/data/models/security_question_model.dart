import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_question_model.freezed.dart';
part 'security_question_model.g.dart';

/// Predefined security questions
class SecurityQuestions {
  static const List<String> questions = [
    "What is your mother's maiden name?",
    "What was the name of your first pet?",
    "What city were you born in?",
    "What was your childhood nickname?",
    "What is your favorite movie?",
    "What was the name of your first school?",
    "What is your favorite book?",
    "What was the make of your first car?",
    "What is your favorite food?",
    "What street did you grow up on?",
    "What is your best friend's name?",
    "What was your dream job as a child?",
  ];
}

/// User's security question with answer
@freezed
class UserSecurityQuestion with _$UserSecurityQuestion {
  const factory UserSecurityQuestion({
    required String question,
    required String answerHash, // Store hashed answer for security
  }) = _UserSecurityQuestion;

  factory UserSecurityQuestion.fromJson(Map<String, dynamic> json) =>
      _$UserSecurityQuestionFromJson(json);
}

/// User's security questions data stored in Firestore
@freezed
class UserSecurityData with _$UserSecurityData {
  const UserSecurityData._();

  const factory UserSecurityData({
    required String userId,
    required List<UserSecurityQuestion> questions,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _UserSecurityData;

  factory UserSecurityData.fromJson(Map<String, dynamic> json) =>
      _$UserSecurityDataFromJson(json);

  /// Convert to Firestore-compatible map with properly serialized questions
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'questions': questions.map((q) => q.toJson()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
