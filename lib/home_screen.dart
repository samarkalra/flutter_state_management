import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/todos_bloc.dart';
import 'package:state_management/bloc/todos_event.dart';
import 'package:state_management/bloc/todos_state.dart';
import 'package:state_management/model/todo.dart';
import 'package:state_management/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _todoTextFieldController = TextEditingController();

  @override
  void dispose() {
    _todoTextFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => TodosBloc(TodosStateInitialState()),
          child: Column(
            children: [
              TextField(
                controller: _todoTextFieldController,
              ),
              Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<TodosBloc>(context).add(
                      AddTodo(
                        todo: Todo(text: _todoTextFieldController.text),
                      ),
                    );
                    _todoTextFieldController.text = '';
                  },
                  child: const Text('Add todo'),
                );
              }),
              const SizedBox(height: 16),
              const Flexible(child: TodoList()),
            ],
          ),
        ),
      ),
    );
  }
}
