import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/env_config.dart';
import '../../core/enums/enums.dart';
import '../models/models.dart';
import '../models/emotional_spending_model.dart';

/// Provider for EmotionalSpendingService
final emotionalSpendingServiceProvider = Provider<EmotionalSpendingService>((ref) {
  return EmotionalSpendingService();
});

/// Service for analyzing emotional spending patterns
class EmotionalSpendingService {
  EmotionalSpendingService({
    FirebaseFirestore? firestore,
    Dio? dio,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _dio = dio ?? Dio();

  final FirebaseFirestore _firestore;
  final Dio _dio;

  // Collection references
  CollectionReference get _analysisCollection =>
      _firestore.collection('emotional_spending_analysis');

  CollectionReference _moodEntriesCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('mood_entries');

  // ===== Analysis Operations =====

  /// Generate emotional spending analysis for a user
  Future<EmotionalSpendingAnalysis> analyzeEmotionalSpending({
    required String userId,
    int daysBack = 90,
    bool useAI = true,
  }) async {
    // Get transactions with mood data
    final transactions = await _getTransactionsWithMood(userId, daysBack);

    if (transactions.isEmpty) {
      return _createEmptyAnalysis(userId);
    }

    // Calculate mood-spending correlations
    final moodSpendingMap = _calculateMoodSpending(transactions);
    final moodFrequencyMap = _calculateMoodFrequency(transactions);

    // Identify patterns
    final patterns = _identifyPatterns(transactions);

    // Identify triggers
    final triggers = _identifyTriggers(transactions);

    // Calculate emotional spending score
    final score = _calculateEmotionalSpendingScore(transactions);

    // Find dominant mood
    final dominantMood = _findDominantMood(moodFrequencyMap);

    // Identify vulnerable moods
    final vulnerableMoods = _identifyVulnerableMoods(moodSpendingMap);

    // Calculate totals
    final totalEmotional = _calculateTotalEmotionalSpending(transactions);
    final totalAll = transactions.fold<double>(0, (sum, t) => sum + t.amount.abs());
    final percentage = totalAll > 0 ? (totalEmotional / totalAll) * 100 : 0.0;

    // Create profile
    final profile = EmotionalSpendingProfile(
      dominantMood: dominantMood,
      emotionalSpendingScore: score,
      moodSpendingMap: moodSpendingMap.map((k, v) => MapEntry(k.name, v)),
      moodFrequencyMap: moodFrequencyMap.map((k, v) => MapEntry(k.name, v)),
      primaryTriggerCategory: _findPrimaryTriggerCategory(transactions),
      primaryTriggerTime: _findPrimaryTriggerTime(transactions),
      isHighRiskSpender: score >= 60,
      vulnerableMoods: vulnerableMoods.map((m) => m.name).toList(),
    );

    // Generate recommendations
    List<String> recommendations;
    if (useAI) {
      recommendations = await _generateAIRecommendations(profile, patterns, triggers);
    } else {
      recommendations = _generateBasicRecommendations(profile, patterns);
    }

    // Create analysis
    final analysis = EmotionalSpendingAnalysis(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      analysisDate: DateTime.now(),
      profile: profile,
      patterns: patterns,
      triggers: triggers,
      recommendations: recommendations,
      totalEmotionalSpending: totalEmotional,
      percentageOfTotal: percentage,
      createdAt: DateTime.now(),
    );

    // Save to Firestore
    await _saveAnalysis(analysis);

    return analysis;
  }

  /// Get latest analysis for a user
  Future<EmotionalSpendingAnalysis?> getLatestAnalysis(String userId) async {
    final snapshot = await _analysisCollection
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;

    return EmotionalSpendingAnalysis.fromJson(
      snapshot.docs.first.data() as Map<String, dynamic>,
    );
  }

  /// Stream latest analysis
  Stream<EmotionalSpendingAnalysis?> watchLatestAnalysis(String userId) {
    return _analysisCollection
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .limit(1)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isEmpty) return null;
      return EmotionalSpendingAnalysis.fromJson(
        snapshot.docs.first.data() as Map<String, dynamic>,
      );
    });
  }

  // ===== Mood Entry Operations =====

  /// Record mood for a transaction
  Future<void> recordMood({
    required String userId,
    required String transactionId,
    required MoodType mood,
    int? stressLevel,
    String? note,
  }) async {
    final entry = MoodEntry(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      transactionId: transactionId,
      mood: mood,
      stressLevel: stressLevel,
      note: note,
      recordedAt: DateTime.now(),
    );

    await _moodEntriesCollection(userId).doc(entry.id).set({
      ...entry.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// Get mood entries for a user
  Future<List<MoodEntry>> getMoodEntries(String userId, {int limit = 100}) async {
    final snapshot = await _moodEntriesCollection(userId)
        .orderBy('recordedAt', descending: true)
        .limit(limit)
        .get();

    return snapshot.docs
        .map((doc) => MoodEntry.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }

  // ===== Private Methods =====

  Future<List<TransactionModel>> _getTransactionsWithMood(
    String userId,
    int daysBack,
  ) async {
    final cutoffDate = DateTime.now().subtract(Duration(days: daysBack));

    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .where('date', isGreaterThan: Timestamp.fromDate(cutoffDate))
        .where('type', isEqualTo: 'expense')
        .get();

    return snapshot.docs
        .map((doc) => TransactionModel.fromJson(doc.data()))
        .where((t) => t.emotionalContext?.mood != null)
        .toList();
  }

  Map<MoodType, double> _calculateMoodSpending(List<TransactionModel> transactions) {
    final moodTotals = <MoodType, double>{};
    final moodCounts = <MoodType, int>{};

    for (final t in transactions) {
      final mood = t.emotionalContext?.mood;
      if (mood != null) {
        moodTotals[mood] = (moodTotals[mood] ?? 0) + t.amount.abs();
        moodCounts[mood] = (moodCounts[mood] ?? 0) + 1;
      }
    }

    // Calculate averages
    return moodTotals.map((mood, total) {
      final count = moodCounts[mood] ?? 1;
      return MapEntry(mood, total / count);
    });
  }

  Map<MoodType, int> _calculateMoodFrequency(List<TransactionModel> transactions) {
    final frequency = <MoodType, int>{};

    for (final t in transactions) {
      final mood = t.emotionalContext?.mood;
      if (mood != null) {
        frequency[mood] = (frequency[mood] ?? 0) + 1;
      }
    }

    return frequency;
  }

  double _calculateEmotionalSpendingScore(List<TransactionModel> transactions) {
    if (transactions.isEmpty) return 0;

    double riskScore = 0;
    int count = 0;

    for (final t in transactions) {
      final mood = t.emotionalContext?.mood;
      if (mood != null) {
        riskScore += mood.spendingRisk;
        count++;
      }
    }

    if (count == 0) return 0;

    // Convert to 0-100 scale (max risk is 10)
    return (riskScore / count) * 10;
  }

  MoodType _findDominantMood(Map<MoodType, int> frequency) {
    if (frequency.isEmpty) return MoodType.neutral;

    return frequency.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }

  List<MoodType> _identifyVulnerableMoods(Map<MoodType, double> moodSpending) {
    if (moodSpending.isEmpty) return [];

    final avgSpending = moodSpending.values.reduce((a, b) => a + b) / moodSpending.length;

    return moodSpending.entries
        .where((e) => e.value > avgSpending * 1.5 && e.key.isHighRisk)
        .map((e) => e.key)
        .toList();
  }

  double _calculateTotalEmotionalSpending(List<TransactionModel> transactions) {
    return transactions
        .where((t) => t.emotionalContext?.mood?.isHighRisk == true)
        .fold<double>(0, (sum, t) => sum + t.amount.abs());
  }

  String? _findPrimaryTriggerCategory(List<TransactionModel> transactions) {
    final categorySpending = <CategoryType, double>{};

    for (final t in transactions) {
      if (t.emotionalContext?.mood?.isHighRisk == true) {
        categorySpending[t.category] =
            (categorySpending[t.category] ?? 0) + t.amount.abs();
      }
    }

    if (categorySpending.isEmpty) return null;

    return categorySpending.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key
        .displayName;
  }

  String? _findPrimaryTriggerTime(List<TransactionModel> transactions) {
    final timeOfDayCounts = <String, int>{};

    for (final t in transactions) {
      if (t.emotionalContext?.mood?.isHighRisk == true) {
        final hour = t.date.hour;
        String timeOfDay;
        if (hour < 6) {
          timeOfDay = 'night';
        } else if (hour < 12) {
          timeOfDay = 'morning';
        } else if (hour < 18) {
          timeOfDay = 'afternoon';
        } else {
          timeOfDay = 'evening';
        }
        timeOfDayCounts[timeOfDay] = (timeOfDayCounts[timeOfDay] ?? 0) + 1;
      }
    }

    if (timeOfDayCounts.isEmpty) return null;

    return timeOfDayCounts.entries
        .reduce((a, b) => a.value > b.value ? a : b)
        .key;
  }

  List<EmotionalPattern> _identifyPatterns(List<TransactionModel> transactions) {
    final patterns = <EmotionalPattern>[];

    // Group by mood
    final moodGroups = <MoodType, List<TransactionModel>>{};
    for (final t in transactions) {
      final mood = t.emotionalContext?.mood;
      if (mood != null) {
        moodGroups[mood] = [...(moodGroups[mood] ?? []), t];
      }
    }

    for (final entry in moodGroups.entries) {
      final mood = entry.key;
      final moodTransactions = entry.value;

      if (moodTransactions.length < 3) continue;

      // Determine pattern type based on mood
      final patternType = _determinePatternType(mood);
      final avgAmount = moodTransactions.fold<double>(0, (sum, t) => sum + t.amount.abs()) /
          moodTransactions.length;

      // Find common category
      final categoryCount = <CategoryType, int>{};
      for (final t in moodTransactions) {
        categoryCount[t.category] = (categoryCount[t.category] ?? 0) + 1;
      }
      final topCategory = categoryCount.entries
          .reduce((a, b) => a.value > b.value ? a : b)
          .key;

      // Find common time
      final timeOfDay = _getMostCommonTimeOfDay(moodTransactions);

      // Find common merchants
      final merchantCount = <String, int>{};
      for (final t in moodTransactions) {
        if (t.merchantName != null) {
          merchantCount[t.merchantName!] = (merchantCount[t.merchantName!] ?? 0) + 1;
        }
      }
      final topMerchants = merchantCount.entries
          .where((e) => e.value >= 2)
          .map((e) => e.key)
          .take(3)
          .toList();

      patterns.add(EmotionalPattern(
        id: '${mood.name}_pattern',
        mood: mood,
        type: patternType,
        description: _generatePatternDescription(mood, patternType, avgAmount),
        avgAmount: avgAmount,
        occurrences: moodTransactions.length,
        confidence: _calculatePatternConfidence(moodTransactions.length),
        category: topCategory.displayName,
        timeOfDay: timeOfDay,
        associatedMerchants: topMerchants,
      ));
    }

    return patterns;
  }

  PatternType _determinePatternType(MoodType mood) {
    switch (mood) {
      case MoodType.stressed:
      case MoodType.anxious:
        return PatternType.stressShopping;
      case MoodType.sad:
        return PatternType.comfortPurchase;
      case MoodType.frustrated:
        return PatternType.impulseControl;
      case MoodType.tired:
        return PatternType.avoidance;
      case MoodType.excited:
        return PatternType.celebratory;
      case MoodType.happy:
        return PatternType.rewardSeeking;
      default:
        return PatternType.boredomSpending;
    }
  }

  String _getMostCommonTimeOfDay(List<TransactionModel> transactions) {
    final counts = <String, int>{};
    for (final t in transactions) {
      final hour = t.date.hour;
      String time;
      if (hour < 6) {
        time = 'night';
      } else if (hour < 12) {
        time = 'morning';
      } else if (hour < 18) {
        time = 'afternoon';
      } else {
        time = 'evening';
      }
      counts[time] = (counts[time] ?? 0) + 1;
    }
    return counts.entries.reduce((a, b) => a.value > b.value ? a : b).key;
  }

  String _generatePatternDescription(MoodType mood, PatternType type, double avgAmount) {
    return 'When feeling ${mood.displayName.toLowerCase()}, you tend to engage in '
        '${type.displayName.toLowerCase()} with an average spend of '
        '\$${avgAmount.toStringAsFixed(2)}.';
  }

  double _calculatePatternConfidence(int occurrences) {
    if (occurrences >= 10) return 0.9;
    if (occurrences >= 7) return 0.75;
    if (occurrences >= 5) return 0.6;
    if (occurrences >= 3) return 0.4;
    return 0.2;
  }

  List<EmotionalTrigger> _identifyTriggers(List<TransactionModel> transactions) {
    final triggers = <EmotionalTrigger>[];

    // Time-of-day trigger
    final timeGroups = <String, List<TransactionModel>>{};
    for (final t in transactions) {
      if (t.emotionalContext?.mood?.isHighRisk == true) {
        final hour = t.date.hour;
        String time;
        if (hour < 6) {
          time = 'Late Night (12am-6am)';
        } else if (hour < 12) {
          time = 'Morning (6am-12pm)';
        } else if (hour < 18) {
          time = 'Afternoon (12pm-6pm)';
        } else {
          time = 'Evening (6pm-12am)';
        }
        timeGroups[time] = [...(timeGroups[time] ?? []), t];
      }
    }

    for (final entry in timeGroups.entries) {
      if (entry.value.length >= 3) {
        final avgIncrease = _calculateSpendingIncrease(entry.value, transactions);
        triggers.add(EmotionalTrigger(
          id: 'time_${entry.key.hashCode}',
          triggerMood: entry.value.first.emotionalContext!.mood!,
          type: TriggerType.timeOfDay,
          description: '${entry.key} shows higher emotional spending',
          riskLevel: (avgIncrease / 10).clamp(0, 10),
          avgSpendIncrease: avgIncrease,
          timePattern: entry.key,
          warningSignals: _getTimeWarningSignals(entry.key),
          copingStrategies: _getTimeCopingStrategies(entry.key),
        ));
      }
    }

    // Day-of-week trigger
    final dayGroups = <int, List<TransactionModel>>{};
    for (final t in transactions) {
      if (t.emotionalContext?.mood?.isHighRisk == true) {
        dayGroups[t.date.weekday] = [...(dayGroups[t.date.weekday] ?? []), t];
      }
    }

    final weekdays = ['', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    for (final entry in dayGroups.entries) {
      if (entry.value.length >= 3) {
        final avgIncrease = _calculateSpendingIncrease(entry.value, transactions);
        triggers.add(EmotionalTrigger(
          id: 'day_${entry.key}',
          triggerMood: entry.value.first.emotionalContext!.mood!,
          type: TriggerType.dayOfWeek,
          description: '${weekdays[entry.key]}s show higher emotional spending',
          riskLevel: (avgIncrease / 10).clamp(0, 10),
          avgSpendIncrease: avgIncrease,
          timePattern: weekdays[entry.key],
          warningSignals: ['High-risk day detected'],
          copingStrategies: ['Plan activities for ${weekdays[entry.key]}s', 'Set spending limits'],
        ));
      }
    }

    return triggers;
  }

  double _calculateSpendingIncrease(
    List<TransactionModel> triggerTransactions,
    List<TransactionModel> allTransactions,
  ) {
    if (allTransactions.isEmpty) return 0;

    final triggerAvg = triggerTransactions.fold<double>(0, (sum, t) => sum + t.amount.abs()) /
        triggerTransactions.length;
    final overallAvg = allTransactions.fold<double>(0, (sum, t) => sum + t.amount.abs()) /
        allTransactions.length;

    if (overallAvg == 0) return 0;
    return ((triggerAvg - overallAvg) / overallAvg) * 100;
  }

  List<String> _getTimeWarningSignals(String timeOfDay) {
    if (timeOfDay.contains('Late Night')) {
      return ['Fatigue-induced decisions', 'Lower impulse control'];
    }
    if (timeOfDay.contains('Evening')) {
      return ['End-of-day stress', 'Reward-seeking behavior'];
    }
    return ['Watch for emotional triggers'];
  }

  List<String> _getTimeCopingStrategies(String timeOfDay) {
    if (timeOfDay.contains('Late Night')) {
      return ['Add items to wishlist instead of buying', 'Set phone usage limits'];
    }
    if (timeOfDay.contains('Evening')) {
      return ['Take a walk before shopping', 'Use the 24-hour rule'];
    }
    return ['Pause and breathe before purchases', 'Check your mood tracker'];
  }

  Future<List<String>> _generateAIRecommendations(
    EmotionalSpendingProfile profile,
    List<EmotionalPattern> patterns,
    List<EmotionalTrigger> triggers,
  ) async {
    final apiKey = EnvConfig.openAIApiKey;
    if (apiKey.isEmpty) {
      return _generateBasicRecommendations(profile, patterns);
    }

    try {
      final prompt = '''
Analyze this emotional spending profile and provide 5 personalized recommendations:

Emotional Spending Score: ${profile.emotionalSpendingScore.toStringAsFixed(1)}/100
Dominant Mood: ${profile.dominantMood.displayName}
High-Risk Spender: ${profile.isHighRiskSpender ? 'Yes' : 'No'}
Vulnerable Moods: ${profile.vulnerableMoods.join(', ')}
Primary Trigger Category: ${profile.primaryTriggerCategory ?? 'Unknown'}
Primary Trigger Time: ${profile.primaryTriggerTime ?? 'Unknown'}

Patterns Identified:
${patterns.map((p) => '- ${p.description}').join('\n')}

Triggers Identified:
${triggers.map((t) => '- ${t.description}').join('\n')}

Provide exactly 5 specific, actionable recommendations to help reduce emotional spending.
Format each recommendation as a single sentence starting with an action verb.
''';

      final response = await _dio.post(
        '${EnvConfig.aiBaseUrl}/chat/completions',
        options: Options(headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        }),
        data: {
          'model': 'gpt-4o-mini',
          'messages': [
            {
              'role': 'system',
              'content': 'You are a financial wellness coach specializing in emotional spending.',
            },
            {'role': 'user', 'content': prompt},
          ],
          'max_tokens': 500,
          'temperature': 0.7,
        },
      );

      final content = response.data['choices'][0]['message']['content'] as String;
      return content
          .split('\n')
          .where((line) => line.trim().isNotEmpty)
          .map((line) => line.replaceFirst(RegExp(r'^\d+\.\s*'), '').trim())
          .where((line) => line.isNotEmpty)
          .take(5)
          .toList();
    } catch (e) {
      debugPrint('AI recommendation failed: $e');
      return _generateBasicRecommendations(profile, patterns);
    }
  }

  List<String> _generateBasicRecommendations(
    EmotionalSpendingProfile profile,
    List<EmotionalPattern> patterns,
  ) {
    final recommendations = <String>[];

    if (profile.isHighRiskSpender) {
      recommendations.add('Consider using a mood check-in before making purchases over \$30.');
    }

    for (final mood in profile.vulnerableMoods) {
      final moodType = MoodType.values.firstWhere(
        (m) => m.name == mood,
        orElse: () => MoodType.neutral,
      );
      recommendations.add(moodType.spendingAdvice);
    }

    if (profile.primaryTriggerTime != null) {
      recommendations.add(
        'Be extra mindful during ${profile.primaryTriggerTime} - this is your high-risk time.',
      );
    }

    if (profile.primaryTriggerCategory != null) {
      recommendations.add(
        'Set a specific budget for ${profile.primaryTriggerCategory} to control emotional spending.',
      );
    }

    recommendations.add('Try journaling your feelings instead of shopping when stressed.');

    return recommendations.take(5).toList();
  }

  EmotionalSpendingAnalysis _createEmptyAnalysis(String userId) {
    return EmotionalSpendingAnalysis(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      analysisDate: DateTime.now(),
      profile: EmotionalSpendingProfile(
        dominantMood: MoodType.neutral,
        emotionalSpendingScore: 0,
        moodSpendingMap: {},
        moodFrequencyMap: {},
      ),
      patterns: [],
      triggers: [],
      recommendations: [
        'Start tracking your mood with purchases to get insights.',
        'Use the mood selector when logging transactions.',
      ],
      createdAt: DateTime.now(),
    );
  }

  Future<void> _saveAnalysis(EmotionalSpendingAnalysis analysis) async {
    await _analysisCollection.doc(analysis.id).set({
      ...analysis.toJson(),
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
