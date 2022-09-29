import 'package:flutter/material.dart';
import 'task_tile.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30.0),
      children: [
        TaskTile(
          text: "Nothing",
        ),
        TaskTile(
          text: "Bidul",
        ),
        TaskTile(
          text: "Bidul",
        ),
      ],
    );
  }
}
