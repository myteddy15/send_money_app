import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:send_money_app/utils/nav_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const FaIcon(
              FontAwesomeIcons.moneyBill1Wave,
              size: 120),
            const SizedBox(height: 50),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: "Email",
                border: const OutlineInputBorder().copyWith(
                  borderSide: const BorderSide(width: 1.0)
                )
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration:  InputDecoration(
                labelText: "Password",
                border: const OutlineInputBorder().copyWith(
                  borderSide: const BorderSide(width: 1.0)
                )
              ),
            ),
            const SizedBox(height: 170),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, NavRoutes.dashboard);
                },
                child: const Text("Log in")),
            )
          ],
        ),
      )
    );
  }
}