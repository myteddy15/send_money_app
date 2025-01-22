import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:send_money_app/repositories/view_transactions_repository.dart';
import '../mock_generator.mocks.dart';

void main() {
  late MockClient mockClient;
  late ViewTransactionsRepository viewTransactionsRepository;
  late Uri url;

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
    mockClient = MockClient();
    viewTransactionsRepository = ViewTransactionsRepositoryImpl(mockClient);
    url = Uri.parse("https://dummyjson.com/c/efe9-0cd5-4194-a9e0");
  });

  test("View transactions repository successfully fetching transactions", () async {
    when(
      mockClient.get(url, ))
      .thenAnswer((_) async => http.Response(mockData, 201));

    final transactionResponse = await viewTransactionsRepository.getTransactions();

    expect(transactionResponse.transactions.length, 3);
  });

  test("View transactions repository failed fetching transactions", () async {
    when(
      mockClient.get(url))
      .thenAnswer((_) async => http.Response(mockData, 400));

    expect(viewTransactionsRepository.getTransactions(), throwsException);
  });

 }