import 'package:bytebank_sqflite/http/webclient.dart';
import 'package:bytebank_sqflite/screeens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankpp(),);
  findAll();
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



