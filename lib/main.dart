import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todos_bloc.dart';
import 'package:todo_app/data/model/todo.dart';
import 'package:todo_app/presentation/screens/todos_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosBloc()
        ..add(AddTodoEvent(
          todo: Todo(
            id: "6",
            title: "Understanding Bloc.",
          ),
        )),
      child: MaterialApp(
        title: 'Todo App',
        home: TodosScreen(),
      ),
    );
  }
}
