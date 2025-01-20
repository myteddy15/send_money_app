import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:send_money_app/utils/nav_routes.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                )]
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Wallet Balance",
                      style: const TextStyle().copyWith(
                        fontSize: 18
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const FaIcon(FontAwesomeIcons.pesoSign),
                        Text(
                          "100000",
                          style: const TextStyle().copyWith(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.75)
                          ),
                        ),
                        const FaIcon(FontAwesomeIcons.eye),
                      ],
                    )
                  ]
                  ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.paperPlane),
                onPressed: () {
                  Navigator.pushNamed(context, NavRoutes.sendMoney);
                },
                label: Text(
                  "Send Money",
                  style: const TextStyle().copyWith(
                    fontSize: 16
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton.icon(
                icon: const FaIcon(FontAwesomeIcons.list),
                onPressed: () {
                  Navigator.pushNamed(context, NavRoutes.viewTransactions);
                },
                label: Text(
                  "View Transactions",
                  style: const TextStyle().copyWith(
                    fontSize: 16
                  ),
                ),
              ),
            )
        ]),
      ),
    );
  }
}