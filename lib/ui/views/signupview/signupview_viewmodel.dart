import 'package:flutter/material.dart';
import 'package:majet/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class SignupviewViewModel extends BaseViewModel {
  final AuthService _authService = AuthService();

  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String role = 'consumer';

  bool isLoading = false;

  /// Register user and return true if success
  Future<bool> registerUser() async {
    if (!(formKey.currentState?.validate() ?? false)) return false;

    setBusy(true);
    isLoading = true;
    notifyListeners();

    try {
      final success = await _authService.signUp(
        emailController.text.trim(),
        passwordController.text.trim(),
        fullNameController.text.trim(),
        role: role,
      );

      if (success) {
        debugPrint('Registration successful!');
      } else {
        debugPrint('Registration failed!');
      }

      return success;
    } catch (e) {
      debugPrint('Signup error: $e');
      return false;
    } finally {
      isLoading = false;
      setBusy(false);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
