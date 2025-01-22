import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:send_money_app/repositories/view_transactions_repository.dart';
import 'package:http/http.dart' as http;
import 'package:send_money_app/views/screens/view_transactions.dart';

import '../mock_generator.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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

  late ViewTransactionsRepository viewTransactionsRepository;
  late MockClient mockClient;
  late Uri url;

  setUpAll(() {
    mockClient = MockClient();
    url = Uri.parse("https://dummyjson.com/c/efe9-0cd5-4194-a9e0");
    viewTransactionsRepository = ViewTransactionsRepositoryImpl(mockClient);
  });

  
  testWidgets("View transactions screen test, Send money text", (widgetTester) async {
    when(
      mockClient.get(url, ))
      .thenAnswer((_) async => http.Response(mockData, 201));
    
    await widgetTester.pumpWidget(
      MaterialApp(
        home: ViewTransactionsScreen(viewTransactionsRepository: viewTransactionsRepository)
    ));

    await widgetTester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.text("January 10, 2025"), findsNWidgets(1));
    expect(find.text("Send money"), findsNWidgets(6));
  });

}