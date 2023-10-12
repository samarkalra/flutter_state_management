import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/counter_events.dart';
import 'package:state_management/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<IncrementCounter>(
      (event, emit) => emit(
        CounterState(counter: state.counter + 1),
      ),
    );
    on<DecrementCounter>(
      (event, emit) => emit(
        CounterState(counter: state.counter - 1),
      ),
    );
    on<ResetCounter>((event, emit) {
      if (state.counter != 0) {
        emit(
          CounterState(counter: 0),
        );
      }
    });
  }
}
