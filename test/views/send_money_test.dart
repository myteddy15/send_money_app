import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:send_money_app/views/screens/send_money.dart';
import 'package:send_money_app/views/widgets/custom_elavated_button.dart';
import 'package:send_money_app/views/widgets/custom_text_field.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  
  testWidgets("Send money screen test, find 1 CustomTextField", (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: SendMoneyScreen()
    ));

    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byType(CustomTextField), findsNWidgets(1));
  });

  testWidgets("Send money screen test, find 1 CustomElavatedButton", (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: SendMoneyScreen()
    ));

    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byType(CustomElavatedButton), findsNWidgets(1));
  });

  testWidgets("Send money screen test, find text Send Money", (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: SendMoneyScreen()
    ));

    await widgetTester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.text("Send Money"), findsNWidgets(1));
  });

}