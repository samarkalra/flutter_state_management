import 'package:flutter/foundation.dart' show immutable;

@immutable
class Person {
  final String name;
  final int age;

  // For manually creating instances of Person class
  const Person({
    required this.name,
    required this.age,
  });

  // named constructor
  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        age = json['age'] as int;
}
