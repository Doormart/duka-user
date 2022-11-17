import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';

class OrderTrackingView extends StatefulWidget {
  const OrderTrackingView({Key? key}) : super(key: key);

  @override
  State<OrderTrackingView> createState() => _OrderTrackingViewState();
}

class _OrderTrackingViewState extends State<OrderTrackingView> {
  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Palette.blackGreen,
          ),
        ),
        title: Text(
          'Track Order',
          style: TextStyle(
            fontSize: SizeMg.text(20),
            color: Palette.blackGreen,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Order tracking',
        ),
      ),
    );
  }
}
