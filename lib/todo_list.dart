import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/todos_bloc.dart';
import 'package:state_management/bloc/todos_state.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        final todosBloc = BlocProvider.of<TodosBloc>(context);
        return ListView.builder(
          shrinkWrap: true,
          itemCount: todosBloc.todos.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(todosBloc.todos[index].text),
          ),
        );
      },
    );
  }
}
