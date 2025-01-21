import 'package:flutter/material.dart';

import '../../models/transactions.dart';
import 'header_text.dart';

class TransactonList extends StatelessWidget {
  final List<Transactions> trancationData;

  const TransactonList({super.key, required this.trancationData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(text: "View Transactions"),
        const SizedBox(height: 35),
        ListView.builder(
          itemCount: trancationData.length,
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
                      trancationData[index].date,
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
                  itemCount: trancationData[index].transactionDetails.length,
                  itemBuilder: (context, transactionDetailsIndex) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            trancationData[index].transactionDetails[transactionDetailsIndex].name,
                            style: const TextStyle().copyWith(
                              fontSize: 15
                            ),
                          ),
                          Text(
                            trancationData[index].transactionDetails[transactionDetailsIndex].amount,
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
    );
  }
}