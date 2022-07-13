import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionAuthDialog extends StatefulWidget {

  final Function(String) onConfirm;

  TransactionAuthDialog({
    required this.onConfirm,
  });

  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {

 final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        maxLength: 4,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 64,letterSpacing: 24),
      ),
      actions: [
        FlatButton(onPressed: () {widget.onConfirm(_passwordController.text); Navigator.pop(context);}, child: Text('Confirm'),),
        FlatButton(onPressed: () {Navigator.pop(context);}, child: Text('Cancel'),),
      ],

    );
  }
}
