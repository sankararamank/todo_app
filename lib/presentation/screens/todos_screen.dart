import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todos_bloc.dart';
import 'package:todo_app/constants/global_constants.dart';
import 'package:todo_app/data/model/todo.dart';
import 'package:todo_app/presentation/screens/add_todo_bottom_sheet.dart';
import 'package:todo_app/presentation/widgets/todo_list.dart';

class TodosScreen extends StatelessWidget {
  TodosScreen({super.key});

  void _addTodo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTodoBottomSheet(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        List<Todo> todoItems = state.allTodos;

        return Scaffold(
          backgroundColor: appBgColor,
          appBar: _buildAppbar(),
          body: Container(
            padding: const EdgeInsets.all(5 * PaddingConstants.extraSmall),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  TextConstants.dashboard,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: PaddingConstants.medium),
                TodosList(todosList: todoItems),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTodo(context),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: appBgColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.menu,
            color: black,
            size: 30,
          ),
          CircleAvatar(backgroundImage: AssetImage('assets/images/profile.png'))
        ],
      ),
    );
  }
}
