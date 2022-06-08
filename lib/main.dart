import 'package:bytebank_sqflite/screeens/contact_form.dart';
import 'package:bytebank_sqflite/screeens/contacts_list.dart';
import 'package:bytebank_sqflite/screeens/dashboard.dart';
import 'package:flutter/material.dart';

import 'database/app_database.dart';
import 'models/Contact.dart';

void main() {
  runApp(ByteBankpp());
}

class ByteBankpp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme : ThemeData (
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData (
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        )
      ),
      home: DashBoard(),
    );
  }
}



