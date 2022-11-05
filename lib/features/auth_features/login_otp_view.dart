import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/shared_widgets/buttons.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/constants.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginOtpView extends StatefulWidget {
  const LoginOtpView({Key? key}) : super(key: key);

  @override
  State<LoginOtpView> createState() => _LoginOtpViewState();
}

class _LoginOtpViewState extends State<LoginOtpView> {
  final FocusManager focusManager = FocusManager.instance;
  Color otpFillColor = Palette.staleWhite;
  final _navigationService = locator<NavigationService>();

  late TextEditingController _otpController;

  @override
  void initState() {
    _otpController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    var bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    return GestureDetector(
      onTap: () => focusManager.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Palette.blackGreen,
            ),
          ),
          title: Text(
            'Login',
            style: TextStyle(
              fontSize: SizeMg.text(20),
              color: Palette.blackGreen,
            ),
          ),
          titleSpacing: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: SizeMg.width(26.0),
              right: SizeMg.width(26.0),
              top: SizeMg.height(20.0),
            ),
            child: Column(
              children: [
                Image.asset(
                  ImageUtils.loginLogo,
                  scale: 4.0,
                ),
                SizedBox(
                  height: SizeMg.height(80),
                ),
                //Otp section
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'OTP',
                    style: TextStyle(
                      fontSize: SizeMg.text(16),
                      color: Palette.secondaryBlack,
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(12),
                ),
                TextField(
                  controller: _otpController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.black,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(4),
                  ],
                  style: TextStyle(
                    fontSize: SizeMg.text(18),
                    fontWeight: FontWeight.w400,
                    color: Palette.blackGreen,
                  ),
                  decoration: kFormTextDecoration.copyWith(
                    hintText: 'Enter otp',
                    fillColor: otpFillColor,
                  ),
                  onChanged: (value) {
                    toggleOtpColor(value);
                  },
                ),
                SizedBox(
                  height: SizeMg.height(32),
                ),
                //Resend
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t receive any code? ",
                      style: TextStyle(
                        color: Palette.secondaryBlack,
                        fontSize: SizeMg.text(18),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        //TODO Call token function again
                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: Palette.mainOrange,
                          fontSize: SizeMg.text(18),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: SizeMg.height(32),
                ),
                //Button
                AnimatedSize(
                  duration: const Duration(milliseconds: 250),
                  child: Builder(
                    builder: (ctx) {
                      if (bottomInsets != 0) {
                        return const SizedBox.shrink();
                      }
                      return PrimaryButton(
                        buttonConfig: ButtonConfig(
                          text: 'Login',
                          action: () {
                            _navigationService.pushNamedAndRemoveUntil(Routes.landingView);
                            focusManager.primaryFocus?.unfocus();
                          },
                          disabled: (_otpController.text.length < 4),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toggleOtpColor(String s) {
    if (s.isEmpty) {
      setState(() {
        otpFillColor = Palette.staleWhite;
      });
    } else {
      setState(() {
        otpFillColor = Palette.offWhite;
      });
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
