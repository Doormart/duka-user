import 'dart:async';

import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/models/simulation/simul_models/order_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/order_product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_product.dart';
import 'package:duka_user/core/models/simulation/simul_values.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum DeliveryTime {now, schedule}

enum PaymentMethod {wallet, card}

class OrdersViewModel extends BaseViewModel {
  //Ongoing properties
  final _orderProduct = locator<OrderProduct>();
  final _navigationService = locator<NavigationService>();

  DeliveryTime deliveryTime = DeliveryTime.now;
  PaymentMethod paymentMethod = PaymentMethod.wallet;

  Map<VendorProduct, int> get orderProduct => _orderProduct.orderProducts;
  Map<VendorProduct, int> get placedOrderProduct => _orderProduct.placedOrderProducts;

  int get subTotal {
    int num = 0;
    orderProduct.forEach((key, value) {
      num += (key.product.price! * value);
    });
    return num;
  }

  int get deliveryFee {
    int num = 0;
    orderProduct.forEach((key, value) {
      int? order = int.tryParse(key.vendor.minOrder!);
      num += order ?? 0;
    });
    return num;
  }

  int get total => subTotal + deliveryFee;

  //Ongoing Functions
  void deleteOrder(VendorProduct vendorProduct){
   _orderProduct.removeProductToOrder(vendorProduct);
   notifyListeners();
  }

  void increaseOrder(VendorProduct vendorProduct){
   _orderProduct.addProductToOrder(vendorProduct, 1);
   notifyListeners();
  }

  void decreaseOrder(VendorProduct vendorProduct){
    _orderProduct.reduceProductToOrder(vendorProduct, 1);
    notifyListeners();
  }

  void changeDeliveryTime(DeliveryTime time){
    deliveryTime = time;
    notifyListeners();
  }

  void changePaymentMethod(PaymentMethod payment){
    paymentMethod = payment;
    notifyListeners();
  }

  void checkOut(){
    _orderProduct.addToPlacedOrder();
    cancelOrder();
  }

  void cancelOrder(){
    _orderProduct.emptyOrder();
    notifyListeners();
  }

  void orderPlacedView(){
    _navigationService.navigateTo(Routes.orderPlacedView);
  }



  //CompletedProperties
  List<Order>? completedOrders;

  void getCompletedOrders(){
    completedOrders = completedOrderList;
    notifyListeners();
  }


  void init(){
    setBusy(true);
    getCompletedOrders();
    Timer(const Duration(seconds: 5), (){
      setBusy(false);
    });
  }
  void rateOrder(double rating){
    print(rating);
  }
}