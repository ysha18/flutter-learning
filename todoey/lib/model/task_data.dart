import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todoey/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Work'),
    Task(name: 'Play'),
    Task(name: 'Pray'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTile) {
    final task = Task(name:newTaskTile);
    _tasks.add(task);
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }
}
