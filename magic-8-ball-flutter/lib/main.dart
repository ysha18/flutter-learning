import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.lightGreen,
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("ASK ME ANYTHING",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                )
            ),
          ),
          body: MagicBall(),
        ),
      ),
    );

class MagicBall extends StatefulWidget {
  @override
  _MagicBallState createState() => _MagicBallState();
}

class _MagicBallState extends State<MagicBall> {
  int imageId = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
          child: Image(
            image: AssetImage('images/ball$imageId.png'),
          ),
          onPressed:(){
            setState(() {
              imageId = Random().nextInt(5) + 1;
            });
          }
      ),
    );
  }
}
