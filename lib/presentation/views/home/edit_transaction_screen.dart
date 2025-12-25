import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../data/services/categorization/ai_categorization_service.dart';
import '../../common/widgets/widgets.dart';

/// Screen for editing an existing transaction
class EditTransactionScreen extends ConsumerStatefulWidget {
  const EditTransactionScreen({
    super.key,
    required this.transaction,
  });

  final TransactionModel transaction;

  @override
  ConsumerState<EditTransactionScreen> createState() => _EditTransactionScreenState();
}

class _EditTransactionScreenState extends ConsumerState<EditTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _amountController;
  late final TextEditingController _merchantController;
  late final TextEditingController _notesController;

  late TransactionType _type;
  late CategoryType _category;
  late DateTime _date;
  bool _isLoading = false;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _initFromTransaction();
  }

  void _initFromTransaction() {
    final tx = widget.transaction;
    _amountController = TextEditingController(text: tx.amount.toStringAsFixed(2));
    _merchantController = TextEditingController(text: tx.merchantName);
    _notesController = TextEditingController(text: tx.notes ?? '');
    _type = tx.type;
    _category = tx.category;
    _date = tx.date;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _merchantController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _markChanged() {
    if (!_hasChanges) {
      setState(() => _hasChanges = true);
    }
  }

  Future<void> _saveTransaction() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final success = await ref.read(transactionsViewModelProvider.notifier).updateTransaction(
            transactionId: widget.transaction.id,
            amount: double.parse(_amountController.text),
            merchantName: _merchantController.text.trim(),
            category: _category,
            type: _type,
            date: _date,
            notes: _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
          );

      // Learn from user's category correction
      if (_category != widget.transaction.category) {
        final aiService = ref.read(aiCategoryServiceProvider);
        await aiService.learnFromCorrection(
          merchantName: _merchantController.text.trim(),
          correctedCategory: _category,
        );
      }

      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Transaction updated successfully')),
          );
          context.pop(true); // Return true to indicate changes were made
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to update transaction')),
          );
        }
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _deleteTransaction() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Transaction'),
        content: const Text(
          'Are you sure you want to delete this transaction? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    setState(() => _isLoading = true);

    try {
      final success = await ref
          .read(transactionsViewModelProvider.notifier)
          .deleteTransaction(widget.transaction.id);

      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Transaction deleted')),
          );
          context.pop(true);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to delete transaction')),
          );
        }
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _date) {
      setState(() => _date = picked);
      _markChanged();
    }
  }

  Future<bool> _onWillPop() async {
    if (!_hasChanges) return true;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Discard changes?'),
        content: const Text('You have unsaved changes. Are you sure you want to discard them?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Keep Editing'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Discard'),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isManual = widget.transaction.isManual;

    return PopScope(
      canPop: !_hasChanges,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) {
          context.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Transaction'),
          actions: [
            IconButton(
              icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
              onPressed: _isLoading ? null : _deleteTransaction,
              tooltip: 'Delete transaction',
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: AppDimensions.screenPadding.copyWith(
              bottom: AppDimensions.spacingMd + MediaQuery.of(context).padding.bottom + 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Source indicator
                if (!isManual) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.spacingMd,
                      vertical: AppDimensions.spacingSm,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primaryContainer.withValues(alpha: 0.5),
                      borderRadius: AppDimensions.borderRadiusSm,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.account_balance_outlined,
                          size: 18,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: AppDimensions.spacingSm),
                        Expanded(
                          child: Text(
                            'Imported from bank account',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingMd),
                ],

                // Transaction Type Toggle
                Text(
                  'Type',
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: AppDimensions.spacingSm),
                AppSegmentedButton<TransactionType>(
                  segments: [
                    AppSegment(
                      value: TransactionType.expense,
                      label: 'Expense',
                      icon: Icons.arrow_upward,
                    ),
                    AppSegment(
                      value: TransactionType.income,
                      label: 'Income',
                      icon: Icons.arrow_downward,
                    ),
                  ],
                  selected: {_type},
                  onSelectionChanged: (selected) {
                    setState(() {
                      _type = selected.first;
                      // Reset category when type changes
                      if (_type == TransactionType.income &&
                          _category.group != CategoryGroup.income) {
                        _category = CategoryType.salary;
                      } else if (_type == TransactionType.expense &&
                          _category.group == CategoryGroup.income) {
                        _category = CategoryType.miscellaneous;
                      }
                    });
                    _markChanged();
                  },
                ),
                const SizedBox(height: AppDimensions.spacingLg),

                // Amount Field
                AppMoneyField(
                  controller: _amountController,
                  label: 'Amount',
                  hint: '0.00',
                  size: AppMoneyFieldSize.large,
                  onChanged: (_) => _markChanged(),
                ),
                const SizedBox(height: AppDimensions.spacingMd),

                // Merchant Field
                AppTextField(
                  controller: _merchantController,
                  label: _type == TransactionType.expense ? 'Merchant' : 'Source',
                  hint: _type == TransactionType.expense
                      ? 'Where did you spend?'
                      : 'Where did the money come from?',
                  prefixIcon: Icons.store_outlined,
                  onChanged: (_) => _markChanged(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a ${_type == TransactionType.expense ? 'merchant' : 'source'}';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.spacingMd),

                // Category Selector - this is the main feature for editing
                Text(
                  'Category',
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: AppDimensions.spacingXs),
                Text(
                  'Change the category if it was incorrectly auto-categorized',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingSm),
                _CategorySelector(
                  selectedCategory: _category,
                  originalCategory: widget.transaction.category,
                  transactionType: _type,
                  onCategorySelected: (category) {
                    setState(() => _category = category);
                    _markChanged();
                  },
                ),
                const SizedBox(height: AppDimensions.spacingMd),

                // Date Picker
                Text(
                  'Date',
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: AppDimensions.spacingSm),
                InkWell(
                  onTap: _selectDate,
                  borderRadius: AppDimensions.borderRadiusMd,
                  child: Container(
                    padding: const EdgeInsets.all(AppDimensions.spacingMd),
                    decoration: BoxDecoration(
                      border: Border.all(color: theme.colorScheme.outline),
                      borderRadius: AppDimensions.borderRadiusMd,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        const SizedBox(width: AppDimensions.spacingSm),
                        Text(
                          '${_date.month}/${_date.day}/${_date.year}',
                          style: theme.textTheme.bodyLarge,
                        ),
                        const Spacer(),
                        Icon(
                          Icons.chevron_right,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingMd),

                // Notes Field
                AppTextField(
                  controller: _notesController,
                  label: 'Notes (Optional)',
                  hint: 'Add any additional notes',
                  prefixIcon: Icons.note_outlined,
                  maxLines: 2,
                  onChanged: (_) => _markChanged(),
                ),
                const SizedBox(height: AppDimensions.spacingLg),

                // Tags Section (if any)
                if (widget.transaction.tags.isNotEmpty) ...[
                  Text(
                    'Tags',
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: AppDimensions.spacingSm),
                  Wrap(
                    spacing: AppDimensions.spacingXs,
                    children: widget.transaction.tags.map((tag) {
                      return Chip(
                        label: Text(tag),
                        labelStyle: theme.textTheme.bodySmall,
                        visualDensity: VisualDensity.compact,
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: AppDimensions.spacingMd),
                ],

                // Location (if available)
                if (widget.transaction.location?.city != null) ...[
                  Text(
                    'Location',
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: AppDimensions.spacingSm),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 20,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: AppDimensions.spacingXs),
                      Text(
                        [
                          widget.transaction.location?.city,
                          widget.transaction.location?.country,
                        ].whereType<String>().join(', '),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppDimensions.spacingMd),
                ],

                const SizedBox(height: AppDimensions.spacingMd),

                // Save Button
                AppButton(
                  label: 'Save Changes',
                  onPressed: _hasChanges && !_isLoading ? _saveTransaction : null,
                  isLoading: _isLoading,
                  isFullWidth: true,
                  size: AppButtonSize.large,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Category selector widget with visual indicator for original category
class _CategorySelector extends StatelessWidget {
  const _CategorySelector({
    required this.selectedCategory,
    required this.originalCategory,
    required this.transactionType,
    required this.onCategorySelected,
  });

  final CategoryType selectedCategory;
  final CategoryType originalCategory;
  final TransactionType transactionType;
  final ValueChanged<CategoryType> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Filter categories based on transaction type
    final categories = transactionType == TransactionType.income
        ? CategoryType.values.where((c) => c.group == CategoryGroup.income).toList()
        : CategoryType.values.where((c) => c.group != CategoryGroup.income).toList();

    // Group categories by their group
    final groupedCategories = <CategoryGroup, List<CategoryType>>{};
    for (final category in categories) {
      groupedCategories.putIfAbsent(category.group, () => []).add(category);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: groupedCategories.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppDimensions.spacingXs),
              child: Text(
                entry.key.displayName,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            Wrap(
              spacing: AppDimensions.spacingSm,
              runSpacing: AppDimensions.spacingSm,
              children: entry.value.map((category) {
                final isSelected = category == selectedCategory;
                final wasOriginal = category == originalCategory;

                return Stack(
                  children: [
                    FilterChip(
                      selected: isSelected,
                      label: Text(category.displayName),
                      avatar: Icon(
                        category.iconData,
                        size: 18,
                        color: isSelected ? theme.colorScheme.onPrimary : category.color,
                      ),
                      onSelected: (_) => onCategorySelected(category),
                      side: wasOriginal && !isSelected
                          ? BorderSide(
                              color: theme.colorScheme.primary.withValues(alpha: 0.5),
                              width: 2,
                            )
                          : null,
                    ),
                    // Show "Original" indicator
                    if (wasOriginal && !isSelected)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Original',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
          ],
        );
      }).toList(),
    );
  }
}

