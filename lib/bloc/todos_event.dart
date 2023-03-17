part of 'todos_bloc.dart';

abstract class TodosEvent extends Equatable {}

class InitialTodoEvent extends TodosEvent {
  @override
  List<Object?> get props => [];
}

class AddTodoEvent extends TodosEvent {
  final Todo todo;

  AddTodoEvent({required this.todo});

  @override
  List<Object?> get props => [todo];
}

class UpdateTodoStatusEvent extends TodosEvent {
  final Todo todo;

  UpdateTodoStatusEvent({required this.todo});

  @override
  List<Object?> get props => [todo];
}

class DeleteTodoEvent extends TodosEvent {
  final Todo todo;

  DeleteTodoEvent({required this.todo});

  @override
  List<Object?> get props => [todo];
}
