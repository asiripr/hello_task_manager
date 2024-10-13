import 'package:flutter/material.dart';
import 'package:hello_task_manager/providers/task_provider.dart';
import 'package:hello_task_manager/widgets/task_item.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Manager"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed('/add-task');
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (ctx, index) {
          return TaskItem(index: index);
        },
      ),
    );
  }
}