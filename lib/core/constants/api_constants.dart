/// API-related constants
class ApiConstants {
  ApiConstants._();

  // Base URLs
  static const String baseUrl = 'https://api.budgetbot.app';
  static const String stagingBaseUrl = 'https://staging-api.budgetbot.app';
  static const String devBaseUrl = 'http://localhost:3000';

  // API Version
  static const String apiVersion = 'v1';
  static const String apiPrefix = '/api/$apiVersion';

  // Firebase
  static const String firebaseProjectId = 'budgetbot-app';

  // External APIs
  static const String plaidBaseUrl = 'https://production.plaid.com';
  static const String plaidSandboxUrl = 'https://sandbox.plaid.com';
  static const String alpacaBaseUrl = 'https://api.alpaca.markets';
  static const String alpacaPaperUrl = 'https://paper-api.alpaca.markets';
  static const String openRouterBaseUrl = 'https://openrouter.ai/api/v1';
  // Legacy alias for compatibility
  static const String openAiBaseUrl = openRouterBaseUrl;
  static const String huggingFaceBaseUrl = 'https://api-inference.huggingface.co';

  // Auth Endpoints
  static const String authEndpoint = '/auth';
  static const String registerEndpoint = '$authEndpoint/register';
  static const String loginEndpoint = '$authEndpoint/login';
  static const String logoutEndpoint = '$authEndpoint/logout';
  static const String refreshTokenEndpoint = '$authEndpoint/refresh-token';
  static const String forgotPasswordEndpoint = '$authEndpoint/forgot-password';
  static const String resetPasswordEndpoint = '$authEndpoint/reset-password';
  static const String verifyEmailEndpoint = '$authEndpoint/verify-email';

  // User Endpoints
  static const String usersEndpoint = '/users';
  static const String userProfileEndpoint = '$usersEndpoint/profile';
  static const String userPreferencesEndpoint = '$usersEndpoint/preferences';
  static const String userDeleteEndpoint = '$usersEndpoint/delete';

  // Account Endpoints
  static const String accountsEndpoint = '/accounts';
  static const String linkAccountEndpoint = '$accountsEndpoint/link';
  static const String syncAccountsEndpoint = '$accountsEndpoint/sync';
  static const String unlinkAccountEndpoint = '$accountsEndpoint/unlink';

  // Transaction Endpoints
  static const String transactionsEndpoint = '/transactions';
  static const String categorizeEndpoint = '$transactionsEndpoint/categorize';
  static const String searchTransactionsEndpoint = '$transactionsEndpoint/search';
  static const String recurringTransactionsEndpoint = '$transactionsEndpoint/recurring';

  // Budget Endpoints
  static const String budgetsEndpoint = '/budgets';
  static const String budgetProgressEndpoint = '$budgetsEndpoint/progress';
  static const String budgetSuggestionsEndpoint = '$budgetsEndpoint/suggestions';

  // Insights Endpoints
  static const String insightsEndpoint = '/insights';
  static const String spendingPatternsEndpoint = '$insightsEndpoint/spending-patterns';
  static const String savingsRecommendationsEndpoint = '$insightsEndpoint/savings';
  static const String anomaliesEndpoint = '$insightsEndpoint/anomalies';

  // Investment Endpoints
  static const String investmentsEndpoint = '/investments';
  static const String riskProfileEndpoint = '$investmentsEndpoint/risk-profile';
  static const String portfolioEndpoint = '$investmentsEndpoint/portfolio';
  static const String recommendationsEndpoint = '$investmentsEndpoint/recommendations';

  // Emotional AI Endpoints
  static const String emotionalEndpoint = '/emotional';
  static const String moodEndpoint = '$emotionalEndpoint/mood';
  static const String correlationsEndpoint = '$emotionalEndpoint/correlations';
  static const String interventionsEndpoint = '$emotionalEndpoint/interventions';

  // Digital Twin Endpoints
  static const String digitalTwinEndpoint = '/digital-twin';
  static const String projectionEndpoint = '$digitalTwinEndpoint/projection';
  static const String scenarioEndpoint = '$digitalTwinEndpoint/scenario';
  static const String goalsEndpoint = '$digitalTwinEndpoint/goals';

  // Bill Negotiator Endpoints
  static const String negotiatorEndpoint = '/negotiator';
  static const String opportunitiesEndpoint = '$negotiatorEndpoint/opportunities';
  static const String negotiateEndpoint = '$negotiatorEndpoint/negotiate';

  // Spending DNA Endpoints
  static const String spendingDnaEndpoint = '/spending-dna';
  static const String personalityEndpoint = '$spendingDnaEndpoint/personality';
  static const String fingerprintEndpoint = '$spendingDnaEndpoint/fingerprint';

  // Cashflow Endpoints
  static const String cashflowEndpoint = '/cashflow';
  static const String predictionEndpoint = '$cashflowEndpoint/prediction';
  static const String alertsEndpoint = '$cashflowEndpoint/alerts';

  // Carbon Endpoints
  static const String carbonEndpoint = '/carbon';
  static const String footprintEndpoint = '$carbonEndpoint/footprint';
  static const String alternativesEndpoint = '$carbonEndpoint/alternatives';
  static const String offsetEndpoint = '$carbonEndpoint/offset';

  // Family Endpoints
  static const String familyEndpoint = '/family';
  static const String inviteEndpoint = '$familyEndpoint/invite';
  static const String membersEndpoint = '$familyEndpoint/members';
  static const String sharedGoalsEndpoint = '$familyEndpoint/goals';

  // Tasks Endpoints
  static const String tasksEndpoint = '/tasks';
  static const String dailyTasksEndpoint = '$tasksEndpoint/daily';
  static const String completeTaskEndpoint = '$tasksEndpoint/complete';
  static const String streaksEndpoint = '$tasksEndpoint/streaks';
  static const String rewardsEndpoint = '$tasksEndpoint/rewards';

  // Subscriptions Endpoints
  static const String subscriptionsEndpoint = '/subscriptions';
  static const String decayEndpoint = '$subscriptionsEndpoint/decay';
  static const String cancelEndpoint = '$subscriptionsEndpoint/cancel';
  static const String pauseEndpoint = '$subscriptionsEndpoint/pause';

  // Local Intelligence Endpoints
  static const String localEndpoint = '/local';
  static const String pricesEndpoint = '$localEndpoint/prices';
  static const String dealsEndpoint = '$localEndpoint/deals';
  static const String gasPricesEndpoint = '$localEndpoint/gas';

  // HTTP Headers
  static const String contentTypeHeader = 'Content-Type';
  static const String authorizationHeader = 'Authorization';
  static const String acceptHeader = 'Accept';
  static const String userAgentHeader = 'User-Agent';
  static const String apiKeyHeader = 'X-API-Key';
  static const String deviceIdHeader = 'X-Device-Id';
  static const String platformHeader = 'X-Platform';
  static const String versionHeader = 'X-App-Version';

  // Content Types
  static const String jsonContentType = 'application/json';
  static const String formDataContentType = 'multipart/form-data';

  // Rate Limiting
  static const int maxRequestsPerMinute = 100;
  static const int maxRequestsPerHour = 1000;
}
