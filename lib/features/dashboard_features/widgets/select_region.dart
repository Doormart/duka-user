import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';

class SelectRegion extends StatelessWidget {

  final VoidCallback onTap;
  final String? region;

  const SelectRegion({Key? key, required this.onTap, this.region}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_on_rounded,
            color: Palette.mainOrange,
          ),
          SizedBox(
            width: SizeMg.width(5),
          ),
          Text(
            region ?? 'Select region',
            style: TextStyle(
              fontSize: SizeMg.text(15),
              color: Colors.black,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down_rounded,
          ),
        ],
      ),
    );
  }
}
