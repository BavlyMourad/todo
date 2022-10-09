import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_strings.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/custom_text_form_field.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key, required this.isNewTask});

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool isNewTask;

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
            ),
            const SizedBox(height: 30.0),
            CustomButton(
              onPressed: () {},
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
