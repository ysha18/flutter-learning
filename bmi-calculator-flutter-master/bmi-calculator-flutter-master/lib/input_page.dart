import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'appItems.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  void updateColor(Gender selectedGender) {
    setState(() {
      maleCardColor = selectedGender == Gender.male ? kActiveCardColor :kInactiveCardColor ;
      femaleCardColor = selectedGender == Gender.female ? kActiveCardColor :kInactiveCardColor ;
    });
  }

  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    gender: Gender.male,
                    onTap: updateColor,
                    cardColor: maleCardColor,
                    cardChild: GenderBoxContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    )
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                        gender: Gender.female,
                        onTap: updateColor,
                        cardColor: femaleCardColor,
                        cardChild: GenderBoxContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                cardColor: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT',
                      style: kIconContentTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),
                          style: kNumbersStyle,
                        ),
                        Text('cm',
                          style: kIconContentTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: kSliderActiveColor,
                        activeTrackColor: kSliderActiveColor,
                        inactiveTrackColor: kInactiveCardColor,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 26.0),

                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )

                  ],
                ),

            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      cardColor: kActiveCardColor,
                    cardChild: AgeWeightContent(
                      attribute: weight,
                      onTapMinus: () => setState(() {
                          weight--;
                        }),
                      onTapPlus: () => setState((){
                        weight++;
                    }),
                      label: 'WEIGHT',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardChild: AgeWeightContent(
                      attribute: age,
                      onTapMinus: () => setState(() {
                        age--;
                      }),
                      onTapPlus: () => setState((){
                        age++;
                      }),
                      label: 'AGE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
          label: 'CALCULATE',
          onTap: () {
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
            Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => ResultsPage(
                                      bmiResult: calc.calculateBmi(),
                                      interpretation: calc.getInterpretation(),
                                      resultText: calc.getResult(),
                  ),
              ),
            );
            }, // onTap
          ),
        ],
      ),
    );
  }
}
