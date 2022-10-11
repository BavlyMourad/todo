import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view_models/tasks_view_model.dart';

import 'task_card.dart';

class TasksList extends StatelessWidget {
  TasksList({super.key, required this.isCompleted});

  bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksViewModel>(
      builder: (context, tasksViewModel, child) {
        return ListView.builder(
          itemCount: isCompleted
              ? tasksViewModel.completedTasks.length
              : tasksViewModel.currentTasks.length,
          itemBuilder: (context, index) {
            return TaskCard(
              task: isCompleted
                  ? tasksViewModel.completedTasks[index]
                  : tasksViewModel.currentTasks[index],
            );
          },
        );
      },
    );
  }
}
