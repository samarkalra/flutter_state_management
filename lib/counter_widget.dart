import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/counter_bloc.dart';

import 'bloc/counter_events.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    final value = counterBloc.state.counter;
    final valueString = value.toString();

    return Column(
      children: [
        Row(
          children: [
            TextButton(
                onPressed: () {
                  counterBloc.add(DecrementCounter());
                },
                child: const Text('-')),
            Text(valueString),
            TextButton(
              onPressed: () {
                counterBloc.add((IncrementCounter()));
              },
              child: const Text('+'),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            counterBloc.add(ResetCounter());
          },
          child: const Text('Reset'),
        ),
      ],
    );
  }
}
