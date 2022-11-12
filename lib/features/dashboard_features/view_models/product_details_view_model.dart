import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/models/simulation/simul_models/order_product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductDetailViewModel extends BaseViewModel {

  int productNumber = 1;
  final _orderProduct = locator<OrderProduct>();

  void increaseProductNumber(){
    productNumber += 1;
    notifyListeners();
  }

  void decreaseProductNumber(){
    productNumber -= 1;
    notifyListeners();
  }

  SnackBar addToCart(Product product){
    String item = productNumber >  2 ? 'items' : 'item';
    int cost = productNumber * product.price!;
    _orderProduct.addProductToOrder(product, productNumber);
    return SnackBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Palette.mainOrange,
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Proceed to order $productNumber $item',
            style: const TextStyle(
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
                    text: StringUtils.numFormatNoDecimal(cost),
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                    ),
                  ),
                ]
            ),
          ),
        ],
      )
    );
  }

}