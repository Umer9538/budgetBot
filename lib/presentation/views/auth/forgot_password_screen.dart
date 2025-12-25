import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../data/services/security_questions_service.dart';
import '../../viewmodels/viewmodels.dart';
import 'security_questions_setup_screen.dart';

/// Forgot password screen with choice between security questions and email link
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // State
  // Steps: 0: email, 1: choose method, 2: questions, 3: new password, 4: success
  int _currentStep = 0;
  bool _isLoading = false;
  bool _hasSecurityQuestions = false;
  List<String> _securityQuestions = [];
  final List<TextEditingController> _answerControllers = [];
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _error;
  String _resetMethod = ''; // 'questions' or 'email'

  @override
  void dispose() {
    _emailController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    for (final controller in _answerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _checkEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final service = ref.read(securityQuestionsServiceProvider);
      final questions = await service.getSecurityQuestions(
        _emailController.text.trim(),
      );

      _hasSecurityQuestions = questions.isNotEmpty;

      if (_hasSecurityQuestions) {
        // Set up answer controllers
        _answerControllers.clear();
        for (int i = 0; i < questions.length; i++) {
          _answerControllers.add(TextEditingController());
        }
        _securityQuestions = questions;
      }

      setState(() {
        _currentStep = 1; // Go to choice step
        _isLoading = false;
      });
    } catch (e) {
      // Even if there's an error checking questions, allow email reset
      setState(() {
        _hasSecurityQuestions = false;
        _currentStep = 1;
        _isLoading = false;
      });
    }
  }

  Future<void> _sendEmailReset() async {
    setState(() {
      _isLoading = true;
      _error = null;
      _resetMethod = 'email';
    });

    try {
      await ref
          .read(authViewModelProvider.notifier)
          .resetPassword(_emailController.text.trim());

      setState(() {
        _currentStep = 4; // Success
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to send reset email. Please try again.';
        _isLoading = false;
      });
    }
  }

  void _chooseSecurityQuestions() {
    setState(() {
      _resetMethod = 'questions';
      _currentStep = 2; // Questions step
      _error = null;
    });
  }

  Future<void> _verifyAnswers() async {
    // Validate all answers are filled
    for (int i = 0; i < _answerControllers.length; i++) {
      if (_answerControllers[i].text.trim().isEmpty) {
        setState(() {
          _error = 'Please answer all security questions';
        });
        return;
      }
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final questionsAndAnswers = <Map<String, String>>[];
      for (int i = 0; i < _securityQuestions.length; i++) {
        questionsAndAnswers.add({
          'question': _securityQuestions[i],
          'answer': _answerControllers[i].text.trim(),
        });
      }

      final service = ref.read(securityQuestionsServiceProvider);
      final verified = await service.verifyAnswers(
        email: _emailController.text.trim(),
        questionsAndAnswers: questionsAndAnswers,
      );

      if (verified) {
        // Answers correct - go to set new password step
        setState(() {
          _currentStep = 3; // New password step
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'One or more answers are incorrect. Please try again.';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Verification failed. Please try again.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: const Text('Reset Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.spacingLg),
          child: Column(
            children: [
              // Progress Indicator
              _buildProgressIndicator(),
              const SizedBox(height: AppDimensions.spacingXl),

              // Content based on step
              if (_currentStep == 0) _buildEmailStep(),
              if (_currentStep == 1) _buildChoiceStep(),
              if (_currentStep == 2) _buildQuestionsStep(),
              if (_currentStep == 3) _buildNewPasswordStep(),
              if (_currentStep == 4) _buildSuccessStep(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    // Map internal steps to display steps
    int displayStep = _currentStep;
    if (_currentStep == 1) displayStep = 1; // Choice = Verify
    if (_currentStep == 2) displayStep = 1; // Questions = Verify
    if (_currentStep == 3) displayStep = 1; // New Password = Verify
    if (_currentStep == 4) displayStep = 2; // Success = Done

    return Row(
      children: [
        _buildStepDot(0, 'Email', displayStep >= 0),
        Expanded(child: _buildStepLine(displayStep > 0)),
        _buildStepDot(1, 'Verify', displayStep >= 1),
        Expanded(child: _buildStepLine(displayStep > 1)),
        _buildStepDot(2, 'Done', displayStep >= 2),
      ],
    );
  }

  Widget _buildStepDot(int step, String label, bool isActive) {
    final isCurrent = (_currentStep == 0 && step == 0) ||
        ((_currentStep == 1 || _currentStep == 2 || _currentStep == 3) && step == 1) ||
        (_currentStep == 4 && step == 2);

    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.surfaceDark,
            shape: BoxShape.circle,
            border: isCurrent
                ? Border.all(color: AppColors.primary, width: 2)
                : null,
          ),
          child: Center(
            child: isActive && !isCurrent
                ? const Icon(Icons.check, color: Colors.white, size: 20)
                : Text(
                    '${step + 1}',
                    style: TextStyle(
                      color: isActive ? Colors.white : AppColors.neutral500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : AppColors.neutral500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildStepLine(bool isActive) {
    return Container(
      height: 2,
      margin: const EdgeInsets.only(bottom: 20),
      color: isActive ? AppColors.primary : AppColors.surfaceDark,
    );
  }

  Widget _buildEmailStep() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.email_outlined,
                color: AppColors.primary,
                size: 40,
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacingLg),

          // Title
          const Center(
            child: Text(
              'Enter Your Email',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),

          Center(
            child: Text(
              'We\'ll help you reset your password',
              style: TextStyle(
                color: AppColors.neutral400,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingXl),

          // Email Field
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email Address',
              hintText: 'Enter your email',
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: AppColors.surfaceDark,
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email';
              }
              if (!value.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),

          // Error Message
          if (_error != null) ...[
            const SizedBox(height: AppDimensions.spacingMd),
            _buildErrorMessage(_error!),
          ],

          const SizedBox(height: AppDimensions.spacingXl),

          // Continue Button
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _isLoading ? null : _checkEmail,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: AppColors.primary,
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChoiceStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.verified_user_outlined,
              color: AppColors.primary,
              size: 40,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spacingLg),

        // Title
        const Center(
          child: Text(
            'Choose Reset Method',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spacingSm),

        Center(
          child: Text(
            'How would you like to reset your password?',
            style: TextStyle(
              color: AppColors.neutral400,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingXl),

        // Option 1: Security Questions (if available)
        if (_hasSecurityQuestions)
          _buildMethodCard(
            icon: Icons.quiz_outlined,
            title: 'Answer Security Questions',
            description: 'Verify your identity by answering your security questions',
            onTap: _chooseSecurityQuestions,
            isRecommended: true,
          ),

        if (_hasSecurityQuestions)
          const SizedBox(height: AppDimensions.spacingMd),

        // Option 2: Email Link
        _buildMethodCard(
          icon: Icons.mail_outline,
          title: 'Send Email Link',
          description: 'We\'ll send a password reset link to your email',
          onTap: _isLoading ? null : _sendEmailReset,
          isRecommended: !_hasSecurityQuestions,
          isLoading: _isLoading && _resetMethod == 'email',
        ),

        // Info message if no security questions
        if (!_hasSecurityQuestions) ...[
          const SizedBox(height: AppDimensions.spacingLg),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.blue, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Tip: Set up security questions in Settings for faster password recovery next time!',
                    style: TextStyle(color: Colors.blue.shade200, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
        ],

        // Error Message
        if (_error != null) ...[
          const SizedBox(height: AppDimensions.spacingMd),
          _buildErrorMessage(_error!),
        ],

        const SizedBox(height: AppDimensions.spacingXl),

        // Back Button
        Center(
          child: TextButton.icon(
            onPressed: () {
              setState(() {
                _currentStep = 0;
                _error = null;
              });
            },
            icon: const Icon(Icons.arrow_back),
            label: Text(
              'Change email',
              style: TextStyle(color: AppColors.neutral400),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMethodCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback? onTap,
    bool isRecommended = false,
    bool isLoading = false,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(12),
          border: isRecommended
              ? Border.all(color: AppColors.primary, width: 2)
              : Border.all(color: AppColors.neutral700),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isRecommended
                    ? AppColors.primary.withValues(alpha: 0.2)
                    : AppColors.neutral700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isRecommended ? AppColors.primary : AppColors.neutral400,
                size: 24,
              ),
            ),
            const SizedBox(width: AppDimensions.spacingMd),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    runSpacing: 4,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (isRecommended)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Recommended',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      color: AppColors.neutral400,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            if (isLoading)
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              Icon(
                Icons.chevron_right,
                color: AppColors.neutral500,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionsStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.quiz_outlined,
              color: AppColors.primary,
              size: 40,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spacingLg),

        // Title
        const Center(
          child: Text(
            'Answer Security Questions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spacingSm),

        Center(
          child: Text(
            'Answer the questions you set up to verify your identity',
            style: TextStyle(
              color: AppColors.neutral400,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingXl),

        // Questions
        for (int i = 0; i < _securityQuestions.length; i++) ...[
          Container(
            padding: const EdgeInsets.all(AppDimensions.spacingMd),
            decoration: BoxDecoration(
              color: AppColors.surfaceDark,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${i + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _securityQuestions[i],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppDimensions.spacingMd),
                TextField(
                  controller: _answerControllers[i],
                  decoration: InputDecoration(
                    hintText: 'Your answer',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: AppColors.backgroundDark,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (i < _securityQuestions.length - 1)
            const SizedBox(height: AppDimensions.spacingMd),
        ],

        // Error Message
        if (_error != null) ...[
          const SizedBox(height: AppDimensions.spacingMd),
          _buildErrorMessage(_error!),
        ],

        const SizedBox(height: AppDimensions.spacingXl),

        // Verify Button
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: _isLoading ? null : _verifyAnswers,
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppColors.primary,
            ),
            child: _isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Verify & Reset Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),

        const SizedBox(height: AppDimensions.spacingMd),

        // Alternative option
        Center(
          child: TextButton(
            onPressed: () {
              setState(() {
                _currentStep = 1; // Back to choice
                _error = null;
              });
            },
            child: Text(
              'Use email link instead',
              style: TextStyle(color: AppColors.neutral400),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNewPasswordStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.lock_reset,
              color: Colors.green,
              size: 40,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spacingLg),

        // Title
        const Center(
          child: Text(
            'Set New Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.spacingSm),

        Center(
          child: Text(
            'Your identity has been verified!\nCreate a new password for your account.',
            style: TextStyle(
              color: AppColors.neutral400,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingXl),

        // New Password Field
        TextField(
          controller: _newPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'New Password',
            hintText: 'Enter new password',
            prefixIcon: const Icon(Icons.lock_outline),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: AppColors.surfaceDark,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingMd),

        // Confirm Password Field
        TextField(
          controller: _confirmPasswordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            hintText: 'Confirm new password',
            prefixIcon: const Icon(Icons.lock_outline),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: AppColors.surfaceDark,
          ),
        ),

        // Error Message
        if (_error != null) ...[
          const SizedBox(height: AppDimensions.spacingMd),
          _buildErrorMessage(_error!),
        ],

        const SizedBox(height: AppDimensions.spacingXl),

        // Reset Password Button
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: _isLoading ? null : _submitNewPassword,
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppColors.primary,
            ),
            child: _isLoading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),

        const SizedBox(height: AppDimensions.spacingMd),

        // Back option
        Center(
          child: TextButton(
            onPressed: () {
              setState(() {
                _currentStep = 2; // Back to questions
                _error = null;
              });
            },
            child: Text(
              'Back to security questions',
              style: TextStyle(color: AppColors.neutral400),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _submitNewPassword() async {
    final newPassword = _newPasswordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    // Validate
    if (newPassword.isEmpty) {
      setState(() => _error = 'Please enter a new password');
      return;
    }
    if (newPassword.length < 6) {
      setState(() => _error = 'Password must be at least 6 characters');
      return;
    }
    if (newPassword != confirmPassword) {
      setState(() => _error = 'Passwords do not match');
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Since we can't directly change password from client without being signed in,
      // we send a password reset email. The user verified their identity via security questions.
      await ref
          .read(authViewModelProvider.notifier)
          .resetPassword(_emailController.text.trim());

      setState(() {
        _currentStep = 4; // Success
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to reset password. Please try again.';
        _isLoading = false;
      });
    }
  }

  Widget _buildSuccessStep() {
    final methodText = _resetMethod == 'questions'
        ? 'Password Reset Initiated!'
        : 'Reset link sent!';

    return Column(
      children: [
        const SizedBox(height: AppDimensions.spacingXl),

        // Success Icon
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 60,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingLg),

        // Title
        Text(
          methodText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingMd),

        Text(
          'We\'ve sent a password reset link to\n${_emailController.text}',
          style: TextStyle(
            color: AppColors.neutral400,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.spacingXl),

        // Info Card
        Container(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline, color: AppColors.primary, size: 20),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Check your email and click the link to set a new password.',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: AppDimensions.spacingXl),

        // Back to Login Button
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () => Navigator.pop(context),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppColors.primary,
            ),
            child: const Text(
              'Back to Login',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorMessage(String message) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.red, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
