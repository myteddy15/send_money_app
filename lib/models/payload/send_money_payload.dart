// To parse this JSON data, do
//
//     final sendMoneyPayload = sendMoneyPayloadFromJson(jsonString);

import 'dart:convert';

SendMoneyPayload sendMoneyPayloadFromJson(String str) => SendMoneyPayload.fromJson(json.decode(str));

String sendMoneyPayloadToJson(SendMoneyPayload data) => json.encode(data.toJson());

class SendMoneyPayload {
    String amount;

    SendMoneyPayload({
        required this.amount,
    });

    factory SendMoneyPayload.fromJson(Map<String, dynamic> json) => SendMoneyPayload(
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
    };
}
