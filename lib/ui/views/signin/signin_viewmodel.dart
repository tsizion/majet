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

      // Print the full response
      print('SignIn response: $response');

      if (response == true) {
        // Navigate to home after successful login
        _navigationService.replaceWith(Routes.homeView);
      } else {
        // Print detailed info (you can customize inside AuthService)
        // print('❌ SignIn failed. Check credentials or approval status.');
      }
    } catch (e, s) {
      // Catch any unexpected errors and stacktrace
      print('SignIn error: $e');
      print('Stacktrace: $s');
    } finally {
      setBusy(false);
    }
  }

  void goToSignup() {
    _navigationService.navigateTo(Routes.signupView);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
