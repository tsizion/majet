import 'package:majet/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.router.dart';

class StartupViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void continueAsGuest() {
    _navigationService.navigateTo(Routes.homeView);
  }

  void signUp() {
    // Navigate to a single signup view
    _navigationService.navigateTo(Routes.signupView);
  }
}
