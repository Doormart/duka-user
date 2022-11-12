import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/models/simulation/simul_models/order_product_model.dart';
import 'package:duka_user/core/utils/box_storage_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stacked/stacked.dart';

class DashboardViewModel extends IndexTrackingViewModel{

  final _orderProduct = locator<OrderProduct>();
  final box = GetStorage();
  int _index = 0;

  @override
  int get currentIndex {
    init();
    return _index;
  }

  void init(){
    if (box.read(StorageUtils.profileView) == true){
      box.remove(StorageUtils.profileView);
      _index = 2;
    }
  }

  @override
  void setIndex(int value) {
    _index = value;
    notifyListeners();
  }

  int get orders {
    return _orderProduct.orderAmount;
  }

}