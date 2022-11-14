import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();

  void authView(){
    _navigationService.pushNamedAndRemoveUntil(Routes.authHomeView);
  }

  void otpView(){
    _navigationService.navigateTo(Routes.loginOtpView);
  }

  void createAccountView(){
    _navigationService.pushNamedAndRemoveUntil(Routes.createAccountView);
  }

}