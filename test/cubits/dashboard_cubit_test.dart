import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:send_money_app/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:send_money_app/models/response/dashboard_response.dart';

import '../mock_generator.mocks.dart';

void main () {
  late MockDashboardRepository mockDashboardRepo;
  late DashboardResponse dashboardResponse;

  const String mockData = """
    {
      "wallat_balance": 100000
    }
    """;

  setUpAll(() {
    mockDashboardRepo = MockDashboardRepository();
    dashboardResponse = DashboardResponse.fromJson(json.decode(mockData));
  });

  blocTest("Hide wallet balnce",
   build: () => DashboardCubit(mockDashboardRepo),
   act: (bloc) {
    bloc.toggleBalance();
   },
   expect: () => const <DashboardState>
    [
      DashboardState(showBalance: false, isLoading: false),
    ], 
  );

  blocTest("Successful fetching wallet balance",
    build: () {
      when(mockDashboardRepo.fetchWalletBalance()).
        thenAnswer((_) async => dashboardResponse);
      return DashboardCubit(mockDashboardRepo);
    },
    act: (bloc) {
      bloc.fetchWalletBalance();
   },
   expect: () => <DashboardState>
    [
      const DashboardState(showBalance: true, isLoading: true),
      DashboardState(showBalance: true, isLoading: false, dashboardResponse: dashboardResponse),
    ], 
  );

  blocTest("Toggling off wallet balance then successful fetching wallet balance",
    build: () {
      when(mockDashboardRepo.fetchWalletBalance()).
        thenAnswer((_) async => dashboardResponse);
      return DashboardCubit(mockDashboardRepo);
    },
    act: (bloc) {
      bloc.toggleBalance();
      bloc.fetchWalletBalance();
   },
   expect: () => <DashboardState>
    [
      const DashboardState(showBalance: false, isLoading: false),
      const DashboardState(showBalance: false, isLoading: true),
      DashboardState(showBalance: false, isLoading: false, dashboardResponse: dashboardResponse),
    ], 
  );

}