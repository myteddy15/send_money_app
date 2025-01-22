import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:send_money_app/models/payload/send_money_payload.dart';
import 'package:send_money_app/repositories/send_money_repository.dart';
import '../mock_generator.mocks.dart';

void main() {
  late MockClient mockClient;
  late SendMoneyRepository sendMoneyRepo;
  late Uri url;
  late SendMoneyPayload sendMoneyPayload;

  const String mockData = """
    {
      "amount_sent": 2000,
      "date_time": "01-22-2025 02:51"
    }
    """;

  setUpAll(() {
    mockClient = MockClient();
    sendMoneyRepo = SendMoneyRepositoryImpl(mockClient);
    url = Uri.parse("https://dummyjson.com/c/96f5-fe85-4e53-8227");
    sendMoneyPayload = SendMoneyPayload(amount: "1000");
  });

  test("Send money api successful", () async {
    when(
      mockClient.post(url, body: sendMoneyPayload.toJson()))
      .thenAnswer((_) async => http.Response(mockData, 201));

    final sendMoneyResponse = await sendMoneyRepo.sendMoney(amount: "1000");

    expect(sendMoneyResponse.amountSent, 2000);
  });

  test("Send money api failed", () async {
    when(
      mockClient.post(url, body: sendMoneyPayload.toJson()))
      .thenAnswer((_) async => http.Response(mockData, 400));

    expect(sendMoneyRepo.sendMoney(amount: "1000"), throwsException);
  });

 }