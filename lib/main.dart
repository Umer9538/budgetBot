import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/config/env_config.dart';
import 'core/core.dart';
import 'data/services/sync/background_sync_service.dart';
import 'firebase_options.dart';
import 'presentation/viewmodels/viewmodels.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment configuration
  await EnvConfig.load();
  if (kDebugMode) {
    EnvConfig.printStatus();
  }

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize Hive for local storage
  await Hive.initFlutter();

  // Initialize WorkManager for background sync (optional - app works without it)
  try {
    await BackgroundSyncService.initialize();
  } catch (e) {
    if (kDebugMode) {
      print('BackgroundSyncService initialization failed: $e');
      print('App will continue without background sync');
    }
  }

  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    const ProviderScope(
      child: BudgetBotApp(),
    ),
  );
}

/// Main application widget
class BudgetBotApp extends ConsumerWidget {
  const BudgetBotApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,

      // Theme Configuration
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,

      // Router Configuration
      routerConfig: router,
    );
  }
}
