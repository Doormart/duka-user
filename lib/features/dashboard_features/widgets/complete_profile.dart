import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {

  bool visible = true;

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);

    Widget body = Container(
      margin: EdgeInsets.only(
        left: SizeMg.width(21),
        right: SizeMg.width(21),
        bottom: SizeMg.height(46),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeMg.width(25),
        vertical: SizeMg.height(15),
      ),
      decoration: BoxDecoration(
        color: Palette.fadedOrange,
        borderRadius: BorderRadius.circular(
          SizeMg.radius(20),
        ),
        border: Border.all(
          color: Palette.staleBlue,
        ),
      ),
      child: RichText(
        text: TextSpan(
          text: 'You can complete your account setup information ',
          style: TextStyle(
            fontSize: SizeMg.text(16),
            color: Palette.blackGreen,
          ),
          children: [
            TextSpan(
              text: 'here',
              style: const TextStyle(
                color: Palette.mainOrange,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                //TODO Profile view
                  print('hello');
                },
            ),
          ],
        ),
      ),
    );

    Widget footer = Positioned(
      right: 10,
      top: 0,
      child: CircleAvatar(
        backgroundColor: Palette.midOrange,
        radius: SizeMg.radius(20),
        child: GestureDetector(
          onTap: (){
            setState(() {
              visible = !visible;
            });
          },
          child: const Icon(
            Icons.close,
            color: Palette.mainOrange,
            size: 23,
          ),
        ),
      ),
    );

    return Visibility(
      visible: visible,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: body,
          ),
          footer,
        ],
      ),
    );
  }
}
