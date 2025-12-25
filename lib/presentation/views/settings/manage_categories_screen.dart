import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/models/custom_category_model.dart';
import '../../../data/services/category_service.dart';
import '../../common/widgets/widgets.dart';
import '../../viewmodels/categories_viewmodel.dart';

/// Screen for managing custom categories
class ManageCategoriesScreen extends ConsumerWidget {
  const ManageCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(categoriesViewModelProvider);
    final customCategories = state.customCategories;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Categories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showCreateCategoryDialog(context, ref),
            tooltip: 'Create Category',
          ),
        ],
      ),
      body: state.isLoading && customCategories.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : customCategories.isEmpty
              ? _EmptyState(
                  onCreateCategory: () => _showCreateCategoryDialog(context, ref),
                )
              : RefreshIndicator(
                  onRefresh: () =>
                      ref.read(categoriesViewModelProvider.notifier).refresh(),
                  child: ListView(
                    padding: AppDimensions.screenPadding,
                    children: [
                      Text(
                        'Custom Categories',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacingXs),
                      Text(
                        'Create your own categories to better organize transactions',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacingMd),
                      ...customCategories.map((category) {
                        return _CategoryCard(
                          category: category,
                          onEdit: () =>
                              _showEditCategoryDialog(context, ref, category),
                          onDelete: () =>
                              _confirmDeleteCategory(context, ref, category),
                        );
                      }),
                      const SizedBox(height: AppDimensions.spacingLg),
                      Text(
                        'System Categories',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacingXs),
                      Text(
                        'These are built-in categories that cannot be deleted',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacingMd),
                      _SystemCategoriesPreview(),
                    ],
                  ),
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateCategoryDialog(context, ref),
        icon: const Icon(Icons.add),
        label: const Text('New Category'),
      ),
    );
  }

  void _showCreateCategoryDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => _CategoryDialog(
        onSave: (displayName, iconName, colorValue, group) async {
          final success =
              await ref.read(categoriesViewModelProvider.notifier).createCategory(
                    displayName: displayName,
                    iconName: iconName,
                    colorValue: colorValue,
                    group: group,
                  );

          if (context.mounted) {
            Navigator.pop(context);
            if (success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Category created')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to create category')),
              );
            }
          }
        },
      ),
    );
  }

  void _showEditCategoryDialog(
    BuildContext context,
    WidgetRef ref,
    CustomCategoryModel category,
  ) {
    showDialog(
      context: context,
      builder: (context) => _CategoryDialog(
        category: category,
        onSave: (displayName, iconName, colorValue, group) async {
          final success =
              await ref.read(categoriesViewModelProvider.notifier).updateCategory(
                    categoryId: category.id,
                    displayName: displayName,
                    iconName: iconName,
                    colorValue: colorValue,
                    group: group,
                  );

          if (context.mounted) {
            Navigator.pop(context);
            if (success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Category updated')),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to update category')),
              );
            }
          }
        },
      ),
    );
  }

  void _confirmDeleteCategory(
    BuildContext context,
    WidgetRef ref,
    CustomCategoryModel category,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Category'),
        content: Text(
          'Are you sure you want to delete "${category.displayName}"? '
          'Transactions using this category will be moved to "Miscellaneous".',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final success = await ref
                  .read(categoriesViewModelProvider.notifier)
                  .deleteCategory(category.id);

              if (context.mounted) {
                Navigator.pop(context);
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Category deleted')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to delete category')),
                  );
                }
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onCreateCategory});

  final VoidCallback onCreateCategory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: AppDimensions.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.category,
                size: 48,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            Text(
              'No Custom Categories',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: AppDimensions.spacingXs),
            Text(
              'Create custom categories to organize your transactions the way you want.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingXl),
            AppButton(
              label: 'Create Category',
              icon: Icons.add,
              onPressed: onCreateCategory,
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    required this.category,
    required this.onEdit,
    required this.onDelete,
  });

  final CustomCategoryModel category;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: category.color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            category.iconData,
            color: category.color,
          ),
        ),
        title: Text(category.displayName),
        subtitle: Text(
          category.categoryGroup.name.replaceAllMapped(
            RegExp(r'([A-Z])'),
            (m) => ' ${m.group(1)}',
          ).trim(),
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit_outlined),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}

