import 'package:flutter/material.dart';
import 'package:hello_task_manager/providers/task_provider.dart';
import 'package:hello_task_manager/widgets/task_action.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _textFieldController = TextEditingController();
  String newTask = '';

  // creating init state for adding state for controller
  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  // disposing the controller
  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    Provider.of<TaskProvider>(context, listen: false).addTask(newTask);
    Navigator.pop(context);
    _textFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showAddTextDialog() async {
      return showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text("Add New Task"),
          content: TextField(
            autofocus: true,
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: "Type here..."),
            onSubmitted: (_) => _submit(),
          ),
          actions: [
            ElevatedButton(onPressed: _submit, style: ElevatedButton.styleFrom(minimumSize: const Size(120, 40)), child: const Text("Submit"),)
          ],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          actionsAlignment: MainAxisAlignment.center,
        );
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text("Hello Task"),),
      body: TaskAction(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _showAddTextDialog();
      },
      child: const Icon(Icons.add),
      tooltip: "Add a ToDo",
      ),
    );
  }
}
