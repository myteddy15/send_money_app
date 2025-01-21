import 'package:flutter/material.dart';
import 'package:send_money_app/models/transactions.dart';
import 'package:send_money_app/views/widgets/transaction_list.dart';

class ViewTransactionsScreen extends StatelessWidget {
  const ViewTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    

    final data = [
      Transactions("January 17, 2025", [
        TransactionDetails("Send money", "1000"), 
        TransactionDetails("Send money", "1000"),
        TransactionDetails("Send money", "1000")]),
      Transactions("January 18, 2025", [
        TransactionDetails("Send money", "1000")]),
      Transactions("January 19, 2025", [
        TransactionDetails("Send money", "1000")])
    ];

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: TransactonList(trancationData: data)
      ),
    );
  }
}