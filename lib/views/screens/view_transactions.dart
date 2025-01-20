import 'package:flutter/material.dart';
import 'package:send_money_app/models/transactions.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "View Transactions",
              textAlign: TextAlign.start,
              style: const TextStyle().copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.75)
              )
            ),
            const SizedBox(height: 35),
            ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          data[index].date,
                          style: const TextStyle().copyWith(
                            fontSize: 15,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data[index].transactionDetails.length,
                      itemBuilder: (context, transactionDetailsIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data[index].transactionDetails[transactionDetailsIndex].name,
                                style: const TextStyle().copyWith(
                                  fontSize: 15
                                ),
                              ),
                              Text(
                                data[index].transactionDetails[transactionDetailsIndex].amount,
                                style: const TextStyle().copyWith(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    )
                  ],
                );
              }
            )
          ]
        ),
      ),
    );
  }
}