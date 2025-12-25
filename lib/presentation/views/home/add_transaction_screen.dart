import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../data/services/receipt_scanner_service.dart';
import '../../common/widgets/widgets.dart';
import '../../viewmodels/viewmodels.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({super.key, this.prefillData});

  /// Pre-filled data from receipt scanner
  final Map<String, dynamic>? prefillData;

  @override
  ConsumerState<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _merchantController = TextEditingController();
  final _notesController = TextEditingController();

  TransactionType _type = TransactionType.expense;
  CategoryType _category = CategoryType.miscellaneous;
  DateTime _date = DateTime.now();
  bool _isLoading = false;
  ReceiptScanResult? _receiptData;

  @override
  void initState() {
    super.initState();
    _initFromPrefillData();
  }

  void _initFromPrefillData() {
    final prefill = widget.prefillData;
    if (prefill == null) return;

    if (prefill['merchantName'] != null) {
      _merchantController.text = prefill['merchantName'] as String;
    }
    if (prefill['amount'] != null) {
      _amountController.text = (prefill['amount'] as double).toStringAsFixed(2);
    }
    if (prefill['date'] != null) {
      _date = prefill['date'] as DateTime;
    }
    if (prefill['category'] != null) {
      _category = prefill['category'] as CategoryType;
    }
    if (prefill['receipt'] != null) {
      _receiptData = prefill['receipt'] as ReceiptScanResult;
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _merchantController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _saveTransaction() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final success = await ref.read(transactionsViewModelProvider.notifier).addTransaction(
            amount: double.parse(_amountController.text),
            merchantName: _merchantController.text.trim(),
            category: _category,
            type: _type,
            date: _date,
            notes: _notesController.text.trim().isEmpty
                ? null
                : _notesController.text.trim(),
          );

      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Transaction added successfully')),
          );
          context.pop();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to add transaction')),
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
    if (picked != null) {
      setState(() => _date = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Transaction'),
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
              // Receipt Preview (if from scanner)
              if (_receiptData?.imagePath != null) ...[
                Text(
                  'Scanned Receipt',
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: AppDimensions.spacingSm),
                ClipRRect(
                  borderRadius: AppDimensions.borderRadiusMd,
                  child: Image.file(
                    File(_receiptData!.imagePath!),
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
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
                    if (_type == TransactionType.income) {
                      _category = CategoryType.salary;
                    } else {
                      _category = CategoryType.miscellaneous;
                    }
                  });
                },
              ),
              const SizedBox(height: AppDimensions.spacingLg),

              // Amount Field
              AppMoneyField(
                controller: _amountController,
                label: 'Amount',
                hint: '0.00',
                size: AppMoneyFieldSize.large,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a ${_type == TransactionType.expense ? 'merchant' : 'source'}';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppDimensions.spacingMd),

              // Category Selector
              Text(
                'Category',
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: AppDimensions.spacingSm),
              _CategorySelector(
                selectedCategory: _category,
                transactionType: _type,
                onCategorySelected: (category) {
                  setState(() => _category = category);
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
              ),
              const SizedBox(height: AppDimensions.spacingXl),

              // Save Button
              AppButton(
                label: 'Save Transaction',
                onPressed: _saveTransaction,
                isLoading: _isLoading,
                isFullWidth: true,
                size: AppButtonSize.large,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategorySelector extends StatelessWidget {
  const _CategorySelector({
    required this.selectedCategory,
    required this.transactionType,
    required this.onCategorySelected,
  });

  final CategoryType selectedCategory;
  final TransactionType transactionType;
  final ValueChanged<CategoryType> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Filter categories based on transaction type
    final categories = transactionType == TransactionType.income
        ? CategoryType.values.where((c) => c.group == CategoryGroup.income).toList()
        : CategoryType.values.where((c) => c.group != CategoryGroup.income).toList();

    return Wrap(
      spacing: AppDimensions.spacingSm,
      runSpacing: AppDimensions.spacingSm,
      children: categories.map((category) {
        final isSelected = category == selectedCategory;
        return FilterChip(
          selected: isSelected,
          label: Text(category.displayName),
          avatar: Icon(
            category.iconData,
            size: 18,
            color: isSelected ? theme.colorScheme.onPrimary : category.color,
          ),
          onSelected: (_) => onCategorySelected(category),
        );
      }).toList(),
    );
  }
}
