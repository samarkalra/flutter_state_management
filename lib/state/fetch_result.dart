import 'package:flutter/material.dart';

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
}
