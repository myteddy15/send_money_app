import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:send_money_app/utils/nav_routes.dart';
import 'package:send_money_app/views/widgets/custom_elavated_button.dart';
import 'package:send_money_app/views/widgets/custom_text_field.dart';

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
            CustomTextField(
              labelText: "Username", 
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]"))
              ],
              controller: usernameController
            ),
            const SizedBox(height: 10),
            CustomTextField(
              labelText: "Password", 
              obscureText: true,
              controller: passwordController
            ),
            const SizedBox(height: 170),
            CustomElavatedButton(
              height: 50, 
              callback: () {
                Navigator.pushReplacementNamed(context, NavRoutes.dashboard);
              }, 
              labelText: "Log in"
            )
          ],
        ),
      )
    );
  }
}