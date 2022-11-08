import 'dart:async';
import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/models/simulation/simul_models/notification_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/region_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';
import 'package:duka_user/core/models/simulation/simul_values.dart';
import 'package:duka_user/core/utils/box_storage_utils.dart';
import 'package:duka_user/features/dashboard_features/select_region_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  int notification = 0;
  RegionModel? regionModel;

  final List<NotificationModel> _listNotification = notificationGroup;
  final List<Product> _listProduct = productList;
  final List<Vendor> _listVendor = vendorList;
  final _navigationService = locator<NavigationService>();
  final box = GetStorage();

  List<Vendor>? vendList;
  List<Product>? prodList;

  List<NotificationModel>? get notificationList {
    return _listNotification;
  }

  void methods() {
    setBusy(true);
    _getRegion();
    _getNotifications();
    _getProducts();
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

  void _getProducts() {
    prodList = _listProduct.take(3).toList();
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

  String checkToday(DateTime time) {
    Jiffy today = Jiffy(DateTime.now());
    Jiffy dateTime = Jiffy(time);
    if (dateTime.isSame(today, Units.DAY)) {
      return 'Today';
    }
    return dateTime.format('dd-MM-yyyy');
  }

  String checkTime(DateTime time) {
    Jiffy today = Jiffy(DateTime.now());
    Jiffy dateTime = Jiffy(time);
    num dateDiffSec = today.diff(dateTime, Units.SECOND);
    //Checking if its less than a minute
    if (dateDiffSec < 60) {
      return '$dateDiffSec seconds ago';
    }
    //Checking if its less than an hour
    else if (dateDiffSec < 3600) {
      int dateDiffMin = dateDiffSec ~/ 60;
      return '$dateDiffMin mins ago';
    }
    //Checking if its less than a day
    else if (dateDiffSec < 86400) {
      int dateDiffHr = dateDiffSec ~/ 3600;
      return '$dateDiffHr hrs ago';
    }
    //Checking if its less than 2 days
    else if (dateDiffSec < 172800) {
      int dateDiffDay = dateDiffSec ~/ 86400;
      return '$dateDiffDay days ago';
    }
    return dateTime.format('EEEE, do MMMM, yyyy');
  }
}
