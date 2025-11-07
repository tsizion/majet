import 'package:majet/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:majet/services/auth_service.dart';
import '../../../app/app.router.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  /// Navigate as guest
  void continueAsGuest() {
    _navigationService.navigateTo(Routes.homeView);
  }

  /// Navigate to sign up
  void signUp() {
    _navigationService.navigateTo(Routes.signupView);
  }

  /// Get the current user from AuthService
  Future<dynamic> getCurrentUser() async {
    return await _authService.getCurrentUser();
  }
}
