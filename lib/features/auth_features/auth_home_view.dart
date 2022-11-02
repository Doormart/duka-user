import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/shared_widgets/buttons.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthHomeView extends StatelessWidget {
  AuthHomeView({Key? key}) : super(key: key);
  
  final _navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: SizeMg.height(64),
            left: SizeMg.width(29),
            right: SizeMg.width(29),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageUtils.brandLogo,
                    scale: 4.0,
                  ),
                  Text(
                    'uka',
                    style: TextStyle(
                      fontSize: SizeMg.text(50),
                      color: Palette.blackGreen,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeMg.height(68),
              ),
              Image.asset(
                ImageUtils.authImage,
              ),
              SizedBox(
                height: SizeMg.height(76),
              ),
              PrimaryButton(
                buttonConfig: ButtonConfig(
                  text: 'Create account',
                  action: () {
                    _navigationService.navigateTo(Routes.createAccountView);
                  },
                ),
              ),
              SizedBox(
                height: SizeMg.height(21),
              ),
              OutlinePrimaryButton(
                buttonConfig: ButtonConfig(
                  text: 'Login',
                  action: () {
                    _navigationService.navigateTo(Routes.loginView);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
