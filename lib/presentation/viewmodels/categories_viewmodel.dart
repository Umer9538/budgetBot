import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/enums/enums.dart';
import '../../data/models/custom_category_model.dart';
import '../../data/services/category_service.dart';
import 'auth_viewmodel.dart';

/// State for categories
class CategoriesState {
  const CategoriesState({
    this.categories = const [],
    this.customCategories = const [],
    this.isLoading = false,
    this.error,
  });

  final List<UnifiedCategory> categories;
  final List<CustomCategoryModel> customCategories;
  final bool isLoading;
  final String? error;

  CategoriesState copyWith({
    List<UnifiedCategory>? categories,
    List<CustomCategoryModel>? customCategories,
    bool? isLoading,
    String? error,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      customCategories: customCategories ?? this.customCategories,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  /// Get categories by group
  List<UnifiedCategory> getCategoriesByGroup(CategoryGroup group) {
    return categories.where((c) => c.group == group).toList();
  }

  /// Get expense categories
  List<UnifiedCategory> get expenseCategories {
    return categories.where((c) => c.group != CategoryGroup.income).toList();
  }

  /// Get income categories
  List<UnifiedCategory> get incomeCategories {
    return categories.where((c) => c.group == CategoryGroup.income).toList();
  }
}

/// ViewModel for categories
class CategoriesViewModel extends StateNotifier<CategoriesState> {
  CategoriesViewModel({
    required String userId,
    CategoryService? service,
  })  : _userId = userId,
        _service = service ?? CategoryService(),
        super(const CategoriesState()) {
    _init();
  }

  final String _userId;
  final CategoryService _service;
  StreamSubscription? _subscription;

  Future<void> _init() async {
    await _loadCategories();
    _watchCategories();
  }

  Future<void> _loadCategories() async {
    state = state.copyWith(isLoading: true);
    try {
      final customCategories = await _service.getCustomCategories(_userId);
      final categories = UnifiedCategory.getAllCategories(
        customCategories: customCategories,
      );
      state = state.copyWith(
        categories: categories,
        customCategories: customCategories,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to load categories',
      );
    }
  }

  void _watchCategories() {
    _subscription?.cancel();
    _subscription = _service.watchCategories(_userId).listen(
      (customCategories) {
        final categories = UnifiedCategory.getAllCategories(
          customCategories: customCategories,
        );
        state = state.copyWith(
          categories: categories,
          customCategories: customCategories.where((c) => !c.isSystem).toList(),
        );
      },
      onError: (error) {
        state = state.copyWith(error: 'Failed to sync categories');
      },
    );
  }

  /// Create a custom category
  Future<bool> createCategory({
    required String displayName,
    required String iconName,
    required int colorValue,
    required CategoryGroup group,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _service.createCategory(
        userId: _userId,
        displayName: displayName,
        iconName: iconName,
        colorValue: colorValue,
        group: group,
      );
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to create category',
      );
      return false;
    }
  }

  /// Update a custom category
  Future<bool> updateCategory({
    required String categoryId,
    String? displayName,
    String? iconName,
    int? colorValue,
    CategoryGroup? group,
  }) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _service.updateCategory(
        userId: _userId,
        categoryId: categoryId,
        displayName: displayName,
        iconName: iconName,
        colorValue: colorValue,
        group: group,
      );
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to update category',
      );
      return false;
    }
  }

  /// Delete a custom category
  Future<bool> deleteCategory(String categoryId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      await _service.deleteCategory(_userId, categoryId);
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString().contains('system')
            ? 'Cannot delete system categories'
            : 'Failed to delete category',
      );
      return false;
    }
  }

  /// Initialize default categories for user
  Future<void> initializeDefaults() async {
    try {
      await _service.initializeDefaultCategories(_userId);
    } catch (e) {
      // Ignore - categories might already exist
    }
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }

  /// Refresh categories
  Future<void> refresh() async {
    await _loadCategories();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

/// Provider for CategoriesViewModel
final categoriesViewModelProvider =
    StateNotifierProvider.autoDispose<CategoriesViewModel, CategoriesState>((ref) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) {
    throw Exception('User not authenticated');
  }
  return CategoriesViewModel(userId: userId);
});

/// Provider for all unified categories
final allCategoriesProvider = Provider.autoDispose<List<UnifiedCategory>>((ref) {
  return ref.watch(categoriesViewModelProvider).categories;
});

/// Provider for expense categories only
final expenseCategoriesProvider = Provider.autoDispose<List<UnifiedCategory>>((ref) {
  return ref.watch(categoriesViewModelProvider).expenseCategories;
});

/// Provider for income categories only
final incomeCategoriesProvider = Provider.autoDispose<List<UnifiedCategory>>((ref) {
  return ref.watch(categoriesViewModelProvider).incomeCategories;
});

/// Provider for custom categories only
final customCategoriesProvider = Provider.autoDispose<List<CustomCategoryModel>>((ref) {
  return ref.watch(categoriesViewModelProvider).customCategories;
});
