import 'package:flutter/material.dart';

void main() => runApp(MyApp());

var kCardsColor = Colors.black;

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Scaffold(
          backgroundColor: Colors.orangeAccent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/avatar.png'),
                ),
                Text(
                  'Harold Yeo',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                  ),
                ),
                Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro',
                    letterSpacing: 10.0,
                  ),
                ),
                SizedBox(height: 30.0, width: 150.0,child: Divider(),),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    title: Text(
                      '+1 334 443 3443',
                      style: TextStyle(fontSize:20.0, color: kCardsColor),
                    ),
                  ),
                ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: kCardsColor,
                    ),
                    title: Text(
                      'haroldyeo@gmail.com',
                      style: TextStyle(fontSize:20.0, color: kCardsColor),
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      )
    );
  }
}
