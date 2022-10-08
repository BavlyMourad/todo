import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/widgets/todo_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFF303030),
        appBar: AppBar(
          title: const Text(
            'ToDo App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0xFF303030),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Current',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Completed',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TodoList(),
            TodoList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: const AddTaskScreen(),
                  ),
                );
              },
            );
          },
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