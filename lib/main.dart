import 'package:flutter/material.dart';
import 'package:hello_task_manager/screens/add_task.dart';
import 'package:hello_task_manager/widgets/task_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
           home: AddTask(),
         );
    }
}
