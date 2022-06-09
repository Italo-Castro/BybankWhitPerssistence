

import 'package:http/http.dart';

void findAll () async{
  final Response response = await get(Uri.http('localhost:8080/transactions', 'transactions'));
  print(response.body);
}