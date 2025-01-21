import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:send_money_app/cubits/login_cubit/login_cubit.dart';
import 'package:send_money_app/utils/nav_routes.dart';
import 'package:send_money_app/views/widgets/custom_elavated_button.dart';
import 'package:send_money_app/views/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key}) ;

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    final _loginCubit = LoginCubit();

    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
        ),
        body: BlocProvider(
          create: (context) => _loginCubit,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const FaIcon(FontAwesomeIcons.moneyBill1Wave, size: 120),
                    const SizedBox(height: 50),
                    CustomTextField(
                        labelText: "Username",
                        onChanged: ((value) {
                          _loginCubit.userNameChangedValue(value);
                        }),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp("[0-9a-zA-Z]"))
                        ],
                        controller: usernameController),
                    const SizedBox(height: 10),
                    CustomTextField(
                        labelText: "Password",
                        onChanged: ((value) {
                          _loginCubit.passwordChangedValue(value);
                        }),
                        obscureText: true,
                        controller: passwordController),
                    const SizedBox(height: 170),
                    CustomElavatedButton(
                        height: 50,
                        callback: state.enableButton ? () {
                          Navigator.pushReplacementNamed(context, NavRoutes.dashboard);
                        } : null,
                        labelText: "Log in")
                  ],
                );
              },
            ),
          ),
        ));
  }
}
