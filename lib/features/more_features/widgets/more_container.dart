import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';

class MoreContainer extends StatelessWidget {

  final String title;
  final IconData? icon;
  final VoidCallback onTap;

  const MoreContainer({
    Key? key,
    required this.title,
    this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: SizeMg.height(17),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeMg.width(20),
          vertical: SizeMg.height(24),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            SizeMg.radius(15),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: icon != null,
              child: CircleAvatar(
                backgroundColor: Palette.midOrange,
                radius: SizeMg.radius(20),
                child: Icon(
                  icon,
                  color: Palette.mainOrange,
                ),
              ),
            ),
            SizedBox(
              width: SizeMg.width(10),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: SizeMg.text(20),
                color: Palette.secondaryBlack,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              color: icon != null ? Palette.mainOrange : Palette.secondaryBlack,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}
