import 'package:stacked/stacked.dart';
import 'package:majet/services/auth_service.dart';
import 'package:majet/app/app.locator.dart';
import 'package:majet/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

class SigninViewModel extends BaseViewModel {
  final AuthService _authService = AuthService();
  final NavigationService _navigationService = locator<NavigationService>();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    setBusy(true);
    try {
      // Call signIn and capture response
      final response = await _authService.signIn(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      print('📝 [ViewModel] SignIn response: $response');

      if (response == true) {
        print('🟢 [ViewModel] Navigation to Home');
        _navigationService.replaceWith(Routes.homeView);
      } else {
        print('🔴 [ViewModel] SignIn failed in AuthService');
      }
    } catch (e, s) {
      print('⚠️ [ViewModel] SignIn error: $e');
      print(s);
    } finally {
      setBusy(false);
    }
  }

  void goToSignup() {
    print('🟡 [ViewModel] Navigating to Signup');
    _navigationService.navigateTo(Routes.signupView);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
