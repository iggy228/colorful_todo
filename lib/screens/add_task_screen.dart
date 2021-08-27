import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
    required TextEditingController controller,
  }) : _controller = controller, super(key: key);

  final TextEditingController _controller;

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
          controller: _controller,
          autofocus: true,
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Add'),
        )
      ],
    );
  }
}