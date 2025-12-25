/// Local storage key constants
class StorageConstants {
  StorageConstants._();

  // Prefix for all keys
  static const String _prefix = 'budgetbot_';

  // Auth Keys
  static const String accessToken = '${_prefix}access_token';
  static const String refreshToken = '${_prefix}refresh_token';
  static const String userId = '${_prefix}user_id';
  static const String isLoggedIn = '${_prefix}is_logged_in';
  static const String tokenExpiry = '${_prefix}token_expiry';

  // User Preferences
  static const String theme = '${_prefix}theme';
  static const String locale = '${_prefix}locale';
  static const String currency = '${_prefix}currency';
  static const String notificationsEnabled = '${_prefix}notifications_enabled';
  static const String biometricEnabled = '${_prefix}biometric_enabled';
  static const String hapticFeedback = '${_prefix}haptic_feedback';

  // Onboarding
  static const String onboardingComplete = '${_prefix}onboarding_complete';
  static const String onboardingStep = '${_prefix}onboarding_step';
  static const String hasSeenTour = '${_prefix}has_seen_tour';
  static const String firstLaunch = '${_prefix}first_launch';

  // Cache Keys
  static const String cachedUser = '${_prefix}cached_user';
  static const String cachedAccounts = '${_prefix}cached_accounts';
  static const String cachedBudgets = '${_prefix}cached_budgets';
  static const String cachedTransactions = '${_prefix}cached_transactions';
  static const String cachedInsights = '${_prefix}cached_insights';
  static const String cachedSpendingDna = '${_prefix}cached_spending_dna';

  // Sync State
  static const String lastSyncTime = '${_prefix}last_sync_time';
  static const String lastTransactionSync = '${_prefix}last_transaction_sync';
  static const String lastBalanceSync = '${_prefix}last_balance_sync';
  static const String pendingSyncQueue = '${_prefix}pending_sync_queue';

  // Gamification
  static const String currentLevel = '${_prefix}current_level';
  static const String totalPoints = '${_prefix}total_points';
  static const String currentStreak = '${_prefix}current_streak';
  static const String longestStreak = '${_prefix}longest_streak';
  static const String lastTaskCompletedDate = '${_prefix}last_task_date';
  static const String earnedBadges = '${_prefix}earned_badges';

  // Emotional AI
  static const String emotionalAiEnabled = '${_prefix}emotional_ai_enabled';
  static const String lastMoodEntry = '${_prefix}last_mood_entry';
  static const String healthDataPermission = '${_prefix}health_data_permission';

  // Feature Flags
  static const String digitalTwinEnabled = '${_prefix}digital_twin_enabled';
  static const String carbonTrackingEnabled = '${_prefix}carbon_tracking_enabled';
  static const String familyModeEnabled = '${_prefix}family_mode_enabled';
  static const String negotiatorEnabled = '${_prefix}negotiator_enabled';

  // Device
  static const String deviceId = '${_prefix}device_id';
  static const String fcmToken = '${_prefix}fcm_token';
  static const String installDate = '${_prefix}install_date';

  // Privacy
  static const String analyticsEnabled = '${_prefix}analytics_enabled';
  static const String crashReportingEnabled = '${_prefix}crash_reporting_enabled';
  static const String personalizedAdsEnabled = '${_prefix}personalized_ads_enabled';

  // Temporary/Session
  static const String tempTransactionDraft = '${_prefix}temp_transaction_draft';
  static const String tempBudgetDraft = '${_prefix}temp_budget_draft';
  static const String lastViewedScreen = '${_prefix}last_viewed_screen';
}