class _SystemCategoriesPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Show a preview of system categories grouped by CategoryGroup
    final groups = CategoryGroup.values;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groups.map((group) {
        final categories = CategoryType.values.where((c) => c.group == group).toList();
        if (categories.isEmpty) return const SizedBox.shrink();

        return Padding(
          padding: const EdgeInsets.only(bottom: AppDimensions.spacingMd),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                group.name.replaceAllMapped(
                  RegExp(r'([A-Z])'),
                  (m) => ' ${m.group(1)}',
                ).trim(),
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppDimensions.spacingXs),
              Wrap(
                spacing: AppDimensions.spacingXs,
                runSpacing: AppDimensions.spacingXs,
                children: categories.map((category) {
                  return Chip(
                    avatar: Icon(
                      category.iconData,
                      size: 16,
                      color: category.color,
                    ),
                    label: Text(
                      category.displayName,
                      style: theme.textTheme.bodySmall,
                    ),
                    visualDensity: VisualDensity.compact,
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

/// Dialog for creating/editing a category
class _CategoryDialog extends StatefulWidget {
  const _CategoryDialog({
    this.category,
    required this.onSave,
  });

  final CustomCategoryModel? category;
  final Future<void> Function(
    String displayName,
    String iconName,
    int colorValue,
    CategoryGroup group,
  ) onSave;

  @override
  State<_CategoryDialog> createState() => _CategoryDialogState();
}

class _CategoryDialogState extends State<_CategoryDialog> {
  final _nameController = TextEditingController();
  String _selectedIcon = 'category';
  Color _selectedColor = const Color(0xFF8B5CF6);
  CategoryGroup _selectedGroup = CategoryGroup.other;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    if (widget.category != null) {
      _nameController.text = widget.category!.displayName;
      _selectedIcon = widget.category!.iconName;
      _selectedColor = widget.category!.color;
      _selectedGroup = widget.category!.categoryGroup;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isEditing = widget.category != null;

    return AlertDialog(
      title: Text(isEditing ? 'Edit Category' : 'Create Category'),
      content: SizedBox(
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Category Name',
                  hintText: 'e.g., Pet Supplies',
                ),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: AppDimensions.spacingMd),
              Text(
                'Icon',
                style: theme.textTheme.labelMedium,
              ),
              const SizedBox(height: AppDimensions.spacingSm),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: CategoryIconOptions.icons.length,
                  itemBuilder: (context, index) {
                    final iconData = CategoryIconOptions.icons[index];
                    final isSelected = iconData['name'] == _selectedIcon;

                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: InkWell(
                        onTap: () => setState(() => _selectedIcon = iconData['name']),
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? theme.colorScheme.primary.withValues(alpha: 0.2)
                                : theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(8),
                            border: isSelected
                                ? Border.all(color: theme.colorScheme.primary, width: 2)
                                : null,
                          ),
                          child: Icon(
                            iconData['icon'] as IconData,
                            color: isSelected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: AppDimensions.spacingMd),
            Text(
              'Color',
              style: theme.textTheme.labelMedium,
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: CategoryColorOptions.colors.map((color) {
                final isSelected = color.toARGB32() == _selectedColor.toARGB32();

                return InkWell(
                  onTap: () => setState(() => _selectedColor = color),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(color: theme.colorScheme.onSurface, width: 3)
                          : null,
                    ),
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 20)
                        : null,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            DropdownButtonFormField<CategoryGroup>(
              value: _selectedGroup,
              decoration: const InputDecoration(
                labelText: 'Group',
              ),
              items: CategoryGroup.values
                  .where((g) => g != CategoryGroup.income)
                  .map((group) {
                return DropdownMenuItem(
                  value: group,
                  child: Text(
                    group.name.replaceAllMapped(
                      RegExp(r'([A-Z])'),
                      (m) => ' ${m.group(1)}',
                    ).trim(),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() => _selectedGroup = value);
                }
              },
            ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isSaving ? null : () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _isSaving
              ? null
              : () async {
                  final name = _nameController.text.trim();
                  if (name.isEmpty) return;

                  setState(() => _isSaving = true);
                  await widget.onSave(
                    name,
                    _selectedIcon,
                    _selectedColor.toARGB32(),
                    _selectedGroup,
                  );
                },
          child: _isSaving
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(isEditing ? 'Save' : 'Create'),
        ),
      ],
    );
  }
}
