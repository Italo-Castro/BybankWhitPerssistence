import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankpp());
}

class ByteBankpp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Column (
          children: <Widget>[
            Image.asset('images/bytebank_logo.png'),
            Container (
              height : 120,
              width: 100,
              color: Colors.green,
              child :Column (
                children: [
                  Icon (Icons.perm_contact_cal_outlined),
                  Text("Contacts")
                ],
              )
            )
          ],
        )
      ),
    );
  }
}
