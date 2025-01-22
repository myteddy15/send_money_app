import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:send_money_app/cubits/view_transactions_cubit/view_transactions_cubit.dart';
import 'package:send_money_app/models/response/transactions_response.dart';
import 'package:send_money_app/models/transactions.dart';

import '../mock_generator.mocks.dart';

void main () {
  late MockViewTransactionsRepository mockViewTransactionsRepository;
  late TransactionsResponse transactionsResponse;
  late List<Transactions>? transactions;
  

  const String mockData = """
    {
        "transactions": [
            {
                "transaction_date": "January 10, 2025",
                "transactionsDetails": [
                    {
                        "amount_sent": 1000,
                        "transactionName": "Send money"
                    }
                ]
            },
            {
                "transaction_date": "January 15, 2025",
                "transactionsDetails": [
                    {
                        "amount_sent": 2026,
                        "transactionName": "Send money"
                    },
                    {
                        "amount_sent": 5010,
                        "transactionName": "Send money"
                    }
                ]
            },
            {
                "transaction_date": "January 20, 2025",
                "transactionsDetails": [
                    {
                        "amount_sent": 8000,
                        "transactionName": "Send money"
                    },
                    {
                        "amount_sent": 700,
                        "transactionName": "Send money"
                    },
                    {
                        "amount_sent": 550,
                        "transactionName": "Send money"
                    }
                ]
            }
        ]
    }
    """;

  setUpAll(() {
    mockViewTransactionsRepository = MockViewTransactionsRepository();
    transactionsResponse = TransactionsResponse.fromJson(json.decode(mockData));

    transactions = transactionsResponse.transactions.map((e) {
      final transactionDetails = e.transactionsDetails.map((e) 
        => TransactionDetails(e.transactionName, e.amountSent.toString()));
      return Transactions(e.transactionDate, transactionDetails.toList());      
    }).toList();

    transactions?.sort((a, b) => b.date.compareTo(a.date));

  });

  blocTest("Successfully fetching transactions",
    build: () {
      when(mockViewTransactionsRepository.getTransactions()).
        thenAnswer((_) async => transactionsResponse);
      return ViewTransactionsCubit(mockViewTransactionsRepository);
    },
    act: (bloc) {
      bloc.getTransactions();
   },
   expect: () => <ViewTransactionsState>
    [
      const ViewTransactionsState(transactions: null, isLoading: true),
      ViewTransactionsState(transactions: transactions, isLoading: false),
    ], 
  );

}