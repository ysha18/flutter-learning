import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Expanded setButton(int soundNumber, Color color){
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: (){
          final player = AudioCache();
          player.play('note$soundNumber.wav');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              setButton(1, Colors.red),
              setButton(2, Colors.orange),
              setButton(3, Colors.yellow),
              setButton(4, Colors.green),
              setButton(5, Colors.blue),
              setButton(6, Colors.purple),
              setButton(7, Colors.deepPurple),
          ]
          ),
        ),
      ),
    );
  }
}
