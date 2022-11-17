import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/features/more_features/view_models/more_view_model.dart';
import 'package:duka_user/features/more_features/widgets/more_container.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class MoreView extends StatefulWidget {
  const MoreView({Key? key}) : super(key: key);

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      backgroundColor: Palette.offWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'More',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizeMg.text(20),
            color: Palette.blackGreen,
          ),
        ),
      ),
      body: ViewModelBuilder<MoreViewModel>.reactive(
        viewModelBuilder: () => MoreViewModel(),
        builder: (_, model, __) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeMg.width(30),
            vertical: SizeMg.height(64),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: model.moreDetails
                .map(
                  (moreDetail) => MoreContainer(
                    title: moreDetail.name,
                    icon: moreDetail.icon,
                    onTap: () {
                      model.navigation(moreDetail.index);
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
