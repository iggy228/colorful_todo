import 'dart:collection';

import 'package:colorful_todo/model/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy a milk'),
    Task(name: 'Buy an apples'),
    Task(name: 'Code more and have a fun'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get count => _tasks.length;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
}