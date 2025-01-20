import 'package:flutter/material.dart';
import 'package:send_money_app/utils/nav_routes.dart';
import 'package:send_money_app/views/screens/dashboard.dart';
import 'package:send_money_app/views/screens/login.dart';
import 'package:send_money_app/views/screens/send_money.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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
        NavRoutes.login: (context) => const LoginScreen(),
        NavRoutes.dashboard :(context) => const DashboardScreen(),
        NavRoutes.sendMoney :(context) => const SendMoneyScreen()
      },
    );
  }
}