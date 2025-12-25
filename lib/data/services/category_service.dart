import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../core/enums/enums.dart';
import '../models/custom_category_model.dart';

/// Service for managing categories (both system and custom)
class CategoryService {
  CategoryService({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;
  static const _uuid = Uuid();

  /// Get categories collection for a user
  CollectionReference<Map<String, dynamic>> _categoriesCollection(String userId) {
    return _firestore.collection('users').doc(userId).collection('categories');
  }

  // ===== Read Operations =====

  /// Stream all categories for a user (includes both system and custom)
  Stream<List<CustomCategoryModel>> watchCategories(String userId) {
    return _categoriesCollection(userId)
        .where('isActive', isEqualTo: true)
        .orderBy('displayName')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => CustomCategoryModel.fromFirestore(doc))
            .toList());
  }

  /// Get all categories (one-time fetch)
  Future<List<CustomCategoryModel>> getCategories(String userId) async {
    final snapshot = await _categoriesCollection(userId)
        .where('isActive', isEqualTo: true)
        .get();
    return snapshot.docs
        .map((doc) => CustomCategoryModel.fromFirestore(doc))
        .toList();
  }

  /// Get custom categories only (non-system)
  Future<List<CustomCategoryModel>> getCustomCategories(String userId) async {
    final snapshot = await _categoriesCollection(userId)
        .where('isSystem', isEqualTo: false)
        .where('isActive', isEqualTo: true)
        .get();
    return snapshot.docs
        .map((doc) => CustomCategoryModel.fromFirestore(doc))
        .toList();
  }

  /// Get categories by group
  Future<List<CustomCategoryModel>> getCategoriesByGroup(
    String userId,
    CategoryGroup group,
  ) async {
    final snapshot = await _categoriesCollection(userId)
        .where('group', isEqualTo: group.name)
        .where('isActive', isEqualTo: true)
        .get();
    return snapshot.docs
        .map((doc) => CustomCategoryModel.fromFirestore(doc))
        .toList();
  }

  /// Get a single category by ID
  Future<CustomCategoryModel?> getCategory(String userId, String categoryId) async {
    final doc = await _categoriesCollection(userId).doc(categoryId).get();
    if (!doc.exists) return null;
    return CustomCategoryModel.fromFirestore(doc);
  }

  /// Get a category by name
  Future<CustomCategoryModel?> getCategoryByName(String userId, String name) async {
    final snapshot = await _categoriesCollection(userId)
        .where('name', isEqualTo: name)
        .limit(1)
        .get();
    if (snapshot.docs.isEmpty) return null;
    return CustomCategoryModel.fromFirestore(snapshot.docs.first);
  }

  // ===== Write Operations =====

  /// Initialize default categories for a new user
  Future<void> initializeDefaultCategories(String userId) async {
    final batch = _firestore.batch();

    for (final type in CategoryType.values) {
      final category = CustomCategoryModel.fromCategoryType(type, userId);
      final docRef = _categoriesCollection(userId).doc(category.id);
      batch.set(docRef, category.toJson());
    }

    await batch.commit();
  }

  /// Create a custom category
  Future<CustomCategoryModel> createCategory({
    required String userId,
    required String displayName,
    required String iconName,
    required int colorValue,
    required CategoryGroup group,
    String? parentCategory,
  }) async {
    // Generate a unique name from display name
    final name = displayName
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]'), '_')
        .replaceAll(RegExp(r'_+'), '_')
        .replaceAll(RegExp(r'^_|_$'), '');

    final uniqueName = '${name}_${_uuid.v4().substring(0, 8)}';

    final category = CustomCategoryModel(
      id: _uuid.v4(),
      userId: userId,
      name: uniqueName,
      displayName: displayName,
      iconName: iconName,
      colorValue: colorValue,
      group: group.name,
      parentCategory: parentCategory,
      isSystem: false,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _categoriesCollection(userId).doc(category.id).set(category.toJson());
    return category;
  }

  /// Update a custom category
  Future<void> updateCategory({
    required String userId,
    required String categoryId,
    String? displayName,
    String? iconName,
    int? colorValue,
    CategoryGroup? group,
  }) async {
    final updates = <String, dynamic>{
      'updatedAt': FieldValue.serverTimestamp(),
    };

    if (displayName != null) updates['displayName'] = displayName;
    if (iconName != null) updates['iconName'] = iconName;
    if (colorValue != null) updates['colorValue'] = colorValue;
    if (group != null) updates['group'] = group.name;

    await _categoriesCollection(userId).doc(categoryId).update(updates);
  }

