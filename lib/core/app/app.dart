import 'package:duka_user/features/auth_features/auth_home_view.dart';
import 'package:duka_user/features/auth_features/create_account_view.dart';
import 'package:duka_user/features/auth_features/create_account_otp_view.dart';
import 'package:duka_user/features/auth_features/login_otp_view.dart';
import 'package:duka_user/features/auth_features/login_view.dart';
import 'package:duka_user/features/dashboard_features/dashboard_view.dart';
import 'package:duka_user/features/dashboard_features/landing_view.dart';
import 'package:duka_user/features/dashboard_features/vendor_details_view.dart';
import 'package:duka_user/features/splash_screen_features/splash_screen_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

///I'm using stacked architecture for state management, dependency injection, etc, so watch tutorials on it if you dunno about it.
/// for code generation anytime u add anything below: flutter pub run build_runner build --delete-conflicting-outputs

@StackedApp(
  routes: [
    AdaptiveRoute(page: SplashScreenView, initial: true),
    AdaptiveRoute(page: AuthHomeView),
    AdaptiveRoute(page: CreateAccountView),
    AdaptiveRoute(page: CreateAccountOtpView),
    AdaptiveRoute(page: LoginView),
    AdaptiveRoute(page: LoginOtpView),
    AdaptiveRoute(page: LandingView),
    AdaptiveRoute(page: DashboardView),
    AdaptiveRoute(page: VendorDetailsView),
  ],
  logger: StackedLogger(),
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)

class AppSetup{}