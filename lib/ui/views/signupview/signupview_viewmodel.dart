import 'package:flutter/material.dart';
import 'package:majet/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:majet/app/app.locator.dart';
import 'package:majet/app/app.router.dart';

class SignupviewViewModel extends BaseViewModel {
  final AuthService _authService = AuthService();
  final NavigationService _navigationService = locator<NavigationService>();

  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String role = 'consumer';

  Future<bool> registerUser() async {
    if (!(formKey.currentState?.validate() ?? false)) return false;

    setBusy(true);

    try {
      final success = await _authService.signUp(
        emailController.text.trim(),
        passwordController.text.trim(),
        fullNameController.text.trim(),
        role: role,
      );

      if (success) {
        /// ✅ Redirect to Signin after successful signup
        _navigationService.replaceWith(Routes.signinView);
      }

      return success;
    } catch (e) {
      debugPrint('Signup error: $e');
      return false;
    } finally {
      setBusy(false);
    }
  }

  /// ✅ Manual navigation to Signin
  void navigateToSignin() {
    _navigationService.navigateTo(Routes.signinView);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
