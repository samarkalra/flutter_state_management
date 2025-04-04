abstract class TodosState {
  const TodosState();
}

class TodosStateInitialState extends TodosState {}

class TodoAddedState extends TodosState {
  final String todoId;

  const TodoAddedState({required this.todoId});
}

class TodoDeletedState extends TodosState {
  const TodoDeletedState();
}