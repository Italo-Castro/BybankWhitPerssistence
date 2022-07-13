import 'dart:convert';

import 'package:flutter/cupertino.dart';

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
    return  decodedJson.map((dynamic json) => Transaction.fromJson(json)).toList();
    /*
    final List<Transaction> transactions = [];
    for (Map<String, dynamic> transactonJson in decodedJson) {
      transactions.add(Transaction.fromJson(transactonJson));
    }
    return transactions;
     */
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    //Map<String, dynamic> transactionMap = _toMap(transaction); antes de usar o padrão de conversão jSon implementado no model.
    final String transactionJson = jsonEncode(transaction.toJson());
    final Response response = await client.post(url_base, headers: {'Content-type': 'application/json','password':'1000',}, body: transactionJson);


    if(response.statusCode == 200) {
     return Transaction.fromJson(jsonDecode(response.body));
    }

    _throwHttpError(response.statusCode);

  }

  void _throwHttpError(int statusCode) =>
       throw Exception(_statusCodeResponses[statusCode]);
  

  static final Map<int, String> _statusCodeResponses = {
    400 : 'there was an error submitting transaction',
    401 : 'authentication failed'
  };

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