import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a text',
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          value: isChecked,
          activeColor: Colors.blueAccent,
          onChanged: null)
    );
  }
}

