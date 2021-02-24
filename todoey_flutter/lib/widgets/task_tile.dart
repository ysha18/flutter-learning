import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  TaskTile({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:Text(text),
      trailing: Checkbox(
        value: false,
      onChanged: null,)
      ,
    );
  }
}