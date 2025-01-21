import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:send_money_app/utils/nav_routes.dart';
import 'package:send_money_app/views/widgets/header_text.dart';

import '../widgets/custom_elavated_button.dart';
import '../widgets/custom_text_field.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sendMoneyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(text: "Send Money"),
            const SizedBox(height: 50),
            CustomTextField(
              labelText: "Amount",
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              ],
              controller: sendMoneyController
            ),
            const SizedBox(height: 20),
            CustomElavatedButton(
              height: 50, 
              icon: const FaIcon(FontAwesomeIcons.paperPlane),
              callback: () {
                Navigator.pushNamed(context, NavRoutes.sendMoney);
              }, 
              labelText: "Submit"
            )
          ],
        ),
      ),
    );
  }
}