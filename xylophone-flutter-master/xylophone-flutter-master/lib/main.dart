import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Expanded getButton(int note, Color color){
      return Expanded(
        child: FlatButton(
          onPressed: () {
            final player = AudioCache();
            player.play('note$note.wav');
          },
          color: color,
        ),
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              getButton(1, Colors.blue),
              getButton(2, Colors.teal),
              getButton(3, Colors.orangeAccent),
              getButton(4, Colors.blueGrey),
              getButton(5, Colors.red),
              getButton(6, Colors.pink),
              getButton(7, Colors.deepPurpleAccent),
            ],
          )
        ),
      ),
    );
  }
}
