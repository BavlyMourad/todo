import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_strings.dart';
import 'package:todo_app/utils/app_utils.dart';
import 'package:todo_app/widgets/task_date.dart';
import 'package:todo_app/widgets/task_list_tile.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.taskTitle});

  final String taskTitle;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 10.0,
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) => AppUtils.showBottomModalSheet(
                context,
                isNewTask: false,
              ),
              backgroundColor: AppColors.green400,
              foregroundColor: AppColors.white,
              icon: Icons.edit,
              label: AppStrings.editButtonTitle,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: AppColors.red400,
              foregroundColor: AppColors.white,
              icon: Icons.delete,
              label: AppStrings.deleteButtonTitle,
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              isCompleted = !isCompleted;
            });
          },
          child: Container(
            color: AppColors.lightDark,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskListTile(
                  taskTitle: widget.taskTitle,
                  isCompleted: isCompleted,
                  onChanged: (newValue) {
                    setState(() {
                      isCompleted = !isCompleted;
                    });
                  },
                ),
                const TaskDate(
                  date: '15 Jun 2022',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
