import 'package:uuid/uuid.dart';

class Todo {
  late String id;
  String text;
  bool isCompleted;

  Todo({required this.text, this.isCompleted = false}) : id = const Uuid().v4();
}
