import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_dimensions.dart';
import '../../../data/models/security_question_model.dart';
import '../../../data/services/security_questions_service.dart';

/// Provider for SecurityQuestionsService
final securityQuestionsServiceProvider = Provider<SecurityQuestionsService>((ref) {
  return SecurityQuestionsService();
});

/// Provider to check if user has security questions
final hasSecurityQuestionsProvider = FutureProvider<bool>((ref) async {
  final service = ref.watch(securityQuestionsServiceProvider);
  return service.currentUserHasSecurityQuestions();
});

/// Screen to set up security questions
class SecurityQuestionsSetupScreen extends ConsumerStatefulWidget {
  const SecurityQuestionsSetupScreen({super.key, this.isFromSettings = false});

  final bool isFromSettings;

  @override
  ConsumerState<SecurityQuestionsSetupScreen> createState() =>
      _SecurityQuestionsSetupScreenState();
}

class _SecurityQuestionsSetupScreenState
    extends ConsumerState<SecurityQuestionsSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> _selectedQuestions = [null, null, null];
  final List<TextEditingController> _answerControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  bool _isSaving = false;

  @override
  void dispose() {
    for (final controller in _answerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  List<String> _getAvailableQuestions(int currentIndex) {
    return SecurityQuestions.questions.where((q) {
      // Show question if it's not selected by other dropdowns
      for (int i = 0; i < _selectedQuestions.length; i++) {
        if (i != currentIndex && _selectedQuestions[i] == q) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  Future<void> _saveQuestions() async {
    if (!_formKey.currentState!.validate()) return;

    // Check all questions are selected
    for (int i = 0; i < _selectedQuestions.length; i++) {
      if (_selectedQuestions[i] == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select question ${i + 1}'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
    }

    setState(() => _isSaving = true);

    try {
      final questionsAndAnswers = <Map<String, String>>[];
      for (int i = 0; i < _selectedQuestions.length; i++) {
        questionsAndAnswers.add({
          'question': _selectedQuestions[i]!,
          'answer': _answerControllers[i].text.trim(),
        });
      }

      final service = ref.read(securityQuestionsServiceProvider);
      await service.saveSecurityQuestions(
        questionsAndAnswers: questionsAndAnswers,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Security questions saved successfully!'),
            backgroundColor: Colors.green,
          ),
        );

        if (widget.isFromSettings) {
          Navigator.pop(context, true);
        } else {
          Navigator.pop(context);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: const Text('Security Questions'),
        leading: widget.isFromSettings
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        automaticallyImplyLeading: widget.isFromSettings,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.spacingLg),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(AppDimensions.spacingMd),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.security,
                        color: AppColors.primary,
                        size: 32,
                      ),
                      const SizedBox(width: AppDimensions.spacingMd),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Secure Your Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Set up 3 security questions to recover your account if you forget your password.',
                              style: TextStyle(
                                color: AppColors.neutral400,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppDimensions.spacingXl),

                // Security Questions
                for (int i = 0; i < 3; i++) ...[
                  _buildQuestionSection(i),
                  if (i < 2) const SizedBox(height: AppDimensions.spacingLg),
                ],

                const SizedBox(height: AppDimensions.spacingXl),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: _isSaving ? null : _saveQuestions,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: AppColors.primary,
                    ),
                    child: _isSaving
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Save Security Questions',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),

                if (!widget.isFromSettings) ...[
                  const SizedBox(height: AppDimensions.spacingMd),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Skip for now',
                        style: TextStyle(color: AppColors.neutral400),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionSection(int index) {
    final availableQuestions = _getAvailableQuestions(index);

    return Container(
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
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppDimensions.spacingSm),
              Text(
                'Question ${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.spacingMd),

          // Question Dropdown
          DropdownButtonFormField<String>(
            value: _selectedQuestions[index],
            decoration: InputDecoration(
              labelText: 'Select a question',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: AppColors.backgroundDark,
            ),
            dropdownColor: AppColors.surfaceDark,
            isExpanded: true,
            items: availableQuestions.map((question) {
              return DropdownMenuItem(
                value: question,
                child: Text(
                  question,
                  style: const TextStyle(fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedQuestions[index] = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select a question';
              }
              return null;
            },
          ),
          const SizedBox(height: AppDimensions.spacingMd),

          // Answer Field
          TextFormField(
            controller: _answerControllers[index],
            decoration: InputDecoration(
              labelText: 'Your answer',
              hintText: 'Enter your answer',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: AppColors.backgroundDark,
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter an answer';
              }
              if (value.trim().length < 2) {
                return 'Answer is too short';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
