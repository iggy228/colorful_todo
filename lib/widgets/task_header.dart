import 'package:colorful_todo/shared/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskHeader extends StatelessWidget {
  final int taskCount;

  TaskHeader({required this.taskCount});

  List<Widget> landscapeTitle() {
    return <Widget>[
      Row(
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
          SizedBox(width: 10.0),
          Text(
            'Colorful Todos',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 50.0,
            ),
          ),
        ],
      ),
      SizedBox(height: 8.0),
      Text(
        taskString(taskCount),
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ];
  }

  List<Widget> portraitTitle() {
    return <Widget>[
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
        taskString(taskCount),
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: orientation == Orientation.portrait ? portraitTitle() : landscapeTitle(),
    );
  }
}
