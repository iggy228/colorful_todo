import 'package:colorful_todo/model/task.dart';
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
          padding: EdgeInsets.zero,
          itemCount: taskData.count,
          itemBuilder: (_, index) {
            final Task task = taskData.tasks[index];
            return TaskTile(
              name: task.name,
              isChecked: task.isDone,
              checkboxCallback: (_) => taskData.updateTask(task),
              dismissCallback: (_) => taskData.removeTask(task),
            );
          },
        );
      },
    );
  }
}
