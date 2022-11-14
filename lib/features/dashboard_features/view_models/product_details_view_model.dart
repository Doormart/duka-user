import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/models/simulation/simul_models/order_product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_product.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

enum FoodType {type1, type2, type3}
enum DrinkType {type1, type2, type3}

class ProductDetailViewModel extends BaseViewModel {

  int productNumber = 1;
  final _orderProduct = locator<OrderProduct>();
  FoodType foodType = FoodType.type1;
  DrinkType drinkType = DrinkType.type1;

  void increaseProductNumber(){
    productNumber += 1;
    notifyListeners();
  }

  void decreaseProductNumber(){
    productNumber -= 1;
    notifyListeners();
  }

  void changeFoodType(FoodType type){
    foodType = type;
    notifyListeners();
  }

  void changeDrinkType(DrinkType type){
    drinkType = type;
    notifyListeners();
  }

  SnackBar addToCart(VendorProduct vendorProduct){
    String item = productNumber >  2 ? 'items' : 'item';
    int cost = productNumber * vendorProduct.product.price!;
    _orderProduct.addProductToOrder(vendorProduct, productNumber);

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