import 'dart:async';
import 'package:duka_user/core/utils/color_utils.dart';
import 'package:duka_user/core/utils/images_utils.dart';
import 'package:duka_user/core/utils/size_manager.dart';
import 'package:duka_user/features/onboarding_features/onboarding_view.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 600),
    vsync: this,
  );

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0.5, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOut,
  ));

  Route _createRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 400),
      barrierColor: Colors.transparent,
      pageBuilder: (context, animation, secondaryAnimation) =>
          const OnboardingView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offset = Tween<Offset>(
                begin: const Offset(0.0, 1.0), end: Offset.zero)
            .animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
        return SlideTransition(
          position: offset,
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _controller.forward();

    _controller.addListener(() {
      setState(() {});
    });

    super.initState();

    Timer(const Duration(milliseconds: 1500),
        () => Navigator.pushReplacement(context, _createRoute()));
  }

  @override
  Widget build(BuildContext context) {
    SizeMg.init(context);
    return Scaffold(
      backgroundColor: Palette.mainOrange,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeMg.width(82),
          ),
          child: SlideTransition(
            position: _offsetAnimation,
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    ImageUtils.splashLogo,
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.fitHeight,
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: _controller.value,
                    child: Text(
                      'uka',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeMg.text(70),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
