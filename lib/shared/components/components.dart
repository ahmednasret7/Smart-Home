import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = const Color(0xff3428A6),
  bool isUpperCase = true,
  required Function function,
  required String text,
  double borderRadius = 15 ,
  double height = 70 ,
}) =>
    Container(
      width: width,
      height: height,
      // color: background,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: (){
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget defaultTextButton({
  required void Function() function,
  required String text,
}) =>
    TextButton(
        onPressed: function,
        child: Text(text.toUpperCase(),
        ),
    );

Widget defaultformField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function()? onTap,
  Function(String)? onChange,
  required Function(String?) validate,
  required String label,
  required IconData prefix,
  bool isPassword = false,
  bool isClickable = true,
  IconData? suffix,
  Function? suffixPressed,
  String error = '',
}) => TextFormField(
  controller: controller,
  enabled: isClickable,
  obscureText: isPassword,
  validator: (s)=>validate(s),
  keyboardType: type,
  decoration: InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
    errorText: error.isEmpty ? null : error,
    suffixIcon: suffix != null
        ? IconButton(
      icon: Icon(suffix),
      onPressed: (){
        suffixPressed!();
      },
    )
        : null,
    prefixIcon: Icon(prefix),
  ),
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  onTap: onTap,
);

Widget neumorphicButton({
  required VoidCallback onPressed,
  required double size,
  required Widget icon,
  Color backgroundColor = const Color(0xFFE0E5EC),
  Color accentColor = const Color(0xFFB9C1CB),
}) {
  return SizedBox(
    width: size,
    height: size,
    child: Center(
      child: NeumorphicButton(
        onPressed: onPressed,
        style: NeumorphicStyle(
          color: backgroundColor,
          depth: 10,
          intensity: 1,
          lightSource: LightSource.topLeft,
          boxShape: NeumorphicBoxShape.circle(),
        ),
        child: Center(
          child: icon,
        ),
      ),
    ),
  );
}

class NeumorphicButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final double size;
  final Widget icon;
  final Color backgroundColor;
  final Color accentColor;
  final int buttonIndex;
  final int selectedButton;

  NeumorphicButtonWidget({
    required this.onPressed,
    required this.size,
    required this.icon,
    this.backgroundColor = const Color(0xFFE0E5EC),
    this.accentColor = const Color(0xFFB9C1CB),
    required this.buttonIndex,
    required this.selectedButton,
  });
  int get selectedButtonValue => selectedButton;
  @override
  _NeumorphicButtonWidgetState createState() => _NeumorphicButtonWidgetState();
}

class _NeumorphicButtonWidgetState extends State<NeumorphicButtonWidget> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = widget.buttonIndex == widget.selectedButton
        ? Color(0xffe3edf7)
        : widget.backgroundColor;
    double depth = widget.buttonIndex == widget.selectedButton ? -5 : 10;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Center(
        child: NeumorphicButton(
          onPressed: () {
            widget.onPressed();
          },
          style: NeumorphicStyle(
            color: backgroundColor,
            depth: depth,
            intensity: 1,
            lightSource: LightSource.topLeft,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          child: Center(
            child: widget.icon,
          ),
        ),
      ),
    );
  }
}


