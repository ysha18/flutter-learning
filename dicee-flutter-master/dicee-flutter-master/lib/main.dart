import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.blue[500],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 2;
  int rightDiceNumber = 1;

  @override
  Widget build(BuildContext context) {

    void rollDice(){
      setState(() {
        leftDiceNumber = Random().nextInt(6)+1;
        rightDiceNumber = Random().nextInt(6)+1;
      });
    }

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
                onPressed: () => rollDice(),
                child: Image.asset("images/dice$leftDiceNumber.png")
            ),
          ),
          Expanded(
            child: FlatButton(
                onPressed: () => rollDice(),
                child: Image.asset("images/dice$rightDiceNumber.png")
            ),
          ),
        ],
      ),
    );
  }

}
