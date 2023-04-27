import 'package:flutter/material.dart';
import 'package:hi_ddd_test1/shared/components/components.dart';

class living_curtains extends StatefulWidget {
  const living_curtains({Key? key}) : super(key: key);

  @override
  State<living_curtains> createState() => _living_curtainsState();
}
String name = "Ahmed";
var logoColor = Colors.black;
const logocolor2 = const Color(0xff6994FE);
const box_back_color = const Color(0xffE3EDF7);
const font_color = const Color(0xff3428A6);
const background_color = const Color(0xffededed);
const track_start = const Color(0xffe01e2f);
const track_end = const Color(0xff0ae6fd);
List<Color> colors = [  track_start, track_end ];
class _living_curtainsState extends State<living_curtains> {
  @override
  int selectedButton  = 3 ;
  Color selectedcolor = Colors.black;
  double percent = 50;
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              //image of living room + text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Transform.scale(
                      scaleX: -1,
                      child: const Image(
                        image:
                        AssetImage('assets/images/living-room-image.png'),
                        height: 100,
                        width: 100,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'Living Room',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins',
                          color: font_color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //row of devices
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NeumorphicButtonWidget(
                    onPressed: () {
                      setState(() {
                        selectedButton = 1;
                      });
                    },
                    backgroundColor: Colors.grey[300]!,
                    accentColor: Colors.grey[400]!,
                    size: 70,
                    icon: const Icon(
                      Icons.light_mode_sharp,
                      size: 36,
                    ),
                    buttonIndex: 1,
                    selectedButton : selectedButton,
                  ),
                  NeumorphicButtonWidget(
                    onPressed: () {
                      setState(() {
                        selectedButton = 2;
                      });
                    },
                    backgroundColor: selectedButton == 2 ? font_color :  Colors.grey[300]!,
                    accentColor: Color(0xffe3edf7),
                    size: 70,
                    icon: const Icon(
                      Icons.air_sharp,
                      size: 36,
                    ), buttonIndex: 2,
                    selectedButton: selectedButton,),
                  NeumorphicButtonWidget(
                    onPressed: () {
                      setState(() {
                        selectedButton = 3;
                      });
                    },
                    backgroundColor: selectedButton == 3 ? font_color :  Colors.grey[300]!,
                    accentColor: Colors.grey[400]!,
                    size: 70,
                    icon: const Icon(
                      Icons.curtains_sharp,
                      size: 36,
                    ),
                    buttonIndex: 3,
                    selectedButton: selectedButton,
                  ),
                  NeumorphicButtonWidget(

                    onPressed: () {
                      setState(() {
                        selectedButton = 4;

                      });
                    },
                    backgroundColor: selectedButton == 4 ? font_color :  Colors.grey[300]!,
                    accentColor: Colors.grey[400]!,
                    size: 70,
                    icon: const Icon(
                      Icons.add,
                      size: 36,
                    ),
                    buttonIndex: 4,
                    selectedButton: selectedButton,
                  ),
                ],
              ),

              SizedBox(height: 10,),

              //Slider & Percentage and png
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //Slider
                    Expanded(
                      child: Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: RotatedBox(
                              quarterTurns: 3,
                              child: SliderTheme(
                                data: SliderThemeData(
                                  trackHeight: 80,
                                  trackShape: const RoundedRectSliderTrackShape(),
                                  thumbShape:const RoundSliderThumbShape(enabledThumbRadius: 40),
                                  activeTrackColor: font_color,
                                  inactiveTrackColor: font_color.withOpacity(0.3),
                                  thumbColor: Colors.white,
                                  overlayColor: font_color,
                                ),
                                child: SizedBox(
                                  width: 350,
                                  child: Slider(
                                    value: percent,
                                    max: 100,
                                    min: 0,
                                    divisions: 10,
                                    onChanged: (value) {
                                      setState(() {
                                        percent = value;
                                      });
                                      print(percent.round());
                                    },
                                    onChangeStart: (value) {
                                      setState(() {
                                        percent = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),

                    //Percentage of the Slider & High & low
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //high text
                        Container(
                          height: 70,
                          alignment: Alignment.center,
                          child: const Text(
                            'High',
                            style: TextStyle(
                              color: font_color,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        //%
                        Center(
                          child: Container(
                            width: 120,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                percent.round().toString() + '%',
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //Low text
                        Container(
                          height: 70,
                          child: const Text(
                            'Low',
                            style: TextStyle(
                              color: font_color,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        // SizedBox(height: 0,),
                      ],
                    ),

                    //Curtain image
                    ClipRect(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.5,
                        child: Image.asset(
                          'assets/images/curtains.png',
                          scale: 2,
                          color: percent == 100 ? Colors.green : percent == 0 ? Colors.red : Colors.orange,
                        ),
                      ),
                    ),
                    ],
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              //On/Off button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NeumorphicButtonWidget(
                    onPressed: (){},
                    backgroundColor: Colors.grey[300]!,
                    accentColor: Colors.grey[400]!,
                    size: 70,
                    icon: const Icon(Icons.power_settings_new_sharp,
                      size: 36,
                      color: Colors.redAccent,
                    ),
                    buttonIndex: 7,
                    selectedButton: selectedButton,
                  ),
                ],
              ),

              //Set Opening button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: defaultButton(
                  function: () {
                    print('Set opening Pressed');
                  },
                  text: 'Set Opening',
                  width: 300,
                  height: 60,
                  borderRadius: 35,
                  isUpperCase: false,
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
