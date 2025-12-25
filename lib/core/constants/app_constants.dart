/// Application-wide constants
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'BudgetBot';
  static const String appTagline = 'Your AI-Powered Finance Assistant';
  static const String appVersion = '1.0.0';
  static const int appBuildNumber = 1;

  // Support
  static const String supportEmail = 'support@budgetbot.app';
  static const String websiteUrl = 'https://budgetbot.app';
  static const String privacyPolicyUrl = 'https://budgetbot.app/privacy';
  static const String termsOfServiceUrl = 'https://budgetbot.app/terms';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  static const int transactionsPageSize = 50;

  // Cache Duration
  static const Duration cacheShortDuration = Duration(minutes: 5);
  static const Duration cacheMediumDuration = Duration(minutes: 30);
  static const Duration cacheLongDuration = Duration(hours: 24);

  // Sync Intervals
  static const Duration transactionSyncInterval = Duration(hours: 4);
  static const Duration balanceSyncInterval = Duration(hours: 1);
  static const Duration insightRefreshInterval = Duration(hours: 6);

  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration connectionTimeout = Duration(seconds: 15);
  static const Duration uploadTimeout = Duration(minutes: 2);

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const int minUsernameLength = 3;
  static const int maxUsernameLength = 30;
  static const int maxNoteLength = 500;
  static const int maxCategoryNameLength = 50;

  // Budget Defaults
  static const double defaultBudgetAlertThreshold = 0.75; // 75%
  static const double budgetWarningThreshold = 0.90; // 90%
  static const double budgetExceededThreshold = 1.0; // 100%
  static const List<double> budgetAlertThresholds = [0.50, 0.75, 0.90, 1.0];

  // Cashflow Prediction
  static const int cashflowPredictionDays = 30;
  static const double healthyBufferAmount = 500.0;
  static const double warningBufferAmount = 200.0;
  static const double criticalBufferAmount = 100.0;

  // Subscription Decay
  static const int subscriptionDecayDaysThreshold = 30;
  static const double decayScoreAbandoned = 76.0;
  static const double decayScoreDormant = 51.0;
  static const double decayScoreDeclining = 26.0;

  // Gamification
  static const int pointsPerLevel = 500;
  static const int maxDailyTasks = 5;
  static const int streakBonusPoints = 50;
  static const int weeklyStreakBonus = 100;
  static const int monthlyStreakBonus = 500;

  // Emotional AI
  static const int highStressThreshold = 70;
  static const int spendingRiskThreshold = 6;
  static const Duration emotionalCooldownPeriod = Duration(hours: 2);

  // Carbon Footprint
  static const double carbonOffsetPricePerKg = 0.01; // USD per kg CO2
  static const double averageMonthlyCarbon = 1200.0; // kg CO2

  // Family
  static const int maxFamilyMembers = 6;
  static const int minAllowanceAge = 8;
  static const int teenAgeThreshold = 13;
  static const int adultAgeThreshold = 18;

  // Investment
  static const double defaultExpectedReturn = 0.07; // 7%
  static const double inflationRate = 0.025; // 2.5%
  static const double lifestyleCreepRate = 0.01; // 1%

  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 150);
  static const Duration animationNormal = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // Date Formats
  static const String dateFormatShort = 'MMM d';
  static const String dateFormatMedium = 'MMM d, yyyy';
  static const String dateFormatLong = 'MMMM d, yyyy';
  static const String dateFormatFull = 'EEEE, MMMM d, yyyy';
  static const String timeFormat = 'h:mm a';
  static const String dateTimeFormat = 'MMM d, yyyy h:mm a';

  // Currency
  static const String defaultCurrency = 'USD';
  static const String defaultCurrencySymbol = '\$';
  static const int currencyDecimalPlaces = 2;

  // Receipt OCR
  static const int maxReceiptImageSize = 5 * 1024 * 1024; // 5MB
  static const List<String> supportedImageFormats = ['jpg', 'jpeg', 'png', 'heic'];
  static const double ocrConfidenceThreshold = 0.85;
}
