import 'package:state_management/types/person.dart';

const mockPersons1 = [
  Person(name: 'Foo 1', age: 20),
  Person(name: 'Bar 1', age: 30),
];

const mockPersons2 = [
  Person(name: 'Foo 2', age: 20),
  Person(name: 'Bar 2', age: 30),
];

Future<Iterable<Person>> mockGetPersons1(String _) =>
    Future.value(mockPersons1);

Future<Iterable<Person>> mockGetPersons2(String _) =>
    Future.value(mockPersons2);
