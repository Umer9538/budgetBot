import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';
import '../../../data/models/investment_model.dart';
import '../../../data/services/investment_service.dart';
import '../../common/widgets/widgets.dart';

/// Provider for Investment Profile stream
final investmentProfileStreamProvider =
    StreamProvider.family<InvestmentProfile?, String>((ref, userId) {
  final service = ref.watch(investmentServiceProvider);
  return service.watchProfile(userId);
});

class InvestmentScreen extends ConsumerStatefulWidget {
  const InvestmentScreen({super.key});

  @override
  ConsumerState<InvestmentScreen> createState() => _InvestmentScreenState();
}

class _InvestmentScreenState extends ConsumerState<InvestmentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userId = ref.watch(currentUserIdProvider);

    if (userId == null) {
      return const Scaffold(
        body: Center(child: Text('Please sign in')),
      );
    }

    final profileAsync = ref.watch(investmentProfileStreamProvider(userId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Investment Guidance'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Profile', icon: Icon(Icons.person_outline)),
            Tab(text: 'Invest', icon: Icon(Icons.trending_up)),
            Tab(text: 'Goals', icon: Icon(Icons.flag_outlined)),
            Tab(text: 'Learn', icon: Icon(Icons.school_outlined)),
          ],
        ),
      ),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (profile) {
          if (profile == null) {
            return _RiskAssessmentTab(userId: userId);
          }
          return TabBarView(
            controller: _tabController,
            children: [
              _RiskProfileTab(profile: profile),
              _RecommendationsTab(profile: profile),
              _GoalsTab(userId: userId, profile: profile),
              _EducationTab(riskProfile: profile.riskProfile),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Text(
          'Disclaimer: All investment recommendations are for educational purposes only and do not constitute financial advice. Consult a licensed financial advisor before making investment decisions.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// ===== Risk Assessment Tab (for new users) =====

class _RiskAssessmentTab extends ConsumerStatefulWidget {
  const _RiskAssessmentTab({required this.userId});

  final String userId;

  @override
  ConsumerState<_RiskAssessmentTab> createState() => _RiskAssessmentTabState();
}

class _RiskAssessmentTabState extends ConsumerState<_RiskAssessmentTab> {
  final _pageController = PageController();
  final _answers = <String, RiskAnswer>{};
  late List<RiskQuestion> _questions;
  int _currentPage = 0;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _questions = ref.read(investmentServiceProvider).getRiskQuestionnaire();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectOption(int optionIndex) {
    final question = _questions[_currentPage];
    final option = question.options[optionIndex];

    setState(() {
      _answers[question.id] = RiskAnswer(
        questionId: question.id,
        question: question.question,
        selectedOption: optionIndex,
        score: option.score,
      );
    });
  }

  void _nextPage() {
    if (_currentPage < _questions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _submitAssessment() async {
    if (_answers.length < _questions.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please answer all questions')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final service = ref.read(investmentServiceProvider);
      await service.completeRiskAssessment(
        widget.userId,
        _answers.values.toList(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Risk profile complete!')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        // Progress indicator
        LinearProgressIndicator(
          value: (_currentPage + 1) / _questions.length,
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
        ),
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          child: Text(
            'Question ${_currentPage + 1} of ${_questions.length}',
            style: theme.textTheme.bodySmall,
          ),
        ),

        // Questions
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (page) => setState(() => _currentPage = page),
            itemCount: _questions.length,
            itemBuilder: (context, index) {
              final question = _questions[index];
              final answer = _answers[question.id];

              return _QuestionPage(
                question: question,
                selectedOption: answer?.selectedOption,
                onOptionSelected: _selectOption,
              );
            },
          ),
        ),

        // Navigation
        Padding(
          padding: const EdgeInsets.all(AppDimensions.spacingMd),
          child: Row(
            children: [
              if (_currentPage > 0)
                OutlinedButton(
                  onPressed: _previousPage,
                  child: const Text('Back'),
                ),
              const Spacer(),
              if (_currentPage < _questions.length - 1)
                AppButton(
                  label: 'Next',
                  onPressed: _answers.containsKey(_questions[_currentPage].id)
                      ? _nextPage
                      : null,
                )
              else
                AppButton(
                  label: 'Complete Assessment',
                  onPressed: _answers.length == _questions.length
                      ? _submitAssessment
                      : null,
                  isLoading: _isSubmitting,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _QuestionPage extends StatelessWidget {
  const _QuestionPage({
    required this.question,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  final RiskQuestion question;
  final int? selectedOption;
  final void Function(int) onOptionSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingLg),
          ...List.generate(question.options.length, (index) {
            final option = question.options[index];
            final isSelected = selectedOption == index;

            return Padding(
              padding: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
              child: InkWell(
                onTap: () => onOptionSelected(index),
                borderRadius: AppDimensions.borderRadiusMd,
                child: Container(
                  padding: const EdgeInsets.all(AppDimensions.spacingMd),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline,
                      width: isSelected ? 2 : 1,
                    ),
                    borderRadius: AppDimensions.borderRadiusMd,
                    color: isSelected
                        ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
                        : null,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isSelected
                                ? theme.colorScheme.primary
                                : theme.colorScheme.outline,
                            width: 2,
                          ),
                          color: isSelected ? theme.colorScheme.primary : null,
                        ),
                        child: isSelected
                            ? Icon(
                                Icons.check,
                                size: 16,
                                color: theme.colorScheme.onPrimary,
                              )
                            : null,
                      ),
                      const SizedBox(width: AppDimensions.spacingMd),
                      Expanded(
                        child: Text(
                          option.text,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ===== Risk Profile Tab =====

class _RiskProfileTab extends StatelessWidget {
  const _RiskProfileTab({required this.profile});

  final InvestmentProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Risk Profile Card
          _RiskProfileCard(profile: profile),
          const SizedBox(height: AppDimensions.spacingMd),

          // Suggested Allocation
          Text(
            'Suggested Asset Allocation',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.spacingSm),
          _AllocationCard(allocation: profile.riskProfile.suggestedAllocation),
          const SizedBox(height: AppDimensions.spacingLg),

          // Behavioral Factors
          if (profile.assessment.behavioralFactors.adjustmentReason != null) ...[
            Text(
              'Behavioral Analysis',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            _BehavioralFactorsCard(factors: profile.assessment.behavioralFactors),
            const SizedBox(height: AppDimensions.spacingLg),
          ],

          // Reassessment reminder
          if (profile.nextReassessmentDate != null)
            Card(
              color: theme.colorScheme.tertiaryContainer,
              child: ListTile(
                leading: Icon(Icons.event, color: theme.colorScheme.tertiary),
                title: const Text('Next Reassessment'),
                subtitle: Text(
                  'Scheduled for ${_formatDate(profile.nextReassessmentDate!)}',
                ),
              ),
            ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}

class _RiskProfileCard extends StatelessWidget {
  const _RiskProfileCard({required this.profile});

  final InvestmentProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final riskProfile = profile.riskProfile;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingLg),
        child: Column(
          children: [
            // Risk Score Circle
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _getRiskColor(profile.riskScore).withValues(alpha: 0.2),
                border: Border.all(
                  color: _getRiskColor(profile.riskScore),
                  width: 4,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${profile.riskScore}',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: _getRiskColor(profile.riskScore),
                    ),
                  ),
                  Text(
                    'Risk Score',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.spacingMd),

            Text(
              riskProfile.displayName,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Text(
              riskProfile.description,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.spacingMd),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Expected Return: ${riskProfile.expectedReturnRange}',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getRiskColor(int score) {
    if (score <= 3) return Colors.green;
    if (score <= 5) return Colors.blue;
    if (score <= 7) return Colors.orange;
    return Colors.red;
  }
}

class _AllocationCard extends StatelessWidget {
  const _AllocationCard({required this.allocation});

  final Map<String, int> allocation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          children: allocation.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: _getAssetColor(entry.key),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      entry.key.substring(0, 1).toUpperCase() +
                          entry.key.substring(1),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    '${entry.value}%',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Color _getAssetColor(String asset) {
    switch (asset.toLowerCase()) {
      case 'stocks':
        return Colors.blue;
      case 'bonds':
        return Colors.green;
      case 'cash':
        return Colors.grey;
      default:
        return Colors.purple;
    }
  }
}

class _BehavioralFactorsCard extends StatelessWidget {
  const _BehavioralFactorsCard({required this.factors});

  final BehavioralRiskFactors factors;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (factors.adjustmentReason != null) ...[
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.tertiaryContainer,
                  borderRadius: AppDimensions.borderRadiusSm,
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: theme.colorScheme.tertiary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        factors.adjustmentReason!,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimensions.spacingMd),
            ],
            _FactorRow(
              label: 'Income Stability',
              value: factors.incomeStability,
            ),
            _FactorRow(
              label: 'Savings Consistency',
              value: factors.savingsConsistency,
            ),
            _FactorRow(
              label: 'Emergency Fund',
              value: '${factors.emergencyFundMonths.toStringAsFixed(1)} months',
              isText: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _FactorRow extends StatelessWidget {
  const _FactorRow({
    required this.label,
    required this.value,
    this.isText = false,
  });

  final String label;
  final dynamic value;
  final bool isText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: theme.textTheme.bodyMedium),
          ),
          if (isText)
            Text(
              value as String,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            )
          else
            SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                value: (value as double).clamp(0.0, 1.0),
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
              ),
            ),
        ],
      ),
    );
  }
}

// ===== Recommendations Tab =====

class _RecommendationsTab extends ConsumerWidget {
  const _RecommendationsTab({required this.profile});

  final InvestmentProfile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      children: [
        Text(
          'Personalized Recommendations',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Based on your ${profile.riskProfile.displayName} profile',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingMd),
        ...profile.recommendations.map(
          (rec) => _RecommendationCard(recommendation: rec),
        ),
      ],
    );
  }
}

class _RecommendationCard extends StatelessWidget {
  const _RecommendationCard({required this.recommendation});

  final InvestmentRecommendation recommendation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingMd),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: AppDimensions.borderRadiusSm,
                  ),
                  child: Text(
                    recommendation.assetType.icon,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recommendation.symbol,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        recommendation.name,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                _RecommendationBadge(type: recommendation.recommendationType),
              ],
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            Text(
              recommendation.reasoning,
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Wrap(
              spacing: 8,
              children: [
                if (recommendation.suggestedAllocation > 0)
                  Chip(
                    label: Text(
                      '${recommendation.suggestedAllocation.toStringAsFixed(0)}% allocation',
                    ),
                    backgroundColor: theme.colorScheme.secondaryContainer,
                  ),
                if (recommendation.expenseRatio != null)
                  Chip(
                    label: Text(
                      '${recommendation.expenseRatio}% expense ratio',
                    ),
                  ),
                if (recommendation.dividendYield != null)
                  Chip(
                    label: Text(
                      '${recommendation.dividendYield}% dividend',
                    ),
                  ),
                if (recommendation.isTaxAdvantaged)
                  Chip(
                    label: const Text('Tax Advantaged'),
                    avatar: const Icon(Icons.star, size: 16),
                    backgroundColor: theme.colorScheme.tertiaryContainer,
                  ),
              ],
            ),
            if (recommendation.isTaxAdvantaged &&
                recommendation.taxAdvantageExplanation != null) ...[
              const SizedBox(height: AppDimensions.spacingSm),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.tertiaryContainer.withValues(alpha: 0.5),
                  borderRadius: AppDimensions.borderRadiusSm,
                ),
                child: Text(
                  recommendation.taxAdvantageExplanation!,
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _RecommendationBadge extends StatelessWidget {
  const _RecommendationBadge({required this.type});

  final RecommendationType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = _getTypeColor(type);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        type.displayName,
        style: theme.textTheme.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getTypeColor(RecommendationType type) {
    switch (type) {
      case RecommendationType.buy:
        return Colors.green;
      case RecommendationType.hold:
        return Colors.blue;
      case RecommendationType.increasPosition:
        return Colors.teal;
      case RecommendationType.reducePosition:
        return Colors.orange;
      case RecommendationType.dollarCostAverage:
        return Colors.purple;
    }
  }
}

// ===== Goals Tab =====

class _GoalsTab extends ConsumerStatefulWidget {
  const _GoalsTab({required this.userId, required this.profile});

  final String userId;
  final InvestmentProfile profile;

  @override
  ConsumerState<_GoalsTab> createState() => _GoalsTabState();
}

class _GoalsTabState extends ConsumerState<_GoalsTab> {
  List<InvestmentGoal>? _goals;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadGoals();
  }

  Future<void> _loadGoals() async {
    final service = ref.read(investmentServiceProvider);
    final goals = await service.getGoals(widget.userId);
    if (mounted) {
      setState(() {
        _goals = goals;
        _isLoading = false;
      });
    }
  }

  void _showAddGoalDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _AddGoalSheet(
        userId: widget.userId,
        onGoalAdded: _loadGoals,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_goals == null || _goals!.isEmpty) {
      return Center(
        child: Padding(
          padding: AppDimensions.screenPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.flag_outlined,
                size: 64,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: AppDimensions.spacingMd),
              Text(
                'Set Investment Goals',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppDimensions.spacingSm),
              Text(
                'Define your financial goals to get personalized recommendations and track your progress.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppDimensions.spacingLg),
              AppButton(
                label: 'Add First Goal',
                icon: Icons.add,
                onPressed: _showAddGoalDialog,
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your Investment Goals',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _showAddGoalDialog,
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacingSm),
        ..._goals!.map((goal) => _GoalCard(goal: goal)),
      ],
    );
  }
}

class _GoalCard extends StatelessWidget {
  const _GoalCard({required this.goal});

  final InvestmentGoal goal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progress = goal.currentAmount / goal.targetAmount;

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingMd),
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getGoalIcon(goal.type),
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    goal.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: goal.isOnTrack
                        ? Colors.green.withValues(alpha: 0.2)
                        : Colors.orange.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    goal.isOnTrack ? 'On Track' : 'Behind',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: goal.isOnTrack ? Colors.green : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress.clamp(0.0, 1.0),
                minHeight: 8,
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${goal.currentAmount.toStringAsFixed(0)}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${goal.targetAmount.toStringAsFixed(0)}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacingSm),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 14,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  '${goal.timeHorizonYears} years',
                  style: theme.textTheme.bodySmall,
                ),
                const Spacer(),
                Icon(
                  Icons.payments_outlined,
                  size: 14,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Text(
                  '\$${goal.requiredMonthlyContribution.toStringAsFixed(0)}/mo needed',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getGoalIcon(GoalType type) {
    switch (type) {
      case GoalType.retirement:
        return Icons.chair;
      case GoalType.emergencyFund:
        return Icons.shield;
      case GoalType.homePurchase:
        return Icons.home;
      case GoalType.education:
        return Icons.school;
      case GoalType.travel:
        return Icons.flight;
      case GoalType.wealthBuilding:
        return Icons.trending_up;
      case GoalType.majorPurchase:
        return Icons.shopping_cart;
      case GoalType.other:
        return Icons.flag;
    }
  }
}

class _AddGoalSheet extends ConsumerStatefulWidget {
  const _AddGoalSheet({required this.userId, required this.onGoalAdded});

  final String userId;
  final VoidCallback onGoalAdded;

  @override
  ConsumerState<_AddGoalSheet> createState() => _AddGoalSheetState();
}

class _AddGoalSheetState extends ConsumerState<_AddGoalSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _targetController = TextEditingController();
  final _currentController = TextEditingController(text: '0');
  int _timeHorizon = 5;
  GoalType _goalType = GoalType.wealthBuilding;
  GoalPriority _priority = GoalPriority.important;
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _targetController.dispose();
    _currentController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final service = ref.read(investmentServiceProvider);
      await service.addGoal(
        widget.userId,
        name: _nameController.text,
        targetAmount: double.parse(_targetController.text),
        currentAmount: double.parse(_currentController.text),
        timeHorizonYears: _timeHorizon,
        priority: _priority,
        type: _goalType,
      );

      if (mounted) {
        Navigator.pop(context);
        widget.onGoalAdded();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: AppDimensions.spacingMd,
        right: AppDimensions.spacingMd,
        top: AppDimensions.spacingMd,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Investment Goal',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: AppDimensions.spacingLg),

              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Goal Name',
                  hintText: 'e.g., House Down Payment',
                ),
                validator: (v) => v?.isEmpty == true ? 'Required' : null,
              ),
              const SizedBox(height: AppDimensions.spacingMd),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _targetController,
                      decoration: const InputDecoration(
                        labelText: 'Target Amount',
                        prefixText: '\$',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (v) => v?.isEmpty == true ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: AppDimensions.spacingMd),
                  Expanded(
                    child: TextFormField(
                      controller: _currentController,
                      decoration: const InputDecoration(
                        labelText: 'Current Amount',
                        prefixText: '\$',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppDimensions.spacingMd),

              Text('Time Horizon: $_timeHorizon years'),
              Slider(
                value: _timeHorizon.toDouble(),
                min: 1,
                max: 30,
                divisions: 29,
                label: '$_timeHorizon years',
                onChanged: (v) => setState(() => _timeHorizon = v.round()),
              ),
              const SizedBox(height: AppDimensions.spacingMd),

              DropdownButtonFormField<GoalType>(
                value: _goalType,
                decoration: const InputDecoration(labelText: 'Goal Type'),
                items: GoalType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.displayName),
                  );
                }).toList(),
                onChanged: (v) => setState(() => _goalType = v!),
              ),
              const SizedBox(height: AppDimensions.spacingMd),

              DropdownButtonFormField<GoalPriority>(
                value: _priority,
                decoration: const InputDecoration(labelText: 'Priority'),
                items: GoalPriority.values.map((p) {
                  return DropdownMenuItem(
                    value: p,
                    child: Text(p.displayName),
                  );
                }).toList(),
                onChanged: (v) => setState(() => _priority = v!),
              ),
              const SizedBox(height: AppDimensions.spacingLg),

              SizedBox(
                width: double.infinity,
                child: AppButton(
                  label: 'Add Goal',
                  onPressed: _submit,
                  isLoading: _isSubmitting,
                ),
              ),
              const SizedBox(height: AppDimensions.spacingMd),
            ],
          ),
        ),
      ),
    );
  }
}

