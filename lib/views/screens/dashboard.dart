import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:send_money_app/cubits/dashboard_cubit/dashboard_cubit.dart';
import 'package:send_money_app/utils/nav_routes.dart';

import '../widgets/custom_elavated_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardCubit = DashboardCubit();

    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => dashboardCubit,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<DashboardCubit, DashboardState>(
            builder: (context, state) {
              return Column(children: [
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Wallet Balance",
                            style: const TextStyle().copyWith(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const FaIcon(FontAwesomeIcons.pesoSign),
                              Text(
                                state.showBalance ? "100000" : "*******",
                                style: const TextStyle().copyWith(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black.withOpacity(0.75)),
                              ),
                              IconButton(onPressed: () {
                                dashboardCubit.toggleBalance();
                              }, icon: state.showBalance ? const FaIcon(FontAwesomeIcons.eye) : const FaIcon(FontAwesomeIcons.eyeSlash))
                            ],
                          )
                        ]),
                  ),
                ),
                const SizedBox(height: 50),
                CustomElavatedButton(
                    height: 50,
                    icon: const FaIcon(FontAwesomeIcons.paperPlane),
                    callback: () {
                      Navigator.pushNamed(context, NavRoutes.sendMoney);
                    },
                    labelText: "Send Money"),
                const SizedBox(height: 20),
                CustomElavatedButton(
                    height: 50,
                    icon: const FaIcon(FontAwesomeIcons.list),
                    callback: () {
                      Navigator.pushNamed(context, NavRoutes.viewTransactions);
                    },
                    labelText: "View Transactions")
              ]);
            },
          ),
        ),
      ),
    );
  }
}
