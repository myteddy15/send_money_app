import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:send_money_app/repositories/dashboard_repository.dart';
import '../mock_generator.mocks.dart';

void main() {
  late MockClient mockClient;
  late DashboardRepository dashboardRepository;
  late Uri url;

  const String mockData = """
    {
      "wallat_balance": 2000
    }
    """;

  setUpAll(() {
    mockClient = MockClient();
    dashboardRepository = DashboardRepositoryImpl(mockClient);
    url = Uri.parse("https://dummyjson.com/c/9860-6649-4bc4-a998");
  });

  test("Dashboard repository successful wallet balance fecthing", () async {
    when(
      mockClient.get(url, ))
      .thenAnswer((_) async => http.Response(mockData, 201));

    final dashboardResponse = await dashboardRepository.fetchWalletBalance();

    expect(dashboardResponse.wallatBalance, 2000);
  });

  test("Dashboard repository failed wallet balance fecthing", () async {
    when(
      mockClient.get(url))
      .thenAnswer((_) async => http.Response(mockData, 400));

    expect(dashboardRepository.fetchWalletBalance(), throwsException);
  });

 }