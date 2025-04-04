import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/counter_bloc.dart';
import 'package:state_management/bloc/counter_state.dart';
import 'package:state_management/counter_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: BlocProvider(
        create: (context) => _counterBloc,
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) => const CounterWidget(),
        ),
      ),
    );
  }
}
