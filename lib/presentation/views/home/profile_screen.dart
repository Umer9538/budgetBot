import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/core.dart';
import '../../../data/services/biometric_service.dart';
import '../../../data/services/dev_tools_service.dart';
import '../../common/widgets/widgets.dart';
import '../../viewmodels/viewmodels.dart';
import '../auth/login_screen.dart';
import '../auth/security_questions_setup_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  void _showPrivacySecuritySheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => _PrivacySecuritySheet(ref: ref),
    );
  }

  void _showAppearanceSheet(BuildContext context, WidgetRef ref) {
    final settingsState = ref.read(settingsViewModelProvider);
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _AppearanceSheet(
        currentTheme: settingsState.themeMode,
        onThemeChanged: (mode) {
          ref.read(settingsViewModelProvider.notifier).setThemeMode(mode);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showHelpSupportSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const _HelpSupportSheet(),
    );
  }

  void _showDevToolsSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _DevToolsSheet(ref: ref),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authState = ref.watch(authViewModelProvider);
    final user = authState.user;
    final userData = authState.userData;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          AppIconButton(
            icon: Icons.settings_outlined,
            onPressed: () {
              context.push(AppRoutes.settings);
            },
            tooltip: 'Settings',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: AppDimensions.screenPadding,
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppDimensions.spacingLg),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: AppDimensions.borderRadiusLg,
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: theme.colorScheme.primary,
                    child: Text(
                      user?.displayName?.isNotEmpty == true
                          ? user!.displayName![0].toUpperCase()
                          : user?.email?[0].toUpperCase() ?? 'U',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingMd),
                  Text(
                    user?.displayName ?? 'User',
                    style: theme.textTheme.titleLarge,
                  ),
                  Text(
                    user?.email ?? '',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingMd),
                  if (userData != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _StatBadge(
                          icon: Icons.local_fire_department,
                          value: '${userData.gamification.streak}',
                          label: 'Streak',
                        ),
                        const SizedBox(width: AppDimensions.spacingMd),
                        _StatBadge(
                          icon: Icons.star,
                          value: '${userData.gamification.points}',
                          label: 'Points',
                        ),
                        const SizedBox(width: AppDimensions.spacingMd),
                        _StatBadge(
                          icon: Icons.trending_up,
                          value: 'Lv ${userData.gamification.level}',
                          label: 'Level',
                        ),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),

            // Menu Items
            _ProfileMenuItem(
              icon: Icons.account_balance_outlined,
              title: 'Linked Accounts',
              subtitle: 'Manage your bank connections',
              onTap: () {
                context.push(AppRoutes.linkedAccounts);
              },
            ),
            _ProfileMenuItem(
              icon: Icons.notifications_outlined,
              title: 'Notifications',
              subtitle: 'Configure alert preferences',
              onTap: () {
                context.push(AppRoutes.notifications);
              },
            ),
            _ProfileMenuItem(
              icon: Icons.security_outlined,
              title: 'Privacy & Security',
              subtitle: 'Manage your data and security',
              onTap: () {
                _showPrivacySecuritySheet(context, ref);
              },
            ),
            _ProfileMenuItem(
              icon: Icons.palette_outlined,
              title: 'Appearance',
              subtitle: 'Theme and display settings',
              onTap: () {
                _showAppearanceSheet(context, ref);
              },
            ),
            _ProfileMenuItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
              subtitle: 'Get help with BudgetBot',
              onTap: () {
                _showHelpSupportSheet(context);
              },
            ),

            // Dev Tools (only in debug mode)
            if (kDebugMode) ...[
              const SizedBox(height: AppDimensions.spacingMd),
              _ProfileMenuItem(
                icon: Icons.developer_mode,
                title: 'Dev Tools',
                subtitle: 'Testing and development',
                onTap: () {
                  _showDevToolsSheet(context, ref);
                },
              ),
            ],

            const SizedBox(height: AppDimensions.spacingLg),

            // Sign Out Button
            AppButton(
              label: 'Sign Out',
              variant: AppButtonVariant.outlined,
              isFullWidth: true,
              onPressed: () async {
                final confirmed = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Sign Out'),
                    content: const Text('Are you sure you want to sign out?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Sign Out'),
                      ),
                    ],
                  ),
                );

                if (confirmed == true) {
                  await ref.read(authViewModelProvider.notifier).signOut();
                }
              },
            ),
            const SizedBox(height: AppDimensions.spacingMd),

            // App Version
            Text(
              'Version ${AppConstants.appVersion}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingHuge),
          ],
        ),
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  const _StatBadge({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: AppDimensions.borderRadiusMd,
          ),
          child: Icon(
            icon,
            color: theme.colorScheme.primary,
            size: 20,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingXs),
      child: ListTile(
        leading: Icon(icon, color: theme.colorScheme.primary),
        title: Text(title),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        onTap: onTap,
      ),
    );
  }
}

