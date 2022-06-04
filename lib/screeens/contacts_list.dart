import 'package:bytebank_sqflite/database/app_database.dart';
import 'package:bytebank_sqflite/screeens/contact_form.dart';
import 'package:flutter/material.dart';

import '../models/Contact.dart';

class ContactsList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: FutureBuilder(
          future: findAll(),
          builder: (context, snapshot) {
            final List<Contact> contacts = snapshot.data as List<Contact>;
            return ListView.builder(
              itemBuilder: (context, index) {
                final Contact contact = contacts[index];
                return _ContactItem(contact);
              },
              itemCount: contacts.length,
            );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then(
                (newContact) => debugPrint('$newContact'),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {

  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name.toString() + contact.id.toString(),
          style: TextStyle(fontSize: 24.0,
          ),
        ),
        subtitle: Text(contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
