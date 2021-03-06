import 'package:flutter/material.dart';
import 'constants.dart';



class ChildCardContents extends StatelessWidget {

  final double iconSize = 80.0;
  String label;
  IconData icon;

  ChildCardContents({this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
            height: 15.0
        ),
        Text(
          label,
          style: kLabelStyle,
        )
      ],
    );
  }
}