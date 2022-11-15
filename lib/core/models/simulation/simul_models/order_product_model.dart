import 'package:duka_user/core/models/simulation/simul_models/vendor_product.dart';
import 'package:stacked/stacked.dart';

class OrderProduct with ReactiveServiceMixin {
  final ReactiveValue<Map<VendorProduct, int>> _orderProducts =
      ReactiveValue<Map<VendorProduct, int>>({});

  final ReactiveValue<Map<VendorProduct, int>> _placedOrderProducts =
  ReactiveValue<Map<VendorProduct, int>>({});

  int get orderAmount => _orderProducts.value.values
      .fold(0, (previousValue, element) => previousValue + element);

  Map<VendorProduct, int> get orderProducts => _orderProducts.value;
  Map<VendorProduct, int> get placedOrderProducts => _placedOrderProducts.value;

  OrderProduct() {
    listenToReactiveValues(
      [
        _orderProducts,
        _placedOrderProducts,
      ],
    );
  }

  void addProductToOrder(VendorProduct vendorProduct, int productAmount) {
    List<VendorProduct> checkList = _orderProducts.value.keys.where((element) => element.vendor.name == vendorProduct.vendor.name && element.product.name == vendorProduct.product.name).toList();
    if (checkList.isNotEmpty){
      _orderProducts.value[checkList[0]] = _orderProducts.value[checkList[0]]! + productAmount;
      notifyListeners();
      return;
    }
    _orderProducts.value[vendorProduct] = productAmount;
    notifyListeners();
  }

  void removeProductToOrder(VendorProduct vendorProduct) {
    _orderProducts.value.remove(vendorProduct);
    notifyListeners();
  }

  void reduceProductToOrder(VendorProduct vendorProduct, int productAmount) {
    _orderProducts.value[vendorProduct] =
        _orderProducts.value[vendorProduct]! - productAmount;
    notifyListeners();
  }

  void emptyOrder() {
    _orderProducts.value = {};
    notifyListeners();
  }

  void addToPlacedOrder(){
    _placedOrderProducts.value.addAll(_orderProducts.value);
    notifyListeners();
  }
}
