import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:send_money_app/utils/nav_routes.dart';

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
            Text(
              "Send Money",
              textAlign: TextAlign.start,
              style: const TextStyle().copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.75)
              ),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: sendMoneyController,
              decoration: InputDecoration(
                labelText: "Amount",
                border: const OutlineInputBorder().copyWith(
                  borderSide: const BorderSide(width: 1.0)
                )
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.paperPlane),
                onPressed: () {
                  Navigator.pushNamed(context, NavRoutes.sendMoney);
                },
                label: Text(
                  "Submit",
                  style: const TextStyle().copyWith(
                    fontSize: 16
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}