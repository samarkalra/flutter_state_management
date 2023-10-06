import 'package:bloc/bloc.dart';
import 'package:state_management/iterable_extension.dart';

const names = [
  'Foo',
  'Bar',
  'Baz',
];

/// Cubit is a simple state management class that relies on
/// methods to [emit] new state.
///
/// Requires an initial state which will be the
/// state of the [Cubit] before [emit] has been called.
///
/// The current state of a [Cubit] can be accessed via the [state] getter.
///
/// Cubit is based on Stream and StreamController
class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void pickRandomName() => emit(
        names.getRandomElement(),
      );
}
