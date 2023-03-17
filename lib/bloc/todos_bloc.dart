import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/model/todo.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(const TodosState()) {
    on<AddTodoEvent>(_addTodo);
    on<UpdateTodoStatusEvent>(_updateTodo);
    on<DeleteTodoEvent>(_deleteTodo);
  }

  Todo? todo;

  void _addTodo(AddTodoEvent event, Emitter<TodosState> emit) {
    emit(TodosState(allTodos: List.from(state.allTodos)..add(event.todo)));
  }

  void _updateTodo(UpdateTodoStatusEvent event, Emitter<TodosState> emit) {
    final int index = state.allTodos.indexOf(event.todo);
    List<Todo> allTodos = List.from(state.allTodos)..remove(event.todo);
    event.todo.isCompleted
        ? allTodos.insert(index, event.todo.copyWith(isCompleted: false))
        : allTodos.insert(index, event.todo.copyWith(isCompleted: true));

    emit(TodosState(allTodos: allTodos));
  }

  void _deleteTodo(DeleteTodoEvent event, Emitter<TodosState> emit) {
    emit(TodosState(allTodos: List.from(state.allTodos)..remove(event.todo)));
  }
}
