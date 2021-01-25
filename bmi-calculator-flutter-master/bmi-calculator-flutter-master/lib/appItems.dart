import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

enum Gender{male,female}

class ReusableCard extends StatelessWidget {

  final Color cardColor;
  final Widget cardChild;
  final Function onTap;
  final Gender gender;

  ReusableCard({@required this.cardColor, this.cardChild, this.onTap, this.gender});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        onTap(gender);
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class GenderBoxContent extends StatelessWidget {

  final String label;
  final IconData icon;

  GenderBoxContent({this.label,this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 100.0,
        ),
        SizedBox(height: 15.0,),
        Text(label,
          style: kIconContentTextStyle),
      ],
    );
  }
}

class AgeWeightContent extends StatelessWidget  {

  final int attribute;
  final String label;
  final Function onTapMinus;
  final Function onTapPlus;

  AgeWeightContent({this.attribute,this.label,this.onTapMinus,this.onTapPlus});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children :<Widget> [
        Text(label,style: kIconContentTextStyle,),
        Text(attribute.toString(), style: kNumbersStyle,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onTap: onTapMinus,
            ),
            SizedBox(width: 10.0,),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onTap: onTapPlus,
            ),
          ],
        )
      ],
    );
  }
}


class RoundIconButton extends StatelessWidget {

  final IconData icon;
  final Function onTap;

  RoundIconButton({@required this.icon,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      shape: CircleBorder(),
      onPressed: onTap,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0
      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  final String label;
  final Function onTap;

  BottomButton({@required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(child: Text(label,style: kCalculateStyle)),
        width: double.infinity,
        height: kBottomContainerHeight,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: kBottomContainerColor,
        ),
      ),
    );
  }
}
