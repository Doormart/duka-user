import 'package:badges/badges.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/features/dashboard_features/home_view.dart';
import 'package:duka_user/features/dashboard_features/more_view.dart';
import 'package:duka_user/features/dashboard_features/orders_view.dart';
import 'package:duka_user/features/dashboard_features/profile_view.dart';
import 'package:duka_user/features/dashboard_features/view_models/dashboard_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(),
      builder: (_, model, __) => Scaffold(
        body: getView(model.currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.currentIndex,
          onTap: model.setIndex,
          elevation: 5,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Palette.mainOrange,
          selectedFontSize: SizeMg.text(12),
          unselectedFontSize: SizeMg.text(12),
          unselectedItemColor: Palette.inactiveGrey,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImageUtils.homeIcon,),
              activeIcon: SvgPicture.asset(
                ImageUtils.homeIcon,
                color: Palette.mainOrange,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Builder(
                builder: (context) {
                  if (model.orders < 1){
                    return SvgPicture.asset(
                      ImageUtils.ordersIcon,
                    );
                  }
                  return Badge(
                    badgeContent: Text(
                      '${model.orders}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeMg.text(18),
                      ),
                    ),
                    elevation: 0,
                    badgeColor: Palette.mainOrange,
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeMg.width(7),
                      vertical: SizeMg.height(3)
                    ),
                    child: SvgPicture.asset(
                      ImageUtils.ordersIcon,
                    ),
                  );
                }
              ),
              activeIcon: SvgPicture.asset(
                ImageUtils.ordersIcon,
                color: Palette.mainOrange,
              ),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImageUtils.profileIcon),
              activeIcon: SvgPicture.asset(
                ImageUtils.profileIcon,
                color: Palette.mainOrange,
              ),
              label: 'Profile',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.more_horiz_rounded,
                size: 34,
              ),
              activeIcon: Icon(
                Icons.more_horiz_rounded,
                color: Palette.mainOrange,
                size: 34,
              ),
              label: 'More',
            ),
          ],
        ),
      ),
    );
  }

  Widget getView(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const OrdersView();
      case 2:
        return const ProfileView();
      case 3:
        return const MoreView();
      default:
        return const HomeView();
    }
  }
}
