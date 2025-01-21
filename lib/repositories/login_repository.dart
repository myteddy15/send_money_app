import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:send_money_app/models/login_response.dart';

class LoginRepository {
  Future<LoginResponse> login({required String userName, required String password}) async {
    Map<String, dynamic> request = {
      "username": userName,
      "password": password
    };

    final response = await http.post(
      Uri.parse(
        "https://dummyjson.com/auth/login"),
        body: request 
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