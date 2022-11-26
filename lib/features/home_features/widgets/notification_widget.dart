import 'package:badges/badges.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final int notification;
  final VoidCallback onPressed;

  const NotificationWidget(
      {Key? key, required this.notification, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    if (notification < 1){
      return IconButton(
        icon: const Icon(
          Icons.notifications_none_rounded,
        ),
        onPressed: onPressed,
      );
    }
    return Badge(
      position: BadgePosition.topEnd(top: 8, end: 8),
      badgeContent: Text(
        '$notification',
        style: TextStyle(
          color: Colors.white,
          fontSize: SizeMg.text(12),
        ),
      ),
      elevation: 0,
      badgeColor: Palette.mainOrange,
      child: IconButton(
        icon: const Icon(
          Icons.notifications_none_rounded,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
