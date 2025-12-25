# BudgetBot

**AI-Powered Personal Finance Assistant**

BudgetBot is a next-generation personal finance assistant that combines traditional money management with cutting-edge AI capabilities. Unlike existing finance apps that simply track spending, BudgetBot predicts financial futures, understands emotional spending patterns, and actively works to improve users' financial health through autonomous actions and personalized micro-interventions.

> "BudgetBot doesn't just track your money—it understands you, predicts your future, and actively fights for your financial wellbeing."

## Features

### Core Features
- **Automatic Bank Sync** - Connect to 10,000+ financial institutions via Plaid API
- **AI-Powered Categorization** - 95%+ accuracy transaction categorization
- **Smart Budgeting** - Custom budgets with AI-suggested limits based on income and history
- **Manual Transaction Entry** - Log cash transactions and expenses
- **Real-time Insights** - AI-generated spending pattern analysis

### Innovative Features
| Feature | Description |
|---------|-------------|
| Predictive Cashflow Crisis Alert | Predict future cash shortfalls before they happen |
| Emotional Spending AI | Detect emotional states and correlate with spending patterns |
| Financial Digital Twin | AI simulation of your financial future based on current behaviors |
| Subscription Decay Detector | Detect subscriptions you pay for but don't use |
| Micro-Task Wealth Builder | Gamified daily financial tasks for habit building |
| AI Bill Negotiator Bot | Autonomous AI agent that negotiates bills and subscriptions |
| Spending DNA | Unique behavioral pattern for personalization and fraud detection |
| Carbon Wallet | Track environmental impact of spending |
| Family Financial Mesh | Cross-generational family financial planning |

## Technology Stack

| Layer | Technology |
|-------|------------|
| Mobile App | Flutter / Dart |
| Backend | Firebase Cloud Functions |
| Database | Firestore (Real-time) |
| Authentication | Firebase Auth |
| AI/ML | OpenAI GPT-4, Hugging Face, Google Cloud AI |
| Analytics | BigQuery + Firebase Analytics |
| Storage | Firebase Storage |

## Getting Started

### Prerequisites
- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- Firebase CLI
- Android Studio / Xcode (for emulators)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-org/budgetbot.git
   cd budgetbot
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure environment variables**

   Create a `.env` file in the root directory:
   ```env
   PLAID_CLIENT_ID=your_plaid_client_id
   PLAID_SECRET=your_plaid_secret
   PLAID_ENV=sandbox
   OPENAI_API_KEY=your_openai_key
   OPENROUTER_API_KEY=your_openrouter_key
   ```

4. **Configure Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com)
   - Download and add `google-services.json` (Android) and `GoogleService-Info.plist` (iOS)
   - Enable Authentication, Firestore, and Cloud Functions

5. **Run the app**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── core/                    # Core utilities, constants, themes
├── data/
│   ├── models/              # Data models (Freezed)
│   ├── services/            # API services (Plaid, AI, Firebase)
│   └── repositories/        # Data repositories
├── presentation/
│   ├── views/               # UI screens
│   ├── viewmodels/          # State management (Riverpod)
│   └── common/widgets/      # Reusable widgets
└── main.dart
```

## API Integrations

### Financial APIs
- **Plaid** - Bank account linking and transaction retrieval
- **Alpaca Markets** - Investment data and trading capabilities

### AI APIs
- **OpenAI API** - NLP, insights generation, categorization
- **Hugging Face API** - Sentiment analysis, text classification
- **Google Cloud AI** - Natural language understanding

### Health APIs (Emotional Spending AI)
- **Apple HealthKit** - HRV, sleep analysis, activity levels
- **Google Fit API** - Heart rate, sleep segments, stress indicators

## Security & Privacy

BudgetBot takes security seriously:

- **TLS 1.3** encryption for all API communications
- **Multi-factor authentication** via Firebase Auth
- **AES-256** encryption for data at rest
- **GDPR & CCPA** compliant
- **PCI DSS** compliant via Plaid (no direct card data storage)
- Bank credentials are **never stored** on our servers

### Data Classification
- **HIGH**: Bank credentials (never stored), SSNs (never collected)
- **MEDIUM**: Transaction data, account balances (encrypted)
- **LOW**: Budget settings, preferences, gamification data

## Environment Configuration

| Variable | Description | Required |
|----------|-------------|----------|
| `PLAID_CLIENT_ID` | Plaid API client ID | Yes |
| `PLAID_SECRET` | Plaid API secret key | Yes |
| `PLAID_ENV` | Plaid environment (sandbox/development/production) | Yes |
| `OPENAI_API_KEY` | OpenAI API key for AI features | Yes |
| `OPENROUTER_API_KEY` | OpenRouter API key (alternative AI provider) | No |

## Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage

# Run integration tests
flutter test integration_test/
```

## Building for Production

### Android
```bash
flutter build apk --release
# or for app bundle
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is proprietary software. All rights reserved.

## Support

For help and support:
- Email: support@budgetbot.app
- Documentation: [docs.budgetbot.app](https://docs.budgetbot.app)

---

**Version:** 1.0
**Last Updated:** December 2025
