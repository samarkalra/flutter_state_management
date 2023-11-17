import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/todos_event.dart';
import 'package:state_management/bloc/todos_state.dart';

class TodosBloc extends Bloc<TodosEvents, TodosState> {
  TodosBloc(super.initialState);
}
