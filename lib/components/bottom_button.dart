import 'package:flutter/material.dart';
import '../constants.dart';

class ButtonBottom extends StatelessWidget {
  ButtonBottom({required this.onTap, required this.ButtonTitle});

  final Function onTap;
  final String ButtonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
          child: Center(
            child: Text(
                ButtonTitle,
                style:kLargeButtonTxtStyle),),
          color: kBottomColor,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height:kBottomContaineHeight


      ),
    );
  }
}
