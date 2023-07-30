import 'package:flutter/material.dart';
import 'package:state_management/models/contact.dart';

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook.sharedInstance() : super([]);
  static final ContactBook _shared = ContactBook.sharedInstance();

  factory ContactBook() => _shared;

  final List<Contact> _contacts = [];

  int get length => _contacts.length;

  void add({required Contact contact}) {
    // value is a getter in ValueNotifier class
    final contacts = value;
    contacts.add(contact);
    notifyListeners();
  }

  void remove({required Contact contact}) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }
  }

  Contact? contact({required int atIndex}) =>
      value.length > atIndex ? value[atIndex] : null;
}
