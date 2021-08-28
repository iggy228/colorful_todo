import 'package:colorful_todo/model/task.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  final void Function(Task task) addTaskCallback;

  AddTaskScreen({
    required this.addTaskCallback,
  });

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTitle = '';

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
        ),
        ElevatedButton(
          onPressed: () => widget.addTaskCallback(Task(name: newTitle)),
          child: Text('Add'),
        )
      ],
    );
  }
}