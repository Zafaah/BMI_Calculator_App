import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_app/components/iconContect.dart';
import 'package:bmi_calculator_app/components/redusableCode.dart';
import '../constants.dart';
import 'resultPage.dart';
import 'package:bmi_calculator_app/components/RoundIcon_Button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator_app/calculater.dart';


enum Gender{
  male,
  female

}
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender ;

  int height=180;
  int weight=80;
  int age=22;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCode(
                        onPress: (){
                          setState(() {
                            selectedGender= Gender.male;
                          });
                        },
                        kalar: selectedGender == Gender.male ? kActivekalar : kInActiveColor,
                          CardChild: IconContect(
                            icon:FontAwesomeIcons.mars,
                            txt: "MALE",
                          )
                      ),


                  ),
                  Expanded(
                    child: ReusableCode(
                        onPress: (){
                          setState(() {
                            selectedGender= Gender.female;
                          });
                        },
                      kalar: selectedGender == Gender.female ? kActivekalar : kInActiveColor,
                      CardChild: IconContect(
                        icon: FontAwesomeIcons.venus,
                        txt:"FEMALE"
                      )
                    ),
                  ),
                ],
              )
          ),
          Expanded(
              child:
              ReusableCode(
                onPress: (){

                },
                kalar: kActivekalar,
                CardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text("HEIGHT",style: kLebalTxtStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kTxtStyle),
                        Text("cm",style: kLebalTxtStyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                      ),
                      child: Slider(
                          value:height.toDouble() ,
                          min: 100.0,
                          max: 220.0,
                          onChanged:(double newValue){
                            setState(() {
                              height= newValue.round();
                            });
                          }
                      ),
                    )

                ],
                  
            ),

          )),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: ReusableCode(
                        onPress: (){

                        },
                        kalar: kActivekalar,
                        CardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WEIGHT" , style: kLebalTxtStyle,),
                            Text(weight.toString(), style: kTxtStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      if(weight>1){
                                        weight--;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(width: 10.0,),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      weight++;

                                    });

                                  },

                                ),
                              ],
                            )

                          ],
                      ),
                      ),
                  ),
                  Expanded(
                      child: ReusableCode(
                        onPress: (){

                        },
                        kalar:kActivekalar,
                        CardChild: Column(
                          children: [
                            Text("AGE" , style: kLebalTxtStyle,),
                            Text(age.toString(), style: kTxtStyle,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: (){
                                    setState(() {
                                      if(age>0){
                                        age--;
                                      }

                                    });
                                  },
                                ),
                                SizedBox(width: 10.0,),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: (){
                                    setState(() {
                                      if(age<100){
                                        age++;
                                      }

                                    });

                                  },

                                ),
                              ],
                            )
                          ],),
                      ),
                  )

                ],
              )
          ),
          ButtonBottom(
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
                BmiResult: calc.calcluteBmi(),
                ResutltTxt: calc.getResult(),
                Interpretation: calc.getInterpretation(),
              )));
            },
            ButtonTitle: "Calculator",
          ),

        ],
      )
    );
  }
}





