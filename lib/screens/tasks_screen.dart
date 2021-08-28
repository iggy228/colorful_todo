import 'package:colorful_todo/model/task.dart';
import 'package:colorful_todo/screens/add_task_screen.dart';
import 'package:colorful_todo/widgets/tasks_list.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Buy a milk'),
    Task(name: 'Buy an apples'),
    Task(name: 'Code more and have a fun'),
  ];

  Widget buildBottomModalSheet(BuildContext context) => SingleChildScrollView(
    // ViewInsets access to size of obscured display
    padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, MediaQuery.of(context).viewInsets.bottom + 8.0),
    child: AddTaskScreen(addTaskCallback: (task) {
      setState(() => tasks.add(task));
      Navigator.pop(context);
    }),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: buildBottomModalSheet,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)
            )),
            isScrollControlled: true,
        ),
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(30, 60, 30, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Colorful Todos',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 50.0,
                  ),
                ),
                Text(
                  '${tasks.length} tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.0),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Colors.white,
              ),
              child: TaskList(tasks: tasks),
            ),
          ),
        ],
      ),
    );
  }
}