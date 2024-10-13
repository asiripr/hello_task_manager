import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hello_task_manager/models/task_model.dart';

class TaskProvider with ChangeNotifier{
  List<Task> _tasks = [];

// to get all the tasks
UnmodifiableListView <Task> get allTasks => UnmodifiableListView(_tasks);

// a mehtod for add tasks
  void addTask(String task){
    _tasks.add(Task(title: task, isCompleted: false));
    notifyListeners(); // no idea
  }

// a method for mark task completed or not
  void toggleTaskStatus(Task task){
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

// removeTask method for delete a task.
  void removeTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}