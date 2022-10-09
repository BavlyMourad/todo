import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_card.dart';

class TasksList extends StatelessWidget {
  TasksList({super.key});

  final List<String> tasks = [
    'This is a task',
    'This is another task',
    'This is a sub task for the above task',
    'So many sub tasks',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskCard(
          taskTitle: tasks[index],
        );
      },
    );
  }
}