// Privacy & Security Bottom Sheet
class _PrivacySecuritySheet extends StatefulWidget {
  const _PrivacySecuritySheet({required this.ref});

  final WidgetRef ref;

  @override
  State<_PrivacySecuritySheet> createState() => _PrivacySecuritySheetState();
}

class _PrivacySecuritySheetState extends State<_PrivacySecuritySheet> {
  final BiometricService _biometricService = BiometricService();
  bool _biometricAvailable = false;
  bool _biometricEnabled = false;
  String _biometricName = 'Biometrics';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBiometricStatus();
  }

  Future<void> _loadBiometricStatus() async {
    final available = await _biometricService.isBiometricAvailable();
    final enabled = await _biometricService.isBiometricEnabled();
    final name = await _biometricService.getBiometricTypeName();

    if (mounted) {
      setState(() {
        _biometricAvailable = available;
        _biometricEnabled = enabled;
        _biometricName = name;
        _isLoading = false;
      });
    }
  }

  Future<void> _toggleBiometric(bool value) async {
    if (value) {
      // Enable biometric - authenticate first
      final authenticated = await _biometricService.authenticate(
        reason: 'Authenticate to enable $_biometricName login',
      );

      if (authenticated) {
        final userEmail = widget.ref.read(authViewModelProvider).user?.email;
        await _biometricService.setBiometricEnabled(true, userEmail: userEmail);

        // Invalidate providers to refresh state
        widget.ref.invalidate(biometricEnabledProvider);

        if (mounted) {
          setState(() => _biometricEnabled = true);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('$_biometricName login enabled'),
              backgroundColor: Colors.green,
            ),
          );
        }
      }
    } else {
      // Disable biometric
      await _biometricService.setBiometricEnabled(false);

      // Invalidate providers to refresh state
      widget.ref.invalidate(biometricEnabledProvider);

      if (mounted) {
        setState(() => _biometricEnabled = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$_biometricName login disabled'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.security, color: theme.colorScheme.primary),
                    const SizedBox(width: 12),
                    Text(
                      'Privacy & Security',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                _SheetOption(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  subtitle: 'Update your account password',
                  onTap: () {
                    Navigator.pop(context);
                    _showChangePasswordDialog(context, widget.ref);
                  },
                ),
                _SheetOption(
                  icon: Icons.quiz_outlined,
                  title: 'Security Questions',
                  subtitle: 'Set up for password recovery',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SecurityQuestionsSetupScreen(
                          isFromSettings: true,
                        ),
                      ),
                    );
                  },
                ),
                if (_biometricAvailable || _isLoading)
                  _SheetOption(
                    icon: _biometricName == 'Face ID'
                        ? Icons.face
                        : Icons.fingerprint,
                    title: '$_biometricName Login',
                    subtitle: _biometricEnabled
                        ? 'Enabled - Sign in quickly with $_biometricName'
                        : 'Use $_biometricName to sign in',
                    trailing: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Switch(
                            value: _biometricEnabled,
                            onChanged: _toggleBiometric,
                          ),
                    onTap: () {},
                  ),
                if (!_biometricAvailable && !_isLoading)
                  _SheetOption(
                    icon: Icons.fingerprint,
                    title: 'Biometric Login',
                    subtitle: 'Not available on this device',
                    trailing: Icon(
                      Icons.info_outline,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Biometric authentication is not available or not set up on this device.',
                          ),
                        ),
                      );
                    },
                  ),
                _SheetOption(
                  icon: Icons.download_outlined,
                  title: 'Export Data',
                  subtitle: 'Download your financial data',
                  onTap: () {
                    Navigator.pop(context);
                    _showExportDialog(context);
                  },
                ),
                _SheetOption(
                  icon: Icons.delete_outline,
                  title: 'Delete Account',
                  subtitle: 'Permanently delete your account',
                  isDestructive: true,
                  onTap: () {
                    Navigator.pop(context);
                    _showDeleteAccountDialog(context, widget.ref);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
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
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Password changed successfully')),
              );
            },
            child: const Text('Change'),
          ),
        ],
      ),
    );
  }

  void _showExportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export Data'),
        content: const Text('Choose the format to export your data:'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Exporting as CSV...')),
              );
            },
            child: const Text('CSV'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Exporting as PDF...')),
              );
            },
            child: const Text('PDF'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Exporting as JSON...')),
              );
            },
            child: const Text('JSON'),
          ),
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
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

