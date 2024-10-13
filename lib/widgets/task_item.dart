import 'package:flutter/material.dart';
import 'package:hello_task_manager/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  final int index;

  const TaskItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context); // no idea
    final task = taskProvider.tasks[index];
    
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      trailing: Checkbox(value: task.isCompleted, onChanged: (value){taskProvider.toggleTaskStatus(index);}),
      onLongPress: () {
        taskProvider.removeTask(index);
      },
    );
  }
}