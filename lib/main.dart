import 'package:bytebank_sqflite/http/webclient.dart';
import 'package:bytebank_sqflite/screeens/dashboard.dart';
import 'package:flutter/material.dart';

import 'models/Contact.dart';
import 'models/transaction.dart';

void main() {
  runApp(ByteBankpp(),);
  //save(Transaction(200,Contact(0,'Italo',2))).then((transaction) => print(transaction));
  //findAll().then((transactions) => print('New transactions $transactions'));
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