// ===== Education Tab =====

class _EducationTab extends ConsumerWidget {
  const _EducationTab({required this.riskProfile});

  final InvestmentRisk riskProfile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final service = ref.read(investmentServiceProvider);
    final content = service.getEducationalContent(riskProfile);

    return ListView(
      padding: const EdgeInsets.all(AppDimensions.spacingMd),
      children: [
        Text(
          'Investment Education',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Content tailored for your ${riskProfile.displayName} profile',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingMd),
        ...content.map((edu) => _EducationCard(education: edu)),
      ],
    );
  }
}

class _EducationCard extends StatelessWidget {
  const _EducationCard({required this.education});

  final InvestmentEducation education;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: AppDimensions.spacingSm),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: AppDimensions.borderRadiusSm,
          ),
          child: Icon(
            _getTopicIcon(education.topic),
            color: theme.colorScheme.primary,
          ),
        ),
        title: Text(
          education.title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(
          children: [
            Chip(
              label: Text(education.level.displayName),
              padding: EdgeInsets.zero,
              labelStyle: theme.textTheme.labelSmall,
            ),
            const SizedBox(width: 8),
            Text('${education.readTimeMinutes} min read'),
          ],
        ),
        trailing: education.isCompleted
            ? Icon(Icons.check_circle, color: Colors.green)
            : Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // TODO: Navigate to education detail
        },
      ),
    );
  }

  IconData _getTopicIcon(EducationTopic topic) {
    switch (topic) {
      case EducationTopic.basics:
        return Icons.school;
      case EducationTopic.diversification:
        return Icons.pie_chart;
      case EducationTopic.riskManagement:
        return Icons.shield;
      case EducationTopic.taxOptimization:
        return Icons.receipt_long;
      case EducationTopic.retirement:
        return Icons.chair;
      case EducationTopic.marketAnalysis:
        return Icons.analytics;
    }
  }
}
