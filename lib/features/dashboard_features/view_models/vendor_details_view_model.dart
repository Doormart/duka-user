import 'dart:async';
import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';
import 'package:duka_user/core/models/simulation/simul_values.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum DeliveryArrival {delivery, pickUp}

class VendorDetailsViewModel extends BaseViewModel {

  final List<Product> _listProduct = productList;
  final _navigationService = locator<NavigationService>();

  DeliveryArrival deliveryArrival = DeliveryArrival.delivery;

  List<Product>? prodList;

  void getProducts(Vendor vendor){
    setBusy(true);
    prodList = _listProduct.where((product) => product.vendorId == vendor.id).toList();
    notifyListeners();
    Timer(const Duration(seconds: 3), () {
      setBusy(false);
    });
  }

  void changeDeliveryArrival(DeliveryArrival arrival){
    deliveryArrival = arrival;
    notifyListeners();
  }

  void productDetailScreen(Product product){
    print(product.description);
  }

  void addProductToCart(Product product){
    print('${product.name} added to cart');
  }
}