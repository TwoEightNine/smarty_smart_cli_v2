import 'package:http/http.dart' as http;
import 'dart:convert';

class BaseRepo {
  static const baseUrl = 'http://192.168.1.228:1753/api/';

  Future<dynamic> baseGet(String path) async {
    final response = await http.get(baseUrl + path);
    return _returnResultOrThrow(response);
  }

  dynamic _returnResultOrThrow(response) {
    return json.decode(response.body);
  }
}