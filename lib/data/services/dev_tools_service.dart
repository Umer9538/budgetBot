import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../core/enums/enums.dart';

/// Service for development/testing tools
class DevToolsService {
  DevToolsService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;
  final _random = Random();

  /// Add dummy transactions for testing AI insights
  Future<int> addDummyTransactions(String userId) async {
    final batch = _firestore.batch();
    final transactionsRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions');

    final now = DateTime.now();
    int count = 0;

    // Generate transactions for the last 3 months
    final transactions = _generateDummyTransactions(now);

    for (final tx in transactions) {
      final docRef = transactionsRef.doc();
      batch.set(docRef, {
        'id': docRef.id,
        'userId': userId,  // Required field!
        ...tx,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });
      count++;
    }

    await batch.commit();
    debugPrint('Added $count dummy transactions for user: $userId');
    return count;
  }

  List<Map<String, dynamic>> _generateDummyTransactions(DateTime now) {
    final transactions = <Map<String, dynamic>>[];

    // === INCOME TRANSACTIONS ===
    // Monthly salary for last 3 months
    for (int i = 0; i < 3; i++) {
      final date = DateTime(now.year, now.month - i, 1);
      transactions.add(_createTransaction(
        amount: 5000.0 + _random.nextDouble() * 500,
        merchantName: 'ABC Corporation',
        category: CategoryType.salary,
        type: TransactionType.income,
        date: date,
        notes: 'Monthly salary',
      ));
    }

    // Freelance income
    transactions.add(_createTransaction(
      amount: 750.0,
      merchantName: 'Freelance Client',
      category: CategoryType.freelance,
      type: TransactionType.income,
      date: DateTime(now.year, now.month, 10),
      notes: 'Web design project',
    ));

    // === EXPENSE TRANSACTIONS ===

    // Rent - Monthly
    for (int i = 0; i < 3; i++) {
      final date = DateTime(now.year, now.month - i, 1);
      transactions.add(_createTransaction(
        amount: 1500.0,
        merchantName: 'Landlord Properties',
        category: CategoryType.rentMortgage,
        type: TransactionType.expense,
        date: date,
        notes: 'Monthly rent',
      ));
    }

    // Utilities
    for (int i = 0; i < 3; i++) {
      final date = DateTime(now.year, now.month - i, 15);
      transactions.add(_createTransaction(
        amount: 120.0 + _random.nextDouble() * 50,
        merchantName: 'Electric Company',
        category: CategoryType.utilities,
        type: TransactionType.expense,
        date: date,
        notes: 'Electricity bill',
      ));
    }

    // Phone & Internet
    transactions.add(_createTransaction(
      amount: 89.99,
      merchantName: 'Verizon',
      category: CategoryType.phoneAndInternet,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month, 5),
      notes: 'Phone bill',
    ));

    // Groceries - Multiple times per month
    final groceryStores = ['Walmart', 'Costco', 'Trader Joe\'s', 'Whole Foods', 'Safeway'];
    for (int i = 0; i < 12; i++) {
      final monthOffset = i ~/ 4;
      final dayOffset = (i % 4) * 7 + _random.nextInt(3);
      transactions.add(_createTransaction(
        amount: 50.0 + _random.nextDouble() * 150,
        merchantName: groceryStores[_random.nextInt(groceryStores.length)],
        category: CategoryType.groceries,
        type: TransactionType.expense,
        date: DateTime(now.year, now.month - monthOffset, dayOffset + 1),
        notes: 'Weekly groceries',
      ));
    }

    // Restaurants
    final restaurants = ['Chipotle', 'Olive Garden', 'Panera Bread', 'Subway', 'Local Diner'];
    for (int i = 0; i < 8; i++) {
      final monthOffset = i ~/ 3;
      transactions.add(_createTransaction(
        amount: 15.0 + _random.nextDouble() * 45,
        merchantName: restaurants[_random.nextInt(restaurants.length)],
        category: CategoryType.restaurants,
        type: TransactionType.expense,
        date: DateTime(now.year, now.month - monthOffset, _random.nextInt(28) + 1),
        notes: 'Dining out',
      ));
    }

    // Coffee shops
    final coffeeShops = ['Starbucks', 'Dunkin', 'Local Coffee', 'Peet\'s Coffee'];
    for (int i = 0; i < 15; i++) {
      final monthOffset = i ~/ 5;
      transactions.add(_createTransaction(
        amount: 4.0 + _random.nextDouble() * 8,
        merchantName: coffeeShops[_random.nextInt(coffeeShops.length)],
        category: CategoryType.coffeeShops,
        type: TransactionType.expense,
        date: DateTime(now.year, now.month - monthOffset, _random.nextInt(28) + 1),
        notes: 'Coffee',
      ));
    }

