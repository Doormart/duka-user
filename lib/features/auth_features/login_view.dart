import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/shared_widgets/buttons.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/constants.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final FocusManager focusManager = FocusManager.instance;
  final _navigationService = locator<NavigationService>();

  Color numberFillColor = Palette.staleWhite;
  late TextEditingController _numberController;

  @override
  void initState() {
    _numberController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);

    var queryData = MediaQuery.of(context);
    var bottomSafeArea = queryData.padding.bottom;
    var bottomInset = queryData.viewInsets.bottom;

    Widget body = Column(
      children: [
        //Logo
        Image.asset(
          ImageUtils.loginLogo,
          scale: 4.0,
        ),
        SizedBox(
          height: SizeMg.height(80),
        ),
        //Phone number form field
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Phone field
              Text(
                'Phone number',
                style: TextStyle(
                  fontSize: SizeMg.text(16),
                  color: Palette.secondaryBlack,
                ),
              ),
              SizedBox(
                height: SizeMg.height(12),
              ),
              TextFormField(
                controller: _numberController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                cursorColor: Colors.black,
                style: TextStyle(
                  fontSize: SizeMg.text(18),
                  fontWeight: FontWeight.w400,
                  color: Palette.blackGreen,
                ),
                decoration: kFormTextDecoration.copyWith(
                  hintText: 'Enter phone number',
                  fillColor: numberFillColor,
                ),
                onChanged: (value) {
                  toggleNumberColor(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Number cannot be empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: SizeMg.height(25),
              ),
              //Button
              PrimaryButton(
                buttonConfig: ButtonConfig(
                  text: 'Next',
                  action: () {
                    if (_formKey.currentState!.validate()) {
                      _navigationService.navigateTo(Routes.loginOtpView);
                    }
                    focusManager.primaryFocus?.unfocus();
                  },
                  disabled: (_numberController.text.length < 11),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    Widget footer = Positioned(
      bottom: SizeMg.height(50) + bottomSafeArea,
      left: 0,
      right: 0,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 250),
        child: Builder(
          builder: (ctx) {
            if (bottomInset != 0) {
              return const SizedBox.shrink();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Biometrics
                SvgPicture.asset(
                  ImageUtils.biometrics,
                ),
                SizedBox(
                  height: SizeMg.height(21),
                ),
                Text(
                  'Login with biometrics',
                  style: TextStyle(
                    fontSize: SizeMg.text(16),
                    color: Palette.blackGreen,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeMg.height(45),
                ),
                //Sign up section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: TextStyle(
                        color: Palette.secondaryBlack,
                        fontSize: SizeMg.text(18),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _navigationService
                            .pushNamedAndRemoveUntil(Routes.createAccountView);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Palette.mainOrange,
                          fontSize: SizeMg.text(18),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );

    return GestureDetector(
      onTap: () => focusManager.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              _navigationService.pushNamedAndRemoveUntil(Routes.authHomeView);
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
              top: SizeMg.height(30),
              left: SizeMg.width(26),
              right: SizeMg.width(26),
            ),
            child: Stack(
              children: [body, footer,],
            ),
          ),
        ),
      ),
    );
  }

  void toggleNumberColor(String s) {
    if (s.isEmpty) {
      setState(() {
        numberFillColor = Palette.staleWhite;
      });
    } else {
      setState(() {
        numberFillColor = Palette.offWhite;
      });
    }
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }
}
