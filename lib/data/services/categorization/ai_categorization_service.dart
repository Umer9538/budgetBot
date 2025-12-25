import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/env_config.dart';
import '../../../core/constants/api_constants.dart';
import '../../../core/enums/enums.dart';

/// Service for AI-powered transaction categorization
class AICategoryService {
  AICategoryService({
    Dio? dio,
    String? openAiApiKey,
  })  : _dio = dio ?? Dio(),
        _openAiApiKey = openAiApiKey ?? _getInitialApiKey();

  final Dio _dio;
  String? _openAiApiKey;

  static const String _apiKeyPrefKey = 'openai_api_key';
  static const String _cachePrefix = 'category_cache_';

  /// Get initial API key from EnvConfig
  static String? _getInitialApiKey() {
    return EnvConfig.isOpenAIConfigured ? EnvConfig.openAIApiKey : null;
  }

  /// Get the configured OpenAI model
  String get _openAiModel => EnvConfig.openAIModel;

  /// Initialize the service with API key (can override EnvConfig)
  Future<void> initialize({String? apiKey}) async {
    if (apiKey != null) {
      _openAiApiKey = apiKey;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_apiKeyPrefKey, apiKey);
    } else if (_openAiApiKey == null) {
      // Try to load from SharedPreferences if not from EnvConfig
      final prefs = await SharedPreferences.getInstance();
      _openAiApiKey = prefs.getString(_apiKeyPrefKey);
    }
  }

  /// Check if service is configured
  bool get isConfigured => _openAiApiKey != null && _openAiApiKey!.isNotEmpty;

  /// Categorize a single transaction using AI
  Future<CategoryType?> categorizeTransaction({
    required String merchantName,
    required double amount,
    String? plaidCategory,
    String? description,
  }) async {
    // Check cache first
    final cached = await _getCachedCategory(merchantName);
    if (cached != null) return cached;

    // Try AI categorization
    if (isConfigured) {
      try {
        final category = await _categorizeWithOpenAI(
          merchantName: merchantName,
          amount: amount,
          plaidCategory: plaidCategory,
          description: description,
        );

        if (category != null) {
          // Cache the result
          await _cacheCategory(merchantName, category);
          return category;
        }
      } catch (e) {
        debugPrint('AI categorization error: $e');
      }
    }

    // Fallback to rule-based categorization
    final ruleBased = _ruleBasedCategorization(merchantName, plaidCategory);
    await _cacheCategory(merchantName, ruleBased);
    return ruleBased;
  }

  /// Categorize multiple transactions in batch
  Future<Map<String, CategoryType>> categorizeBatch(
    List<TransactionCategorizationInput> transactions,
  ) async {
    final results = <String, CategoryType>{};
    final uncached = <TransactionCategorizationInput>[];

    // Check cache for each transaction
    for (final tx in transactions) {
      final cached = await _getCachedCategory(tx.merchantName);
      if (cached != null) {
        results[tx.id] = cached;
      } else {
        uncached.add(tx);
      }
    }

    // Batch categorize uncached transactions
    if (uncached.isNotEmpty && isConfigured) {
      try {
        final batchResults = await _batchCategorizeWithOpenAI(uncached);
        results.addAll(batchResults);

        // Cache results
        for (final entry in batchResults.entries) {
          final tx = uncached.firstWhere((t) => t.id == entry.key);
          await _cacheCategory(tx.merchantName, entry.value);
        }
      } catch (e) {
        debugPrint('Batch categorization error: $e');
        // Fallback to rule-based for each
        for (final tx in uncached) {
          final category = _ruleBasedCategorization(tx.merchantName, tx.plaidCategory);
          results[tx.id] = category;
          await _cacheCategory(tx.merchantName, category);
        }
      }
    } else {
      // Fallback for uncached when AI is not available
      for (final tx in uncached) {
        final category = _ruleBasedCategorization(tx.merchantName, tx.plaidCategory);
        results[tx.id] = category;
      }
    }

    return results;
  }

  /// Categorize using OpenAI GPT
  Future<CategoryType?> _categorizeWithOpenAI({
    required String merchantName,
    required double amount,
    String? plaidCategory,
    String? description,
  }) async {
    final categories = CategoryType.values.map((c) => c.name).join(', ');

    final prompt = '''
Categorize this financial transaction into exactly ONE category.

Transaction details:
- Merchant: $merchantName
- Amount: \$${amount.toStringAsFixed(2)}
${plaidCategory != null ? '- Bank category hint: $plaidCategory' : ''}
${description != null ? '- Description: $description' : ''}

Available categories: $categories

Respond with ONLY the category name, nothing else.
''';

    try {
      final response = await _dio.post(
        '${ApiConstants.openAiBaseUrl}/chat/completions',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_openAiApiKey',
            'Content-Type': 'application/json',
          },
        ),
        data: jsonEncode({
          'model': _openAiModel,
          'messages': [
            {
              'role': 'system',
              'content': 'You are a financial transaction categorization expert. '
                  'Respond with only the exact category name from the provided list.',
            },
            {'role': 'user', 'content': prompt},
          ],
          'max_tokens': 50,
          'temperature': 0.1,
        }),
      );

      if (response.statusCode == 200) {
        final content = response.data['choices'][0]['message']['content'] as String;
        final categoryName = content.trim().toLowerCase();

        // Find matching category
        for (final category in CategoryType.values) {
          if (category.name.toLowerCase() == categoryName) {
            return category;
          }
        }
      }
    } catch (e) {
      debugPrint('OpenAI API error: $e');
    }

    return null;
  }

  /// Batch categorize using OpenAI
  Future<Map<String, CategoryType>> _batchCategorizeWithOpenAI(
    List<TransactionCategorizationInput> transactions,
  ) async {
    final results = <String, CategoryType>{};
    final categories = CategoryType.values.map((c) => c.name).join(', ');

    // Build batch prompt
    final transactionList = transactions
        .asMap()
        .entries
        .map((e) => '${e.key + 1}. ${e.value.merchantName} - \$${e.value.amount.toStringAsFixed(2)}')
        .join('\n');

    final prompt = '''
Categorize each of these financial transactions.

Transactions:
$transactionList

Available categories: $categories

Respond with the number and category for each, one per line:
1. category_name
2. category_name
etc.
''';

    try {
      final response = await _dio.post(
        '${ApiConstants.openAiBaseUrl}/chat/completions',
        options: Options(
          headers: {
            'Authorization': 'Bearer $_openAiApiKey',
            'Content-Type': 'application/json',
          },
        ),
        data: jsonEncode({
          'model': _openAiModel,
          'messages': [
            {
              'role': 'system',
              'content': 'You are a financial transaction categorization expert. '
                  'Categorize each transaction with the exact category name from the list.',
            },
            {'role': 'user', 'content': prompt},
          ],
          'max_tokens': 500,
          'temperature': 0.1,
        }),
      );

      if (response.statusCode == 200) {
        final content = response.data['choices'][0]['message']['content'] as String;
        final lines = content.split('\n');

        for (final line in lines) {
          final match = RegExp(r'(\d+)\.\s*(\w+)').firstMatch(line);
          if (match != null) {
            final index = int.tryParse(match.group(1) ?? '');
            final categoryName = match.group(2)?.toLowerCase();

            if (index != null &&
                index > 0 &&
                index <= transactions.length &&
                categoryName != null) {
              for (final category in CategoryType.values) {
                if (category.name.toLowerCase() == categoryName) {
                  results[transactions[index - 1].id] = category;
                  break;
                }
              }
            }
          }
        }
      }
    } catch (e) {
      debugPrint('OpenAI batch API error: $e');
    }

    // Fill in any missing with rule-based
    for (final tx in transactions) {
      if (!results.containsKey(tx.id)) {
        results[tx.id] = _ruleBasedCategorization(tx.merchantName, tx.plaidCategory);
      }
    }

    return results;
  }

  /// Rule-based categorization fallback
  CategoryType _ruleBasedCategorization(String merchantName, String? plaidCategory) {
    final lower = merchantName.toLowerCase();

    // Food & Dining patterns
    if (_matchesAny(lower, ['mcdonald', 'burger king', 'wendy', 'taco bell', 'chipotle',
        'subway', 'pizza hut', 'domino', 'kfc', 'chick-fil-a'])) {
      return CategoryType.restaurants;
    }
    if (_matchesAny(lower, ['starbucks', 'dunkin', 'peet', 'coffee'])) {
      return CategoryType.coffeeShops;
    }
    if (_matchesAny(lower, ['walmart', 'target', 'costco', 'kroger', 'safeway',
        'whole foods', 'trader joe', 'publix', 'grocery', 'supermarket'])) {
      return CategoryType.groceries;
    }
    if (_matchesAny(lower, ['doordash', 'uber eats', 'grubhub', 'postmates', 'instacart'])) {
      return CategoryType.foodDelivery;
    }

    // Transportation patterns
    if (_matchesAny(lower, ['shell', 'chevron', 'exxon', 'mobil', 'bp', 'gas', 'fuel', 'petroleum'])) {
      return CategoryType.fuel;
    }
    if (_matchesAny(lower, ['uber', 'lyft', 'taxi', 'cab'])) {
      return CategoryType.rideShare;
    }
    if (_matchesAny(lower, ['mta', 'metro', 'bart', 'transit', 'subway'])) {
      return CategoryType.publicTransit;
    }

    // Shopping patterns
    if (_matchesAny(lower, ['amazon', 'ebay', 'etsy', 'alibaba'])) {
      return CategoryType.onlineShopping;
    }
    if (_matchesAny(lower, ['nike', 'adidas', 'h&m', 'zara', 'gap', 'old navy',
        'nordstrom', 'macy', 'jcpenney', 'clothing', 'apparel'])) {
      return CategoryType.clothing;
    }
    if (_matchesAny(lower, ['apple', 'best buy', 'microsoft', 'electronics'])) {
      return CategoryType.electronics;
    }
    if (_matchesAny(lower, ['ikea', 'home depot', 'lowe', 'bed bath', 'wayfair'])) {
      return CategoryType.homeGoods;
    }

    // Entertainment patterns
    if (_matchesAny(lower, ['netflix', 'hulu', 'disney+', 'hbo', 'spotify', 'apple music',
        'amazon prime', 'youtube', 'streaming'])) {
      return CategoryType.streamingServices;
    }
    if (_matchesAny(lower, ['steam', 'playstation', 'xbox', 'nintendo', 'gaming'])) {
      return CategoryType.gaming;
    }
    if (_matchesAny(lower, ['ticketmaster', 'stubhub', 'eventbrite', 'concert', 'theater'])) {
      return CategoryType.eventsAndConcerts;
    }

    // Health patterns
    if (_matchesAny(lower, ['cvs', 'walgreens', 'rite aid', 'pharmacy'])) {
      return CategoryType.pharmacy;
    }
    if (_matchesAny(lower, ['planet fitness', 'la fitness', 'equinox', 'gym', 'ymca'])) {
      return CategoryType.fitness;
    }
    if (_matchesAny(lower, ['hospital', 'clinic', 'doctor', 'medical', 'health', 'dental'])) {
      return CategoryType.medical;
    }
    if (_matchesAny(lower, ['therapy', 'counseling', 'mental health', 'betterhelp', 'talkspace'])) {
      return CategoryType.mentalHealth;
    }

    // Housing patterns
    if (_matchesAny(lower, ['rent', 'mortgage', 'apartment', 'lease'])) {
      return CategoryType.rentMortgage;
    }
    if (_matchesAny(lower, ['electric', 'gas bill', 'water', 'utility', 'pge', 'con edison'])) {
      return CategoryType.utilities;
    }

    // Financial patterns
    if (_matchesAny(lower, ['insurance', 'geico', 'state farm', 'allstate', 'progressive'])) {
      return CategoryType.insurance;
    }
    if (_matchesAny(lower, ['atm', 'bank fee', 'overdraft', 'service charge'])) {
      return CategoryType.fees;
    }
    if (_matchesAny(lower, ['irs', 'tax', 'turbotax'])) {
      return CategoryType.taxes;
    }
    if (_matchesAny(lower, ['vanguard', 'fidelity', 'schwab', 'investment', '401k', 'ira'])) {
      return CategoryType.investmentContributions;
    }

    // Income patterns
    if (_matchesAny(lower, ['payroll', 'salary', 'direct deposit', 'paychex', 'adp'])) {
      return CategoryType.salary;
    }
    if (_matchesAny(lower, ['venmo', 'zelle', 'paypal', 'cash app']) && lower.contains('from')) {
      return CategoryType.otherIncome;
    }
    if (_matchesAny(lower, ['freelance', 'upwork', 'fiverr', 'consulting'])) {
      return CategoryType.freelance;
    }

    // Other patterns
    if (_matchesAny(lower, ['charity', 'donation', 'nonprofit', 'red cross'])) {
      return CategoryType.charity;
    }
    if (_matchesAny(lower, ['gift', 'present'])) {
      return CategoryType.gifts;
    }
    if (_matchesAny(lower, ['school', 'university', 'college', 'tuition', 'course', 'udemy', 'coursera'])) {
      return CategoryType.education;
    }

    // Use Plaid category as hint
    if (plaidCategory != null) {
      return _mapPlaidCategory(plaidCategory);
    }

    return CategoryType.miscellaneous;
  }

  /// Check if string matches any patterns
  bool _matchesAny(String text, List<String> patterns) {
    return patterns.any((pattern) => text.contains(pattern));
  }

  /// Map Plaid category to our CategoryType
  CategoryType _mapPlaidCategory(String plaidCategory) {
    final lower = plaidCategory.toLowerCase();

    if (lower.contains('food') || lower.contains('restaurant')) {
      return CategoryType.restaurants;
    }
    if (lower.contains('grocery')) return CategoryType.groceries;
    if (lower.contains('coffee')) return CategoryType.coffeeShops;
    if (lower.contains('gas') || lower.contains('fuel')) return CategoryType.fuel;
    if (lower.contains('transport')) return CategoryType.publicTransit;
    if (lower.contains('shopping')) return CategoryType.onlineShopping;
    if (lower.contains('entertain')) return CategoryType.streamingServices;
    if (lower.contains('health') || lower.contains('medical')) return CategoryType.medical;
    if (lower.contains('rent') || lower.contains('mortgage')) return CategoryType.rentMortgage;
    if (lower.contains('utility')) return CategoryType.utilities;
    if (lower.contains('insurance')) return CategoryType.insurance;
    if (lower.contains('payroll') || lower.contains('salary')) return CategoryType.salary;

    return CategoryType.miscellaneous;
  }

  /// Get cached category for a merchant
  Future<CategoryType?> _getCachedCategory(String merchantName) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '$_cachePrefix${merchantName.toLowerCase().replaceAll(' ', '_')}';
    final cached = prefs.getString(key);

    if (cached != null) {
      try {
        return CategoryType.values.firstWhere((c) => c.name == cached);
      } catch (_) {}
    }
    return null;
  }

  /// Cache a category for a merchant
  Future<void> _cacheCategory(String merchantName, CategoryType category) async {
    final prefs = await SharedPreferences.getInstance();
    final key = '$_cachePrefix${merchantName.toLowerCase().replaceAll(' ', '_')}';
    await prefs.setString(key, category.name);
  }

  /// Clear category cache
  Future<void> clearCache() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys().where((k) => k.startsWith(_cachePrefix));
    for (final key in keys) {
      await prefs.remove(key);
    }
  }

  /// Train on user corrections to improve future categorization
  Future<void> learnFromCorrection({
    required String merchantName,
    required CategoryType correctedCategory,
  }) async {
    // Cache the user's correction
    await _cacheCategory(merchantName, correctedCategory);

    // In a production app, you might also:
    // 1. Send this to your backend for model improvement
    // 2. Store in Firestore for personalized rules
    // 3. Fine-tune a custom model
  }
}

/// Input for transaction categorization
class TransactionCategorizationInput {
  const TransactionCategorizationInput({
    required this.id,
    required this.merchantName,
    required this.amount,
    this.plaidCategory,
    this.description,
  });

  final String id;
  final String merchantName;
  final double amount;
  final String? plaidCategory;
  final String? description;
}

/// Provider for AI categorization service
final aiCategoryServiceProvider = Provider<AICategoryService>((ref) {
  return AICategoryService();
});
