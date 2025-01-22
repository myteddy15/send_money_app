import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:send_money_app/models/response/dashboard_response.dart';

abstract class DashboardRepository {
  Future<DashboardResponse> fetchWalletBalance();
}

class DashboardRepositoryImpl extends DashboardRepository {

  http.Client httpClient;

  DashboardRepositoryImpl(this.httpClient);

  Future<DashboardResponse> fetchWalletBalance() async {
    final url = Uri.parse("https://dummyjson.com/c/9860-6649-4bc4-a998");

    final response = await httpClient.get(url);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final dashboardResponse = DashboardResponse.fromJson(json.decode(response.body));
        return dashboardResponse;
      } catch (e) {
        throw Exception("Error parsing $e");
      }
    } else {
      throw Exception("Error fetching wallet balance");
    }
  }
}