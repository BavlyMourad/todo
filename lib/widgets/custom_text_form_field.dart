import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_strings.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.onChanged});

  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: const Text(
          AppStrings.taskTitleHintText,
          style: TextStyle(
            color: AppColors.white38,
          ),
        ),
        fillColor: AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: AppColors.white38,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: const BorderSide(
            color: AppColors.white38,
          ),
        ),
      ),
      style: const TextStyle(
        color: AppColors.white,
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return AppStrings.taskIsEmptyError;
        }
        return null;
      },
    );
  }
}
