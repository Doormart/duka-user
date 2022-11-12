import 'dart:async';
import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/models/simulation/simul_models/notification_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/region_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';
import 'package:duka_user/core/models/simulation/simul_values.dart';
import 'package:duka_user/core/utils/box_storage_utils.dart';
import 'package:duka_user/features/dashboard_features/select_region_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  int notification = 0;
  RegionModel? regionModel;

  final List<NotificationModel> _listNotification = notificationGroup;
  final List<Vendor> _listVendor = vendorList;
  final _navigationService = locator<NavigationService>();
  final box = GetStorage();

  List<Vendor>? vendList;
  List<Product>? prodList;

  List<NotificationModel>? get notificationList {
    return _listNotification;
  }

  void init() {
    setBusy(true);
    _getRegion();
    _getNotifications();
    _getVendors();
    Timer(const Duration(seconds: 3), () {
      setBusy(false);
    });
  }

  void _getRegion() {
    regionModel = RegionModel(
      id: box.read(StorageUtils.regionId),
      region: box.read(StorageUtils.regionName),
    );
    notifyListeners();
  }

  void _getNotifications() {
    if (notificationList == null || notificationList!.isEmpty) {
      return;
    }
    int number = 0;
    for (NotificationModel model in notificationList!) {
      number = number + model.number;
    }
    notification = number;
    notifyListeners();
  }

  void _getVendors() {
    vendList = _listVendor;
    notifyListeners();
  }

  void regionView() {
    _navigationService.navigateWithTransition(
      const SelectRegionView(),
      transitionStyle: Transition.rightToLeftWithFade,
    );
  }

  void vendorDetailsView(Vendor vendor){
    _navigationService.navigateToVendorDetailsView(
      vendor: vendor,
    );
  }

  void searchFood(){
    print('Food searched');
  }

  void readNotification(){
    print('Notification read');
  }
}
