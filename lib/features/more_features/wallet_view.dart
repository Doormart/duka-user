import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/features/more_features/view_models/wallet_view_model.dart';
import 'package:duka_user/features/more_features/widgets/wallet_history.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WalletView extends StatefulWidget {
  const WalletView({Key? key}) : super(key: key);

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      backgroundColor: Palette.offWhite,
      appBar: AppBar(
        title: Text(
          'Wallet',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: SizeMg.text(20),
            color: Palette.blackGreen,
          ),
        ),
        elevation: 0,
      ),
      body: ViewModelBuilder<WalletViewModel>.reactive(
        viewModelBuilder: () => WalletViewModel(),
        builder: (_, model, __) => SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(21),
                    margin: EdgeInsets.only(
                      top: SizeMg.height(45),
                      right: SizeMg.width(30),
                      left: SizeMg.width(30),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        SizeMg.radius(15),
                      ),
                      color: Palette.blackGreen,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Balance',
                          style: TextStyle(
                            fontSize: SizeMg.text(16),
                            color: Palette.darkGrey,
                          ),
                        ),
                        SizedBox(
                          height: SizeMg.height(11),
                        ),
                        RichText(
                          text: TextSpan(
                            text: '\u{20A6}',
                            style: TextStyle(
                              fontSize: SizeMg.text(25),
                              color: Colors.white,
                              letterSpacing: 1.5,
                            ),
                            children: [
                              TextSpan(
                                text: model.walletBalance,
                              ),
                            ],),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: SizeMg.height(32),
                    ),
                    child: Text(
                      'Transaction history',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: SizeMg.text(20),
                        color: Palette.secondaryBlack,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(
                          SizeMg.radius(50),
                        ),
                        topLeft: Radius.circular(
                          SizeMg.radius(50),
                        ),
                      ),
                      color: Colors.white,
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(
                        top: SizeMg.height(40),
                        left: SizeMg.width(39),
                        right: SizeMg.width(39),
                        bottom: SizeMg.height(16),
                      ),
                      itemBuilder: (ctx, index) =>
                          WalletHistory(model: model.walletModelList[index]),
                      separatorBuilder: (ctx, index) => SizedBox(
                        height: SizeMg.height(16),
                      ),
                      itemCount: model.walletModelList.length,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
