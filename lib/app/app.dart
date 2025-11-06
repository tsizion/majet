import 'package:majet/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:majet/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:majet/ui/views/home/home_view.dart';
import 'package:majet/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:majet/services/auth_service.dart';
import 'package:majet/services/recipe_service.dart';
import 'package:majet/ui/views/home/home_view.dart';
import 'package:majet/ui/views/upload/upload_view.dart';
import 'package:majet/ui/views/recipe_detail/recipe_detail_view.dart';
import 'package:majet/ui/views/startup/startup_view.dart';
import 'package:majet/ui/views/signupview/signupview_view.dart';
import 'package:majet/ui/views/signin/signin_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: UploadView),
    MaterialRoute(page: RecipeDetailView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: SigninView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: RecipeService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
