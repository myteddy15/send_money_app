import 'package:flutter/material.dart';
import 'package:send_money_app/utils/nav_routes.dart';
import 'package:send_money_app/views/screens/dashboard.dart';
import 'package:send_money_app/views/screens/login.dart';
import 'package:send_money_app/views/screens/send_money.dart';
import 'package:send_money_app/views/screens/view_transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send Money app',
      theme: ThemeData(
        primaryColor: const Color(0xff00b464),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff00b464)),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff00b464),
            foregroundColor: Colors.white,
            disabledBackgroundColor: const Color(0xff00b464).withOpacity(0.5),
            disabledForegroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )
          )
        ),
        iconTheme: const IconThemeData().copyWith(
          color: const Color(0xff00b464)
        ),
        useMaterial3: true
      ),
      initialRoute: NavRoutes.login,
      routes: {
        NavRoutes.login : (context) => LoginScreen(),
        NavRoutes.dashboard : (context) => DashboardScreen(),
        NavRoutes.sendMoney : (context) => SendMoneyScreen(),
        NavRoutes.viewTransactions : (context) => ViewTransactionsScreen()
      },
    );
  }
}