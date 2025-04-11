import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/state/fetch_result.dart';
import 'package:state_management/state/load_action.dart';
import 'package:state_management/state/persons_bloc.dart';

import '../mock/mock_data.dart';

void main() {
  group('PersonsBlo test', () {
    late PersonsBloc bloc;

    setUp(() {
      bloc = PersonsBloc();
    });

    blocTest(
      'Initial state should be null',
      build: () => bloc,
      verify: (bloc) => expect(bloc.state, null),
    );

    blocTest(
      'should return persons for LoadPersonsAction for first iterable',
      build: () => bloc,
      act: (bloc) {
        bloc.add(
          const LoadPersonsAction(url: "dummy_url_1", loader: mockGetPersons1),
        );
        bloc.add(
          const LoadPersonsAction(url: "dummy_url_1", loader: mockGetPersons1),
        );
      },
      expect: () => [
        const FetchResult(
          persons: mockPersons1,
          isRetrievedFromCache: false,
        ),
        const FetchResult(
          persons: mockPersons1,
          isRetrievedFromCache: true,
        ),
      ],
    );
  });
}