// Appearance Bottom Sheet
class _AppearanceSheet extends StatelessWidget {
  const _AppearanceSheet({
    required this.currentTheme,
    required this.onThemeChanged,
  });

  final ThemeMode currentTheme;
  final ValueChanged<ThemeMode> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.palette, color: theme.colorScheme.primary),
                    const SizedBox(width: 12),
                    Text(
                      'Appearance',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Theme',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                _ThemeOption(
                  icon: Icons.brightness_auto,
                  title: 'System Default',
                  subtitle: 'Follow device settings',
                  isSelected: currentTheme == ThemeMode.system,
                  onTap: () => onThemeChanged(ThemeMode.system),
                ),
                _ThemeOption(
                  icon: Icons.light_mode,
                  title: 'Light',
                  subtitle: 'Light theme',
                  isSelected: currentTheme == ThemeMode.light,
                  onTap: () => onThemeChanged(ThemeMode.light),
                ),
                _ThemeOption(
                  icon: Icons.dark_mode,
                  title: 'Dark',
                  subtitle: 'Dark theme',
                  isSelected: currentTheme == ThemeMode.dark,
                  onTap: () => onThemeChanged(ThemeMode.dark),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
        ],
      ),
    );
  }
}

class _ThemeOption extends StatelessWidget {
  const _ThemeOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      color: isSelected
          ? theme.colorScheme.primaryContainer
          : theme.colorScheme.surfaceContainerHighest,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.onSurfaceVariant,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: isSelected
            ? Icon(Icons.check_circle, color: theme.colorScheme.primary)
            : null,
        onTap: onTap,
      ),
    );
  }
}

// Help & Support Bottom Sheet
class _HelpSupportSheet extends StatelessWidget {
  const _HelpSupportSheet();

