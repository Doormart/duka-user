import 'package:duka_user/core/models/simulation/simul_models/wallet_model.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/core/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class WalletHistory extends StatelessWidget {
  final WalletModel model;

  const WalletHistory({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          SizeMg.radius(15),
        ),
        color: Palette.offWhite,
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: SizeMg.width(150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Palette.blackGreen,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeMg.text(16),
                  ),
                ),
                Text(
                  Jiffy(DateTime.parse(model.dateTime))
                      .format('EEEE, do MMMM, yyyy'),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Palette.darkGrey,
                    fontSize: SizeMg.text(12),
                  ),
                ),
                Text(
                  StringUtils.formatTime12(DateTime.parse(model.dateTime)),
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Palette.darkGrey,
                    fontSize: SizeMg.text(12),
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: '\u{20A6}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: SizeMg.text(16),
                color: model.debit ? Palette.red : Palette.green,
              ),
              children: [
                TextSpan(
                  text: StringUtils.numFormatDecimal(model.price),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
