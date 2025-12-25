import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Environment configuration for accessing API keys and app settings.
///
/// Usage:
/// ```dart
/// // In main.dart, before runApp():
/// await EnvConfig.load();
///
/// // Then access anywhere:
/// final plaidClientId = EnvConfig.plaidClientId;
/// ```
class EnvConfig {
  EnvConfig._();

  /// Load environment variables from .env file
  static Future<void> load() async {
    await dotenv.load(fileName: '.env');
  }

  /// Check if environment is loaded
  static bool get isLoaded => dotenv.isEveryDefined([
    'PLAID_CLIENT_ID',
    'PLAID_SECRET',
  ]);

  // ===== PLAID CONFIGURATION =====

  /// Plaid Client ID
  static String get plaidClientId =>
      dotenv.env['PLAID_CLIENT_ID'] ?? '';

  /// Plaid Secret
  static String get plaidSecret =>
      dotenv.env['PLAID_SECRET'] ?? '';

  /// Plaid Environment (sandbox, development, production)
  static String get plaidEnv =>
      dotenv.env['PLAID_ENV'] ?? 'sandbox';

  /// Plaid Products (comma-separated)
  static List<String> get plaidProducts =>
      (dotenv.env['PLAID_PRODUCTS'] ?? 'transactions').split(',');

  /// Plaid Country Codes (comma-separated)
  static List<String> get plaidCountryCodes =>
      (dotenv.env['PLAID_COUNTRY_CODES'] ?? 'US').split(',');

  /// Check if Plaid is configured
  static bool get isPlaidConfigured =>
      plaidClientId.isNotEmpty &&
      plaidClientId != 'your_plaid_client_id_here' &&
      plaidSecret.isNotEmpty &&
      plaidSecret != 'your_plaid_secret_here';

  // ===== OPENROUTER AI CONFIGURATION =====

  /// OpenRouter API Key
  static String get openRouterApiKey =>
      dotenv.env['OPENROUTER_API_KEY'] ?? '';

  /// OpenRouter Model (default: openai/gpt-3.5-turbo)
  static String get openRouterModel =>
      dotenv.env['OPENROUTER_MODEL'] ?? 'openai/gpt-3.5-turbo';

  /// OpenRouter Base URL
  static String get openRouterBaseUrl =>
      dotenv.env['OPENROUTER_BASE_URL'] ?? 'https://openrouter.ai/api/v1';

  /// Check if OpenRouter is configured
  static bool get isOpenRouterConfigured =>
      openRouterApiKey.isNotEmpty &&
      openRouterApiKey != 'your_openrouter_api_key_here';

  // Legacy OpenAI compatibility aliases
  static String get openAIApiKey => openRouterApiKey;
  static String get openAIModel => openRouterModel;
  static bool get isOpenAIConfigured => isOpenRouterConfigured;
  static String get aiBaseUrl => openRouterBaseUrl;

  // ===== APP CONFIGURATION =====

  /// App Environment (development, staging, production)
  static String get appEnv =>
      dotenv.env['APP_ENV'] ?? 'development';

  /// Is development environment
  static bool get isDevelopment => appEnv == 'development';

  /// Is production environment
  static bool get isProduction => appEnv == 'production';

  /// Debug mode enabled
  static bool get debugMode =>
      dotenv.env['DEBUG_MODE']?.toLowerCase() == 'true';

  /// Background sync interval in hours
  static int get syncIntervalHours =>
      int.tryParse(dotenv.env['SYNC_INTERVAL_HOURS'] ?? '4') ?? 4;

  /// Historical import months
  static int get historicalImportMonths =>
      int.tryParse(dotenv.env['HISTORICAL_IMPORT_MONTHS'] ?? '24') ?? 24;

  // ===== HELPER METHODS =====

  /// Get a summary of configuration status (for debugging)
  static Map<String, bool> get configStatus => {
    'plaid': isPlaidConfigured,
    'openrouter': isOpenRouterConfigured,
    'debug': debugMode,
  };

  /// Print configuration status (for debugging)
  static void printStatus() {
    print('=== EnvConfig Status ===');
    print('App Environment: $appEnv');
    print('Plaid Configured: $isPlaidConfigured');
    print('Plaid Environment: $plaidEnv');
    print('OpenRouter Configured: $isOpenRouterConfigured');
    print('OpenRouter Model: $openRouterModel');
    print('Debug Mode: $debugMode');
    print('Sync Interval: ${syncIntervalHours}h');
    print('========================');
  }
}

/// Exception thrown when required environment variables are missing
class EnvConfigException implements Exception {
  final String message;
  EnvConfigException(this.message);

  @override
  String toString() => 'EnvConfigException: $message';
}
