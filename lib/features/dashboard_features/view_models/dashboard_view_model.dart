import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/region_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';
import 'package:duka_user/core/models/simulation/simul_values.dart';
import 'package:duka_user/features/dashboard_features/select_region_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {

  final _navigationService = locator<NavigationService>();

  RegionModel? regionModel;

  final List<Product> _listProduct = productList;
  final List<Vendor> _listVendor = vendorList;
  final List<RegionModel> _regions = regions;

  List<Vendor>? vendList;
  List<Product>? prodList;
  List<RegionModel>? regionsList = regions;

  void selectRegion(RegionModel model){
    regionModel = model;
    notifyListeners();
  }

  void showRegion(String? s){
    if (s == null){
      regionsList = _regions;
      notifyListeners();
    } else {
      regionsList = _regions.where((element) => element.region.toLowerCase().contains(s)).toList();
      notifyListeners();
    }
  }

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

  void selectProducts({required vendorId}){
    prodList = _listProduct.where((element) => element.vendorId == vendorId).toList();
    notifyListeners();
  }

  void regionView(){
    _navigationService.navigateWithTransition(
      const SelectRegionView(),
      transitionStyle: Transition.rightToLeftWithFade,
    );
  }

  void landingView(){
    _navigationService.pushNamedAndRemoveUntil(Routes.landingView);
  }
}