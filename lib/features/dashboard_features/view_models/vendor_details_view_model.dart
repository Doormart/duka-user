import 'dart:async';
import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/models/simulation/simul_models/order_product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';
import 'package:duka_user/core/models/simulation/simul_values.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum DeliveryArrival { delivery, pickUp }

class VendorDetailsViewModel extends BaseViewModel {
  final List<Product> _listProduct = productList;
  final _navigationService = locator<NavigationService>();
  final _orderProduct = locator<OrderProduct>();
  DeliveryArrival deliveryArrival = DeliveryArrival.delivery;

  List<Product>? prodList;
  List<Product>? allProdList;
  List<Product>? comboProdList;
  List<Product>? drinksProdList;
  List<Product>? localProdList;

  void getProducts(Vendor vendor) {
    setBusy(true);
    prodList =
        _listProduct.where((product) => product.vendorId == vendor.id).toList();
    notifyListeners();
    _separateProducts();
    Timer(const Duration(seconds: 3), () {
      setBusy(false);
    });
  }

  void _separateProducts() {
    allProdList = prodList;
    notifyListeners();
    comboProdList = prodList;
    notifyListeners();
    drinksProdList = prodList;
    notifyListeners();
    localProdList = prodList;
    notifyListeners();
  }

  void searchProducts(String? s, int index){
    switch (index){
      case 0:
        if (s == null || s.isEmpty) {
          allProdList = prodList;
          notifyListeners();
        } else {
          allProdList = prodList!
              .where((element) => element.name!.toLowerCase().contains(s))
              .toList();
          notifyListeners();
        }
        return;
      case 1:
        if (s == null || s.isEmpty) {
          comboProdList = prodList;
          notifyListeners();
        } else {
          comboProdList = prodList!
              .where((element) => element.name!.toLowerCase().contains(s))
              .toList();
          notifyListeners();
        }
        return;
      case 2:
        if (s == null || s.isEmpty) {
          drinksProdList = prodList;
          notifyListeners();
        } else {
          drinksProdList = prodList!
              .where((element) => element.name!.toLowerCase().contains(s))
              .toList();
          notifyListeners();
        }
        return;
      default:
        if (s == null || s.isEmpty) {
          localProdList = prodList;
          notifyListeners();
        } else {
          localProdList = prodList!
              .where((element) => element.name!.toLowerCase().contains(s))
              .toList();
          notifyListeners();
        }
        return;
    }
  }

  void changeDeliveryArrival(DeliveryArrival arrival) {
    deliveryArrival = arrival;
    notifyListeners();
  }

  void productDetailScreen(Product product) {
    _navigationService.navigateToProductDetailView(product: product);
  }

  void previousScreen(){
    _navigationService.pushNamedAndRemoveUntil(Routes.dashboardView);
  }

  SnackBar addProductToCart(Product product) {
    _orderProduct.addProductToOrder(product, 1);
    return SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Palette.mainOrange,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1500),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Proceed to order 1 item',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          RichText(
            text: TextSpan(
                text: '\u{20A6}',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: StringUtils.numFormatNoDecimal(product.price),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }
}
