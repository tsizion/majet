import 'package:flutter/material.dart';
import 'package:majet/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_viewmodel.dart';
import 'discover_view.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return _HomeContent();
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}

class _HomeContent extends StatefulWidget {
  const _HomeContent({Key? key}) : super(key: key);

  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  bool showDiscover = true;
  String? userName;

  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  Future<void> _checkUser() async {
    final client = Supabase.instance.client;

    // 1️⃣ Check Supabase session
    final session = client.auth.currentSession;
    if (session != null &&
        session.expiresAt != null &&
        session.expiresAt! * 1000 > DateTime.now().millisecondsSinceEpoch) {
      // Token exists and is valid
      final email = session.user?.email;
      if (email != null) {
        final record = await client
            .from('users')
            .select()
            .eq('email', email)
            .maybeSingle();

        if (record != null) {
          final Map<String, dynamic> userData = record as Map<String, dynamic>;
          setState(() {
            showDiscover = false;
            userName = userData['full_name'] ?? email;
          });
          return;
        }
      }
    }

    // 2️⃣ Fallback to local storage
    final localUser = await AuthService().getCurrentUser();
    if (localUser != null) {
      setState(() {
        showDiscover = false;
        userName = localUser.fullName;
      });
      return;
    }

    // If no session or local user, keep DiscoverView
    setState(() {
      showDiscover = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: showDiscover
          ? DiscoverView(
              onSkip: () {
                setState(() {
                  showDiscover = false;
                });
              },
            )
          : Container(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (userName != null)
                      Text(
                        'Welcome back, $userName!',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      )
                    else
                      const Text(
                        'Welcome to the App!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    const SizedBox(height: 20),
                    // Add other home content here, e.g., recipes, buttons
                  ],
                ),
              ),
            ),
    );
  }
}
