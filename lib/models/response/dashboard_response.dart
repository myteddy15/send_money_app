// To parse this JSON data, do
//
//     final dashboardResponse = dashboardResponseFromJson(jsonString);

import 'dart:convert';

DashboardResponse dashboardResponseFromJson(String str) => DashboardResponse.fromJson(json.decode(str));

String dashboardResponseToJson(DashboardResponse data) => json.encode(data.toJson());

class DashboardResponse {
    int wallatBalance;

    DashboardResponse({
        required this.wallatBalance,
    });

    factory DashboardResponse.fromJson(Map<String, dynamic> json) => DashboardResponse(
        wallatBalance: json["wallat_balance"],
    );

    Map<String, dynamic> toJson() => {
        "wallat_balance": wallatBalance,
    };
}
