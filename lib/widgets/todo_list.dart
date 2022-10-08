import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  TodoList({super.key});

  final List<String> todos = [
    'One',
    'Two',
    'Three',
    'Four',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
          surfaceTintColor: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: Checkbox(
              value: false,
              onChanged: (value) {},
            ),
            title: Text(
              todos[index],
              style: const TextStyle(
                color: Color(0xFF303030),
              ),
            ),
          ),
        );
      },
    );
  }
}
