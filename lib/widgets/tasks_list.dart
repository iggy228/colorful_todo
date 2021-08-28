import 'package:colorful_todo/model/task_data.dart';
import 'package:colorful_todo/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (_, taskData, child) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: taskData.count,
          itemBuilder: (_, index) {
          return TaskTile(
            name: taskData.tasks[index].name,
            isChecked: taskData.tasks[index].isDone,
            checkboxCallback: (_) {}
            );
          },
        );
      },
    );
  }
}
