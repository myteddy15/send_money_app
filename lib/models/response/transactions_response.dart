// To parse this JSON data, do
//
//     final transactionsResponse = transactionsResponseFromJson(jsonString);

import 'dart:convert';

TransactionsResponse transactionsResponseFromJson(String str) => TransactionsResponse.fromJson(json.decode(str));

String transactionsResponseToJson(TransactionsResponse data) => json.encode(data.toJson());

class TransactionsResponse {
    List<Transaction> transactions;

    TransactionsResponse({
        required this.transactions,
    });

    factory TransactionsResponse.fromJson(Map<String, dynamic> json) => TransactionsResponse(
        transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
    };
}

class Transaction {
    String transactionDate;
    List<TransactionsDetail> transactionsDetails;

    Transaction({
        required this.transactionDate,
        required this.transactionsDetails,
    });

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        transactionDate: json["transaction_date"],
        transactionsDetails: List<TransactionsDetail>.from(json["transactionsDetails"].map((x) => TransactionsDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "transaction_date": transactionDate,
        "transactionsDetails": List<dynamic>.from(transactionsDetails.map((x) => x.toJson())),
    };
}

class TransactionsDetail {
    int amountSent;
    String transactionName;

    TransactionsDetail({
        required this.amountSent,
        required this.transactionName,
    });

    factory TransactionsDetail.fromJson(Map<String, dynamic> json) => TransactionsDetail(
        amountSent: json["amount_sent"],
        transactionName: json["transactionName"],
    );

    Map<String, dynamic> toJson() => {
        "amount_sent": amountSent,
        "transactionName": transactionName,
    };
}
