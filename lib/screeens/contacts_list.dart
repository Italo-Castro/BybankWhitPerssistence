import 'package:bytebank_sqflite/screeens/contact_form.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Italo',
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text('10', style: TextStyle(fontSize: 16.0)),
            ),
          )
        ],
      ),
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
