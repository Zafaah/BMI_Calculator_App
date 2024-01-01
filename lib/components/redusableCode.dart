import 'package:flutter/material.dart';
class ReusableCode extends StatelessWidget {
  ReusableCode({required this.kalar, required this.CardChild, required this.onPress});
  final Color kalar;
  final Widget CardChild ;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        onPress();
      },
      child: Container(
          child:CardChild,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: kalar,
              borderRadius: BorderRadius.circular(10.0)
          ),


      
      
      ),
    );
  }
}