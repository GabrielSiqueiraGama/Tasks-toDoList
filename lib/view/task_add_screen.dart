import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/provider/task_provider.dart';

class TaskAddScreen extends StatefulWidget {
  const TaskAddScreen({super.key});

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends State<TaskAddScreen> {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar nova tarefa: '),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Titulo da tarefa'),
              onChanged: (value) {
                newTaskTitle = value;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (newTaskTitle.isNotEmpty) {
                    Provider.of<TaskProvider>(context, listen: false)
                        .addTask(newTaskTitle);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Adicionar Tarefa'))
          ],
        ),
      ),
    );
  }
}
