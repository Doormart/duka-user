import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/models/simulation/simul_models/region_model.dart';
import 'package:duka_user/core/models/simulation/simul_values.dart';
import 'package:duka_user/core/utils/box_storage_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SelectRegionViewModel extends BaseViewModel {

  final List<RegionModel> _regions = regions;
  final box = GetStorage();
  final _navigationService = locator<NavigationService>();

  List<RegionModel>? regionsList = regions;

  void selectRegion(RegionModel model){
    box.write(StorageUtils.regionId, model.id);
    box.write(StorageUtils.regionName, model.region);
  }

  void showRegion(String? s){
    if (s == null){
      regionsList = _regions;
      notifyListeners();
    } else {
      regionsList = _regions.where((element) => element.region!.toLowerCase().contains(s)).toList();
      notifyListeners();
    }
  }

  void previousView(){
    _navigationService.pushNamedAndRemoveUntil(_navigationService.previousRoute);
  }

}