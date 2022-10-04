import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  TaskTile({required this.text});

  final String text;

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.text,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: TaskListCheckbox(
        checkBoxState: isChecked,
        toggleCheckBoxState: (checkBoxState) {
          setState(() {
            isChecked = checkBoxState!;
          });
        },
      ),
    );
  }
}

class TaskListCheckbox extends StatelessWidget {
  final bool? checkBoxState;
  final Function(bool?)? toggleCheckBoxState;

  TaskListCheckbox(
      {required this.checkBoxState, required this.toggleCheckBoxState});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: checkBoxState,
        activeColor: Colors.blueAccent,
        onChanged: toggleCheckBoxState);
  }
}
