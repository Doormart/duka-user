import 'package:duka_user/core/models/simulation/simul_models/order_model.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/core/utils/string_utils.dart';
import 'package:flutter/material.dart';

class CompletedOrderBox extends StatelessWidget {

  final Order completedOrder;

  const CompletedOrderBox({Key? key, required this.completedOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeMg.width(20),
          vertical: SizeMg.height(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${completedOrder.vendor.name}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: SizeMg.text(16),
                      color: Palette.blackGreen,
                    ),
                  ),
                  SizedBox(
                    height: SizeMg.height(10),
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: '\u20A6',
                      style: TextStyle(
                        fontSize: SizeMg.text(14),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                        color: Palette.green,
                      ),
                      children: [
                        TextSpan(
                          text: StringUtils.numFormatDecimal(completedOrder.total),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Text(
                StringUtils.formatCompletedOrderDate(completedOrder.deliveryDeparture),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: SizeMg.text(12),
                  color: Palette.darkGrey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
