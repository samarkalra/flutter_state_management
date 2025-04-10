import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/state/fetch_result.dart';
import 'package:state_management/state/load_action.dart';

import '../types/person.dart';

class PersonsBloc extends Bloc<LoadAction, FetchResult?> {
  final Map<String, Iterable<Person>> _cache = {};

  PersonsBloc() : super(null) {
    on<LoadPersonsAction>((event, emit) async {
      final url = event.url;
      if (_cache.containsKey(url)) {
        final cachedPersons = _cache[url];
        final result = FetchResult(
          persons: cachedPersons ?? [],
          isRetrievedFromCache: true,
        );
        emit(result);
      } else {
        final personsLoader = event.loader;
        final persons = await personsLoader(url);
        _cache[url] = persons;
        final result = FetchResult(
          persons: persons,
          isRetrievedFromCache: false,
        );
        emit(result);
      }
    });
  }
}
