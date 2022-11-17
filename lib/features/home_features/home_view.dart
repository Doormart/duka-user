import 'package:carousel_slider/carousel_slider.dart';
import 'package:duka_user/core/models/simulation/simul_models/notification_model.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/core/utils/string_utils.dart';
import 'package:duka_user/features/home_features/view_models/home_view_model.dart';
import 'package:duka_user/features/dashboard_features/widgets/carousel_stack.dart';
import 'package:duka_user/features/dashboard_features/widgets/notification_widget.dart';
import 'package:duka_user/features/dashboard_features/widgets/select_region.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.init(),
      fireOnModelReadyOnce: true,
      disposeViewModel: false,
      builder: (_, model, __) => Builder(builder: (context) {
        if (model.isBusy) {
          return const Center(
            child: CircularProgressIndicator(
              color: Palette.mainOrange,
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: SelectRegion(
              onTap: model.regionView,
              region: model.regionModel?.region,
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: model.searchFood,
              ),
              NotificationWidget(
                notification: model.notification,
                onPressed: () {
                  _buildNotificationScreen(model.notificationList, model);
                },
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeMg.width(21),
                      vertical: SizeMg.height(20),
                    ),
                    child: Text(
                      'As e dey hot \u{1F525}',
                      style: TextStyle(
                        fontSize: SizeMg.text(25),
                        color: Palette.blackGreen,
                      ),
                    ),
                  ),
                  CarouselSlider.builder(
                    itemCount: model.vendList!.length,
                    itemBuilder: (ctx, _, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeMg.width(24),
                        ),
                        child: CarouselStack(
                          vendor: model.vendList![index],
                          onTap: (){
                            model.vendorDetailsView(model.vendList![index]);
                          },
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: SizeMg.height(265),
                      viewportFraction: 0.62,
                      padEnds: false,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeMg.width(22),
                      vertical: SizeMg.height(28),
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: SizeMg.width(24),
                      vertical: SizeMg.height(40),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        SizeMg.radius(15),
                      ),
                      color: Palette.midMintGreen,
                    ),
                    child: Text(
                      'Enter referral contest to win N5,000 shopping voucher',
                      style: TextStyle(
                        fontSize: SizeMg.text(16),
                        fontWeight: FontWeight.w500,
                        color: Palette.green,
                      ),
                    ),
                  ),
                  ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeMg.width(21),
                    ),
                    shrinkWrap: true,
                    itemCount: model.vendList!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return SizedBox(
                        height: SizeMg.height(166),
                        child: CarouselStack(
                          vendor: model.vendList![index],
                          onTap: (){
                            model.vendorDetailsView(model.vendList![index]);
                          },
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return SizedBox(
                        height: SizeMg.height(24),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Future _buildNotificationScreen(
      List<NotificationModel>? notificationList, HomeViewModel model) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              SizeMg.radius(50),
            ),
            topLeft: Radius.circular(
              SizeMg.radius(50),
            ),
          ),
          child: ColoredBox(
            color: Colors.white,
            child: DraggableScrollableSheet(
              initialChildSize: 0.4,
              maxChildSize: 0.8,
              expand: false,
              builder: (context, scrollController) {
                if (notificationList == null || notificationList.isEmpty) {
                  return Center(
                    child: Text(
                      'No notification',
                      style: TextStyle(
                        fontSize: SizeMg.text(15),
                        color: Palette.secondaryBlack,
                      ),
                    ),
                  );
                }
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Container(
                        height: SizeMg.height(10),
                        margin: EdgeInsets.symmetric(
                          horizontal: SizeMg.width(140),
                          vertical: SizeMg.height(30),
                        ),
                        decoration: BoxDecoration(
                          color: Palette.darkGrey,
                          borderRadius:
                              BorderRadius.circular(SizeMg.radius(30),),
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final notificationModel = notificationList[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: SizeMg.width(26),
                                  right: SizeMg.width(26),
                                  bottom: SizeMg.height(28),
                                ),
                                child: Text(
                                  StringUtils.checkToday(notificationModel.date),
                                  style: TextStyle(
                                    fontSize: SizeMg.text(20),
                                    color: Palette.blackGreen,
                                  ),
                                ),
                              ),
                              _buildNotificationDetails(
                                  notificationModel, model),
                            ],
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return SizedBox(
                            height: SizeMg.height(33),
                          );
                        },
                        itemCount: notificationList.length,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildNotificationDetails(
      NotificationModel notificationModel, HomeViewModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: notificationModel.data
          .map(
            (notification) => GestureDetector(
              onTap: model.readNotification,
              child: Container(
                decoration: BoxDecoration(
                  color:
                      notification.read ? Colors.transparent : Palette.offWhite,
                  border: const Border(
                    bottom: BorderSide(
                      color: Palette.inactiveGrey,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeMg.width(26),
                  vertical: SizeMg.height(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      notification.notificationMessage,
                      style: TextStyle(
                        fontSize: SizeMg.text(14),
                        color: Palette.secondaryBlack,
                      ),
                    ),
                    Text(
                      StringUtils.checkTime(notification.notificationDate),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: SizeMg.text(12),
                        color: Palette.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
