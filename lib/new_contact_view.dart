import 'package:flutter/material.dart';
import 'package:state_management/models/contact.dart';
import 'package:state_management/models/contact_book.dart';

class NewContactView extends StatefulWidget {
  const NewContactView({super.key});

  @override
  State<NewContactView> createState() => _NewContactViewState();
}

class _NewContactViewState extends State<NewContactView> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void onAdd() {
    final contact = Contact(name: _controller.text);
    ContactBook().add(contact: contact);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new contact"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            decoration:
                const InputDecoration(hintText: "Enter a new contact here..."),
          ),
          TextButton(
            onPressed: onAdd,
            child: const Text("Add Contact"),
          ),
        ],
      ),
    );
  }
}
