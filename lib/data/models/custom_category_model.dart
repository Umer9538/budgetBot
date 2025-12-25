import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../core/enums/enums.dart';

/// Model for custom user-defined categories
/// This extends the base CategoryType enum with user-created categories
class CustomCategoryModel {
  const CustomCategoryModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.displayName,
    required this.iconName,
    required this.colorValue,
    required this.group,
    this.parentCategory,
    this.isSystem = false,
    this.isActive = true,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String userId;
  final String name; // Machine-readable name (e.g., "my_custom_cat")
  final String displayName; // User-facing name (e.g., "My Custom Category")
  final String iconName; // Icon name from Icons class
  final int colorValue; // Color as int value
  final String group; // CategoryGroup name
  final String? parentCategory; // For subcategories
  final bool isSystem; // True for default categories
  final bool isActive; // Can be disabled but not deleted
  final DateTime? createdAt;
  final DateTime? updatedAt;

  /// Get the Color object
  Color get color => Color(colorValue);

  /// Get the CategoryGroup
  CategoryGroup get categoryGroup {
    try {
      return CategoryGroup.values.firstWhere((g) => g.name == group);
    } catch (_) {
      return CategoryGroup.other;
    }
  }

  /// Get icon data from icon name
  IconData get iconData {
    // Map common icon names to IconData
    final iconMap = <String, IconData>{
      'home': Icons.home,
      'home_outlined': Icons.home_outlined,
      'restaurant': Icons.restaurant,
      'restaurant_outlined': Icons.restaurant_outlined,
      'local_cafe': Icons.local_cafe,
      'local_grocery_store': Icons.local_grocery_store,
      'shopping_bag': Icons.shopping_bag,
      'shopping_cart': Icons.shopping_cart,
      'local_gas_station': Icons.local_gas_station,
      'directions_car': Icons.directions_car,
      'directions_bus': Icons.directions_bus,
      'medical_services': Icons.medical_services,
      'fitness_center': Icons.fitness_center,
      'movie': Icons.movie,
      'music_note': Icons.music_note,
      'gamepad': Icons.gamepad,
      'school': Icons.school,
      'work': Icons.work,
      'attach_money': Icons.attach_money,
      'savings': Icons.savings,
      'credit_card': Icons.credit_card,
      'account_balance': Icons.account_balance,
      'category': Icons.category,
      'more_horiz': Icons.more_horiz,
      'pets': Icons.pets,
      'child_care': Icons.child_care,
      'flight': Icons.flight,
      'hotel': Icons.hotel,
      'spa': Icons.spa,
      'sports': Icons.sports,
      'phone_android': Icons.phone_android,
      'wifi': Icons.wifi,
      'subscriptions': Icons.subscriptions,
      'card_giftcard': Icons.card_giftcard,
      'volunteer_activism': Icons.volunteer_activism,
    };

    return iconMap[iconName] ?? Icons.category;
  }

  /// Convert to Firestore document
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'displayName': displayName,
      'iconName': iconName,
      'colorValue': colorValue,
      'group': group,
      'parentCategory': parentCategory,
      'isSystem': isSystem,
      'isActive': isActive,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  /// Create from Firestore document
  factory CustomCategoryModel.fromJson(Map<String, dynamic> json) {
    return CustomCategoryModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      iconName: json['iconName'] as String,
      colorValue: json['colorValue'] as int,
      group: json['group'] as String,
      parentCategory: json['parentCategory'] as String?,
      isSystem: json['isSystem'] as bool? ?? false,
      isActive: json['isActive'] as bool? ?? true,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
    );
  }

  /// Create from Firestore document snapshot
  factory CustomCategoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};
    return CustomCategoryModel.fromJson({...data, 'id': doc.id});
  }

  /// Create from existing CategoryType enum
  factory CustomCategoryModel.fromCategoryType(
    CategoryType type,
    String userId,
  ) {
    return CustomCategoryModel(
      id: 'system_${type.name}',
      userId: userId,
      name: type.name,
      displayName: type.displayName,
      iconName: _iconToName(type.iconData),
      colorValue: type.color.toARGB32(),
      group: type.group.name,
      isSystem: true,
      isActive: true,
      createdAt: DateTime.now(),
    );
  }

  /// Copy with modifications
  CustomCategoryModel copyWith({
    String? displayName,
    String? iconName,
    int? colorValue,
    String? group,
    String? parentCategory,
    bool? isActive,
  }) {
    return CustomCategoryModel(
      id: id,
      userId: userId,
      name: name,
      displayName: displayName ?? this.displayName,
      iconName: iconName ?? this.iconName,
      colorValue: colorValue ?? this.colorValue,
      group: group ?? this.group,
      parentCategory: parentCategory ?? this.parentCategory,
      isSystem: isSystem,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }

  /// Convert icon data to icon name
  static String _iconToName(IconData icon) {
    // This is a reverse mapping - in production you might want a more robust solution
    if (icon == Icons.home) return 'home';
    if (icon == Icons.restaurant) return 'restaurant';
    if (icon == Icons.local_cafe) return 'local_cafe';
    if (icon == Icons.local_grocery_store) return 'local_grocery_store';
    if (icon == Icons.shopping_bag) return 'shopping_bag';
    if (icon == Icons.local_gas_station) return 'local_gas_station';
    if (icon == Icons.directions_car) return 'directions_car';
    if (icon == Icons.medical_services) return 'medical_services';
    if (icon == Icons.movie) return 'movie';
    if (icon == Icons.attach_money) return 'attach_money';
    return 'category';
  }
}

/// Unified category that can be either a system CategoryType or custom category
class UnifiedCategory {
  const UnifiedCategory._({
    required this.id,
    required this.name,
    required this.displayName,
    required this.iconData,
    required this.color,
    required this.group,
    this.systemCategory,
    this.customCategory,
  });

  final String id;
  final String name;
  final String displayName;
  final IconData iconData;
  final Color color;
  final CategoryGroup group;
  final CategoryType? systemCategory;
  final CustomCategoryModel? customCategory;

  /// Is this a system (enum) category
  bool get isSystem => systemCategory != null;

  /// Is this a custom category
  bool get isCustom => customCategory != null;

  /// Create from CategoryType enum
  factory UnifiedCategory.fromSystem(CategoryType type) {
    return UnifiedCategory._(
      id: 'system_${type.name}',
      name: type.name,
      displayName: type.displayName,
      iconData: type.iconData,
      color: type.color,
      group: type.group,
      systemCategory: type,
    );
  }

  /// Create from CustomCategoryModel
  factory UnifiedCategory.fromCustom(CustomCategoryModel custom) {
    return UnifiedCategory._(
      id: custom.id,
      name: custom.name,
      displayName: custom.displayName,
      iconData: custom.iconData,
      color: custom.color,
      group: custom.categoryGroup,
      customCategory: custom,
    );
  }

  /// Get all unified categories (system + custom)
  static List<UnifiedCategory> getAllCategories({
    List<CustomCategoryModel>? customCategories,
  }) {
    final categories = <UnifiedCategory>[];

    // Add all system categories
    for (final type in CategoryType.values) {
      categories.add(UnifiedCategory.fromSystem(type));
    }

    // Add custom categories
    if (customCategories != null) {
      for (final custom in customCategories) {
        if (custom.isActive && !custom.isSystem) {
          categories.add(UnifiedCategory.fromCustom(custom));
        }
      }
    }

    return categories;
  }
}
