import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/models/simulation/simul_models/more_container_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MoreViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<MoreContainerModel> moreDetails = [
    MoreContainerModel(
      name: 'Wallet',
      index: 0,
      icon: Icons.account_balance_wallet_rounded,
    ),
    MoreContainerModel(
      name: 'FAQs',
      index: 1,
      icon: Icons.question_mark_rounded,
    ),
    MoreContainerModel(
      name: 'Support',
      index: 2,
      icon: Icons.headset_mic_rounded,
    ),
    MoreContainerModel(
      name: 'Referral',
      index: 3,
      icon: Icons.share,
    ),
  ];

  void navigation(int index) {
    switch (index) {
      case 0:
        _navigationService.navigateTo(Routes.walletView);
        return;
      case 1:
        _navigationService.navigateTo(Routes.faqsView);
        return;
      case 2:
        _navigationService.navigateTo(Routes.supportView);
        return;
      default:
        _navigationService.navigateTo(Routes.referralView);
        return;
    }
  }
}
