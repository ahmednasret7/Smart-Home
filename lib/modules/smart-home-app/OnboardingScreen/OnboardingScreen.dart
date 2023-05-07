import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/LoginScreen/LoginScreen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  bool firstOpen = true;
  void _onIntroEnd(context) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  _buildFullScreenImage() {
    return Container(
      margin: EdgeInsets.all(22),
      child: Image.asset(
        'assets/images/pexels-anna-nekrashevich-6203792.jpg',
        fit: BoxFit.contain,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topCenter,
      ),
    );
  }

  _buildImage(String assetName, [double width = 350]) {
    return Image.asset(
      '$assetName',
      width: width,
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!firstOpen) {
        _onIntroEnd(context);
      }
    });
  }

  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return firstOpen
        ? IntroductionScreen(
            key: introKey,
            globalHeader: Align(
              alignment: Alignment.topRight,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16),
                  child: _buildImage('assets/images/splashScreen.png', 50),
                ),
              ),
            ),
            globalBackgroundColor: Colors.white,
            pages: [
              //failed Onboarding Screen
              // PageViewModel(
              //   bodyWidget: Container(
              //     height: MediaQuery.of(context).size.height * 0.8,
              //     width: MediaQuery.of(context).size.width,
              //     child: Stack(
              //       children: [
              //         Image.asset(
              //           'assets/images/pexels-anna-nekrashevich-6203792.jpg',
              //           height: MediaQuery.of(context).size.height,
              //           width: MediaQuery.of(context).size.width,
              //           fit: BoxFit.cover,
              //         ),
              //         Align(
              //           alignment: Alignment.bottomCenter,
              //           child: Container(
              //             height: MediaQuery.of(context).size.height * 0.4,
              //             width: MediaQuery.of(context).size.width,
              //             color: Colors.white,
              //             child: Padding(
              //               padding: const EdgeInsets.all(32.0),
              //               child: Container(
              //                 color: Colors.transparent,
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   children: [
              //                     Text(
              //                       'Control your home from anywhere',
              //                       style: TextStyle(
              //                         fontSize: 32,
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                     SizedBox(height: 16),
              //                     Text(
              //                       'with our easy-to-use app.',
              //                       style: TextStyle(
              //                         fontSize: 24,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              //   title: 'Welcome to your Smart Home',
              //   decoration: pageDecoration.copyWith(
              //     bodyFlex: 3,
              //     imageFlex: 10,
              //   ),
              // ),
              PageViewModel(
                title: "Welcome to your Smart Home",
                body:"Control your home from anywhere with our easy-to-use app.",
                image: _buildFullScreenImage(),
                decoration: pageDecoration.copyWith(
                  bodyFlex: 3,
                  imageFlex: 10,
                ),
              ),
              PageViewModel(
                title: "Stay Connected",
                body:
                    "Real-time monitoring of activities and instant notifications of any activity.",
                image: SvgPicture.asset('assets/logos/notifications_active_FILL0_wght300_GRAD200_opsz48 - Copy.svg',
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                decoration: pageDecoration.copyWith(
                  bodyFlex: 3,
                  imageFlex: 10,
                  imagePadding: EdgeInsets.symmetric(horizontal: 16),
                  titlePadding: EdgeInsets.only(bottom: 8),
                  pageColor: Colors.transparent,
                ),
              ),
              PageViewModel(
                title: "Set Schedules",
                body:
                    "Create custom schedules for lights, appliances, and more to fit your lifestyle.",
                image: SvgPicture.asset('assets/logos/schedule_FILL0_wght400_GRAD0_opsz48.svg',
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                decoration: pageDecoration.copyWith(
                  bodyFlex: 3,
                  imageFlex: 10,
                  imagePadding: EdgeInsets.symmetric(horizontal: 16),
                  titlePadding: EdgeInsets.only(bottom: 8),
                  pageColor: Colors.transparent,
                ),
              ),
              PageViewModel(
                title: "Get Started",
                bodyWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Tap to begin", style: bodyStyle),
                  ],
                ),
                image: SvgPicture.asset('assets/logos/home_FILL0_wght300_GRAD-25_opsz48.svg',
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                decoration: pageDecoration.copyWith(
                  bodyFlex: 3,
                  imageFlex: 10,
                  imagePadding: EdgeInsets.symmetric(horizontal: 16),
                  titlePadding: EdgeInsets.only(bottom: 8),
                  pageColor: Colors.transparent,
                ),
              ),
            ],
            onDone: () => _onIntroEnd(context),
            showSkipButton: true,
            skip: const Text('Skip',
                style: TextStyle(fontWeight: FontWeight.w300 , fontSize: 18)
            ),
            next: const Icon(Icons.arrow_forward),
            done: const Text('Get started',
                style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 18)),
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Theme.of(context).primaryColor,
              color: const Color(0xFFBDBDBD),
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),

              ),
              ),
              )
        : Text('HI') //
    // el mafrood yroo7 3ala el home page lawo mesh his first time to open the app
    ;
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Home App'),
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
