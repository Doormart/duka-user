import 'package:duka_user/core/models/simulation/simul_models/more_container_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SupportViewModel extends BaseViewModel {

  List<MoreContainerModel> supportDetails = [
    MoreContainerModel(
      name: 'Chat',
      index: 0,
    ),
    MoreContainerModel(
      name: 'Instagram',
      index: 1,
    ),
    MoreContainerModel(
      name: 'Whatsapp',
      index: 2,
    ),
    MoreContainerModel(
      name: 'Twitter',
      index: 3,
      icon: Icons.share,
    ),
  ];

  void navigation(int index) {
    switch (index) {
      case 0:
        print('Chat');
        return;
      case 1:
        print('Instagram');
        return;
      case 2:
        print('Whatsapp');
        return;
      default:
        print('Twitter');
        return;
    }
  }
}
