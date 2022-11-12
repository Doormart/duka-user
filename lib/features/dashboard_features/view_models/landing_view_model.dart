import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/models/simulation/simul_models/region_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';
import 'package:duka_user/core/models/simulation/simul_values.dart';
import 'package:duka_user/core/utils/box_storage_utils.dart';
import 'package:duka_user/features/dashboard_features/view_models/select_region_view_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LandingViewModel extends BaseViewModel {
  final List<Vendor> _listVendor = vendorList;
  final _navigationService = locator<NavigationService>();
  final SelectRegionViewModel selectModel = SelectRegionViewModel();
  final box = GetStorage();

  List<Vendor>? vendList;
  RegionModel? regionModel;

  void selectVendors(int? categoryId){
    if (regionModel == null){
      if (categoryId != null){
        vendList =  _listVendor.where((element) => element.categoryId == categoryId).toList();
        notifyListeners();
      } else {
        vendList = _listVendor;
        notifyListeners();
      }
    } else if (regionModel != null){
      if (categoryId != null){
      vendList =  _listVendor.where((element) => (element.categoryId == categoryId) && (element.regionId == regionModel!.id)).toList();
        notifyListeners();
      } else {
        vendList = _listVendor.where((element) => element.regionId == regionModel!.id).toList();
        notifyListeners();
      }
    }
  }


  void dashboardView(){
    _navigationService.pushNamedAndRemoveUntil(Routes.dashboardView);
  }

  void profileView(){
    box.write(StorageUtils.profileView, true);
    _navigationService.pushNamedAndRemoveUntil(Routes.dashboardView);
  }
}