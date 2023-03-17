import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todos_bloc.dart';
import 'package:todo_app/constants/global_constants.dart';
import 'package:todo_app/data/model/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        updateTodoStatus(context, todo);
      },
      tileColor: Colors.white,
      leading: Icon(
        todo.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
        color: green,
      ),
      title: Text(
        todo.title,
        style: TextStyle(decoration: todo.isCompleted ? TextDecoration.lineThrough : null),
      ),
      trailing: _buildTodoIcon(
        context,
        red,
        const Icon(Icons.delete),
        () {
          deleteTodo(context, todo);
        },
      ),
    );
  }

  Widget _buildTodoIcon(
    BuildContext context,
    Color color,
    Icon icon,
    VoidCallback performAction,
  ) {
    return Container(
      height: todoIconWidth,
      width: todoIconWidth,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(BorderRadiusConstants.small),
      ),
      child: IconButton(
        onPressed: performAction,
        iconSize: 14,
        icon: icon,
        color: Colors.white,
      ),
    );
  }

  void updateTodoStatus(BuildContext context, Todo todo) {
    context.read<TodosBloc>().add(UpdateTodoStatusEvent(todo: todo));
  }

  void deleteTodo(BuildContext context, Todo todo) {
    context.read<TodosBloc>().add(DeleteTodoEvent(todo: todo));
  }
}
