import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/shared_widgets/buttons.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked_services/stacked_services.dart';

class OrderPlacedView extends StatelessWidget {

  final _navigationService = locator<NavigationService>();

  OrderPlacedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Palette.blackGreen,
          ),
        ),
        title: Text(
          'Orders',
          style: TextStyle(
            fontSize: SizeMg.text(20),
            color: Palette.blackGreen,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              ImageUtils.trackOrder,
            ),
            Text(
              'Order placed succesfully!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeMg.text(18),
                fontWeight: FontWeight.w500,
                color: Palette.secondaryBlack,
              ),
            ),
            PrimaryButton(
              margin: EdgeInsets.symmetric(
                horizontal: SizeMg.width(30),
              ),
              buttonConfig: ButtonConfig(
                text: 'Track your order here',
                action: (){
                  _navigationService.navigateTo(Routes.orderTrackingView);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