    // Food delivery
    for (int i = 0; i < 6; i++) {
      final monthOffset = i ~/ 2;
      transactions.add(_createTransaction(
        amount: 25.0 + _random.nextDouble() * 30,
        merchantName: ['DoorDash', 'Uber Eats', 'Grubhub'][_random.nextInt(3)],
        category: CategoryType.foodDelivery,
        type: TransactionType.expense,
        date: DateTime(now.year, now.month - monthOffset, _random.nextInt(28) + 1),
        notes: 'Food delivery',
      ));
    }

    // Fuel
    for (int i = 0; i < 6; i++) {
      final monthOffset = i ~/ 2;
      transactions.add(_createTransaction(
        amount: 40.0 + _random.nextDouble() * 30,
        merchantName: ['Shell', 'Chevron', 'BP', 'Exxon'][_random.nextInt(4)],
        category: CategoryType.fuel,
        type: TransactionType.expense,
        date: DateTime(now.year, now.month - monthOffset, _random.nextInt(28) + 1),
        notes: 'Gas',
      ));
    }

    // Ride share
    for (int i = 0; i < 4; i++) {
      transactions.add(_createTransaction(
        amount: 12.0 + _random.nextDouble() * 25,
        merchantName: ['Uber', 'Lyft'][_random.nextInt(2)],
        category: CategoryType.rideShare,
        type: TransactionType.expense,
        date: DateTime(now.year, now.month, _random.nextInt(28) + 1),
        notes: 'Ride',
      ));
    }

    // Streaming services
    transactions.add(_createTransaction(
      amount: 15.99,
      merchantName: 'Netflix',
      category: CategoryType.streamingServices,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month, 8),
      notes: 'Monthly subscription',
    ));
    transactions.add(_createTransaction(
      amount: 9.99,
      merchantName: 'Spotify',
      category: CategoryType.streamingServices,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month, 12),
      notes: 'Monthly subscription',
    ));
    transactions.add(_createTransaction(
      amount: 14.99,
      merchantName: 'Disney+',
      category: CategoryType.streamingServices,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month, 15),
      notes: 'Monthly subscription',
    ));

    // Shopping
    transactions.add(_createTransaction(
      amount: 89.99,
      merchantName: 'Amazon',
      category: CategoryType.onlineShopping,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month, 5),
      notes: 'Household items',
    ));
    transactions.add(_createTransaction(
      amount: 149.99,
      merchantName: 'Best Buy',
      category: CategoryType.electronics,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month, 18),
      notes: 'Headphones',
    ));
    transactions.add(_createTransaction(
      amount: 65.00,
      merchantName: 'Target',
      category: CategoryType.clothing,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month - 1, 22),
      notes: 'New clothes',
    ));

    // Fitness
    transactions.add(_createTransaction(
      amount: 49.99,
      merchantName: 'Planet Fitness',
      category: CategoryType.fitness,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month, 1),
      notes: 'Gym membership',
    ));

    // Medical
    transactions.add(_createTransaction(
      amount: 35.00,
      merchantName: 'CVS Pharmacy',
      category: CategoryType.pharmacy,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month, 10),
      notes: 'Prescription',
    ));

    // Insurance
    transactions.add(_createTransaction(
      amount: 150.00,
      merchantName: 'State Farm',
      category: CategoryType.insurance,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month, 1),
      notes: 'Car insurance',
    ));

    // Savings
    transactions.add(_createTransaction(
      amount: 500.00,
      merchantName: 'Savings Account',
      category: CategoryType.savings,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month, 1),
      notes: 'Monthly savings transfer',
    ));

    // Gaming
    transactions.add(_createTransaction(
      amount: 59.99,
      merchantName: 'Steam',
      category: CategoryType.gaming,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month, 20),
      notes: 'New game',
    ));

    // Gifts
    transactions.add(_createTransaction(
      amount: 75.00,
      merchantName: 'Gift Shop',
      category: CategoryType.gifts,
      type: TransactionType.expense,
      date: DateTime(now.year, now.month - 1, 15),
      notes: 'Birthday gift',
    ));

    return transactions;
  }

  Map<String, dynamic> _createTransaction({
    required double amount,
    required String merchantName,
    required CategoryType category,
    required TransactionType type,
    required DateTime date,
    String? notes,
    List<String>? tags,
  }) {
    return {
      'amount': amount,
      'currency': 'USD',
      'merchantName': merchantName,
      'category': category.name,
      'type': type.name,
      'date': date.toIso8601String(),  // Store as ISO8601 string to match queries
      'notes': notes,
      'tags': tags ?? [],
      'isManual': true,
      'isRecurring': false,
      'isPending': false,
    };
  }

  /// Clear all transactions for a user
  Future<int> clearAllTransactions(String userId) async {
    final transactionsRef = _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions');

    final snapshot = await transactionsRef.get();
    final batch = _firestore.batch();

    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
    debugPrint('Cleared ${snapshot.docs.length} transactions for user: $userId');
    return snapshot.docs.length;
  }
}
