import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/shared_widgets/buttons.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/constants.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final _navigationService = locator<NavigationService>();
  final _formKey = GlobalKey<FormState>();
  final FocusManager focusManager = FocusManager.instance;

  Color nameFillColor = Palette.staleWhite;
  Color emailFillColor = Palette.staleWhite;
  Color numberFillColor = Palette.staleWhite;

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _numberController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _numberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            _navigationService.pushNamedAndRemoveUntil(Routes.authHomeView);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: Text(
          'Create an account',
          style: TextStyle(
            fontSize: SizeMg.text(20),
            color: Palette.blackGreen,
          ),
        ),
        titleSpacing: 0,
      ),
      body: GestureDetector(
        onTap: () => focusManager.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.only(
                left: SizeMg.width(26.0),
                right: SizeMg.width(26.0),
                top: SizeMg.height(15.0),
              ),
              shrinkWrap: true,
              children: [
                Text(
                  'Put in your details',
                  style: TextStyle(
                    fontSize: SizeMg.text(25),
                    color: Palette.blackGreen,
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(18),
                ),
                Text(
                  'An otp code will be sent to you as text message to verify your phone number',
                  style: TextStyle(
                    fontSize: SizeMg.text(18),
                    color: Palette.secondaryBlack,
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(20),
                ),
                //Name section
                Text(
                  'Name',
                  style: TextStyle(
                    fontSize: SizeMg.text(16),
                    color: Palette.secondaryBlack,
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(10),
                ),
                TextFormField(
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: SizeMg.text(18),
                    fontWeight: FontWeight.w400,
                    color: Palette.blackGreen,
                  ),
                  decoration: kFormTextDecoration.copyWith(
                    hintText: 'Enter name',
                    fillColor: nameFillColor,
                  ),
                  onChanged: (value) {
                    toggleNameColor(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeMg.height(25),
                ),
                //Email section
                Text(
                  'Email',
                  style: TextStyle(
                    fontSize: SizeMg.text(16),
                    color: Palette.secondaryBlack,
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(10),
                ),
                TextFormField(
                  controller: _emailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: SizeMg.text(18),
                    fontWeight: FontWeight.w400,
                    color: Palette.blackGreen,
                  ),
                  decoration: kFormTextDecoration.copyWith(
                    hintText: 'Enter email',
                    fillColor: emailFillColor,
                  ),
                  onChanged: (value) {
                    toggleEmailColor(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeMg.height(25),
                ),
                //Phone number section
                Text(
                  'Phone number',
                  style: TextStyle(
                    fontSize: SizeMg.text(16),
                    color: Palette.secondaryBlack,
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(10),
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
                      return 'Phone number cannot be empty';
                    }
                    if (value.length < 11) {
                      return 'Phone number cannot be less than 11 numbers';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: SizeMg.height(35),
                ),
                //Button section
                PrimaryButton(
                  buttonConfig: ButtonConfig(
                    text: 'Next',
                    action: () {
                      if (_formKey.currentState!.validate()) {
                        _navigationService.navigateTo(Routes.createAccountOtpView);
                      }
                      focusManager.primaryFocus?.unfocus();
                    },
                    disabled: !(_nameController.text.isNotEmpty &&
                        _emailController.text.isNotEmpty &&
                        _numberController.text.isNotEmpty),
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(25),
                ),
                //Login section
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        color: Palette.secondaryBlack,
                        fontSize: SizeMg.text(18),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Palette.mainOrange,
                          fontSize: SizeMg.text(18),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toggleNameColor(String s) {
    if (s.isEmpty) {
      setState(() {
        nameFillColor = Palette.staleWhite;
      });
    } else {
      setState(() {
        nameFillColor = Palette.offWhite;
      });
    }
  }

  void toggleEmailColor(String s) {
    if (s.isEmpty) {
      setState(() {
        emailFillColor = Palette.staleWhite;
      });
    } else {
      setState(() {
        emailFillColor = Palette.offWhite;
      });
    }
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
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
  }
}
