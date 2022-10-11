import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/tasks_view_model.dart';
import 'task_card.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key, required this.isCompleted});

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksViewModel>(
      builder: (context, tasksViewModel, child) {
        final currentTasks = tasksViewModel.currentTasks;
        final completedTasks = tasksViewModel.completedTasks;

        return ListView.builder(
          itemCount: isCompleted ? completedTasks.length : currentTasks.length,
          itemBuilder: (context, index) {
            return TaskCard(
              task: isCompleted ? completedTasks[index] : currentTasks[index],
            );
          },
        );
      },
    );
  }
}
