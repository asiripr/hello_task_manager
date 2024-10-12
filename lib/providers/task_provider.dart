import 'package:flutter/material.dart';
import 'package:hello_task_manager/models/task_model.dart';

class TaskProvider with ChangeNotifier{
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks; // no idea

  void addTask(Task task){
    _tasks.add(task);
    notifyListeners(); // no idea
  }

  void toggleTaskStatus(int index){
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }

  void removeTask(int index){
    _tasks.removeAt(index);
    notifyListeners();
  }

  // no idea

  List<Task> get pendingTasks =>
      _tasks.where((task) => !task.isCompleted).toList();

  List<Task> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

}