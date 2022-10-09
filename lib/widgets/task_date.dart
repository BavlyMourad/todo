import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';

class TaskDate extends StatelessWidget {
  const TaskDate({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(7.0),
      ),
      margin: const EdgeInsets.only(
        left: 30.0,
        bottom: 10.0,
      ),
      child: Text(
        date,
        style: const TextStyle(color: AppColors.white),
      ),
    );
  }
}
