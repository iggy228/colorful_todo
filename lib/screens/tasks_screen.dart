import 'package:colorful_todo/model/task_data.dart';
import 'package:colorful_todo/screens/add_task_screen.dart';
import 'package:colorful_todo/widgets/task_header.dart';
import 'package:colorful_todo/widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  Widget buildBottomModalSheet(BuildContext context) => SingleChildScrollView(
        // ViewInsets access to size of obscured display
        padding: EdgeInsets.fromLTRB(
            16.0, 32.0, 16.0, MediaQuery.of(context).viewInsets.bottom + 8.0),
        child: AddTaskScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: buildBottomModalSheet,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0))),
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
            child: TaskHeader(
              taskCount: Provider.of<TaskData>(context).count,
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
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
