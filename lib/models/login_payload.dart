// To parse this JSON data, do
//
//     final loginPayload = loginPayloadFromJson(jsonString);

import 'dart:convert';

LoginPayload loginPayloadFromJson(String str) => LoginPayload.fromJson(json.decode(str));

String loginPayloadToJson(LoginPayload data) => json.encode(data.toJson());

class LoginPayload {
    String username;
    String password;

    LoginPayload({
        required this.username,
        required this.password,
    });

    factory LoginPayload.fromJson(Map<String, dynamic> json) => LoginPayload(
        username: json["username"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
    };
}
