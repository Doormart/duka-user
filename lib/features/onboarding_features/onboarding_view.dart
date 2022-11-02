import 'package:duka_user/core/app/app.locator.dart';
import 'package:duka_user/core/app/app.router.dart';
import 'package:duka_user/core/shared_widgets/buttons.dart';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _navigationService = locator<NavigationService>();

  int currentIndex = 0;
  late PageController _controller;

  final List<String> onBoardingImages = [
    ImageUtils.firstOnboarding,
    ImageUtils.secondOnboarding,
    ImageUtils.thirdOnboarding,
  ];

  final List<String> onBoardingLoad = [
    ImageUtils.firstOnboardingLoad,
    ImageUtils.secondOnboardingLoad,
    ImageUtils.thirdOnboardingLoad,
  ];

  final List<Color> onBoardingColors = [
    Palette.blackGreen,
    Palette.green,
    Palette.altGreen,
  ];

  final List<Color> onBoardingContainerColors = [
    Palette.green,
    Palette.altGreen,
    Palette.blackGreen,
  ];

  final List<String> onBoardingTitle = [
    'Use DUKA to search for vendors  around your region/location and place your order',
    'DUKA also allows you to track your order from the vendor to the delivery',
    'Now you can enjoy your order and rate the delivery & vendor.',
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemCount: onBoardingImages.length,
            itemBuilder: (_, int index) {
              return Container(
                color: onBoardingColors[index],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      onBoardingImages[index],
                      height: SizeMg.height(600),
                    ),
                  ],
                ),
              );
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeMg.width(25),
              vertical: SizeMg.height(25),
            ),
            height: deviceHeight / 3,
            decoration: BoxDecoration(
              color: onBoardingContainerColors[currentIndex],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(SizeMg.radius(50)),
                topRight: Radius.circular(SizeMg.radius(50)),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: (currentIndex != 2),
                  child: GestureDetector(
                    onTap: () {
                      _controller.animateToPage(2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SizeMg.text(25),
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: SizeMg.width(25.0)),
                  child: Text(
                    onBoardingTitle[currentIndex],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: SizeMg.text(16),
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (currentIndex != 2) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Visibility(
                            visible: currentIndex == 1,
                            child: GestureDetector(
                              onTap: () {
                                _controller.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: Text(
                                'Prev',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: SizeMg.text(25),
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeOut);
                            },
                            child: Text(
                              'Next',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: SizeMg.text(25),
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      );
                    }
                    return PrimaryButton(
                      buttonConfig: ButtonConfig(
                        text: 'Get started',
                        action: () {
                          _navigationService
                              .pushNamedAndRemoveUntil(Routes.authHomeView);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: deviceHeight / 4,
            left: deviceWidth / 2.8,
            child: Image.asset(
              onBoardingLoad[currentIndex],
              scale: 4.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
