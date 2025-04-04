import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/todos_event.dart';
import 'package:state_management/bloc/todos_state.dart';

import '../model/todo.dart';

class TodosBloc extends Bloc<TodosEvents, TodosState> {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  TodosBloc(super.initialState) {
    on<AddTodo>((event, emit) {
      _todos.add(event.todo);
      emit(TodoAddedState(todoId: event.todo.id));
    });

    on<DeleteTodo>((event, emit) {
      final todoToRemoveIndex =
          _todos.indexWhere((todo) => todo.id == event.todoId);
      if (todoToRemoveIndex >= 0) {
        _todos.removeAt(todoToRemoveIndex);
        emit(const TodoDeletedState());
      }
    });
  }
}
