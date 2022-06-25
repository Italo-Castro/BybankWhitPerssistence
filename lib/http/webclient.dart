import 'dart:convert';

import 'package:bytebank_sqflite/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../models/Contact.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print(data.toString());
    return data;
  }
}
Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
var  url_base = Uri.http('http://192.168.0.106:8080/transactions', 'transactions');
Future<List<Transaction>> findAll() async {

  final Response response = await client
      .get(url_base).timeout(Duration(seconds: 5));
  final List<dynamic> decodedJson = jsonDecode(response.body);
  print('decoded json $decodedJson');

  final List<Transaction> transactions = [];
  for (Map<String, dynamic> transactonJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactonJson['contact'];
    final Transaction transaction = Transaction(
      transactonJson['value'],
      Contact(
        0,
        transactonJson['name'],
        transactonJson['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact' : {
      'name' : transaction.contact.name,
      'accountNumber' : transaction.contact.accountNumber
    }
  };

  final String transactionJson = jsonEncode(transactionMap);
  final Response response = await client.post(url_base, headers: {'Content-type': 'application/json','password':'1000',}, body: transactionJson);

  Map<String, dynamic> json = jsonDecode(response.body);
  final Map<String, dynamic> contactJson = json['contact'];
  return   Transaction(
    json['value'],
    Contact(
      0,
      json['name'],
      json['accountNumber'],
    ),
  );
}