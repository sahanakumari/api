import 'dart:convert';

import 'package:api/config/api_config.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetch(String endpoint) async {
  print(hostUrl + endpoint);
  final response = await http.get(
    hostUrl + endpoint,
  );
  final data = jsonDecode(response.body);
  return {
    'status_code': response.statusCode,
    'body': data,
  };
}

Future<Map<String, dynamic>> post(
    String endpoint, Map<String, dynamic> body) async {
  final response = await http.post(hostUrl + endpoint);
  final data = jsonDecode(response.body);
  return {
    'status_code': response.statusCode,
    'body': data,
  };
}

Future<Map<String, dynamic>> delete(String endpoint) async {
  print(hostUrl + endpoint);
  final response = await http.delete(
    hostUrl + endpoint,
  );
  final data = jsonDecode(response.body);
  return {
    'status_code': response.statusCode,
    'body': data,
  };
}
