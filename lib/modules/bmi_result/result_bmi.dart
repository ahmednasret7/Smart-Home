import 'package:flutter/material.dart';

class result_bmi1 extends StatelessWidget {

  final double result ;
  final bool isMale ;
  final double age ;
  result_bmi1({
    required this.result,
    required this.age,
    required this.isMale,
  });

  String getBMICategory() {
    if (result < 18.5) {
      return 'Underweight';
    } else if (result >= 18.5 && result < 25) {
      return 'Normal';
    } else if (result >= 25 && result < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
  @override
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${isMale ? 'Male' : 'Female'}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              'Age : ${age.round()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              'BMI : ${result.round()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w100,
              ),
            ),
            Text(
              'Category: ${getBMICategory()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
