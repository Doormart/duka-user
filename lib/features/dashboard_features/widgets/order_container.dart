import 'package:duka_user/core/models/simulation/simul_models/product_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_model.dart';
import 'package:duka_user/core/models/simulation/simul_models/vendor_product.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/core/utils/string_utils.dart';
import 'package:duka_user/features/orders_features/view_models/orders_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OrderContainer extends ViewModelWidget<OrdersViewModel> {
  final VendorProduct vendorProduct;
  final int productAmount;

  const OrderContainer({
    super.key,
    required this.vendorProduct,
    required this.productAmount,
  });

  @override
  Widget build(BuildContext context, OrdersViewModel viewModel) {
    SizeMg.init(context);
    final Vendor vendor = vendorProduct.vendor;
    final Product product = vendorProduct.product;
    final int cost = productAmount * product.price!;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeMg.width(28),
        vertical: SizeMg.height(14),
      ),
      margin: EdgeInsets.only(
        bottom: SizeMg.height(10),
      ),
      color: Colors.white,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${vendor.name}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: SizeMg.text(16),
                      color: Palette.blackGreen,
                    ),
                  ),
                  SizedBox(
                    height: SizeMg.height(14),
                  ),
                  Text(
                    '${productAmount}x ${product.name}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: SizeMg.text(14),
                      color: Palette.darkGrey,
                    ),
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: '\u{20A6}',
                      style: TextStyle(
                        fontSize: SizeMg.text(16),
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        color: Palette.blackGreen,
                      ),
                      children: [
                        TextSpan(
                          text: StringUtils.numFormatDecimal(cost),
                          style: const TextStyle(fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      viewModel.deleteOrder(vendorProduct);
                    },
                    child: const Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          (productAmount > 1) ? viewModel.decreaseOrder(vendorProduct) : null;
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2.0,
                              color: (productAmount > 1) ? Palette.darkGrey : Colors.grey,
                            ),
                          ),
                          child: Icon(
                            Icons.horizontal_rule_rounded,
                            color: (productAmount > 1)? Palette.darkGrey : Colors.grey,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          viewModel.increaseOrder(vendorProduct);
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2.0,
                              color: Palette.darkGrey,
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Palette.darkGrey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
