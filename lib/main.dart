import 'package:flutter/material.dart';
import 'package:hello_task_manager/providers/task_provider.dart';
import 'package:hello_task_manager/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => TaskProvider()),
      child: MaterialApp(
          title: 'Hello Task Manager',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.lightBlue),
          home: Home()),
    );
  }
}
