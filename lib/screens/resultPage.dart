import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:bmi_calculator_app/components/redusableCode.dart';
import 'inputFile.dart';
import '../components/bottom_button.dart';
class ResultPage extends StatelessWidget {
  ResultPage({required this.BmiResult, required this.Interpretation, required this.ResutltTxt});
  final String BmiResult;
  final String ResutltTxt;
  final String Interpretation;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text("your Result", style: kTitleStyle,),
              )
          ),
          Expanded(
            flex: 5,
              child:ReusableCode(

                kalar: kActivekalar,
                onPress: (){},
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(ResutltTxt.toUpperCase(), style: kResutlStyle,),
                    Text(BmiResult, style: kBmiStyle,),
                    Text(Interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,)
                  ],
                ),
              )
          ),
          ButtonBottom(
              onTap: (){
                Navigator.pop(context);
                },
              ButtonTitle:"Re_Calculator")
        ],
      )
    );
  }
}
