import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:send_money_app/models/response/transactions_response.dart';

abstract class ViewTransactionsRepository {
  Future<TransactionsResponse> getTransactions();
}

class ViewTransactionsRepositoryImpl extends ViewTransactionsRepository {
  http.Client httpClient;

  ViewTransactionsRepositoryImpl(this.httpClient);

  @override
  Future<TransactionsResponse> getTransactions() async {
    final url = Uri.parse("https://dummyjson.com/c/efe9-0cd5-4194-a9e0");
    final response = await httpClient.get(url);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final transactionsResponse = TransactionsResponse.fromJson(json.decode(response.body));
        return transactionsResponse;
      } catch (e) {
        throw Exception("Error parsing $e");
      }
    } else {
      throw Exception("Error getting transactions");
    }
  }
}