import 'package:flutter/material.dart';
import 'package:majet/components/PrimaryButton.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'startup_viewmodel.dart';
import '../home/home_view.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    StartupViewModel viewModel,
    Widget? child,
  ) {
    return _StartupContent(viewModel: viewModel);
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();
}

class _StartupContent extends StatefulWidget {
  final StartupViewModel viewModel;
  const _StartupContent({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<_StartupContent> createState() => _StartupContentState();
}

class _StartupContentState extends State<_StartupContent> {
  bool isLoading = true;
  bool hasValidSession = false;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    final client = Supabase.instance.client;
    final session = client.auth.currentSession;

    if (session != null &&
        session.expiresAt != null &&
        session.expiresAt! * 1000 > DateTime.now().millisecondsSinceEpoch) {
      // Session is valid
      final email = session.user?.email;
      if (email != null) {
        final record = await client
            .from('users')
            .select()
            .eq('email', email)
            .maybeSingle();

        if (record != null) {
          setState(() {
            hasValidSession = true;
            isLoading = false;
          });
          _goToHomeAfterDelay();
          return;
        }
      }
    }

    // Check local fallback
    final localUser = await widget.viewModel.getCurrentUser();
    if (localUser != null) {
      setState(() {
        hasValidSession = true;
        isLoading = false;
      });
      _goToHomeAfterDelay();
      return;
    }

    // No valid session
    setState(() {
      hasValidSession = false;
      isLoading = false;
    });
  }

  void _goToHomeAfterDelay() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (hasValidSession) {
      // Show only logo in center with no background
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image(
            image: AssetImage('assets/logo.png'),
            width: 150,
            height: 150,
          ),
        ),
      );
    }

    // No valid session: show normal startup UI
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/food.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 14, 9, 2).withOpacity(0.5),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(
                    label: "Continue as Guest",
                    onPressed: widget.viewModel.continueAsGuest,
                  ),
                  const SizedBox(height: 15),
                  PrimaryButton(
                    label: "Sign Up",
                    onPressed: widget.viewModel.signUp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
