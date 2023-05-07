import 'package:flutter/material.dart';
import 'package:hi_ddd_test1/shared/components/components.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class living_ac extends StatefulWidget {
  const living_ac({Key? key}) : super(key: key);

  @override
  State<living_ac> createState() => _living_acState();
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

class _living_acState extends State<living_ac> {
  int selectedButton  = 2 ;
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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

                SizedBox(height: 50),

                //the temp circular slider
                SleekCircularSlider(
                   appearance: CircularSliderAppearance(
                   size: 250,
                   infoProperties: InfoProperties(
                     modifier: (value){
                       var roundedValue = value.ceil().toInt().toString();
                       return '$roundedValue°C';
                     },
                     bottomLabelText: 'Temp.',

                     bottomLabelStyle: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 20,

                       ),

                   ),
                   customColors: CustomSliderColors(
                     trackColors: colors,
                     progressBarColors: colors,
                     shadowMaxOpacity: 0.1,
            ),
            // customWidths: CustomSliderWidths(
            //     trackWidth: 20,
            //     handlerSize: 10,
            //     shadowWidth: 25,
            // ),
            ),

                 min: 16,
                 max: 30,
                 initialValue: (16+30)/2,
                 onChange: (double value) {
                 print(value);
                 }),

                //text hot & cold
                /* Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'Cold',
                        style: TextStyle(
                          color: track_end,
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text('Hot',
                        style: TextStyle(
                          color: track_start,
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    ],
                ),*/


                //space
                Expanded(
                  child: const SizedBox(
                    height: 20,
                  ),
                ),

                //  ON/Off & Power saving Mode Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textBaseline:TextBaseline.alphabetic,
                    children: [

                      Row(
                        children: [
                          NeumorphicButtonWidget(
                            onPressed: (){},
                            backgroundColor: Colors.grey[300]!,
                            accentColor: Colors.grey[400]!,
                            size: 70,
                            icon: const Icon(Icons.energy_savings_leaf_sharp,
                              size: 36,
                              color: Colors.green,
                            ),
                            buttonIndex: 7,
                            selectedButton: selectedButton,
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 50,
                            child: const Text(
                              'Power Saving mode',
                              style: TextStyle(
                                color: font_color,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,

                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
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
                ),

                SizedBox(height: 10,),

                //Bootom Button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: defaultButton(
                    function: () {
                      print('Set Temperature Pressed');
                    },
                    text: 'Set Temperature',
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
