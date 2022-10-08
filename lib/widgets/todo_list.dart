import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 14.0,
          ),
          surfaceTintColor: Colors.white30,
          color: Colors.white30,
          elevation: 2.0,
          child: Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
                  onPressed: (context) {},
                  backgroundColor: const Color(0xFF7BC043),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Edit',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  // An action can be bigger than the others.
                  flex: 2,
                  onPressed: (context) {},
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete',
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  title: Text(
                    todos[index],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  '2022-10-08',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
