import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatelessWidget {
  const SliderScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SliderContainer(),
        ),
      ),
    );
  }
}

class SliderContainer extends StatefulWidget {
  const SliderContainer({Key? key}) : super(key: key);

  @override
  State<SliderContainer> createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  static double lowValue = 0.0;
  static double upperValue = 100.0;
  static double StartValue = 5.0;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: 80,
        activeTrackColor: Colors.blue,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 35.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 60.0),
      ),
      child: Slider(
          min: lowValue,
          max: upperValue,
          value: StartValue,

        onChanged: (value) {
          setState(() {
            StartValue = value;
          });
          print(StartValue.round());


        },
      ),
    );
  }
}

