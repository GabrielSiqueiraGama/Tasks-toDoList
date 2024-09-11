import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/provider/task_provider.dart';
import 'package:tasks/view/task_add_screen.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de taregas'),
        backgroundColor: Colors.green,
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              final task = taskProvider.tasks[index];
              return ListTile(
                title: Text(
                  task.title,
                  style: TextStyle(
                      decoration:
                          task.isCompleted ? TextDecoration.lineThrough : null),
                ),
                leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    taskProvider.toggleTaskCompleton(index);
                  },
                ),
                trailing: IconButton(
                    onPressed: () {
                      taskProvider.removeTask(index);
                    },
                    icon: const Icon(Icons.delete)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TaskAddScreen(),
          ),
        );
      }),
    );
  }
}
