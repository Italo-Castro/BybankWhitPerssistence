import 'package:bytebank_sqflite/components/centered_message.dart';
import 'package:flutter/material.dart';

import '../http/webclient.dart';
import '../http/webclients/transacton_webclient.dart';
import '../models/Contact.dart';
import '../models/transaction.dart';

class TransactionsList extends StatelessWidget {

  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: FutureBuilder<List<Transaction>> (
        future: _webClient.findAll(),
        builder : (context, snapshot) {
          if (snapshot.hasData) {
            final List<Transaction> transactions = snapshot.data as List<Transaction>;
              if (transactions.isNotEmpty) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Transaction transaction = transactions[index];
                    return Card(
                      child: ListTile(
                        leading: Icon(Icons.monetization_on),
                        title: Text(
                          transaction.value.toString(),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          transaction.contact.accountNumber.toString(),
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: transactions.length,
                );
              }
          }
        return CenteredMessage('No transactions found', icon: Icons.warning);
        }
      )
    );
  }
}