import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:send_money_app/cubits/send_money_cubit/send_money_cubit.dart';
import 'package:send_money_app/models/response/send_money_response.dart';

import '../mock_generator.mocks.dart';

void main () {
  late MockSendMoneyRepository mockSendMoneyRepository;
  late SendMoneyResponse sendMoneyResponse;  

  const String mockData = """
    {
      "amount_sent": 2000,
      "date_time": "01-22-2025 02:51"
    }
    """;

  setUpAll(() {
    mockSendMoneyRepository = MockSendMoneyRepository();
    sendMoneyResponse = SendMoneyResponse.fromJson(json.decode(mockData));
  });

  blocTest("Enable button set to true when amount textfield is populated",
   build: () => SendMoneyCubit(mockSendMoneyRepository),
   act: (bloc) {
    bloc.amountValueChanged("test");
   },
   expect: () => const <SendMoneyState>
    [
      SendMoneyState(enableButton: true, isLoading: false),
    ], 
  );

  blocTest("Enable button set to false when amount textfield is populated then text is removed",
   build: () => SendMoneyCubit(mockSendMoneyRepository),
   act: (bloc) {
    bloc.amountValueChanged("test");
    bloc.amountValueChanged("");
   },
   expect: () => const <SendMoneyState>
    [
      SendMoneyState(enableButton: true, isLoading: false),
      SendMoneyState(enableButton: false, isLoading: false)
    ], 
  );

  blocTest("Send money api successful",
    build: () {
      when(mockSendMoneyRepository.sendMoney(amount: "1000")).
        thenAnswer((_) async => sendMoneyResponse);
      return SendMoneyCubit(mockSendMoneyRepository);
    },
    act: (bloc) {
      bloc.amountValueChanged("1000");
      bloc.sendMoney();
   },
   expect: () => <SendMoneyState>
    [
      const SendMoneyState(enableButton: true, isLoading: false),
      const SendMoneyState(enableButton: true, isLoading: true),
      SendMoneyState(enableButton: true, isLoading: false, sendMoneyResponse: sendMoneyResponse),
    ], 
  );

  blocTest("Amount is less than 300, send money error",
    build: () {
      when(mockSendMoneyRepository.sendMoney(amount: "200")).
        thenAnswer((_) async => sendMoneyResponse);
      return SendMoneyCubit(mockSendMoneyRepository);
    },
    act: (bloc) {
      bloc.amountValueChanged("200");
      bloc.sendMoney();
   },
   expect: () => <SendMoneyState>
    [
      const SendMoneyState(enableButton: true, isLoading: false),
      const SendMoneyState(enableButton: true, isLoading: true),
      const SendMoneyState(enableButton: true, isLoading: false, sendMoneyError: "Amount must be 300 or higher."),
    ], 
  );

  blocTest("Send money api failure",
    build: () {
      when(mockSendMoneyRepository.sendMoney(amount: "1000")).
        thenThrow((_) async => Exception());
      return SendMoneyCubit(mockSendMoneyRepository);
    },
    act: (bloc) {
      bloc.amountValueChanged("1000");
      bloc.sendMoney();
   },
   expect: () => <SendMoneyState>
    [
      const SendMoneyState(enableButton: true, isLoading: false),
      const SendMoneyState(enableButton: true, isLoading: true),
      const SendMoneyState(enableButton: true, isLoading: false, sendMoneyError: "Error sending money."),
    ], 
  );

}