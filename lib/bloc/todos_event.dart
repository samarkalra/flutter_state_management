import 'package:state_management/model/todo.dart';

abstract class TodosEvents {}

class AddTodo extends TodosEvents {
  final Todo todo;

  AddTodo({required this.todo});
}

class DeleteTodo extends TodosEvents {
  final String todoId;

  DeleteTodo({required this.todoId});
}
