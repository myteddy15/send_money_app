import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:send_money_app/repositories/dashboard_repository.dart';
import 'package:send_money_app/views/screens/dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:send_money_app/views/widgets/custom_elavated_button.dart';

import '../mock_generator.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const String mockData = """
    {
      "wallat_balance": 100000
    }
    """;

  late DashboardRepository dashboardRepository;
  late MockClient mockClient;
  late Uri url;

  setUpAll(() {
    mockClient = MockClient();
    url = Uri.parse("https://dummyjson.com/c/9860-6649-4bc4-a998");
    dashboardRepository = DashboardRepository(mockClient);
  });

  
  testWidgets("Dashboard screen test, find wallet balance", (widgetTester) async {
    when(
      mockClient.get(url, ))
      .thenAnswer((_) async => http.Response(mockData, 201));
    
    await widgetTester.pumpWidget(
      MaterialApp(
        home: DashboardScreen(dashboardRepository: dashboardRepository)
    ));

    await widgetTester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.text("Wallet Balance"), findsNWidgets(1));
    expect(find.text("100000"), findsNWidgets(1));
  });

  testWidgets("Dashboard screen test, find 2 CustomElevatedButton", (widgetTester) async {
    when(
      mockClient.get(url, ))
      .thenAnswer((_) async => http.Response(mockData, 201));
    
    await widgetTester.pumpWidget(
      MaterialApp(
        home: DashboardScreen(dashboardRepository: dashboardRepository)
    ));

    await widgetTester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.byType(CustomElavatedButton), findsNWidgets(2));
  });

}