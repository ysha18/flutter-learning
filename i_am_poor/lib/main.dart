import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text("I AM POOR"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Image(
          image: AssetImage("images/sad_face.png"),
        ),
      ),
    ),
  )
);
