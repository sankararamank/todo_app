import 'package:flutter/material.dart';
import 'package:todo_app/constants/global_constants.dart';
import 'package:todo_app/data/model/todo.dart';
import 'package:todo_app/presentation/widgets/todo_item.dart';

class TodosList extends StatelessWidget {
  final List<Todo> todosList;

  const TodosList({
    Key? key,
    required this.todosList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          for (Todo todo in todosList) ...[
            TodoItem(todo: todo),
            const SizedBox(height: PaddingConstants.medium),
          ],
        ],
      ),
    );
  }
}
