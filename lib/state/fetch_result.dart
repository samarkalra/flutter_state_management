import 'package:flutter/foundation.dart' show immutable;
import 'package:state_management/extensions/iterable_extensions.dart';

import '../types/person.dart';

@immutable
class FetchResult {
  final Iterable<Person> persons;
  final bool isRetrievedFromCache;

  const FetchResult({
    required this.persons,
    required this.isRetrievedFromCache,
  });

  @override
  String toString() =>
      "FetchResult (isRetrievedFromCache = $isRetrievedFromCache, persons = $persons)";

  @override
  bool operator ==(covariant FetchResult other) {
    return persons.isEqualToIgnoringOrdering(other.persons) &&
        isRetrievedFromCache == other.isRetrievedFromCache;
  }

  @override
  int get hashCode => Object.hash(persons, isRetrievedFromCache);
}
