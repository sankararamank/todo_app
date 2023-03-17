part of 'todos_bloc.dart';

class TodosState extends Equatable {
  final List<Todo> allTodos;

  const TodosState({this.allTodos = const <Todo>[]});

  @override
  List<Object?> get props => [allTodos];
}
