import 'dart:convert';

import 'package:http/http.dart';

class AuthenticationAPI {
  final Client _client;

  AuthenticationAPI(this._client);
  final _baseURL = 'https://api.themoviedb.org/3';
  final _apiKey = 'f345fe1849219d95cc365e8e9b90f866';

  Future<String> createRequestToken() async {
    final response = await _client.get(
      Uri.parse('$_baseURL/authentication/token/new?api_key=$_apiKey'),
    );
    print("valor >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${response.body}");
    if (response.statusCode == 200) {
      jsonDecode(response.body);
    }
    return '';
  }
}
