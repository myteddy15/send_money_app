// To parse this JSON data, do
//
//     final sendMoneyResponse = sendMoneyResponseFromJson(jsonString);

import 'dart:convert';

SendMoneyResponse sendMoneyResponseFromJson(String str) => SendMoneyResponse.fromJson(json.decode(str));

String sendMoneyResponseToJson(SendMoneyResponse data) => json.encode(data.toJson());

class SendMoneyResponse {
    int amountSent;
    String dateTime;

    SendMoneyResponse({
        required this.amountSent,
        required this.dateTime,
    });

    factory SendMoneyResponse.fromJson(Map<String, dynamic> json) => SendMoneyResponse(
        amountSent: json["amount_sent"],
        dateTime: json["date_time"],
    );

    Map<String, dynamic> toJson() => {
        "amount_sent": amountSent,
        "date_time": dateTime,
    };
}
