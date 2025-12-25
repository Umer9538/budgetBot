import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../../../data/services/biometric_service.dart';
import '../../common/widgets/widgets.dart';
import '../../viewmodels/viewmodels.dart';

/// Provider for biometric service
final biometricServiceProvider = Provider<BiometricService>((ref) {
  return BiometricService();
});

/// Provider to check if biometrics are available
final biometricAvailableProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(biometricServiceProvider);
  return service.isBiometricAvailable();
});

/// Provider to check if biometrics are enabled
final biometricEnabledProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(biometricServiceProvider);
  return service.isBiometricEnabled();
});

/// Provider to get biometric type name
final biometricTypeNameProvider = FutureProvider<String>((ref) async {
  final service = ref.watch(biometricServiceProvider);
  return service.getBiometricTypeName();
});

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _biometricTriggered = false;

  @override
  void initState() {
    super.initState();
    // Trigger biometric authentication after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAndTriggerBiometric();
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _checkAndTriggerBiometric() async {
    if (_biometricTriggered) return;

    final service = ref.read(biometricServiceProvider);
    final isEnabled = await service.isBiometricEnabled();
    final isAvailable = await service.isBiometricAvailable();

    if (isEnabled && isAvailable && mounted) {
      _biometricTriggered = true;
      await _authenticateWithBiometric();
    }
  }

  Future<void> _authenticateWithBiometric() async {
    final service = ref.read(biometricServiceProvider);
    final biometricName = await service.getBiometricTypeName();

    final authenticated = await service.authenticate(
      reason: 'Use $biometricName to sign in to BudgetBot',
    );

    if (authenticated && mounted) {
      // Get saved email and sign in
      final savedEmail = await service.getBiometricUserEmail();
      if (savedEmail != null) {
        // For biometric login, we need to use a token-based approach
        // For now, show success and let the auth state handle it
        final success = await ref
            .read(authViewModelProvider.notifier)
            .signInWithBiometric(savedEmail);

        if (!success && mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Biometric authentication failed. Please sign in with your password.'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    }
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref.read(authViewModelProvider.notifier).signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

    if (!success && mounted) {
      // Error is shown via the ViewModel's error state
    }
  }

  void _showForgotPasswordDialog() {
    final resetEmailController = TextEditingController(
      text: _emailController.text.trim(),
    );

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Reset Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter your email address and we\'ll send you a link to reset your password.',
            ),
            const SizedBox(height: 16),
            TextField(
              controller: resetEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email_outlined),
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
            onPressed: () async {
              final email = resetEmailController.text.trim();
              if (email.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter your email'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              Navigator.pop(dialogContext);

              final success = await ref
                  .read(authViewModelProvider.notifier)
                  .resetPassword(email);

              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success
                          ? 'Password reset email sent! Check your inbox.'
                          : 'Failed to send reset email. Please try again.',
                    ),
                    backgroundColor: success ? Colors.green : Colors.red,
                  ),
                );
              }
            },
            child: const Text('Send Reset Link'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authViewModelProvider);
    final biometricAvailable = ref.watch(biometricAvailableProvider);
    final biometricEnabled = ref.watch(biometricEnabledProvider);
    final biometricTypeName = ref.watch(biometricTypeNameProvider);

    // Check if biometric button should be shown
    final showBiometricButton = biometricAvailable.maybeWhen(
          data: (available) => available,
          orElse: () => false,
        ) &&
        biometricEnabled.maybeWhen(
          data: (enabled) => enabled,
          orElse: () => false,
        );

    final biometricName = biometricTypeName.maybeWhen(
      data: (name) => name,
      orElse: () => 'Biometrics',
    );

    // Listen to error changes and clear when needed
    ref.listen<AuthState>(authViewModelProvider, (previous, next) {
      if (next.error != null && previous?.error != next.error) {
        // Error is displayed in UI
      }
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppDimensions.spacingHuge),

                // Logo and Title
                Icon(
                  Icons.account_balance_wallet,
                  size: 64,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: AppDimensions.spacingMd),
                Text(
                  AppConstants.appName,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimensions.spacingXs),
                Text(
                  'Your AI-powered finance assistant',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimensions.spacingHuge),

                // Welcome text
                Text(
                  'Welcome back',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: AppDimensions.spacingXs),
                Text(
                  'Sign in to continue',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingXl),

                // Error message
                if (authState.error != null) ...[
                  Container(
                    padding: const EdgeInsets.all(AppDimensions.spacingMd),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.errorContainer,
                      borderRadius: AppDimensions.borderRadiusMd,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: theme.colorScheme.error,
                        ),
                        const SizedBox(width: AppDimensions.spacingSm),
                        Expanded(
                          child: Text(
                            authState.error!,
                            style: TextStyle(
                              color: theme.colorScheme.onErrorContainer,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            ref.read(authViewModelProvider.notifier).clearError();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingMd),
                ],

                // Email field
                AppTextField(
                  controller: _emailController,
                  label: 'Email',
                  hint: 'Enter your email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.spacingMd),

                // Password field
                AppTextField(
                  controller: _passwordController,
                  label: 'Password',
                  hint: 'Enter your password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _signIn(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.spacingSm),

                // Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.push(AppRoutes.forgotPassword);
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingLg),

                // Sign in button
                AppButton(
                  label: 'Sign In',
                  onPressed: _signIn,
                  isLoading: authState.isLoading,
                  isFullWidth: true,
                  size: AppButtonSize.large,
                ),

                // Biometric login button
                if (showBiometricButton) ...[
                  const SizedBox(height: AppDimensions.spacingMd),
                  OutlinedButton.icon(
                    onPressed: authState.isLoading ? null : _authenticateWithBiometric,
                    icon: Icon(
                      biometricName == 'Face ID'
                          ? Icons.face
                          : Icons.fingerprint,
                      size: 24,
                    ),
                    label: Text('Sign in with $biometricName'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: theme.colorScheme.primary),
                    ),
                  ),
                ],

                const SizedBox(height: AppDimensions.spacingXl),

                // Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.spacingMd,
                      ),
                      child: Text(
                        'OR',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacingXl),

                // Sign up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Sign Up Screen
class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await ref.read(authViewModelProvider.notifier).signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          displayName: _nameController.text.trim(),
        );

    if (success && mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppDimensions.screenPadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppDimensions.spacingMd),

                // Title
                Text(
                  'Get Started',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: AppDimensions.spacingXs),
                Text(
                  'Create an account to start managing your finances',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingXl),

                // Error message
                if (authState.error != null) ...[
                  Container(
                    padding: const EdgeInsets.all(AppDimensions.spacingMd),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.errorContainer,
                      borderRadius: AppDimensions.borderRadiusMd,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: theme.colorScheme.error,
                        ),
                        const SizedBox(width: AppDimensions.spacingSm),
                        Expanded(
                          child: Text(
                            authState.error!,
                            style: TextStyle(
                              color: theme.colorScheme.onErrorContainer,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            ref.read(authViewModelProvider.notifier).clearError();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingMd),
                ],

                // Name field
                AppTextField(
                  controller: _nameController,
                  label: 'Full Name',
                  hint: 'Enter your full name',
                  prefixIcon: Icons.person_outline,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.spacingMd),

                // Email field
                AppTextField(
                  controller: _emailController,
                  label: 'Email',
                  hint: 'Enter your email',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.spacingMd),

                // Password field
                AppTextField(
                  controller: _passwordController,
                  label: 'Password',
                  hint: 'Create a password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.spacingMd),

                // Confirm password field
                AppTextField(
                  controller: _confirmPasswordController,
                  label: 'Confirm Password',
                  hint: 'Confirm your password',
                  prefixIcon: Icons.lock_outline,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _signUp(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.spacingXl),

                // Sign up button
                AppButton(
                  label: 'Create Account',
                  onPressed: _signUp,
                  isLoading: authState.isLoading,
                  isFullWidth: true,
                  size: AppButtonSize.large,
                ),
                const SizedBox(height: AppDimensions.spacingMd),

                // Terms text
                Text(
                  'By creating an account, you agree to our Terms of Service and Privacy Policy',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimensions.spacingXl),

                // Sign in link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Sign In'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
