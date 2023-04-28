import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hi_ddd_test1/layout/home_layout.dart';
import 'package:hi_ddd_test1/modules/Living_Lights/living_lights.dart';
import 'package:hi_ddd_test1/modules/bmi_screen1/bmi_screen1.dart';
import 'package:hi_ddd_test1/modules/home/home_screen.dart';
import 'package:hi_ddd_test1/modules/living_ac/living_ac.dart';
import 'package:hi_ddd_test1/modules/living_curtains/living_Curtains.dart';
import 'package:hi_ddd_test1/modules/messenger/messenger.dart';
import 'package:hi_ddd_test1/modules/bmi_result/result_bmi.dart';
import 'package:hi_ddd_test1/modules/newTasks/NewTasksScreen.dart';
import 'package:hi_ddd_test1/modules/slider.dart';
import 'package:hi_ddd_test1/modules/smart_home_home_screen/about.dart';
import 'package:hi_ddd_test1/modules/smart_home_home_screen/smart_home_home_screen.dart';
import 'package:hi_ddd_test1/modules/splash_screen/splash_screen.dart';
import 'package:hi_ddd_test1/modules/userscreen/Userscreen.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:hi_ddd_test1/modules/LoginScreen/LoginScreen.dart';
import 'modules/OnboardingScreen/OnboardingScreen.dart';

void main() {
  runApp(myapp());
}
//stateless

//stateful
 class myapp extends StatelessWidget
 {
  @override
  Widget build(BuildContext context)
  {
   return MaterialApp(
    debugShowCheckedModeBanner:false ,
     title: 'Smart Home',
     home: OnboardingScreen(),
   );
  }

 }


