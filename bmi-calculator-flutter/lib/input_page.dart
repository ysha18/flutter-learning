import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_contents.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender {male,female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  Function onTapGesture(Gender gender){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children : <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: selectedGender==Gender.male ? activeCardColor : inactiveCardColour,
                    cardChild: ChildCardContents(
                      label: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      }
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour:  selectedGender==Gender.female ? activeCardColor : inactiveCardColour,
                    cardChild: ChildCardContents(
                      label: 'FEMALE',
                      icon: FontAwesomeIcons.venus,
                    ),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    }
                  )
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activeCardColor,
            )
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                  )
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                  )
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            height: bottomContainerHeight,
            width: double.infinity,
            color: bottomContainerColor,
          )
        ],
      )
    );
  }
}


