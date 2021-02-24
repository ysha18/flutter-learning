import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/add_task_screen.dart';
import '../widgets/task_tile.dart';
import '../widgets/task_list.dart';

class TasksScreen extends StatelessWidget {

  List<TaskTile> tasks = [];

  List<TaskTile> getTasks(){
    tasks.add(TaskTile(text: "Buy milk",));
    tasks.add(TaskTile(text: "Get food",));
    return tasks;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top:  60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 30.0,
                    color: Colors.lightGreen,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Todoey',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  '12 tasks',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
              ),
              padding: EdgeInsets.all(00.0),
              child: TaskList(
                
              )
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context) => AddTaskScreen());
        },
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.add),
      ),
    );
  }
}


