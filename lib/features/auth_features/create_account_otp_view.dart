import 'package:duka_user/core/shared_widgets/buttons.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/constants.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAccountOtpView extends StatefulWidget {
  const CreateAccountOtpView({Key? key}) : super(key: key);

  @override
  State<CreateAccountOtpView> createState() => _CreateAccountOtpViewState();
}

class _CreateAccountOtpViewState extends State<CreateAccountOtpView> {
  final FocusManager focusManager = FocusManager.instance;
  Color otpFillColor = Palette.staleWhite;
  late TextEditingController _otpController;

  @override
  void initState() {
    _otpController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
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
          'Enter Otp',
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
          child: Padding(
            padding: EdgeInsets.only(
              left: SizeMg.width(26.0),
              right: SizeMg.width(26.0),
              top: SizeMg.height(20.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Confirm phone number',
                  style: TextStyle(
                    fontSize: SizeMg.text(25),
                    color: Palette.blackGreen,
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(22),
                ),
                RichText(
                  text: TextSpan(
                    text: 'An otp code has been sent to ',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: SizeMg.text(20),
                      fontWeight: FontWeight.w400,
                      color: Palette.secondaryBlack,
                    ),
                    children: const [
                      TextSpan(
                        text: '09022117273',
                        style: TextStyle(
                          color: Palette.altGreen,
                        ),
                      ),
                      TextSpan(
                        text: ' as text message to verify your phone number',
                        style: TextStyle(
                          color: Palette.secondaryBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: SizeMg.height(30),
                ),
                //Otp section
                Text(
                  'OTP',
                  style: TextStyle(
                    fontSize: SizeMg.text(16),
                    color: Palette.secondaryBlack,
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
                  height: SizeMg.height(31),
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
                        //TODO navigate to login screen
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
                  height: SizeMg.height(50),
                ),
                //Button
                PrimaryButton(
                  buttonConfig: ButtonConfig(
                    text: 'Start ordering',
                    action: () {
                      focusManager.primaryFocus?.unfocus();
                    },
                    disabled: (_otpController.text.length < 4),
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
