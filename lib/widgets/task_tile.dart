import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String name;
  final void Function(bool? value) checkboxCallback;
  final void Function(DismissDirection direction) dismissCallback;

  TaskTile({
    required this.isChecked,
    required this.name,
    required this.checkboxCallback,
    required this.dismissCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      onDismissed: dismissCallback,
      direction: DismissDirection.startToEnd,
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: checkboxCallback,
        ),
      ),
    );
  }
}