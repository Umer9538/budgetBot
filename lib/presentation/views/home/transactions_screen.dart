import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../common/widgets/widgets.dart';
import '../../viewmodels/viewmodels.dart';

class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  bool _isSearchMode = false;
  final _searchController = TextEditingController();
  String _searchQuery = '';

  // Filter state
  Set<CategoryType> _selectedCategories = {};
  Set<TransactionType> _selectedTypes = {};
  DateTimeRange? _dateRange;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSearchMode() {
    setState(() {
      _isSearchMode = !_isSearchMode;
      if (!_isSearchMode) {
        _searchController.clear();
        _searchQuery = '';
      }
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
    });
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _FilterBottomSheet(
        selectedCategories: _selectedCategories,
        selectedTypes: _selectedTypes,
        dateRange: _dateRange,
        onApply: (categories, types, dateRange) {
          setState(() {
            _selectedCategories = categories;
            _selectedTypes = types;
            _dateRange = dateRange;
          });
          Navigator.pop(context);
        },
        onClear: () {
          setState(() {
            _selectedCategories = {};
            _selectedTypes = {};
            _dateRange = null;
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  bool get _hasActiveFilters =>
      _selectedCategories.isNotEmpty ||
      _selectedTypes.isNotEmpty ||
      _dateRange != null;

  List<TransactionModel> _filterTransactions(List<TransactionModel> transactions) {
    return transactions.where((t) {
      // Search filter
      if (_searchQuery.isNotEmpty) {
        final matchesMerchant = t.merchantName.toLowerCase().contains(_searchQuery);
        final matchesCategory = t.category.displayName.toLowerCase().contains(_searchQuery);
        final matchesNotes = t.notes?.toLowerCase().contains(_searchQuery) ?? false;
        if (!matchesMerchant && !matchesCategory && !matchesNotes) {
          return false;
        }
      }

      // Category filter
      if (_selectedCategories.isNotEmpty && !_selectedCategories.contains(t.category)) {
        return false;
      }

      // Type filter
      if (_selectedTypes.isNotEmpty && !_selectedTypes.contains(t.type)) {
        return false;
      }

      // Date range filter
      if (_dateRange != null) {
        final transactionDate = DateTime(t.date.year, t.date.month, t.date.day);
        if (transactionDate.isBefore(_dateRange!.start) ||
            transactionDate.isAfter(_dateRange!.end)) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(transactionsViewModelProvider);
    final viewModel = ref.read(transactionsViewModelProvider.notifier);

    return Scaffold(
      appBar: _isSearchMode
          ? AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _toggleSearchMode,
              ),
              title: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search transactions...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                style: theme.textTheme.bodyLarge,
                onChanged: _onSearchChanged,
              ),
              actions: [
                if (_searchController.text.isNotEmpty)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                      _onSearchChanged('');
                    },
                  ),
              ],
            )
          : AppBar(
              title: const Text('Transactions'),
              actions: [
                Stack(
                  children: [
                    AppIconButton(
                      icon: Icons.filter_list,
                      onPressed: _showFilterBottomSheet,
                      tooltip: 'Filter',
                    ),
                    if (_hasActiveFilters)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
                AppIconButton(
                  icon: Icons.search,
                  onPressed: _toggleSearchMode,
                  tooltip: 'Search',
                ),
              ],
            ),
      body: RefreshIndicator(
        onRefresh: () => viewModel.refresh(),
        child: _buildContent(context, theme, state, viewModel),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Scan Receipt FAB
            FloatingActionButton.small(
              heroTag: 'scan',
              onPressed: () => context.push(AppRoutes.scanReceipt),
              tooltip: 'Scan Receipt',
              child: const Icon(Icons.document_scanner_outlined),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            // Add Transaction FAB
            AppFab(
              icon: Icons.add,
              tooltip: 'Add Transaction',
              onPressed: () => context.push(AppRoutes.addTransaction),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ThemeData theme,
    TransactionsState state,
    TransactionsViewModel viewModel,
  ) {
    if (state.isLoading && state.transactions.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null && state.transactions.isEmpty) {
      return Center(child: Text('Error: ${state.error}'));
    }

    if (state.transactions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            Text(
              'No transactions yet',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Add your first transaction to get started',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            AppButton(
              label: 'Add Transaction',
              onPressed: () => context.push(AppRoutes.addTransaction),
            ),
          ],
        ),
      );
    }

    // Filter transactions
    final filteredTransactions = _filterTransactions(state.transactions);

    if (filteredTransactions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            Text(
              'No matching transactions',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              'Try adjusting your search or filters',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            if (_hasActiveFilters || _searchQuery.isNotEmpty) ...[
              const SizedBox(height: AppDimensions.spacingLg),
              AppButton(
                label: 'Clear Filters',
                variant: AppButtonVariant.secondary,
                onPressed: () {
                  setState(() {
                    _selectedCategories = {};
                    _selectedTypes = {};
                    _dateRange = null;
                    _searchController.clear();
                    _searchQuery = '';
                    _isSearchMode = false;
                  });
                },
              ),
            ],
          ],
        ),
      );
    }

    // Group filtered transactions by date
    final grouped = _groupTransactionsByDate(filteredTransactions);

    return Column(
      children: [
        // Active filters chips
        if (_hasActiveFilters || _searchQuery.isNotEmpty)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spacingMd,
              vertical: AppDimensions.spacingSm,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  if (_searchQuery.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(right: AppDimensions.spacingXs),
                      child: Chip(
                        label: Text('Search: "$_searchQuery"'),
                        deleteIcon: const Icon(Icons.close, size: 16),
                        onDeleted: () {
                          _searchController.clear();
                          _onSearchChanged('');
                        },
                      ),
                    ),
                  ..._selectedCategories.map((cat) => Padding(
                        padding: const EdgeInsets.only(right: AppDimensions.spacingXs),
                        child: Chip(
                          avatar: Icon(cat.iconData, size: 16),
                          label: Text(cat.displayName),
                          deleteIcon: const Icon(Icons.close, size: 16),
                          onDeleted: () {
                            setState(() {
                              _selectedCategories.remove(cat);
                            });
                          },
                        ),
                      )),
                  ..._selectedTypes.map((type) => Padding(
                        padding: const EdgeInsets.only(right: AppDimensions.spacingXs),
                        child: Chip(
                          label: Text(type == TransactionType.expense ? 'Expenses' : 'Income'),
                          deleteIcon: const Icon(Icons.close, size: 16),
                          onDeleted: () {
                            setState(() {
                              _selectedTypes.remove(type);
                            });
                          },
                        ),
                      )),
                  if (_dateRange != null)
                    Chip(
                      label: Text(
                        '${_dateRange!.start.month}/${_dateRange!.start.day} - ${_dateRange!.end.month}/${_dateRange!.end.day}',
                      ),
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () {
                        setState(() {
                          _dateRange = null;
                        });
                      },
                    ),
                ],
              ),
            ),
          ),

        // Results count
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spacingMd,
          ),
          child: Row(
            children: [
              Text(
                '${filteredTransactions.length} transaction${filteredTransactions.length != 1 ? 's' : ''}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),

        // Transaction list
        Expanded(
          child: ListView.builder(
            padding: AppDimensions.screenPadding,
            itemCount: grouped.length,
            itemBuilder: (context, index) {
              final date = grouped.keys.elementAt(index);
              final dayTransactions = grouped[date]!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.spacingSm,
                    ),
                    child: Text(
                      date,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  ...dayTransactions.map((t) => _TransactionTile(
                        transaction: t,
                        onDelete: () => viewModel.deleteTransaction(t.id),
                        searchQuery: _searchQuery,
                      )),
                  const SizedBox(height: AppDimensions.spacingSm),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Map<String, List<TransactionModel>> _groupTransactionsByDate(
      List<TransactionModel> transactions) {
    final grouped = <String, List<TransactionModel>>{};
    for (final transaction in transactions) {
      final dateKey = _formatDateKey(transaction.date);
      grouped.putIfAbsent(dateKey, () => []).add(transaction);
    }
    return grouped;
  }

  String _formatDateKey(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final transactionDate = DateTime(date.year, date.month, date.day);

    if (transactionDate == today) return 'Today';
    if (transactionDate == yesterday) return 'Yesterday';
    return '${date.month}/${date.day}/${date.year}';
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({
    required this.transaction,
    required this.onDelete,
    this.searchQuery = '',
  });

  final TransactionModel transaction;
  final VoidCallback onDelete;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isExpense = transaction.type == TransactionType.expense;

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingXs),
      child: Dismissible(
        key: Key(transaction.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: AppDimensions.spacingMd),
          color: theme.colorScheme.error,
          child: Icon(
            Icons.delete,
            color: theme.colorScheme.onError,
          ),
        ),
        confirmDismiss: (direction) async {
          return await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Delete Transaction'),
              content: const Text(
                  'Are you sure you want to delete this transaction?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Delete'),
                ),
              ],
            ),
          );
        },
        onDismissed: (_) => onDelete(),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: transaction.category.color.withValues(alpha: 0.15),
              borderRadius: AppDimensions.borderRadiusMd,
            ),
            child: Icon(
              transaction.category.iconData,
              color: transaction.category.color,
            ),
          ),
          title: _buildHighlightedText(
            transaction.merchantName,
            searchQuery,
            theme.textTheme.titleMedium!,
            theme,
          ),
          subtitle: _buildHighlightedText(
            transaction.category.displayName,
            searchQuery,
            theme.textTheme.bodySmall!,
            theme,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isExpense ? '-' : '+'}\$${transaction.amount.toStringAsFixed(2)}',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: isExpense ? theme.colorScheme.error : AppColors.success,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (transaction.notes != null && transaction.notes!.isNotEmpty)
                Icon(
                  Icons.note_outlined,
                  size: 14,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
            ],
          ),
          onTap: () {
            context.push(AppRoutes.editTransaction, extra: transaction);
          },
        ),
      ),
    );
  }

  Widget _buildHighlightedText(
    String text,
    String query,
    TextStyle style,
    ThemeData theme,
  ) {
    if (query.isEmpty) {
      return Text(text, style: style);
    }

    final lowerText = text.toLowerCase();
    final lowerQuery = query.toLowerCase();
    final startIndex = lowerText.indexOf(lowerQuery);

    if (startIndex == -1) {
      return Text(text, style: style);
    }

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text.substring(0, startIndex),
            style: style,
          ),
          TextSpan(
            text: text.substring(startIndex, startIndex + query.length),
            style: style.copyWith(
              backgroundColor: theme.colorScheme.primaryContainer,
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text: text.substring(startIndex + query.length),
            style: style,
          ),
        ],
      ),
    );
  }
}

