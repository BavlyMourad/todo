import 'package:flutter/material.dart';
import 'package:todo_app/models/local/app_db.dart';

import '../views/screens/task_screen.dart';

class AppUtils {
  static void showBottomModalSheet(
    BuildContext context, {
    required bool isNewTask,
    Task? task,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: TaskScreen(isNewTask: isNewTask, task: task!),
          ),
        );
      },
    );
  }
}