  /// Delete a custom category (soft delete - just deactivates)
  Future<void> deleteCategory(String userId, String categoryId) async {
    // Check if it's a system category
    final doc = await _categoriesCollection(userId).doc(categoryId).get();
    if (!doc.exists) return;

    final category = CustomCategoryModel.fromFirestore(doc);
    if (category.isSystem) {
      throw Exception('Cannot delete system categories');
    }

    await _categoriesCollection(userId).doc(categoryId).update({
      'isActive': false,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  /// Restore a deleted category
  Future<void> restoreCategory(String userId, String categoryId) async {
    await _categoriesCollection(userId).doc(categoryId).update({
      'isActive': true,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // ===== Utility Methods =====

  /// Get unified categories combining system and custom
  Future<List<UnifiedCategory>> getUnifiedCategories(String userId) async {
    final customCategories = await getCustomCategories(userId);
    return UnifiedCategory.getAllCategories(customCategories: customCategories);
  }

  /// Map a category name to CategoryType or custom category
  Future<CategoryType?> resolveCategoryType(String userId, String categoryName) async {
    // First try to match system categories
    for (final type in CategoryType.values) {
      if (type.name == categoryName) {
        return type;
      }
    }

    // If not found, check custom categories
    final custom = await getCategoryByName(userId, categoryName);
    if (custom != null) {
      // Return the closest matching system category or miscellaneous
      return CategoryType.miscellaneous;
    }

    return null;
  }
}

/// Predefined icon options for category creation
class CategoryIconOptions {
  static const List<Map<String, dynamic>> icons = [
    {'name': 'restaurant', 'icon': Icons.restaurant},
    {'name': 'local_cafe', 'icon': Icons.local_cafe},
    {'name': 'local_grocery_store', 'icon': Icons.local_grocery_store},
    {'name': 'shopping_bag', 'icon': Icons.shopping_bag},
    {'name': 'shopping_cart', 'icon': Icons.shopping_cart},
    {'name': 'local_gas_station', 'icon': Icons.local_gas_station},
    {'name': 'directions_car', 'icon': Icons.directions_car},
    {'name': 'directions_bus', 'icon': Icons.directions_bus},
    {'name': 'flight', 'icon': Icons.flight},
    {'name': 'hotel', 'icon': Icons.hotel},
    {'name': 'home', 'icon': Icons.home},
    {'name': 'medical_services', 'icon': Icons.medical_services},
    {'name': 'fitness_center', 'icon': Icons.fitness_center},
    {'name': 'spa', 'icon': Icons.spa},
    {'name': 'movie', 'icon': Icons.movie},
    {'name': 'music_note', 'icon': Icons.music_note},
    {'name': 'gamepad', 'icon': Icons.gamepad},
    {'name': 'sports', 'icon': Icons.sports},
    {'name': 'school', 'icon': Icons.school},
    {'name': 'work', 'icon': Icons.work},
    {'name': 'attach_money', 'icon': Icons.attach_money},
    {'name': 'savings', 'icon': Icons.savings},
    {'name': 'credit_card', 'icon': Icons.credit_card},
    {'name': 'account_balance', 'icon': Icons.account_balance},
    {'name': 'pets', 'icon': Icons.pets},
    {'name': 'child_care', 'icon': Icons.child_care},
    {'name': 'phone_android', 'icon': Icons.phone_android},
    {'name': 'wifi', 'icon': Icons.wifi},
    {'name': 'subscriptions', 'icon': Icons.subscriptions},
    {'name': 'card_giftcard', 'icon': Icons.card_giftcard},
    {'name': 'volunteer_activism', 'icon': Icons.volunteer_activism},
    {'name': 'category', 'icon': Icons.category},
  ];

  static IconData getIcon(String name) {
    final match = icons.firstWhere(
      (i) => i['name'] == name,
      orElse: () => {'icon': Icons.category},
    );
    return match['icon'] as IconData;
  }
}

/// Predefined color options for category creation
class CategoryColorOptions {
  static const List<Color> colors = [
    Color(0xFF8B5CF6), // Amethyst
    Color(0xFFD4A574), // Champagne Gold
    Color(0xFFFF8A80), // Coral
    Color(0xFF4CAF50), // Green
    Color(0xFF2196F3), // Blue
    Color(0xFFFF9800), // Orange
    Color(0xFFE91E63), // Pink
    Color(0xFF9C27B0), // Purple
    Color(0xFF00BCD4), // Cyan
    Color(0xFF795548), // Brown
    Color(0xFF607D8B), // Blue Grey
    Color(0xFFFF5722), // Deep Orange
    Color(0xFF009688), // Teal
    Color(0xFF673AB7), // Deep Purple
    Color(0xFF3F51B5), // Indigo
  ];
}

/// Provider for CategoryService
final categoryServiceProvider = Provider<CategoryService>((ref) {
  return CategoryService();
});
