import 'package:flutter/material.dart';
import '../model/task.dart';
import 'task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  List<Task> tasks = [
    Task(name: 'Work'),
    Task(name: 'Play'),
    Task(name: 'Pray'),
  ];

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
