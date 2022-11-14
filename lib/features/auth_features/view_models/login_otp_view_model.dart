import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginOtpViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();

  void landingView(){
    _navigationService.pushNamedAndRemoveUntil(Routes.landingView);
  }

  void init(){
    print('Otp Sent');
  }

}