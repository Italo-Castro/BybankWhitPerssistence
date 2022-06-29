import 'dart:convert';

import '../../models/Contact.dart';
import '../../models/transaction.dart';
import 'package:http/http.dart';

import '../webclient.dart';
class TransactionWebClient {

  Future<List<Transaction>> findAll() async {

    final Response response = await client
        .get(url_base).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    print('decoded json $decodedJson');

    List<Transaction> transactions = _toTransactions(decodedJson);
    return transactions;
  }

  List<Transaction> _toTransactions(List<dynamic> decodedJson) {
    final List<Transaction> transactions = [];
    for (Map<String, dynamic> transactonJson in decodedJson) {
      transactions.add(Transaction.fromJson(transactonJson));
    }
    return transactions;
  }

  Future<Transaction> save(Transaction transaction) async {
    //Map<String, dynamic> transactionMap = _toMap(transaction); antes de usar o padrão de conversão jSon implementado no model.
    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response = await client.post(url_base, headers: {'Content-type': 'application/json','password':'1000',}, body: transactionJson);

    return _toTransaction(response);
  }

  Transaction _toTransaction(Response response) {
     Map<String, dynamic> json = jsonDecode(response.body);
    return Transaction.fromJson(json);
  }

  Map<String, dynamic> _toMap(Transaction transaction) {
    final Map<String, dynamic> transactionMap = {
      'value': transaction.value,
      'contact' : {
        'name' : transaction.contact.name,
        'accountNumber' : transaction.contact.accountNumber
      }
    };
    return transactionMap;
  }
}