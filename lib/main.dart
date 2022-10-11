import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app.dart';
import 'package:todo_app/view_models/tasks_view_model.dart';

import 'models/local/app_db.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: AppDb()),
        ChangeNotifierProxyProvider<AppDb, TasksViewModel>(
          create: (context) => TasksViewModel(),
          update: (context, db, tasksViewModel) {
            return tasksViewModel!
              ..initAppDb(db)
              ..getAllTasks();
          },
        ),
      ],
      child: const ToDoApp(),
    ),
  );
}
