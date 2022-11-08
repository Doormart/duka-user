import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final int notification;
  final Function() onPressed;

  const NotificationWidget(
      {Key? key, required this.notification, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Stack(
      children: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none_rounded,
          ),
          onPressed: onPressed,
        ),
        Builder(builder: (context) {
          if (notification == 0) {
            return const SizedBox.shrink();
          }
          return Positioned(
            right: 12,
            top: 10,
            child: CircleAvatar(
              radius: SizeMg.radius(8),
              backgroundColor: Palette.mainOrange,
              child: Text(
                notification.toString(),
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: SizeMg.text(11),
                  color: Colors.white,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
