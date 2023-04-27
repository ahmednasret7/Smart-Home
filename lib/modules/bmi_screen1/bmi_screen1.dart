import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hi_ddd_test1/modules/bmi_result/result_bmi.dart';

class bmi_screen1 extends StatefulWidget {
  const bmi_screen1({Key? key}) : super(key: key);

  State<bmi_screen1> createState() => _bmi_screen1State();
}

class _bmi_screen1State extends State<bmi_screen1> {
  bool isMale = true;
  double height = 167.5;
  double age = 20;
  double weight = 60;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Center(
          child: Text(

            'BMI Calculator',

          ),
        ),
      ),
      backgroundColor: Colors.black87,
      body: Container(
        color: Colors.black87,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: ()
                        {
                        setState(() {
                          isMale = true;
                        });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  image: AssetImage('assets/images/Cristiano Ronaldo - FootyRenders.png') ,
                                  height: 160,
                                  width: 160,
                              ),
                              SizedBox(height: 5),
                              // Text(
                              //   'MALE',
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 30,
                              //     fontWeight: FontWeight.w100,
                              //   ),
                              // ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isMale ? Color(0xFFE8134A) : Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            isMale = false ;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/Alexia Putellas Ballon d’Or 2022 - FootyRenders.png') ,
                                height: 160,
                                width: 160,
                              ),
                              SizedBox(height: 5),
                              // Text(
                              //   'FEMALE',
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 30,
                              //     fontWeight: FontWeight.w100,
                              //   ),
                              // ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: !isMale ? Colors.red : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
            Expanded(
              child:  Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [

                          Text(
                            '${height.round()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w900 ,
                            ),
                          ),
                          SizedBox(width: 4,),
                          Text(
                            'cm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      SliderTheme(
                        data: SliderThemeData(
                          activeTrackColor: Colors.grey,
                          thumbColor: Colors.red,
                        ),
                        child: Slider(
                            value: height,
                            max: 280,
                            min: 55,
                            onChanged: (value){
                              setState(() {
                                height = value;
                              });
                              print(height.round());

                            }
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w100 ,
                              ),
                            ),
                            SizedBox(height: 1,),
                            Text(
                              '${age.round()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w900 ,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  heroTag: 'age+',
                                  mini: true,
                                  backgroundColor: Color(0xFF414552),
                                  child: Icon(
                                    Icons.add_circle_outline_sharp,
                                  ),
                                ),
                                FloatingActionButton(
                                    onPressed: (){
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  heroTag: 'age-',
                                  mini: true,
                                  backgroundColor: Color(0xFF414552),
                                  child: Icon(
                                    Icons.remove_circle_outline_sharp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w100 ,
                              ),
                            ),
                            SizedBox(height: 1,),
                            Text(
                              '${weight.round()}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w900 ,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      weight+=10;
                                    });
                                  },
                                  heroTag: 'weight+',
                                  mini: true,
                                  backgroundColor: Color(0xFF414552),
                                  child: Icon(
                                    Icons.add_circle_outline_sharp,
                                  ),
                                ),
                                FloatingActionButton(
                                  heroTag: 'weight-',
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  mini: true,
                                  backgroundColor: Color(0xFF414552),
                                  child: Icon(
                                    Icons.remove_circle_outline_sharp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.red,
              child: MaterialButton(
                onPressed: (){
                  double result = weight /pow(height/100, 2);
                  print(result.round());
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => result_bmi1(
                          age: age,
                          isMale: isMale,
                          result:  result,

                        ),
                      )
                  );
                },
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
