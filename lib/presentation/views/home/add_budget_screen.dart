import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../common/widgets/widgets.dart';

class AddBudgetScreen extends ConsumerStatefulWidget {
  const AddBudgetScreen({super.key});

  @override
  ConsumerState<AddBudgetScreen> createState() => _AddBudgetScreenState();
}

class _AddBudgetScreenState extends ConsumerState<AddBudgetScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _amountController = TextEditingController();
  final _merchantController = TextEditingController();

  CategoryType _category = CategoryType.groceries;
  BudgetPeriod _period = BudgetPeriod.monthly;
  BudgetTargetType _targetType = BudgetTargetType.category;
  bool _enableRollover = false;
  bool _isLoading = false;
  bool _showTemplates = true;
  List<BudgetSuggestion>? _aiSuggestions;
  bool _loadingAiSuggestions = false;

  @override
  void dispose() {
    _nameController.dispose();
    _amountController.dispose();
    _merchantController.dispose();
    super.dispose();
  }

  Future<void> _applyTemplate(BudgetTemplateType type) async {
    setState(() => _isLoading = true);

    try {
      final userId = ref.read(currentUserIdProvider);
      if (userId == null) throw Exception('User not authenticated');

      // Show income input dialog
      final income = await _showIncomeDialog();
      if (income == null) {
        setState(() => _isLoading = false);
        return;
      }

      final templateService = ref.read(budgetTemplateServiceProvider);
      final budgets = await templateService.applyTemplate(
        userId: userId,
        type: type,
        monthlyIncome: income,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Created ${budgets.length} budgets from template'),
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<double?> _showIncomeDialog() async {
    final incomeController = TextEditingController();
    return showDialog<double>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Monthly Income'),
        content: AppMoneyField(
          controller: incomeController,
          label: 'Monthly Income',
          hint: '5000.00',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final value = double.tryParse(incomeController.text);
              Navigator.pop(context, value);
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }

  Future<void> _loadAiSuggestions() async {
    setState(() => _loadingAiSuggestions = true);

    try {
      final userId = ref.read(currentUserIdProvider);
      if (userId == null) throw Exception('User not authenticated');

      final suggestionService = ref.read(budgetSuggestionServiceProvider);
      final suggestions = await suggestionService.getSuggestions(
        userId: userId,
      );

      setState(() {
        _aiSuggestions = suggestions;
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error getting suggestions: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _loadingAiSuggestions = false);
      }
    }
  }

  void _applySuggestion(BudgetSuggestion suggestion) {
    setState(() {
      _category = suggestion.category;
      _amountController.text = suggestion.suggestedAmount.toStringAsFixed(2);
      _nameController.text = suggestion.category.displayName;
      _showTemplates = false;
    });
  }

  Future<void> _saveBudget() async {
    if (!_formKey.currentState!.validate()) return;

    // Validate merchant name if merchant target type
    if (_targetType == BudgetTargetType.merchant &&
        _merchantController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a merchant name')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final userId = ref.read(currentUserIdProvider);
      if (userId == null) throw Exception('User not authenticated');

      final now = DateTime.now();
      DateTime startDate;
      DateTime? endDate;

      switch (_period) {
        case BudgetPeriod.weekly:
          startDate = now.subtract(Duration(days: now.weekday - 1));
          endDate = startDate.add(const Duration(days: 6));
          break;
        case BudgetPeriod.monthly:
          startDate = DateTime(now.year, now.month, 1);
          endDate = DateTime(now.year, now.month + 1, 0);
          break;
        case BudgetPeriod.yearly:
          startDate = DateTime(now.year, 1, 1);
          endDate = DateTime(now.year, 12, 31);
          break;
        default:
          startDate = now;
          endDate = null;
      }

      final budget = BudgetModel(
        id: '',
        userId: userId,
        name: _nameController.text.trim(),
        category: _category,
        amount: double.parse(_amountController.text),
        spent: 0,
        period: _period,
        startDate: startDate,
        endDate: endDate,
        isActive: true,
        rollover: _enableRollover,
        rolloverAmount: 0,
        targetType: _targetType,
        merchantName: _targetType == BudgetTargetType.merchant
            ? _merchantController.text.trim()
            : null,
        merchantPatterns: _targetType == BudgetTargetType.merchant
            ? [_merchantController.text.trim().toLowerCase()]
            : [],
        createdAt: now,
        updatedAt: now,
      );

      await ref.read(budgetRepositoryProvider).createBudgetFromModel(budget);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Budget created successfully')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Budget'),
        actions: [
          if (!_showTemplates)
            TextButton.icon(
              onPressed: () => setState(() => _showTemplates = true),
              icon: const Icon(Icons.dashboard_customize),
              label: const Text('Templates'),
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Template Section
              if (_showTemplates) ...[
                _buildTemplateSection(theme),
                const SizedBox(height: AppDimensions.spacingLg),
                const Divider(),
                const SizedBox(height: AppDimensions.spacingMd),
                Center(
                  child: Text(
                    'Or create a custom budget',
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingMd),
              ],

              // AI Suggestions Section
              _buildAiSuggestionsSection(theme),
              const SizedBox(height: AppDimensions.spacingLg),

              // Budget Name
              AppTextField(
                controller: _nameController,
                label: 'Budget Name',
                hint: 'e.g., Dining Out, Groceries',
                prefixIcon: Icons.label_outline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a budget name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: AppDimensions.spacingMd),

              // Amount
              AppMoneyField(
                controller: _amountController,
                label: 'Budget Amount',
                hint: '0.00',
                size: AppMoneyFieldSize.large,
              ),
              const SizedBox(height: AppDimensions.spacingLg),

              // Period
              Text(
                'Budget Period',
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: AppDimensions.spacingSm),
              AppSegmentedButton<BudgetPeriod>(
                segments: [
                  AppSegment(
                    value: BudgetPeriod.weekly,
                    label: 'Weekly',
                  ),
                  AppSegment(
                    value: BudgetPeriod.monthly,
                    label: 'Monthly',
                  ),
                  AppSegment(
                    value: BudgetPeriod.yearly,
                    label: 'Yearly',
                  ),
                ],
                selected: {_period},
                onSelectionChanged: (selected) {
                  setState(() => _period = selected.first);
                },
              ),
              const SizedBox(height: AppDimensions.spacingLg),

              // Target Type
              Text(
                'Budget Target',
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: AppDimensions.spacingSm),
              AppSegmentedButton<BudgetTargetType>(
                segments: [
                  AppSegment(
                    value: BudgetTargetType.category,
                    label: 'Category',
                    icon: Icons.category,
                  ),
                  AppSegment(
                    value: BudgetTargetType.merchant,
                    label: 'Merchant',
                    icon: Icons.store,
                  ),
                ],
                selected: {_targetType},
                onSelectionChanged: (selected) {
                  setState(() => _targetType = selected.first);
                },
              ),
              const SizedBox(height: AppDimensions.spacingLg),

              // Category or Merchant input
              if (_targetType == BudgetTargetType.category) ...[
                Text(
                  'Category',
                  style: theme.textTheme.titleSmall,
                ),
                const SizedBox(height: AppDimensions.spacingSm),
                _CategorySelector(
                  selectedCategory: _category,
                  onCategorySelected: (category) {
                    setState(() {
                      _category = category;
                      if (_nameController.text.isEmpty) {
                        _nameController.text = category.displayName;
                      }
                    });
                  },
                ),
              ] else ...[
                AppTextField(
                  controller: _merchantController,
                  label: 'Merchant Name',
                  hint: 'e.g., Starbucks, Amazon',
                  prefixIcon: Icons.store,
                  validator: (value) {
                    if (_targetType == BudgetTargetType.merchant &&
                        (value == null || value.isEmpty)) {
                      return 'Please enter a merchant name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.spacingSm),
                Text(
                  'This budget will track spending at merchants matching this name',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
              const SizedBox(height: AppDimensions.spacingLg),

              // Rollover Toggle
              SwitchListTile(
                title: const Text('Enable Rollover'),
                subtitle: const Text(
                  'Unused budget carries over to the next period',
                ),
                value: _enableRollover,
                onChanged: (value) {
                  setState(() => _enableRollover = value);
                },
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: AppDimensions.spacingMd),

              // Suggested amounts
              Container(
                padding: const EdgeInsets.all(AppDimensions.spacingMd),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer.withValues(alpha: 0.3),
                  borderRadius: AppDimensions.borderRadiusMd,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(width: AppDimensions.spacingSm),
                    Expanded(
                      child: Text(
                        _targetType == BudgetTargetType.category
                            ? 'Tip: The average ${_period.displayName.toLowerCase()} budget for ${_category.displayName} is \$${_getSuggestedAmount().toStringAsFixed(0)}'
                            : 'Tip: Track spending at specific merchants like coffee shops or online stores',
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.spacingXl),

              // Save Button
              AppButton(
                label: 'Create Budget',
                onPressed: _saveBudget,
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

  Widget _buildTemplateSection(ThemeData theme) {
    final templates = BudgetTemplates.all;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Budget Templates',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () => setState(() => _showTemplates = false),
              child: const Text('Skip'),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacingSm),
        Text(
          'Start with a proven budgeting strategy',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingMd),
        ...templates.map((template) => _buildTemplateCard(theme, template)),
      ],
    );
  }

  Widget _buildTemplateCard(ThemeData theme, BudgetTemplate template) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: InkWell(
        onTap: () => _applyTemplate(template.type),
        borderRadius: AppDimensions.borderRadiusMd,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppDimensions.spacingSm),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: AppDimensions.borderRadiusSm,
                ),
                child: Icon(
                  _getTemplateIcon(template.type),
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: AppDimensions.spacingMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      template.name,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      template.description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getTemplateIcon(BudgetTemplateType type) {
    return switch (type) {
      BudgetTemplateType.rule503020 => Icons.pie_chart,
      BudgetTemplateType.rule702010 => Icons.donut_large,
      BudgetTemplateType.zeroBased => Icons.calculate,
      BudgetTemplateType.envelope => Icons.mail,
      BudgetTemplateType.minimalist => Icons.minimize,
      BudgetTemplateType.custom => Icons.tune,
    };
  }

  Widget _buildAiSuggestionsSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'AI Suggestions',
              style: theme.textTheme.titleSmall,
            ),
            TextButton.icon(
              onPressed: _loadingAiSuggestions ? null : _loadAiSuggestions,
              icon: _loadingAiSuggestions
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.auto_awesome, size: 18),
              label: Text(_loadingAiSuggestions
                  ? 'Loading...'
                  : _aiSuggestions != null
                      ? 'Refresh'
                      : 'Get Suggestions'),
            ),
          ],
        ),
        if (_aiSuggestions != null && _aiSuggestions!.isNotEmpty) ...[
          const SizedBox(height: AppDimensions.spacingSm),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _aiSuggestions!.length,
              itemBuilder: (context, index) {
                final suggestion = _aiSuggestions![index];
                return _buildSuggestionChip(theme, suggestion);
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSuggestionChip(ThemeData theme, BudgetSuggestion suggestion) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: AppDimensions.spacingSm),
      child: Card(
        child: InkWell(
          onTap: () => _applySuggestion(suggestion),
          borderRadius: AppDimensions.borderRadiusSm,
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.spacingSm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Icon(
                      suggestion.category.iconData,
                      size: 16,
                      color: suggestion.category.color,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        suggestion.category.displayName,
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${suggestion.suggestedAmount.toStringAsFixed(0)}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Avg: \$${suggestion.currentAverage.toStringAsFixed(0)}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  double _getSuggestedAmount() {
    final monthlyBase = switch (_category) {
      CategoryType.groceries || CategoryType.foodDelivery => 500,
      CategoryType.restaurants => 200,
      CategoryType.coffeeShops => 50,
      CategoryType.streamingServices || CategoryType.gaming => 150,
      CategoryType.clothing || CategoryType.onlineShopping => 200,
      CategoryType.fuel || CategoryType.publicTransit => 300,
      CategoryType.utilities => 200,
      _ => 100,
    };

    return switch (_period) {
      BudgetPeriod.weekly => monthlyBase / 4,
      BudgetPeriod.monthly => monthlyBase.toDouble(),
      BudgetPeriod.yearly => monthlyBase * 12,
      _ => monthlyBase.toDouble(),
    };
  }
}

class _CategorySelector extends StatelessWidget {
  const _CategorySelector({
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final CategoryType selectedCategory;
  final ValueChanged<CategoryType> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Only show expense categories for budgets
    final categories = CategoryType.values
        .where((c) => c.group != CategoryGroup.income)
        .toList();

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
