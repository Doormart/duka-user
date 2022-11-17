import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/features/more_features/view_models/support_view_model.dart';
import 'package:duka_user/features/more_features/widgets/more_container.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SupportView extends StatelessWidget {
  const SupportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      backgroundColor: Palette.offWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Support',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizeMg.text(20),
            color: Palette.blackGreen,
          ),
        ),
      ),
      body: ViewModelBuilder<SupportViewModel>.reactive(
        viewModelBuilder: () => SupportViewModel(),
        builder: (_, model, __) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeMg.width(30),
            vertical: SizeMg.height(64),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: model.supportDetails
                .map(
                  (detail) => MoreContainer(
                    title: detail.name,
                    onTap: () {
                      model.navigation(detail.index);
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