class _FilterBottomSheet extends StatefulWidget {
  const _FilterBottomSheet({
    required this.selectedCategories,
    required this.selectedTypes,
    required this.dateRange,
    required this.onApply,
    required this.onClear,
  });

  final Set<CategoryType> selectedCategories;
  final Set<TransactionType> selectedTypes;
  final DateTimeRange? dateRange;
  final Function(Set<CategoryType>, Set<TransactionType>, DateTimeRange?) onApply;
  final VoidCallback onClear;

  @override
  State<_FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<_FilterBottomSheet> {
  late Set<CategoryType> _selectedCategories;
  late Set<TransactionType> _selectedTypes;
  DateTimeRange? _dateRange;

  @override
  void initState() {
    super.initState();
    _selectedCategories = Set.from(widget.selectedCategories);
    _selectedTypes = Set.from(widget.selectedTypes);
    _dateRange = widget.dateRange;
  }

  Future<void> _selectDateRange() async {
    final now = DateTime.now();
    final result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 2),
      lastDate: now,
      initialDateRange: _dateRange ??
          DateTimeRange(
            start: now.subtract(const Duration(days: 30)),
            end: now,
          ),
    );

    if (result != null) {
      setState(() {
        _dateRange = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 12),
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.all(AppDimensions.spacingMd),
                child: Row(
                  children: [
                    Text(
                      'Filter Transactions',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: widget.onClear,
                      child: const Text('Clear All'),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // Content
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(AppDimensions.spacingMd),
                  children: [
                    // Transaction Type
                    Text(
                      'Transaction Type',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacingSm),
                    Wrap(
                      spacing: AppDimensions.spacingSm,
                      children: [TransactionType.expense, TransactionType.income].map((type) {
                        final isSelected = _selectedTypes.contains(type);
                        return FilterChip(
                          label: Text(
                            type == TransactionType.expense ? 'Expenses' : 'Income',
                          ),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedTypes.add(type);
                              } else {
                                _selectedTypes.remove(type);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: AppDimensions.spacingLg),

                    // Date Range
                    Text(
                      'Date Range',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacingSm),
                    OutlinedButton.icon(
                      onPressed: _selectDateRange,
                      icon: const Icon(Icons.calendar_today),
                      label: Text(
                        _dateRange == null
                            ? 'Select Date Range'
                            : '${_dateRange!.start.month}/${_dateRange!.start.day}/${_dateRange!.start.year} - ${_dateRange!.end.month}/${_dateRange!.end.day}/${_dateRange!.end.year}',
                      ),
                    ),
                    if (_dateRange != null)
                      TextButton(
                        onPressed: () => setState(() => _dateRange = null),
                        child: const Text('Clear Date'),
                      ),

                    const SizedBox(height: AppDimensions.spacingLg),

                    // Categories
                    Text(
                      'Categories',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacingSm),
                    Wrap(
                      spacing: AppDimensions.spacingSm,
                      runSpacing: AppDimensions.spacingSm,
                      children: CategoryType.values.map((category) {
                        final isSelected = _selectedCategories.contains(category);
                        return FilterChip(
                          avatar: Icon(
                            category.iconData,
                            size: 18,
                            color: isSelected
                                ? theme.colorScheme.onPrimaryContainer
                                : category.color,
                          ),
                          label: Text(category.displayName),
                          selected: isSelected,
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                _selectedCategories.add(category);
                              } else {
                                _selectedCategories.remove(category);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              // Apply Button
              Padding(
                padding: const EdgeInsets.all(AppDimensions.spacingMd),
                child: AppButton(
                  label: 'Apply Filters',
                  isFullWidth: true,
                  onPressed: () {
                    widget.onApply(
                      _selectedCategories,
                      _selectedTypes,
                      _dateRange,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
