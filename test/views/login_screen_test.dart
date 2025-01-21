import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:send_money_app/views/screens/login.dart';
import 'package:send_money_app/views/widgets/custom_text_field.dart';

void main() {
  final TestWidgetsFlutterBinding binding = TestWidgetsFlutterBinding.ensureInitialized();
  
  testWidgets("Login screen test", (widgetTester) async {
    await binding.setSurfaceSize(const Size(640, 640));
    await widgetTester.pumpWidget(
      MaterialApp(
        home: LoginScreen()
    ));

    expect(find.byType(CustomTextField), findsNWidgets(2));
    await widgetTester.pumpAndSettle(const Duration(seconds: 2));

  });

}