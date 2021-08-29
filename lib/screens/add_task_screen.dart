import 'package:colorful_todo/model/task.dart';
import 'package:colorful_todo/model/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTitle = '';
  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Add Task',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 32.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextField(
          onChanged: (val) => newTitle = val,
          autofocus: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            isDense: true,
            errorText: isEmpty ? 'Must be filled' : null,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (newTitle.isEmpty) {
              setState(() => isEmpty = true);
              return;
            }
            final Task task = Task(name: newTitle);
            context.read<TaskData>().addTask(task);
            Navigator.pop(context);
          },
          child: Text('Add'),
        )
      ],
    );
  }
}
