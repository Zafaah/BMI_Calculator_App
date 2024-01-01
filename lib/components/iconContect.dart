import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';

class IconContect extends StatelessWidget {
  IconContect({required this.icon, required this.txt});
  final IconData icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0,),
        Text(txt, style: kLebalTxtStyle,)
      ],);
  }
}