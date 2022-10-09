import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_strings.dart';
import 'package:todo_app/utils/app_utils.dart';
import 'package:todo_app/widgets/tasks_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.dark,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                AppStrings.appTitle,
                style: TextStyle(
                  color: AppColors.white,
                  fontFamily: AppStrings.dancingScriptFont,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 10.0),
              Image.asset(
                AppStrings.logoImg,
                width: 42.0,
                height: 42.0,
              ),
            ],
          ),
          backgroundColor: AppColors.dark,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  '${AppStrings.currentTabBar} (7)',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  '${AppStrings.completedTabBar} (4)',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TasksList(),
            TasksList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => AppUtils.showBottomModalSheet(
            context,
            isNewTask: true,
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}


/*

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO ${tabController.index + 1}'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              child: Text(
                'Current',
                style: TextStyle(
                  color: Colors.blue.shade700,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Completed',
                style: TextStyle(
                  color: Colors.blue.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(
            child: Text('5'),
          ),
          Center(
            child: Text('8'),
          ),
        ],
      ),
    );
  }
}


*/