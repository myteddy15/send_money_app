import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:send_money_app/models/login_payload.dart';
import 'package:send_money_app/models/login_response.dart';

class LoginRepository {

  http.Client httpClient;

  LoginRepository(this.httpClient);

  Future<LoginResponse> login({required String userName, required String password}) async {
    final url = Uri.parse("https://dummyjson.com/auth/login");
    final loginPayload = LoginPayload(username: userName, password: password);

    final response = await httpClient.post(
      url,
      body: loginPayload.toJson() 
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final loginResponse = LoginResponse.fromJson(json.decode(response.body));
        return loginResponse;
      } catch (e) {
        throw Exception("Error parsing $e");
      }
    } else {
      throw Exception("Error login");
    }
  }
}