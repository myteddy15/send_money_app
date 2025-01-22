// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:send_money_app/cubits/login_cubit/login_cubit.dart';
import 'package:send_money_app/repositories/login_repository.dart';
import 'package:send_money_app/utils/nav_routes.dart';
import 'package:send_money_app/views/widgets/custom_elavated_button.dart';
import 'package:send_money_app/views/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {

  late LoginRepository? loginRepository;

  LoginScreen({super.key, LoginRepository? loginRepository}) {
    this.loginRepository = loginRepository ?? LoginRepositoryImpl(http.Client());
  } 

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    final loginCubit = LoginCubit(loginRepository);

    return Scaffold(
        appBar: AppBar(
          title: const Text(""),
        ),
        body: BlocProvider(
          create: (context) => loginCubit,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.isLoginSuccess == true) {
                  Navigator.pushReplacementNamed(context, NavRoutes.dashboard);
                }
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator()
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const FaIcon(FontAwesomeIcons.moneyBill1Wave, size: 120),
                      const SizedBox(height: 50),
                      CustomTextField(
                        labelText: "Username",
                        onChanged: ((value) {
                          loginCubit.userNameChangedValue(value);
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
                          loginCubit.passwordChangedValue(value);
                        }),
                        obscureText: true,
                        controller: passwordController),
                      const SizedBox(height: 170),
                      CustomElavatedButton(
                        height: 50,
                        callback: state.enableButton ? () async {
                          try { 
                            await loginCubit.performAuth();
                          } catch (e) {
                            if (context.mounted) {
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  title: const Text("Error"),
                                  content: const Text("Authentication error"),
                                  actions: [
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: Theme.of(context).textTheme.labelLarge,
                                      ),
                                      child: const Text('Okay'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                            }
                          }
                        } : null,
                        labelText: "Log in")
                    ],
                  );
                }
              },
            ),
          ),
        ));
  }
}
