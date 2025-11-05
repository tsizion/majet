import 'package:flutter/material.dart';
import 'package:majet/app/app.bottomsheets.dart';
import 'package:majet/app/app.dialogs.dart';
import 'package:majet/app/app.locator.dart';
import 'package:majet/app/app.router.dart';
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
        debugShowCheckedModeBanner: false);
  }
}
