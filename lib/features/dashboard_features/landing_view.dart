import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/features/dashboard_features/view_models/landing_view_model.dart';
import 'package:duka_user/features/dashboard_features/widgets/complete_profile.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      body: ViewModelBuilder<LandingViewModel>.reactive(
        viewModelBuilder: () => LandingViewModel(),
        builder: (_, model, __) => SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: SizeMg.height(38),
              ),
              //Complete profile
              CompleteProfile(
                onHereTap: model.profileView,
              ),
              //Others
              GestureDetector(
                onTap: model.dashboardView,
                child: Container(
                  height: SizeMg.height(142),
                  margin: const EdgeInsets.all(21),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      SizeMg.radius(15),
                    ),
                    color: Palette.midOrange,
                    image: const DecorationImage(
                      image: AssetImage(
                        ImageUtils.shopFood,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Shop Food',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeMg.text(25),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  height: SizeMg.height(142),
                  margin: const EdgeInsets.all(21),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      SizeMg.radius(15),
                    ),
                    color: Palette.midMintGreen,
                    image: const DecorationImage(
                      image: AssetImage(
                        ImageUtils.pharmacy,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Pharmacy',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeMg.text(25),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
