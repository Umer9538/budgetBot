import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';
import '../../data/models/models.dart';
import '../../presentation/viewmodels/viewmodels.dart';
import '../../presentation/views/auth/auth.dart';
import '../../presentation/views/home/home.dart';
import '../../presentation/views/settings/settings.dart';

/// App route paths
class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String home = '/home';
  static const String transactions = '/transactions';
  static const String addTransaction = '/transactions/add';
  static const String editTransaction = '/transactions/edit';
  static const String scanReceipt = '/transactions/scan';
  static const String budgets = '/budgets';
  static const String addBudget = '/budgets/add';
  static const String insights = '/insights';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String linkedAccounts = '/settings/accounts';
  static const String manageCategories = '/settings/categories';

  // Feature routes
  static const String emotionalSpending = '/features/emotional-spending';
  static const String spendingDna = '/features/spending-dna';
  static const String carbonWallet = '/features/carbon-wallet';
  static const String familyHub = '/features/family-hub';
  static const String microTasks = '/features/micro-tasks';
  static const String subscriptions = '/features/subscriptions';
  static const String digitalTwin = '/features/digital-twin';
  static const String billNegotiator = '/features/bill-negotiator';
  static const String localIntelligence = '/features/local-intelligence';
  static const String investment = '/features/investment';
  static const String notifications = '/notifications';
  static const String forgotPassword = '/forgot-password';
  static const String securityQuestionsSetup = '/security-questions-setup';
}

/// Router provider
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authViewModelProvider);

  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoading = authState.isLoading;
      final isLoggedIn = authState.isAuthenticated;

      // Routes that should be accessible without authentication
      final isAuthRoute = state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.signUp ||
          state.matchedLocation == AppRoutes.forgotPassword ||
          state.matchedLocation == AppRoutes.securityQuestionsSetup;

      // Show loading while checking auth
      if (isLoading) return null;

      // Redirect to login if not authenticated
      if (!isLoggedIn && !isAuthRoute) {
        return AppRoutes.login;
      }

      // Redirect to home if authenticated and on auth route (but not forgot password or security questions)
      final isLoginOrSignUp = state.matchedLocation == AppRoutes.login ||
          state.matchedLocation == AppRoutes.signUp;
      if (isLoggedIn && isLoginOrSignUp) {
        return AppRoutes.home;
      }

      // Redirect splash to appropriate route
      if (state.matchedLocation == AppRoutes.splash) {
        return isLoggedIn ? AppRoutes.home : AppRoutes.login;
      }

      return null;
    },
    routes: [
      // Splash / Loading
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // Auth routes
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: AppRoutes.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutes.securityQuestionsSetup,
        builder: (context, state) {
          final isFromSettings = state.extra as bool? ?? false;
          return SecurityQuestionsSetupScreen(isFromSettings: isFromSettings);
        },
      ),

      // Main app shell with bottom navigation
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.transactions,
            builder: (context, state) => const TransactionsScreen(),
            routes: [
              GoRoute(
                path: 'add',
                builder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>?;
                  return AddTransactionScreen(prefillData: extra);
                },
              ),
              GoRoute(
                path: 'scan',
                builder: (context, state) => const ReceiptScannerScreen(),
              ),
              GoRoute(
                path: 'edit',
                builder: (context, state) {
                  final transaction = state.extra as TransactionModel;
                  return EditTransactionScreen(transaction: transaction);
                },
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.budgets,
            builder: (context, state) => const BudgetsScreen(),
            routes: [
              GoRoute(
                path: 'add',
                builder: (context, state) => const AddBudgetScreen(),
              ),
            ],
          ),
          GoRoute(
            path: AppRoutes.insights,
            builder: (context, state) => const InsightsScreen(),
          ),
          GoRoute(
            path: AppRoutes.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),

      // Settings routes (outside shell - no bottom nav)
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
        routes: [
          GoRoute(
            path: 'accounts',
            builder: (context, state) => const LinkedAccountsScreen(),
          ),
          GoRoute(
            path: 'categories',
            builder: (context, state) => const ManageCategoriesScreen(),
          ),
        ],
      ),

      // Feature routes (outside shell - full screen)
      GoRoute(
        path: AppRoutes.emotionalSpending,
        builder: (context, state) => const EmotionalSpendingScreen(),
      ),
      GoRoute(
        path: AppRoutes.spendingDna,
        builder: (context, state) => const SpendingDNAScreen(),
      ),
      GoRoute(
        path: AppRoutes.carbonWallet,
        builder: (context, state) => const CarbonWalletScreen(),
      ),
      GoRoute(
        path: AppRoutes.familyHub,
        builder: (context, state) => const FamilyHubScreen(),
      ),
      GoRoute(
        path: AppRoutes.microTasks,
        builder: (context, state) => const MicroTasksScreen(),
      ),
      GoRoute(
        path: AppRoutes.subscriptions,
        builder: (context, state) => const SubscriptionDecayScreen(),
      ),
      GoRoute(
        path: AppRoutes.digitalTwin,
        builder: (context, state) => const DigitalTwinScreen(),
      ),
      GoRoute(
        path: AppRoutes.billNegotiator,
        builder: (context, state) => const BillNegotiatorScreen(),
      ),
      GoRoute(
        path: AppRoutes.localIntelligence,
        builder: (context, state) => const LocalIntelligenceScreen(),
      ),
      GoRoute(
        path: AppRoutes.investment,
        builder: (context, state) => const InvestmentScreen(),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        builder: (context, state) => const NotificationsScreen(),
      ),
    ],
  );
});

/// Splash screen shown while checking auth
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

/// App shell with bottom navigation
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      extendBody: true,
      body: child,
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}

/// Bottom navigation bar with glass effect
class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(AppRoutes.home)) return 0;
    if (location.startsWith(AppRoutes.transactions)) return 1;
    if (location.startsWith(AppRoutes.budgets)) return 2;
    if (location.startsWith(AppRoutes.insights)) return 3;
    if (location.startsWith(AppRoutes.profile)) return 4;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceDark.withValues(alpha: 0.85),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            border: Border(
              top: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
          ),
          child: NavigationBar(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            indicatorColor: AppColors.primary.withValues(alpha: 0.2),
            selectedIndex: currentIndex,
            onDestinationSelected: (index) {
              switch (index) {
                case 0:
                  context.go(AppRoutes.home);
                  break;
                case 1:
                  context.go(AppRoutes.transactions);
                  break;
                case 2:
                  context.go(AppRoutes.budgets);
                  break;
                case 3:
                  context.go(AppRoutes.insights);
                  break;
                case 4:
                  context.go(AppRoutes.profile);
                  break;
              }
            },
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined, color: AppColors.neutral500),
                selectedIcon: Icon(Icons.home, color: AppColors.primaryLight),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.receipt_long_outlined, color: AppColors.neutral500),
                selectedIcon: Icon(Icons.receipt_long, color: AppColors.primaryLight),
                label: 'Transactions',
              ),
              NavigationDestination(
                icon: Icon(Icons.pie_chart_outline, color: AppColors.neutral500),
                selectedIcon: Icon(Icons.pie_chart, color: AppColors.primaryLight),
                label: 'Budgets',
              ),
              NavigationDestination(
                icon: Icon(Icons.lightbulb_outline, color: AppColors.neutral500),
                selectedIcon: Icon(Icons.lightbulb, color: AppColors.primaryLight),
                label: 'Insights',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline, color: AppColors.neutral500),
                selectedIcon: Icon(Icons.person, color: AppColors.primaryLight),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
