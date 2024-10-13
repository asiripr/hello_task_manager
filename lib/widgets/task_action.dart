import 'package:flutter/material.dart';
import 'package:hello_task_manager/providers/task_provider.dart';
import 'package:provider/provider.dart';

class TaskAction extends StatelessWidget {
  const TaskAction({super.key});

  @override
  Widget build(BuildContext context) {

    // store the value in a variable
    final task = Provider.of<TaskProvider>(context);
    return ListView.builder(
      itemCount: task.allTasks.length,
      itemBuilder: ((context, index) => ListTile(
        leading: Checkbox(
          value: task.allTasks[index].isCompleted, // toggle the task as index item 
          onChanged: ((_)=>task.toggleTaskStatus(task.allTasks[index])),
          ),
        title: Text(task.allTasks[index].title), //show all the task title
        trailing: IconButton(
          onPressed: (){
            task.removeTask(task.allTasks[index]);
          }, 
          icon: const Icon(Icons.delete)
          ),
      )) ,
    );
  }
}