import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/smart_home_home_screen/smart_home_home_screen.dart';
import 'package:page_transition/page_transition.dart';

class splash_screen extends StatelessWidget {

  @override
  Color background_color = const Color(0xffFaFafa);
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 500,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: background_color,
        pageTransitionType: PageTransitionType.fade,
        splash: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/Handdrawn Outdoor Travel Logo Design.png'),
          radius: 400,
        ),
        nextScreen: HomeScreen());
  }
}
