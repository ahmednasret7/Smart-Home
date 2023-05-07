import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';
import 'package:hi_ddd_test1/shared/components/components.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RunningDevices {
  late final String name;
  late final String time;
  late final Icon icon;
  RunningDevices({
    required this.name,
    required this.time,
    required this.icon,
  });
}

double percent = 0;
final borderRadius = BorderRadius.circular(70);

class living_lights extends StatefulWidget {
  @override
  State<living_lights> createState() => _living_lightsState();
}

String name = "Ahmed";
var logoColor = Colors.black;
const logocolor2 = const Color(0xff6994FE);
const box_back_color = const Color(0xffE3EDF7);
const font_color = const Color(0xff3428A6);
const background_color = const Color(0xffededed);


class _living_lightsState extends State<living_lights> {
  int selectedButton  = 1 ;

  Color selectedcolor = Colors.black;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: background_color,
        body: SafeArea(
          child: Column(
            children: [
              //this the image of the living room + text
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

              //row of buttons
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
                      accentColor: Colors.grey[400]!,
                      size: 70,
                      icon: const Icon(
                        Icons.ac_unit_sharp,
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

              //slider + pic of bulb
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Slider
                    Expanded(
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

                    //Percentage of the Slider
                    Container(
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

                    //light bulb image
                    Image.asset(
                      'assets/images/Light_Bulb_png-removebg-preview.png',
                      color: selectedcolor,
                      height: 300,
                      width: 100,
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                    // SliderTheme(
                    //   data: SliderThemeData(
                    //     trackHeight: 80,
                    //     trackShape: RoundedRectSliderTrackShape(),
                    //     thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
                    //     activeTrackColor: font_color,
                    //     inactiveTrackColor: font_color.withOpacity(0.3),
                    //     thumbColor: Colors.white,
                    //     overlayColor: font_color,
                    //     ),
                    //   child: RotatedBox(
                    //     quarterTurns: 3,
                    //     child: Stack(
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             SizedBox(
                    //               width: 350,
                    //               child: Slider(
                    //                 value: percent,
                    //                 max: 100,
                    //                 min: 0,
                    //                 onChanged: (value) {
                    //                   setState(() {
                    //                     percent = value;
                    //                   });
                    //                   print(percent.round());
                    //                 },
                    //                 onChangeStart: (value) {
                    //                   setState(() {
                    //                     percent = value;
                    //                   });
                    //                 },
                    //               ),
                    //             ),
                    //             Container(
                    //               child: RotatedBox(
                    //                 quarterTurns: 1,
                    //                 child: Text(
                    //                   percent.round().toString()+ '%',
                    //                   style: TextStyle(
                    //                       fontSize: 20
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),


              //spcae
              const SizedBox(
                height: 10,
              ),

              //lights & button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Lights',
                    style: TextStyle(
                      color: font_color,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  NeumorphicButtonWidget(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Pick a color'),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: Colors.grey[300]!,
                                onColorChanged: (color) {
                                  setState(() {
                                    selectedcolor = color;
                                  });
                                  // do something with the selected color
                                },
                                colorPickerWidth: 350.0,
                                pickerAreaHeightPercent: 0.6,
                                enableAlpha: false,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // do something with the selected color
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    backgroundColor: Colors.grey[300]!,
                    accentColor: Colors.grey[400]!,
                    size: 70,
                    icon: const Icon(
                      Icons.colorize_sharp,
                      size: 36,
                      color: Colors.black,
                    ),
                    buttonIndex: 6,
                    selectedButton: selectedButton,
                  ),
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

              const SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: defaultButton(
                  function: () {
                    print('Set Lighting Pressed');
                  },
                  text: 'Set Lighting',
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
