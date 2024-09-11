import 'package:flutter/material.dart';
import 'package:tasks/model/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _task = [];

  List<Task> get tasks => _task;

  void addTask(String title) {
    _task.add(Task(title: title));
    notifyListeners();
  }

  void toggleTaskCompleton(int index) {
    _task[index].isCompleted = !_task[index].isCompleted;
    notifyListeners();
  }

  void removeTask(int index) {
    _task.removeAt(index);
    notifyListeners();
  }
}
