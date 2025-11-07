import 'package:flutter/material.dart';
import 'package:majet/app/app.bottomsheets.dart';
import 'package:majet/app/app.dialogs.dart';
import 'package:majet/app/app.locator.dart';
import 'package:majet/app/app.router.dart';
import 'package:majet/core/constants/app_colors.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url:
        'https://avitjiubevrrrvyzyntn.supabase.co', // replace with your Supabase project URL
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF2aXRqaXViZXZycnJ2eXp5bnRuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjIyOTA5NzMsImV4cCI6MjA3Nzg2Njk3M30.TzwC31TjEGBvA00IQ8i7GDO1HdStoKo5eYNOxUumDYc', // replace with your anon/public key
  );

  // Setup Stacked services
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [StackedService.routeObserver],
      debugShowCheckedModeBanner: false,

      // Custom theme
      theme: ThemeData(
        brightness: Brightness.light, // Light or dark mode
        primaryColor: primaryColor, // Primary color of your app
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          foregroundColor: Color.fromARGB(255, 23, 4, 4),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: primaryColor,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
