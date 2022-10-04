import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('Add Task',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0
            ),),
            const TextField(
              textAlign: TextAlign.center,
              autofocus: true,
            ),
            FlatButton(
              child: Text('Add',
              style: TextStyle(
                color: Colors.white,
              ),
              ),
              autofocus: true,
              color: Colors.blueAccent,
              onPressed: (){

              },
            )
          ],
        ),
      ),
    );
  }
}