  Future<void> _launchEmail(BuildContext context, String email, {String? subject}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: subject != null ? {'subject': subject} : null,
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        // Fallback: copy email to clipboard
        await Clipboard.setData(ClipboardData(text: email));
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email copied: $email')),
          );
        }
      }
    } catch (e) {
      await Clipboard.setData(ClipboardData(text: email));
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Email copied: $email')),
        );
      }
    }
  }

  Future<void> _launchUrl(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open the link')),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open the link')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Icon(Icons.help, color: theme.colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  'Help & Support',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).padding.bottom + 20,
              ),
              child: Column(
                children: [
                  _SheetOption(
                    icon: Icons.email_outlined,
                    title: 'Email Support',
                    subtitle: 'support@budgetbot.app',
                    onTap: () {
                      Navigator.pop(context);
                      _launchEmail(context, 'support@budgetbot.app', subject: 'BudgetBot Support Request');
                    },
                  ),
                  _SheetOption(
                    icon: Icons.chat_outlined,
                    title: 'FAQ',
                    subtitle: 'Frequently asked questions',
                    onTap: () {
                      Navigator.pop(context);
                      _showFAQDialog(context);
                    },
                  ),
                  _SheetOption(
                    icon: Icons.bug_report_outlined,
                    title: 'Report a Bug',
                    subtitle: 'Help us improve',
                    onTap: () {
                      Navigator.pop(context);
                      _launchEmail(context, 'bugs@budgetbot.app', subject: 'BudgetBot Bug Report');
                    },
                  ),
                  _SheetOption(
                    icon: Icons.star_outline,
                    title: 'Rate the App',
                    subtitle: 'Share your feedback',
                    onTap: () {
                      Navigator.pop(context);
                      _launchUrl(context, 'https://apps.apple.com/app/budgetbot');
                    },
                  ),
                  _SheetOption(
                    icon: Icons.description_outlined,
                    title: 'Terms of Service',
                    subtitle: 'Read our terms',
                    onTap: () {
                      Navigator.pop(context);
                      _showTermsDialog(context);
                    },
                  ),
                  _SheetOption(
                    icon: Icons.privacy_tip_outlined,
                    title: 'Privacy Policy',
                    subtitle: 'How we handle your data',
                    onTap: () {
                      Navigator.pop(context);
                      _showPrivacyDialog(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFAQDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Frequently Asked Questions'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _FAQItem(
                question: 'How do I add a transaction?',
                answer: 'Tap the + button on the home screen or go to Transactions and tap "Add Transaction".',
              ),
              _FAQItem(
                question: 'How do I create a budget?',
                answer: 'Go to the Budgets tab and tap "Create Budget" to set spending limits for categories.',
              ),
              _FAQItem(
                question: 'How do I link my bank account?',
                answer: 'Go to Profile > Bank Accounts and tap "Link Account" to connect via Plaid.',
              ),
              _FAQItem(
                question: 'How do AI insights work?',
                answer: 'Our AI analyzes your spending patterns to provide personalized tips and predictions.',
              ),
              _FAQItem(
                question: 'Is my data secure?',
                answer: 'Yes! We use bank-level encryption and never share your data with third parties.',
              ),
              _FAQItem(
                question: 'How do I enable notifications?',
                answer: 'Go to Profile > Notifications to customize which alerts you receive.',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showTermsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Terms of Service'),
        content: const SingleChildScrollView(
          child: Text(
            'BudgetBot Terms of Service\n\n'
            'Last updated: December 2024\n\n'
            '1. Acceptance of Terms\n'
            'By using BudgetBot, you agree to these terms. If you do not agree, please do not use the app.\n\n'
            '2. Use of Service\n'
            'BudgetBot is a personal finance management tool. You are responsible for the accuracy of information you enter.\n\n'
            '3. Account Security\n'
            'You are responsible for maintaining the confidentiality of your account credentials.\n\n'
            '4. Data Accuracy\n'
            'While we strive for accuracy, BudgetBot does not guarantee the accuracy of financial calculations or AI-generated insights.\n\n'
            '5. Limitation of Liability\n'
            'BudgetBot is not liable for any financial decisions made based on app data or recommendations.\n\n'
            '6. Changes to Terms\n'
            'We may update these terms at any time. Continued use constitutes acceptance of new terms.\n\n'
            '7. Contact\n'
            'For questions, contact support@budgetbot.app',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Privacy Policy'),
        content: const SingleChildScrollView(
          child: Text(
            'BudgetBot Privacy Policy\n\n'
            'Last updated: December 2024\n\n'
            '1. Data We Collect\n'
            '• Account information (email, name)\n'
            '• Financial data you enter\n'
            '• Usage analytics\n\n'
            '2. How We Use Data\n'
            '• To provide budgeting features\n'
            '• To generate AI insights\n'
            '• To improve our service\n\n'
            '3. Data Storage\n'
            'Your data is stored securely using Firebase with encryption at rest and in transit.\n\n'
            '4. Data Sharing\n'
            'We do not sell or share your personal data with third parties except as required by law.\n\n'
            '5. Your Rights\n'
            '• Access your data\n'
            '• Delete your account\n'
            '• Export your data\n\n'
            '6. Security\n'
            'We use industry-standard security measures including encryption and secure authentication.\n\n'
            '7. Contact\n'
            'For privacy concerns, contact support@budgetbot.app',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class _FAQItem extends StatelessWidget {
  const _FAQItem({required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            answer,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

// Shared option widget for bottom sheets
class _SheetOption extends StatelessWidget {
  const _SheetOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.trailing,
    this.isDestructive = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Widget? trailing;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = isDestructive ? Colors.red : theme.colorScheme.onSurface;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (isDestructive ? Colors.red : theme.colorScheme.primary)
              .withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: isDestructive ? Colors.red : theme.colorScheme.primary,
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: trailing ??
          Icon(
            Icons.chevron_right,
            color: theme.colorScheme.onSurfaceVariant,
          ),
      onTap: onTap,
    );
  }
}

// Dev Tools Bottom Sheet
class _DevToolsSheet extends StatefulWidget {
  const _DevToolsSheet({required this.ref});

  final WidgetRef ref;

  @override
  State<_DevToolsSheet> createState() => _DevToolsSheetState();
}

class _DevToolsSheetState extends State<_DevToolsSheet> {
  bool _isLoading = false;
  String? _message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userId = widget.ref.watch(currentUserIdProvider);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.developer_mode, color: theme.colorScheme.primary),
                    const SizedBox(width: 12),
                    Text(
                      'Dev Tools',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Development and testing tools',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 20),

                // Status message
                if (_message != null)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
                    ),
                    child: Text(
                      _message!,
                      style: const TextStyle(color: Colors.green),
                    ),
                  ),

                // Add Dummy Transactions
                _SheetOption(
                  icon: Icons.add_chart,
                  title: 'Add Dummy Transactions',
                  subtitle: 'Add 50+ test transactions for AI testing',
                  onTap: _isLoading || userId == null
                      ? () {}
                      : () async {
                          setState(() {
                            _isLoading = true;
                            _message = null;
                          });

                          try {
                            final service = DevToolsService();
                            final count = await service.addDummyTransactions(userId);
                            setState(() {
                              _message = 'Added $count dummy transactions!';
                              _isLoading = false;
                            });
                          } catch (e) {
                            setState(() {
                              _message = 'Error: $e';
                              _isLoading = false;
                            });
                          }
                        },
                  trailing: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : null,
                ),

                // Clear All Transactions
                _SheetOption(
                  icon: Icons.delete_sweep,
                  title: 'Clear All Transactions',
                  subtitle: 'Remove all transactions (cannot be undone)',
                  isDestructive: true,
                  onTap: _isLoading || userId == null
                      ? () {}
                      : () async {
                          final confirmed = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Clear All Transactions?'),
                              content: const Text(
                                'This will permanently delete all your transactions. This action cannot be undone.',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.red,
                                  ),
                                  child: const Text('Delete All'),
                                ),
                              ],
                            ),
                          );

                          if (confirmed == true) {
                            setState(() {
                              _isLoading = true;
                              _message = null;
                            });

                            try {
                              final service = DevToolsService();
                              final count = await service.clearAllTransactions(userId);
                              setState(() {
                                _message = 'Cleared $count transactions!';
                                _isLoading = false;
                              });
                            } catch (e) {
                              setState(() {
                                _message = 'Error: $e';
                                _isLoading = false;
                              });
                            }
                          }
                        },
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).padding.bottom + 10),
        ],
      ),
    );
  }
}
