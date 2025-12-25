import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/models/models.dart';
import '../../../data/services/bank_link/bank_link.dart';
import '../../common/widgets/widgets.dart';
import '../../viewmodels/viewmodels.dart';

class LinkedAccountsScreen extends ConsumerWidget {
  const LinkedAccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsState = ref.watch(accountsViewModelProvider);
    final linkedAccounts = accountsState.accounts;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Linked Accounts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_card),
            onPressed: () => _showAddManualAccountDialog(context, ref),
            tooltip: 'Add Manual Account',
          ),
        ],
      ),
      body: accountsState.isLoading && linkedAccounts.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : linkedAccounts.isEmpty
              ? _EmptyState(
                  onLinkAccount: () => _showLinkAccountSheet(context, ref),
                  onAddManual: () => _showAddManualAccountDialog(context, ref),
                )
              : RefreshIndicator(
                  onRefresh: () =>
                      ref.read(accountsViewModelProvider.notifier).refresh(),
                  child: ListView.builder(
                    padding: AppDimensions.screenPadding,
                    itemCount: linkedAccounts.length + 1,
                    itemBuilder: (context, index) {
                      if (index == linkedAccounts.length) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: AppDimensions.spacingMd),
                          child: AppButton(
                            label: 'Link Another Account',
                            variant: AppButtonVariant.outlined,
                            icon: Icons.add,
                            isFullWidth: true,
                            onPressed: () => _showLinkAccountSheet(context, ref),
                          ),
                        );
                      }

                      final account = linkedAccounts[index];
                      return _AccountCard(
                        account: account,
                        onTap: () =>
                            _showAccountOptions(context, ref, account),
                      );
                    },
                  ),
                ),
      floatingActionButton: linkedAccounts.isEmpty
          ? null
          : FloatingActionButton.extended(
              onPressed: () => _showLinkAccountSheet(context, ref),
              icon: const Icon(Icons.add),
              label: const Text('Link Account'),
            ),
    );
  }

  void _showLinkAccountSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => _LinkAccountSheet(
          scrollController: scrollController,
        ),
      ),
    );
  }

  void _showAddManualAccountDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final balanceController = TextEditingController(text: '0.00');
    AccountType selectedType = AccountType.checking;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Add Manual Account'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Account Name',
                    hintText: 'e.g., My Savings',
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<AccountType>(
                  value: selectedType,
                  decoration: const InputDecoration(
                    labelText: 'Account Type',
                  ),
                  items: AccountType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.displayName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => selectedType = value);
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: balanceController,
                  decoration: const InputDecoration(
                    labelText: 'Current Balance',
                    prefixText: '\$ ',
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () async {
                final name = nameController.text.trim();
                if (name.isEmpty) return;

                final balance =
                    double.tryParse(balanceController.text) ?? 0.0;

                final success = await ref
                    .read(accountsViewModelProvider.notifier)
                    .createManualAccount(
                      accountName: name,
                      accountType: selectedType,
                      currentBalance: balance,
                    );

                if (success && context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Account added')),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAccountOptions(
      BuildContext context, WidgetRef ref, AccountModel account) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.sync),
              title: const Text('Sync Now'),
              onTap: () async {
                Navigator.pop(context);
                await ref
                    .read(accountsViewModelProvider.notifier)
                    .syncAccount(account.id);
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Account synced')),
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text('Edit Account'),
              onTap: () {
                Navigator.pop(context);
                _showEditAccountDialog(context, ref, account);
              },
            ),
            ListTile(
              leading:
                  Icon(Icons.delete_outline, color: Theme.of(context).colorScheme.error),
              title: Text('Remove Account',
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmation(context, ref, account);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEditAccountDialog(
      BuildContext context, WidgetRef ref, AccountModel account) {
    final nameController = TextEditingController(text: account.accountName);
    final balanceController =
        TextEditingController(text: account.currentBalance.toStringAsFixed(2));

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Account'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Account Name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: balanceController,
              decoration: const InputDecoration(
                labelText: 'Current Balance',
                prefixText: '\$ ',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final name = nameController.text.trim();
              final balance = double.tryParse(balanceController.text);

              final success = await ref
                  .read(accountsViewModelProvider.notifier)
                  .updateAccount(
                    accountId: account.id,
                    accountName: name.isNotEmpty ? name : null,
                    currentBalance: balance,
                  );

              if (success && context.mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Account updated')),
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(
      BuildContext context, WidgetRef ref, AccountModel account) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Account'),
        content: Text(
          'Are you sure you want to remove "${account.accountName}"? '
          'Historical transactions will be kept.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final success = await ref
                  .read(accountsViewModelProvider.notifier)
                  .deleteAccount(account.id);

              if (context.mounted) {
                Navigator.pop(context);
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Account removed')),
                  );
                }
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.onLinkAccount,
    required this.onAddManual,
  });

  final VoidCallback onLinkAccount;
  final VoidCallback onAddManual;

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
                Icons.account_balance,
                size: 48,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            Text(
              'No Accounts Yet',
              style: theme.textTheme.headlineSmall,
            ),
            const SizedBox(height: AppDimensions.spacingXs),
            Text(
              'Connect your bank accounts to automatically import transactions or add accounts manually.',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingXl),
            AppButton(
              label: 'Link Bank Account',
              icon: Icons.account_balance,
              onPressed: onLinkAccount,
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            AppButton(
              label: 'Add Manual Account',
              icon: Icons.add_card,
              variant: AppButtonVariant.outlined,
              onPressed: onAddManual,
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountCard extends StatelessWidget {
  const _AccountCard({
    required this.account,
    required this.onTap,
  });

  final AccountModel account;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingMd),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Icon(
            _getAccountIcon(account.accountType),
            color: theme.colorScheme.primary,
          ),
        ),
        title: Text(account.accountName),
        subtitle: Text(
          '${account.institutionName}${account.mask != null ? ' • ****${account.mask}' : ''}',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${account.currentBalance.toStringAsFixed(2)}',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (account.lastSynced != null)
              Text(
                'Synced ${_formatLastSync(account.lastSynced!)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 10,
                ),
              ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  IconData _getAccountIcon(AccountType type) {
    switch (type) {
      case AccountType.checking:
        return Icons.account_balance;
      case AccountType.savings:
        return Icons.savings;
      case AccountType.creditCard:
        return Icons.credit_card;
      case AccountType.investment:
        return Icons.trending_up;
      case AccountType.cash:
        return Icons.money;
      case AccountType.loan:
        return Icons.account_balance_wallet;
      case AccountType.crypto:
        return Icons.currency_bitcoin;
      case AccountType.other:
        return Icons.wallet;
    }
  }

  String _formatLastSync(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${date.month}/${date.day}';
    }
  }
}

/// Bank Link Sheet with region selection and provider-agnostic search
class _LinkAccountSheet extends ConsumerStatefulWidget {
  const _LinkAccountSheet({required this.scrollController});

  final ScrollController scrollController;

  @override
  ConsumerState<_LinkAccountSheet> createState() => _LinkAccountSheetState();
}

class _LinkAccountSheetState extends ConsumerState<_LinkAccountSheet> {
  final _searchController = TextEditingController();
  BankLinkRegion _selectedRegion = BankLinkRegion.usa;
  List<InstitutionSearchResult> _searchResults = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _loadDefaultInstitutions();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadDefaultInstitutions() async {
    setState(() => _isSearching = true);
    try {
      final service = ref.read(bankLinkServiceProvider);
      service.setRegion(_selectedRegion);
      final results = await service.searchInstitutions(query: '');
      setState(() {
        _searchResults = results;
        _isSearching = false;
      });
    } catch (e) {
      setState(() => _isSearching = false);
    }
  }

  Future<void> _searchInstitutions(String query) async {
    setState(() => _isSearching = true);
    try {
      final service = ref.read(bankLinkServiceProvider);
      final results = await service.searchInstitutions(query: query);
      setState(() {
        _searchResults = results;
        _isSearching = false;
      });
    } catch (e) {
      setState(() => _isSearching = false);
    }
  }

  void _onRegionChanged(BankLinkRegion region) {
    setState(() => _selectedRegion = region);
    final service = ref.read(bankLinkServiceProvider);
    service.setRegion(region);
    _loadDefaultInstitutions();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final service = ref.watch(bankLinkServiceProvider);
    final availableProviders = service.getProvidersForRegion(_selectedRegion);

    return Column(
      children: [
        // Handle
        Container(
          margin: const EdgeInsets.only(top: 12),
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        // Header
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          child: Column(
            children: [
              Text(
                'Link Your Bank',
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: AppDimensions.spacingXs),
              Text(
                'Select your region and find your financial institution.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        // Region Selector
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacingMd),
          child: DropdownButtonFormField<BankLinkRegion>(
            value: _selectedRegion,
            decoration: InputDecoration(
              labelText: 'Your Region',
              prefixIcon: const Icon(Icons.public),
              border: OutlineInputBorder(
                borderRadius: AppDimensions.borderRadiusMd,
              ),
            ),
            items: BankLinkRegion.values.map((region) {
              return DropdownMenuItem(
                value: region,
                child: Text(region.displayName),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) _onRegionChanged(value);
            },
          ),
        ),
        const SizedBox(height: AppDimensions.spacingMd),
        // Search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacingMd),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search banks...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: AppDimensions.borderRadiusMd,
              ),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        _loadDefaultInstitutions();
                      },
                    )
                  : null,
            ),
            onChanged: (value) {
              if (value.length >= 2) {
                _searchInstitutions(value);
              } else if (value.isEmpty) {
                _loadDefaultInstitutions();
              }
            },
          ),
        ),
        const SizedBox(height: AppDimensions.spacingSm),
        // Provider badges
        if (availableProviders.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacingMd),
            child: Row(
              children: [
                Text(
                  'Powered by: ',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                ...availableProviders.map((p) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Chip(
                        label: Text(p.displayName),
                        labelStyle: theme.textTheme.labelSmall,
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity.compact,
                      ),
                    )),
              ],
            ),
          ),
        const SizedBox(height: AppDimensions.spacingMd),
        // Institution list
        Expanded(
          child: _isSearching
              ? const Center(child: CircularProgressIndicator())
              : _searchResults.isEmpty
                  ? Center(
                      child: Text(
                        'No institutions found',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: widget.scrollController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.spacingMd),
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final result = _searchResults[index];
                        return _InstitutionTile(
                          institution: result.institution,
                          provider: result.provider,
                          onTap: () => _onInstitutionSelected(result),
                        );
                      },
                    ),
        ),
        // Security note
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 16,
                color: theme.colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 4),
              Text(
                'Bank-level security encryption',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onInstitutionSelected(InstitutionSearchResult result) {
    // Don't pop the sheet here - show dialog on top, close sheet after connection
    _showConnectDialog(context, result);
  }

  void _showConnectDialog(BuildContext sheetContext, InstitutionSearchResult result) {
    // Capture all references BEFORE showing dialog to avoid context issues
    final rootNavigator = Navigator.of(sheetContext, rootNavigator: true);
    final sheetNavigator = Navigator.of(sheetContext);
    final scaffoldMessenger = ScaffoldMessenger.of(sheetContext);
    final viewModel = ref.read(accountsViewModelProvider.notifier);

    final providerName = result.provider == BankLinkProviderType.plaid
        ? 'Plaid'
        : result.provider == BankLinkProviderType.trueLayer
            ? 'TrueLayer'
            : result.provider.name;

    showDialog(
      context: sheetContext,
      builder: (dialogContext) => AlertDialog(
        title: Text('Connect to ${result.institution.name}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: result.institution.primaryColor != null
                    ? Color(int.parse(
                            result.institution.primaryColor!.replaceFirst('#', ''),
                            radix: 16) +
                        0xFF000000)
                    : Theme.of(dialogContext).colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.account_balance,
                size: 48,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'You will be securely connected via $providerName.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Your credentials are encrypted and never stored on our servers.',
              textAlign: TextAlign.center,
              style: Theme.of(dialogContext).textTheme.bodySmall?.copyWith(
                    color: Theme.of(dialogContext).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              _launchBankLinkFlow(
                result: result,
                rootNavigator: rootNavigator,
                sheetNavigator: sheetNavigator,
                scaffoldMessenger: scaffoldMessenger,
                viewModel: viewModel,
              );
            },
            child: const Text('Connect'),
          ),
        ],
      ),
    );
  }

  Future<void> _launchBankLinkFlow({
    required InstitutionSearchResult result,
    required NavigatorState rootNavigator,
    required NavigatorState sheetNavigator,
    required ScaffoldMessengerState scaffoldMessenger,
    required AccountsViewModel viewModel,
  }) async {
    // Close the bottom sheet first
    sheetNavigator.pop();

    // Show loading indicator using root navigator's context
    showDialog(
      context: rootNavigator.context,
      barrierDismissible: false,
      builder: (ctx) => const Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Connecting to your bank...'),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      final linkResult = await viewModel.linkBankAccount(
        preferredProvider: result.provider,
        institutionId: result.institution.id,
        importHistory: true,
        historyMonths: 24,
      );

      // Dismiss loading dialog
      rootNavigator.pop();

      if (linkResult.success) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(
              'Successfully linked ${linkResult.accountsLinked} account(s)! '
              '${linkResult.transactionsImported} transactions imported.',
            ),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(linkResult.error ?? 'Failed to link account'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Dismiss loading dialog
      try {
        rootNavigator.pop();
      } catch (_) {}

      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

class _InstitutionTile extends StatelessWidget {
  const _InstitutionTile({
    required this.institution,
    required this.provider,
    required this.onTap,
  });

  final InstitutionData institution;
  final BankLinkProviderType provider;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color? bgColor;
    if (institution.primaryColor != null) {
      try {
        bgColor = Color(
            int.parse(institution.primaryColor!.replaceFirst('#', ''), radix: 16) +
                0xFF000000);
      } catch (_) {}
    }

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: bgColor ?? theme.colorScheme.surfaceContainerHighest,
        child: _buildLogo(theme, bgColor),
      ),
      title: Text(institution.name),
      subtitle: Text(
        institution.countryCodes.join(', '),
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }

  Widget _buildLogo(ThemeData theme, Color? bgColor) {
    // If no logo, show first letter
    if (institution.logo == null || institution.logo!.isEmpty) {
      return Text(
        institution.name[0].toUpperCase(),
        style: TextStyle(
          color: bgColor != null ? Colors.white : theme.colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      );
    }

    // Check if logo is base64 data or a URL
    final logo = institution.logo!;
    if (logo.startsWith('http://') || logo.startsWith('https://')) {
      // It's a URL
      return Image.network(
        logo,
        width: 24,
        height: 24,
        errorBuilder: (_, __, ___) => Text(
          institution.name[0].toUpperCase(),
          style: TextStyle(
            color: bgColor != null ? Colors.white : theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      // Assume it's base64 data
      try {
        return Image.memory(
          base64Decode(logo),
          width: 24,
          height: 24,
          errorBuilder: (_, __, ___) => Text(
            institution.name[0].toUpperCase(),
            style: TextStyle(
              color: bgColor != null ? Colors.white : theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      } catch (_) {
        return Text(
          institution.name[0].toUpperCase(),
          style: TextStyle(
            color: bgColor != null ? Colors.white : theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        );
      }
    }
  }
}
