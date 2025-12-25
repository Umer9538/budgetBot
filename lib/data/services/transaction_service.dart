import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/enums/enums.dart';
import '../models/models.dart';

/// Service for handling transaction operations with Firebase
class TransactionService {
  TransactionService({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  /// Get transactions collection for a user
  CollectionReference<Map<String, dynamic>> _transactionsCollection(
      String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions');
  }

  // ===== Read Operations =====

  /// Stream all transactions for a user
  Stream<List<TransactionModel>> watchTransactions(String userId) {
    return _transactionsCollection(userId)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TransactionModel.fromFirestore(doc))
            .toList());
  }

  /// Stream transactions for a date range
  Stream<List<TransactionModel>> watchTransactionsByDateRange({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    return _transactionsCollection(userId)
        .where('date', isGreaterThanOrEqualTo: startDate.toIso8601String())
        .where('date', isLessThanOrEqualTo: endDate.toIso8601String())
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TransactionModel.fromFirestore(doc))
            .toList());
  }

  /// Stream transactions by category
  Stream<List<TransactionModel>> watchTransactionsByCategory({
    required String userId,
    required CategoryType category,
  }) {
    return _transactionsCollection(userId)
        .where('category', isEqualTo: category.name)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TransactionModel.fromFirestore(doc))
            .toList());
  }

  /// Get a single transaction
  Future<TransactionModel?> getTransaction({
    required String userId,
    required String transactionId,
  }) async {
    final doc =
        await _transactionsCollection(userId).doc(transactionId).get();
    if (!doc.exists) return null;
    return TransactionModel.fromFirestore(doc);
  }

  /// Get transactions for a date range (one-time fetch)
  Future<List<TransactionModel>> getTransactionsByDateRange({
    required String userId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final snapshot = await _transactionsCollection(userId)
        .where('date', isGreaterThanOrEqualTo: startDate.toIso8601String())
        .where('date', isLessThanOrEqualTo: endDate.toIso8601String())
        .orderBy('date', descending: true)
        .get();

    return snapshot.docs
        .map((doc) => TransactionModel.fromFirestore(doc))
        .toList();
  }

  // ===== Write Operations =====

  /// Add a new transaction
  Future<TransactionModel> addTransaction({
    required String userId,
    required double amount,
    required String merchantName,
    required CategoryType category,
    required TransactionType type,
    required DateTime date,
    String? accountId,
    String? notes,
    List<String>? tags,
  }) async {
    final docRef = _transactionsCollection(userId).doc();

    final transaction = TransactionModel(
      id: docRef.id,
      userId: userId,
      amount: amount,
      merchantName: merchantName,
      category: category,
      type: type,
      date: date,
      accountId: accountId,
      notes: notes,
      tags: tags ?? [],
      isManual: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await docRef.set(transaction.toJson());
    return transaction;
  }

  /// Update a transaction
  Future<void> updateTransaction({
    required String userId,
    required String transactionId,
    double? amount,
    String? merchantName,
    CategoryType? category,
    TransactionType? type,
    DateTime? date,
    String? notes,
    List<String>? tags,
  }) async {
    final updates = <String, dynamic>{
      'updatedAt': FieldValue.serverTimestamp(),
    };

    if (amount != null) updates['amount'] = amount;
    if (merchantName != null) updates['merchantName'] = merchantName;
    if (category != null) updates['category'] = category.name;
    if (type != null) updates['type'] = type.name;
    if (date != null) updates['date'] = date.toIso8601String();
    if (notes != null) updates['notes'] = notes;
    if (tags != null) updates['tags'] = tags;

    await _transactionsCollection(userId).doc(transactionId).update(updates);
  }

  /// Delete a transaction
  Future<void> deleteTransaction({
    required String userId,
    required String transactionId,
  }) async {
    await _transactionsCollection(userId).doc(transactionId).delete();
  }

  // ===== Search =====

  /// Search transactions (limited client-side search)
  Future<List<TransactionModel>> searchTransactions({
    required String userId,
    required String query,
    int limit = 100,
  }) async {
    final snapshot = await _transactionsCollection(userId)
        .orderBy('date', descending: true)
        .limit(limit)
        .get();

    final lowerQuery = query.toLowerCase();

    return snapshot.docs
        .map((doc) => TransactionModel.fromFirestore(doc))
        .where((t) =>
            t.merchantName.toLowerCase().contains(lowerQuery) ||
            (t.notes?.toLowerCase().contains(lowerQuery) ?? false))
        .toList();
  }
}
