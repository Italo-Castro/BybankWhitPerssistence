import 'dart:convert';


import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';


import 'interceptors/loggin_interceptor.dart';


Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
var  url_base = Uri.http('http://192.168.0.106:8080/transactions', 'transactions');
