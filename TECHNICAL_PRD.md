# BudgetBot - Technical Product Requirements Document

**Version:** 1.0
**Last Updated:** December 2025
**Status:** Development

---

## Table of Contents

1. [Executive Summary](#1-executive-summary)
2. [System Architecture](#2-system-architecture)
3. [Technology Stack](#3-technology-stack)
4. [Project Structure](#4-project-structure)
5. [Data Models](#5-data-models)
6. [Services Layer](#6-services-layer)
7. [API Integrations](#7-api-integrations)
8. [State Management](#8-state-management)
9. [Authentication & Security](#9-authentication--security)
10. [Feature Specifications](#10-feature-specifications)
11. [Database Schema](#11-database-schema)
12. [Environment Configuration](#12-environment-configuration)
13. [Build & Deployment](#13-build--deployment)

---

## 1. Executive Summary

### 1.1 Product Overview

BudgetBot is an AI-powered personal finance assistant built with Flutter that combines traditional money management with cutting-edge AI capabilities. The app predicts financial futures, understands emotional spending patterns, and actively works to improve users' financial health.

### 1.2 Key Differentiators

| Feature | Description |
|---------|-------------|
| Predictive AI | Forecasts financial crises before they happen |
| Emotional Intelligence | Understands the "why" behind spending |
| Autonomous Agents | Negotiates bills and optimizes finances |
| Family-Aware Planning | Cross-generational financial coordination |
| Gamified Micro-Actions | Sustainable habit building |

### 1.3 Target Platforms

- Android (API 21+)
- iOS (12.0+)

---

## 2. System Architecture

### 2.1 Architecture Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                      PRESENTATION LAYER                         │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────────┐ │
│  │   Views     │  │  ViewModels │  │   Common Widgets        │ │
│  │  (Screens)  │  │  (Riverpod) │  │   (Reusable UI)         │ │
│  └─────────────┘  └─────────────┘  └─────────────────────────┘ │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                        DATA LAYER                                │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────────┐ │
│  │ Repositories│  │   Services  │  │       Models            │ │
│  │             │  │             │  │     (Freezed)           │ │
│  └─────────────┘  └─────────────┘  └─────────────────────────┘ │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                      EXTERNAL SERVICES                           │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌────────────────┐  │
│  │ Firebase │  │  Plaid   │  │ OpenAI   │  │  Local Storage │  │
│  │          │  │   API    │  │   API    │  │  (Hive/Prefs)  │  │
│  └──────────┘  └──────────┘  └──────────┘  └────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

### 2.2 Design Patterns

| Pattern | Usage |
|---------|-------|
| MVVM | Separation of UI and business logic |
| Repository | Abstraction layer for data sources |
| Provider/Riverpod | Dependency injection and state management |
| Freezed | Immutable data classes with union types |

---

## 3. Technology Stack

### 3.1 Core Framework

| Component | Technology | Version |
|-----------|------------|---------|
| Framework | Flutter | 3.x |
| Language | Dart | 3.9.0+ |
| State Management | Riverpod | 2.6.1 |
| Routing | GoRouter | 14.6.2 |

### 3.2 Backend Services (Firebase)

| Service | Package | Purpose |
|---------|---------|---------|
| Authentication | firebase_auth: 5.3.4 | User authentication |
| Database | cloud_firestore: 5.6.0 | Real-time NoSQL database |
| Storage | firebase_storage: 12.4.0 | File/image storage |
| Core | firebase_core: 3.8.1 | Firebase initialization |

### 3.3 External APIs

| API | Package | Purpose |
|-----|---------|---------|
| Plaid | plaid_flutter: 3.1.5 | Bank account linking |
| OpenAI | dart_openai: 5.1.0 | AI insights generation |
| HTTP | dio: 5.7.0 | Network requests |

### 3.4 Local Storage

| Storage | Package | Purpose |
|---------|---------|---------|
| Hive | hive_flutter: 1.1.0 | Local NoSQL database |
| SharedPreferences | shared_preferences: 2.3.4 | Key-value storage |

### 3.5 Code Generation

| Tool | Package | Purpose |
|------|---------|---------|
| Freezed | freezed: 2.5.7 | Immutable data classes |
| JSON Serializable | json_serializable: 6.9.0 | JSON parsing |
| Build Runner | build_runner: 2.4.13 | Code generation |

### 3.6 UI Components

| Component | Package | Purpose |
|-----------|---------|---------|
| Charts | fl_chart: 0.69.2 | Financial visualizations |
| Fonts | google_fonts: 6.3.3 | Typography |
| Images | cached_network_image: 3.4.1 | Image caching |
| Loading | shimmer: 3.0.0 | Loading placeholders |

### 3.7 Device Features

| Feature | Package | Purpose |
|---------|---------|---------|
| Biometrics | local_auth: 2.3.0 | Fingerprint/Face ID |
| Camera | image_picker: 1.1.2 | Receipt capture |
| OCR | google_mlkit_text_recognition: 0.14.0 | Receipt scanning |
| Notifications | flutter_local_notifications: 18.0.1 | Local alerts |
| Background | workmanager: 0.9.0 | Background sync |

---

## 4. Project Structure

```
lib/
├── core/                           # Core utilities and configuration
│   ├── config/                     # App configuration
│   ├── constants/                  # App constants
│   ├── enums/                      # Enumerations
│   │   └── category/               # Category enums
│   ├── router/                     # GoRouter configuration
│   ├── theme/                      # Theming system
│   │   ├── colors/                 # Color definitions
│   │   │   ├── primary_colors.dart
│   │   │   ├── semantic_colors.dart
│   │   │   ├── neutral_colors.dart
│   │   │   ├── surface_colors.dart
│   │   │   ├── category_colors.dart
│   │   │   └── gradient_colors.dart
│   │   ├── dimensions/             # Spacing and sizes
│   │   ├── typography/             # Text styles
│   │   ├── themes/                 # Theme configurations
│   │   │   ├── light_color_scheme.dart
│   │   │   ├── dark_color_scheme.dart
│   │   │   └── [component]_themes.dart
│   │   └── glass/                  # Glass morphism effects
│   └── utils/                      # Utility functions
│
├── data/                           # Data layer
│   ├── models/                     # Data models (Freezed)
│   │   ├── user_model.dart
│   │   ├── transaction_model.dart
│   │   ├── account_model.dart
│   │   ├── budget_model.dart
│   │   ├── insight_model.dart
│   │   ├── subscription_model.dart
│   │   ├── cashflow_model.dart
│   │   ├── digital_twin_model.dart
│   │   ├── emotional_spending_model.dart
│   │   ├── spending_dna_model.dart
│   │   ├── family_model.dart
│   │   ├── carbon_wallet_model.dart
│   │   ├── micro_task_model.dart
│   │   ├── investment_model.dart
│   │   ├── bill_negotiator_model.dart
│   │   └── local_intelligence_model.dart
│   │
│   ├── services/                   # Business logic services
│   │   ├── auth_service.dart
│   │   ├── transaction_service.dart
│   │   ├── account_service.dart
│   │   ├── budget_service.dart
│   │   ├── budget_suggestion_service.dart
│   │   ├── budget_alert_service.dart
│   │   ├── insight_service.dart
│   │   ├── category_service.dart
│   │   ├── notification_service.dart
│   │   ├── receipt_scanner_service.dart
│   │   ├── biometric_service.dart
│   │   ├── cashflow_prediction_service.dart
│   │   ├── digital_twin_service.dart
│   │   ├── emotional_spending_service.dart
│   │   ├── spending_dna_service.dart
│   │   ├── subscription_decay_service.dart
│   │   ├── family_service.dart
│   │   ├── carbon_wallet_service.dart
│   │   ├── micro_task_service.dart
│   │   ├── investment_service.dart
│   │   ├── bill_negotiator_service.dart
│   │   ├── local_intelligence_service.dart
│   │   ├── security_questions_service.dart
│   │   ├── dev_tools_service.dart
│   │   ├── bank_link/              # Bank linking services
│   │   │   ├── bank_link_service.dart
│   │   │   ├── plaid_provider.dart
│   │   │   └── bank_link.dart
│   │   ├── categorization/         # AI categorization
│   │   └── sync/                   # Data synchronization
│   │
│   ├── repositories/               # Data repositories
│   │   ├── user_repository.dart
│   │   ├── transaction_repository.dart
│   │   ├── budget_repository.dart
│   │   └── insight_repository.dart
│   │
│   └── providers/                  # Riverpod providers
│
├── presentation/                   # UI layer
│   ├── views/                      # Screen widgets
│   │   ├── auth/                   # Authentication screens
│   │   │   ├── login_screen.dart
│   │   │   ├── register_screen.dart
│   │   │   └── forgot_password_screen.dart
│   │   ├── home/                   # Main app screens
│   │   │   ├── home_screen.dart
│   │   │   ├── dashboard_screen.dart
│   │   │   ├── transactions_screen.dart
│   │   │   ├── add_transaction_screen.dart
│   │   │   ├── budgets_screen.dart
│   │   │   ├── add_budget_screen.dart
│   │   │   └── insights_screen.dart
│   │   └── settings/               # Settings screens
│   │       ├── settings_screen.dart
│   │       ├── profile_screen.dart
│   │       └── linked_accounts_screen.dart
│   │
│   ├── viewmodels/                 # State management
│   │   ├── auth_viewmodel.dart
│   │   ├── transactions_viewmodel.dart
│   │   ├── budgets_viewmodel.dart
│   │   ├── accounts_viewmodel.dart
│   │   └── viewmodels.dart
│   │
│   └── common/                     # Shared UI components
│       └── widgets/
│           ├── buttons/
│           ├── cards/
│           ├── text_fields/
│           └── dialogs/
│
└── main.dart                       # App entry point
```

---

## 5. Data Models

### 5.1 Core Models

#### UserModel
```dart
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    String? displayName,
    String? photoUrl,
    required DateTime createdAt,
    DateTime? lastLoginAt,
    @Default(false) bool isPremium,
    @Default('USD') String currency,
    UserPreferences? preferences,
  }) = _UserModel;
}
```

#### TransactionModel
```dart
@freezed
class TransactionModel with _$TransactionModel {
  const factory TransactionModel({
    required String id,
    required String userId,
    required double amount,
    required TransactionType type,
    required TransactionCategory category,
    required DateTime date,
    String? description,
    String? merchantName,
    String? accountId,
    String? receiptUrl,
    Map<String, dynamic>? metadata,
    @Default(false) bool isRecurring,
    @Default(DataSource.manual) DataSource source,
  }) = _TransactionModel;
}
```

#### AccountModel
```dart
@freezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    required String id,
    required String userId,
    required String institutionName,
    required AccountType type,
    required double balance,
    required String currency,
    String? institutionId,
    String? plaidAccountId,
    String? accessToken,
    DateTime? lastSynced,
    @Default(true) bool isActive,
  }) = _AccountModel;
}
```

#### BudgetModel
```dart
@freezed
class BudgetModel with _$BudgetModel {
  const factory BudgetModel({
    required String id,
    required String userId,
    required String name,
    required TransactionCategory category,
    required double limit,
    required double spent,
    required BudgetPeriod period,
    required DateTime startDate,
    DateTime? endDate,
    @Default(true) bool isActive,
    @Default(0.8) double alertThreshold,
  }) = _BudgetModel;
}
```

#### InsightModel
```dart
@freezed
class InsightModel with _$InsightModel {
  const factory InsightModel({
    required String id,
    required String userId,
    required InsightType type,
    required String title,
    required String description,
    Map<String, dynamic>? data,
    @Default(false) bool actionable,
    InsightAction? action,
    @Default(InsightPriority.medium) InsightPriority priority,
    @Default(false) bool isRead,
    @Default(false) bool isDismissed,
    required DateTime createdAt,
    DateTime? expiresAt,
  }) = _InsightModel;
}
```

### 5.2 Advanced Feature Models

| Model | Purpose |
|-------|---------|
| `SubscriptionModel` | Track recurring subscriptions |
| `CashflowModel` | Cash flow predictions |
| `DigitalTwinModel` | Financial future simulations |
| `EmotionalSpendingModel` | Emotion-spending correlations |
| `SpendingDNAModel` | Unique spending patterns |
| `FamilyModel` | Family financial coordination |
| `CarbonWalletModel` | Environmental impact tracking |
| `MicroTaskModel` | Gamified financial tasks |
| `InvestmentModel` | Investment portfolio data |
| `BillNegotiatorModel` | Bill negotiation status |
| `LocalIntelligenceModel` | Local deal/price data |

---

## 6. Services Layer

### 6.1 Core Services

| Service | Responsibility |
|---------|----------------|
| `AuthService` | User authentication (Firebase Auth) |
| `TransactionService` | CRUD operations for transactions |
| `AccountService` | Bank account management |
| `BudgetService` | Budget creation and tracking |
| `CategoryService` | Transaction categorization |
| `NotificationService` | Local push notifications |

### 6.2 AI Services

| Service | Responsibility |
|---------|----------------|
| `InsightService` | AI-generated financial insights |
| `CashflowPredictionService` | Future cash flow forecasting |
| `DigitalTwinService` | Financial scenario simulations |
| `EmotionalSpendingService` | Emotion-based spending analysis |
| `SpendingDNAService` | Behavioral pattern recognition |

### 6.3 Integration Services

| Service | Responsibility |
|---------|----------------|
| `BankLinkService` | Plaid bank connection orchestration |
| `PlaidProvider` | Plaid API communication |
| `ReceiptScannerService` | OCR receipt processing |
| `BiometricService` | Fingerprint/Face ID authentication |

### 6.4 Advanced Feature Services

| Service | Responsibility |
|---------|----------------|
| `SubscriptionDecayService` | Detect unused subscriptions |
| `BillNegotiatorService` | Automated bill negotiation |
| `FamilyService` | Family financial coordination |
| `CarbonWalletService` | Carbon footprint tracking |
| `MicroTaskService` | Daily financial challenges |
| `InvestmentService` | Portfolio management |
| `LocalIntelligenceService` | Local deal tracking |

---

## 7. API Integrations

### 7.1 Plaid API (Bank Connectivity)

**Purpose:** Secure bank account linking and transaction retrieval

**Endpoints Used:**
| Endpoint | Purpose |
|----------|---------|
| `/link/token/create` | Initialize Plaid Link |
| `/item/public_token/exchange` | Exchange public token |
| `/accounts/get` | Retrieve account data |
| `/transactions/sync` | Sync transactions |
| `/institutions/search` | Search financial institutions |

**Configuration:**
```env
PLAID_CLIENT_ID=your_client_id
PLAID_SECRET=your_secret
PLAID_ENV=sandbox|development|production
```

**Supported Features:**
- 12,000+ financial institutions
- Real-time balance updates
- Transaction categorization
- Historical data (up to 24 months)

### 7.2 OpenAI API (AI Features)

**Purpose:** Natural language insights and categorization

**Usage:**
| Feature | Model | Purpose |
|---------|-------|---------|
| Insights | GPT-4 | Generate financial insights |
| Categorization | GPT-3.5 | Auto-categorize transactions |
| Predictions | GPT-4 | Spending predictions |

**Configuration:**
```env
OPENAI_API_KEY=your_api_key
OPENROUTER_API_KEY=your_openrouter_key  # Alternative
```

### 7.3 Firebase Services

**Authentication:**
- Email/Password
- Google Sign-In
- Apple Sign-In

**Firestore Collections:**
```
users/{userId}
users/{userId}/accounts/{accountId}
users/{userId}/transactions/{transactionId}
users/{userId}/budgets/{budgetId}
users/{userId}/insights/{insightId}
users/{userId}/subscriptions/{subscriptionId}
families/{familyId}
```

**Storage Buckets:**
- Receipt images
- Profile photos
- Export files

---

## 8. State Management

### 8.1 Riverpod Architecture

```dart
// Provider Types Used
StateNotifierProvider   // Complex state with methods
FutureProvider          // Async data fetching
StreamProvider          // Real-time data streams
Provider                // Simple computed values
```

### 8.2 Key Providers

```dart
// Authentication
final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final currentUserIdProvider = Provider<String?>((ref) {
  return ref.watch(authStateProvider).value?.uid;
});

// Transactions
final transactionsStreamProvider = StreamProvider.family<List<TransactionModel>, String>((ref, userId) {
  return ref.watch(transactionRepositoryProvider).watchTransactions(userId);
});

// Budgets
final budgetsViewModelProvider = StateNotifierProvider<BudgetsViewModel, BudgetsState>((ref) {
  return BudgetsViewModel(ref);
});
```

### 8.3 ViewModel Pattern

```dart
class BudgetsViewModel extends StateNotifier<BudgetsState> {
  final Ref ref;

  BudgetsViewModel(this.ref) : super(BudgetsState.initial()) {
    _init();
  }

  Future<void> _init() async {
    // Load initial data
  }

  Future<void> createBudget(BudgetModel budget) async {
    // Business logic
  }
}

@freezed
class BudgetsState with _$BudgetsState {
  const factory BudgetsState({
    @Default([]) List<BudgetModel> budgets,
    @Default(false) bool isLoading,
    String? error,
    BudgetSummary? summary,
  }) = _BudgetsState;
}
```

---

## 9. Authentication & Security

### 9.1 Authentication Methods

| Method | Provider | Status |
|--------|----------|--------|
| Email/Password | Firebase Auth | Implemented |
| Google Sign-In | Firebase Auth | Planned |
| Apple Sign-In | Firebase Auth | Planned |
| Biometric | local_auth | Implemented |

### 9.2 Security Features

| Feature | Implementation |
|---------|----------------|
| Biometric Lock | local_auth package |
| Security Questions | Custom implementation |
| Session Management | Firebase Auth tokens |
| Data Encryption | Firestore at-rest encryption |

### 9.3 Firestore Security Rules

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Users can only access their own data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;

      match /{subcollection}/{docId} {
        allow read, write: if request.auth != null && request.auth.uid == userId;
      }
    }

    // Family access rules
    match /families/{familyId} {
      allow read, write: if request.auth != null &&
        request.auth.uid in resource.data.memberIds;
    }
  }
}
```

---

## 10. Feature Specifications

### 10.1 Core Features (P0 - Critical)

#### F1: Expense Tracking
- Automatic bank transaction import (Plaid)
- Manual transaction entry
- AI-powered categorization (95%+ accuracy)
- Receipt scanning (OCR)
- Multi-currency support

#### F2: Budgeting
- Custom budget creation by category
- Period options: Weekly, Monthly, Custom
- Real-time spending tracking
- Alert thresholds (configurable)
- Budget templates (50/30/20 rule)

#### F3: AI Insights
- Spending pattern analysis
- Anomaly detection
- Personalized recommendations
- Priority-based notifications

### 10.2 Advanced Features (P1 - High Priority)

#### F4: Predictive Cashflow
- 30/60/90 day forecasting
- Bill prediction
- Income pattern recognition
- Crisis alerts

#### F5: Subscription Decay Detector
- Detect unused subscriptions
- Usage frequency analysis
- Cancellation recommendations
- Savings calculations

#### F6: Emotional Spending AI
- Health data integration (optional)
- Mood-spending correlation
- Trigger identification
- Intervention suggestions

### 10.3 Innovative Features (P2 - Medium Priority)

#### F7: Financial Digital Twin
- What-if scenario modeling
- Goal simulations
- Risk assessment
- Future projections

#### F8: AI Bill Negotiator
- Automated negotiation agents
- Provider communication
- Savings tracking
- Success rate analytics

#### F9: Family Financial Mesh
- Multi-user households
- Shared goals
- Privacy controls
- Allowance management

---

## 11. Database Schema

### 11.1 Firestore Collections

```
firestore/
├── users/
│   └── {userId}/
│       ├── accounts/
│       │   └── {accountId}
│       ├── transactions/
│       │   └── {transactionId}
│       ├── budgets/
│       │   └── {budgetId}
│       ├── insights/
│       │   └── {insightId}
│       ├── subscriptions/
│       │   └── {subscriptionId}
│       ├── cashflowPredictions/
│       │   └── {predictionId}
│       ├── spendingDNA/
│       │   └── {dnaId}
│       ├── digitalTwin/
│       │   └── {scenarioId}
│       ├── microTasks/
│       │   └── {taskId}
│       └── securityQuestions/
│           └── {questionId}
│
└── families/
    └── {familyId}
```

### 11.2 Index Requirements

```
// Transactions - by date descending
users/{userId}/transactions: date DESC

// Budgets - active by category
users/{userId}/budgets: isActive ASC, category ASC

// Insights - unread by priority
users/{userId}/insights: isRead ASC, priority ASC
```

---

## 12. Environment Configuration

### 12.1 Environment Variables

```env
# Plaid API
PLAID_CLIENT_ID=your_client_id
PLAID_SECRET=your_secret
PLAID_ENV=sandbox

# OpenAI API
OPENAI_API_KEY=your_openai_key
OPENROUTER_API_KEY=your_openrouter_key

# Firebase (configured via google-services.json / GoogleService-Info.plist)
```

### 12.2 Build Configurations

| Environment | Plaid | AI | Debug |
|-------------|-------|-----|-------|
| Development | Sandbox | Enabled | Yes |
| Staging | Development | Enabled | Yes |
| Production | Production | Enabled | No |

---

## 13. Build & Deployment

### 13.1 Build Commands

```bash
# Get dependencies
flutter pub get

# Generate code (Freezed, JSON)
dart run build_runner build --delete-conflicting-outputs

# Run development
flutter run

# Build Android
flutter build apk --release
flutter build appbundle --release

# Build iOS
flutter build ios --release
```

### 13.2 Required Setup

1. **Firebase Setup**
   - Create Firebase project
   - Add Android app (download `google-services.json`)
   - Add iOS app (download `GoogleService-Info.plist`)
   - Enable Authentication, Firestore, Storage

2. **Plaid Setup**
   - Create Plaid account
   - Get API credentials
   - Configure webhook URLs (production)

3. **OpenAI Setup**
   - Create OpenAI account
   - Generate API key
   - Set usage limits

### 13.3 App Signing

**Android:**
- Generate keystore for release builds
- Configure `key.properties`

**iOS:**
- Configure provisioning profiles
- Set up App Store Connect

---

## Appendix

### A. Glossary

| Term | Definition |
|------|------------|
| Plaid | Third-party API for bank connectivity |
| Freezed | Code generation for immutable classes |
| Riverpod | State management solution |
| Digital Twin | AI simulation of financial future |
| Spending DNA | Unique spending behavior fingerprint |

### B. Dependencies Summary

```yaml
# Core: 15 packages
# Firebase: 4 packages
# UI: 7 packages
# Storage: 3 packages
# AI/ML: 3 packages
# Device: 5 packages
# Dev: 4 packages
# Total: ~41 packages
```

### C. API Rate Limits

| API | Limit | Notes |
|-----|-------|-------|
| Plaid | 100 req/min | Per client_id |
| OpenAI | Varies by plan | Token-based |
| Firebase | 50k reads/day (free) | Firestore |

---

**Document Version:** 1.0
**Created:** December 2025
**Maintained By:** BudgetBot Development Team
