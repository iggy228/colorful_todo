import 'package:colorful_todo/model/task.dart';
import 'package:colorful_todo/widgets/task_tile.dart';
import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;

  TaskList({required this.tasks});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: widget.tasks.length,
      itemBuilder: (_, index) {
        return TaskTile(
          name: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkboxCallback: (_) => setState(() => widget.tasks[index].toggleDone())
        );
      },
    );
  }
}
