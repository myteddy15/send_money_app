import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:send_money_app/models/payload/send_money_payload.dart';
import '../models/response/send_money_response.dart';

abstract class SendMoneyRepository {
  Future<SendMoneyResponse> sendMoney({required String amount});
}

class SendMoneyRepositoryImpl extends SendMoneyRepository{

  http.Client httpClient;

  SendMoneyRepositoryImpl(this.httpClient);

  @override
  Future<SendMoneyResponse> sendMoney({required String amount}) async {
    final url = Uri.parse("https://dummyjson.com/c/96f5-fe85-4e53-8227");
    final sendMoneyPayload = SendMoneyPayload(amount: amount);

    final response = await httpClient.post(
      url,
      body: sendMoneyPayload.toJson() 
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final sendMoneyResponse = SendMoneyResponse.fromJson(json.decode(response.body));
        return sendMoneyResponse;
      } catch (e) {
        throw Exception("Error parsing $e");
      }
    } else {
      throw Exception("Error sending money");
    }
  }
}