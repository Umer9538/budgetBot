import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../viewmodels/viewmodels.dart';
import '../auth/security_questions_setup_screen.dart';

// Settings state providers
final pushNotificationsProvider = StateProvider<bool>((ref) => true);
final weeklyDigestProvider = StateProvider<bool>((ref) => false);
final biometricLoginProvider = StateProvider<bool>((ref) => false);

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final settingsState = ref.watch(settingsViewModelProvider);
    final pushNotifications = ref.watch(pushNotificationsProvider);
    final weeklyDigest = ref.watch(weeklyDigestProvider);
    final biometricLogin = ref.watch(biometricLoginProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: AppDimensions.screenPadding,
        children: [
          // Appearance Section
          _SectionHeader(title: 'Appearance'),
          Card(
            child: Column(
              children: [
                _ThemeModeTile(
                  currentMode: settingsState.themeMode,
                  onChanged: (mode) {
                    ref
                        .read(settingsViewModelProvider.notifier)
                        .setThemeMode(mode);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.spacingLg),

          // Account Section
          _SectionHeader(title: 'Account'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.account_balance_outlined),
                  title: const Text('Linked Accounts'),
                  subtitle: const Text('Manage bank connections'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    context.push(AppRoutes.linkedAccounts);
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.category_outlined),
                  title: const Text('Categories'),
                  subtitle: const Text('Customize transaction categories'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    context.push(AppRoutes.manageCategories);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.spacingLg),

          // Notifications Section
          _SectionHeader(title: 'Notifications'),
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  secondary: const Icon(Icons.notifications_outlined),
                  title: const Text('Push Notifications'),
                  subtitle: const Text('Receive budget alerts'),
                  value: pushNotifications,
                  onChanged: (value) {
                    ref.read(pushNotificationsProvider.notifier).state = value;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(value
                            ? 'Push notifications enabled'
                            : 'Push notifications disabled'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(Icons.email_outlined),
                  title: const Text('Weekly Digest'),
                  subtitle: const Text('Email summary of spending'),
                  value: weeklyDigest,
                  onChanged: (value) {
                    ref.read(weeklyDigestProvider.notifier).state = value;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(value
                            ? 'Weekly digest enabled'
                            : 'Weekly digest disabled'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.spacingLg),

          // Privacy & Security Section
          _SectionHeader(title: 'Privacy & Security'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.lock_outline),
                  title: const Text('Change Password'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showChangePasswordDialog(context, ref);
                  },
                ),
                const Divider(height: 1),
                _SecurityQuestionsListTile(),
                const Divider(height: 1),
                SwitchListTile(
                  secondary: const Icon(Icons.fingerprint),
                  title: const Text('Biometric Login'),
                  subtitle: const Text('Use fingerprint or face ID'),
                  value: biometricLogin,
                  onChanged: (value) {
                    ref.read(biometricLoginProvider.notifier).state = value;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(value
                            ? 'Biometric login enabled'
                            : 'Biometric login disabled'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.download_outlined),
                  title: const Text('Export Data'),
                  subtitle: const Text('Download your financial data'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    _showExportDataDialog(context);
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.delete_outline,
                      color: theme.colorScheme.error),
                  title: Text('Delete Account',
                      style: TextStyle(color: theme.colorScheme.error)),
                  onTap: () {
                    _showDeleteAccountDialog(context, ref);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.spacingLg),

          // About Section
          _SectionHeader(title: 'About'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text('App Version'),
                  trailing: Text(
                    AppConstants.appVersion,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.description_outlined),
                  title: const Text('Terms of Service'),
                  trailing: const Icon(Icons.open_in_new, size: 18),
                  onTap: () => _showUrlDialog(context, 'Terms of Service', 'https://budgetbot.app/terms'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: const Text('Privacy Policy'),
                  trailing: const Icon(Icons.open_in_new, size: 18),
                  onTap: () => _showUrlDialog(context, 'Privacy Policy', 'https://budgetbot.app/privacy'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text('Help & Support'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showHelpDialog(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.spacingHuge),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to delete your account? This action cannot be undone and all your data will be permanently removed.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Account deletion requested. You will receive a confirmation email.'),
                  duration: Duration(seconds: 3),
                ),
              );
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

  void _showChangePasswordDialog(BuildContext context, WidgetRef ref) {
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Change Password'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: currentPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Current Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm New Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (newPasswordController.text != confirmPasswordController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Passwords do not match'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              if (newPasswordController.text.length < 6) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Password must be at least 6 characters'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Password changed successfully'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Change'),
          ),
        ],
      ),
    );
  }

  void _showExportDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Data'),
        content: const Text(
          'Choose the format to export your financial data:',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _exportData(context, 'CSV');
            },
            child: const Text('CSV'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _exportData(context, 'PDF');
            },
            child: const Text('PDF'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _exportData(context, 'JSON');
            },
            child: const Text('JSON'),
          ),
        ],
      ),
    );
  }

  void _exportData(BuildContext context, String format) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Exporting data as $format...'),
        duration: const Duration(seconds: 2),
      ),
    );
    // Simulate export
    Future.delayed(const Duration(seconds: 2), () {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Data exported successfully as $format'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    });
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Help & Support'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.email_outlined),
              title: const Text('Email Support'),
              subtitle: const Text('support@budgetbot.app'),
              onTap: () {
                Navigator.pop(dialogContext);
                Clipboard.setData(const ClipboardData(text: 'support@budgetbot.app'));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Email copied to clipboard')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat_outlined),
              title: const Text('FAQ'),
              subtitle: const Text('Frequently asked questions'),
              onTap: () {
                Navigator.pop(dialogContext);
                _showUrlDialog(context, 'FAQ', 'https://budgetbot.app/faq');
              },
            ),
            ListTile(
              leading: const Icon(Icons.bug_report_outlined),
              title: const Text('Report a Bug'),
              subtitle: const Text('Help us improve'),
              onTap: () {
                Navigator.pop(dialogContext);
                Clipboard.setData(const ClipboardData(text: 'bugs@budgetbot.app'));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Bug report email copied to clipboard')),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showUrlDialog(BuildContext context, String title, String url) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Visit the following URL:'),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SelectableText(
                url,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Close'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: url));
              Navigator.pop(dialogContext);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('URL copied to clipboard')),
              );
            },
            icon: const Icon(Icons.copy, size: 18),
            label: const Text('Copy URL'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimensions.spacingXs,
        bottom: AppDimensions.spacingXs,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

class _ThemeModeTile extends StatelessWidget {
  const _ThemeModeTile({
    required this.currentMode,
    required this.onChanged,
  });

  final ThemeMode currentMode;
  final ValueChanged<ThemeMode> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Icon(
        currentMode == ThemeMode.dark
            ? Icons.dark_mode
            : currentMode == ThemeMode.light
                ? Icons.light_mode
                : Icons.brightness_auto,
      ),
      title: const Text('Theme'),
      subtitle: Text(_getThemeModeLabel(currentMode)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => _showThemeDialog(context),
    );
  }

  String _getThemeModeLabel(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'System default';
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
    }
  }

  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile<ThemeMode>(
              title: const Text('System default'),
              subtitle: const Text('Follow device settings'),
              value: ThemeMode.system,
              groupValue: currentMode,
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                  Navigator.pop(context);
                }
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Light'),
              value: ThemeMode.light,
              groupValue: currentMode,
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                  Navigator.pop(context);
                }
              },
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Dark'),
              value: ThemeMode.dark,
              groupValue: currentMode,
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SecurityQuestionsListTile extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasQuestionsAsync = ref.watch(hasSecurityQuestionsProvider);

    return hasQuestionsAsync.when(
      data: (hasQuestions) => ListTile(
        leading: const Icon(Icons.security_outlined),
        title: const Text('Security Questions'),
        subtitle: Text(
          hasQuestions ? 'Questions configured' : 'Not set up yet',
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (hasQuestions)
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 20,
              ),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right),
          ],
        ),
        onTap: () async {
          final result = await Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (_) => const SecurityQuestionsSetupScreen(
                isFromSettings: true,
              ),
            ),
          );
          if (result == true) {
            // Refresh the provider to update the status
            ref.invalidate(hasSecurityQuestionsProvider);
          }
        },
      ),
      loading: () => const ListTile(
        leading: Icon(Icons.security_outlined),
        title: Text('Security Questions'),
        subtitle: Text('Loading...'),
        trailing: SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      error: (_, __) => ListTile(
        leading: const Icon(Icons.security_outlined),
        title: const Text('Security Questions'),
        subtitle: const Text('Set up for password recovery'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () async {
          final result = await Navigator.push<bool>(
            context,
            MaterialPageRoute(
              builder: (_) => const SecurityQuestionsSetupScreen(
                isFromSettings: true,
              ),
            ),
          );
          if (result == true) {
            ref.invalidate(hasSecurityQuestionsProvider);
          }
        },
      ),
    );
  }
}
