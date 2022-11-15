import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/shared_widgets/buttons.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/constants.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  final _navigationService = locator<NavigationService>();

  late TextEditingController _controllerName;
  late TextEditingController _controllerNumber;
  late TextEditingController _controllerAddress;
  late TextEditingController _controllerEmail;

  @override
  void initState() {
    _controllerName = TextEditingController();
    _controllerName.text = 'Daniel Adesanya';
    _controllerNumber = TextEditingController();
    _controllerNumber.text = '090567886554';
    _controllerAddress = TextEditingController();
    _controllerAddress.text = '18 Mogaji str. Mushin, Lagos, Nigeria';
    _controllerEmail = TextEditingController();
    _controllerEmail.text = 'dhajbfgfyyv@gmail.com';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizeMg.text(20),
            color: Palette.blackGreen,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(
            left: SizeMg.width(30),
            right: SizeMg.width(30),
            top: SizeMg.height(55),
          ),
          physics: const BouncingScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Palette.lightRed,
                radius: SizeMg.radius(66),
                child: Text(
                  _controllerName.text.substring(0, 1),
                  style: TextStyle(
                    fontSize: SizeMg.text(48),
                    fontWeight: FontWeight.w600,
                    color: Palette.mainOrange,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeMg.height(60),
            ),
            Text(
              'Name',
              style: TextStyle(
                fontSize: SizeMg.text(14),
                color: Palette.mainOrange,
              ),
            ),
            SizedBox(
              height: SizeMg.height(5),
            ),
            TextField(
              controller: _controllerName,
              textCapitalization: TextCapitalization.words,
              cursorColor: Palette.secondaryBlack,
              style: TextStyle(
                fontSize: SizeMg.text(18),
                color: Palette.secondaryBlack,
              ),
              decoration: kProfileInputDecoration,
            ),
            SizedBox(
              height: SizeMg.height(17),
            ),
            Text(
              'Phone number',
              style: TextStyle(
                fontSize: SizeMg.text(14),
                color: Palette.mainOrange,
              ),
            ),
            SizedBox(
              height: SizeMg.height(5),
            ),
            TextField(
              controller: _controllerNumber,
              keyboardType: TextInputType.number,
              cursorColor: Palette.secondaryBlack,
              style: TextStyle(
                fontSize: SizeMg.text(18),
                color: Palette.secondaryBlack,
              ),
              decoration: kProfileInputDecoration,
            ),
            SizedBox(
              height: SizeMg.height(17),
            ),
            Text(
              'Email',
              style: TextStyle(
                fontSize: SizeMg.text(14),
                color: Palette.mainOrange,
              ),
            ),
            SizedBox(
              height: SizeMg.height(5),
            ),
            TextField(
              controller: _controllerEmail,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Palette.secondaryBlack,
              style: TextStyle(
                fontSize: SizeMg.text(18),
                color: Palette.secondaryBlack,
              ),
              decoration: kProfileInputDecoration,
            ),
            SizedBox(
              height: SizeMg.height(17),
            ),
            Text(
              'Home address',
              style: TextStyle(
                fontSize: SizeMg.text(14),
                color: Palette.mainOrange,
              ),
            ),
            SizedBox(
              height: SizeMg.height(5),
            ),
            TextField(
              controller: _controllerAddress,
              textCapitalization: TextCapitalization.words,
              maxLines: 2,
              cursorColor: Palette.secondaryBlack,
              style: TextStyle(
                fontSize: SizeMg.text(18),
                color: Palette.secondaryBlack,
              ),
              decoration: kProfileInputDecoration,
            ),
            SizedBox(
              height: SizeMg.height(50),
            ),
            PrimaryButton(
              buttonConfig: ButtonConfig(
                text: 'Delete account',
                action: () {
                  _navigationService.navigateTo(Routes.deleteAccountView);
                },
              ),
            ),
            SizedBox(
              height: SizeMg.height(30),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controllerEmail.dispose();
    _controllerAddress.dispose();
    _controllerNumber.dispose();
    _controllerName.dispose();
  }
}
