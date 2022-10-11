import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/local/app_db.dart';
import 'package:todo_app/view_models/tasks_view_model.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({
    super.key,
    required this.isNewTask,
    required this.task,
  });

  final bool isNewTask;
  final Task task;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Container(
      padding: const EdgeInsets.all(21.0),
      color: AppColors.grey,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isNewTask ? AppStrings.addTaskTitle : AppStrings.editTaskTitle,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 30.0,
              ),
            ),
            const SizedBox(height: 30.0),
            CustomTextFormField(
              onChanged: (value) {
                newTaskTitle = value;
              },
              value: isNewTask ? '' : task.title,
            ),
            const SizedBox(height: 30.0),
            CustomButton(
              onPressed: () {
                final newTaskEntity = TasksCompanion(
                  title: drift.Value(newTaskTitle!),
                );

                final updatedTaskEntity = TasksCompanion(
                  id: drift.Value(task.id),
                  title: drift.Value(newTaskTitle!),
                  isCompleted: drift.Value(task.isCompleted),
                );

                isNewTask
                    ? context.read<TasksViewModel>().addTask(newTaskEntity)
                    : context
                        .read<TasksViewModel>()
                        .editTask(updatedTaskEntity);

                Navigator.pop(context);
              },
              title: isNewTask
                  ? AppStrings.addButtonTitle
                  : AppStrings.saveButtonTitle,
            ),
          ],
        ),
      ),
    );
  }
}
