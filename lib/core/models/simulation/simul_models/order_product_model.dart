import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:stacked/stacked.dart';

class OrderProduct with ReactiveServiceMixin{
  final ReactiveValue<Map<Product, int>> _orderProducts = ReactiveValue<Map<Product, int>>({});
  final ReactiveValue<int> _orderAmount = ReactiveValue<int>(0);

  int get orderAmount => _orderAmount.value;
  Map<Product, int> get orderProducts => _orderProducts.value;

  OrderProduct(){
    listenToReactiveValues([_orderProducts, _orderAmount]);
  }

  void addProductToOrder(Product product, int productAmount) {
    _orderAmount.value = _orderAmount.value + productAmount;
    notifyListeners();
    if (_orderProducts.value.containsKey(product)) {
      _orderProducts.value[product] = productAmount + _orderProducts.value[product]!;
      notifyListeners();
    }
    _orderProducts.value[product] = productAmount;
    notifyListeners();
  }

  void emptyOrder(){
    _orderAmount.value = 0;
    notifyListeners();
    _orderProducts.value = {};
    notifyListeners();
  }
}
