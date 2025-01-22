// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:send_money_app/cubits/send_money_cubit/send_money_cubit.dart';
import 'package:send_money_app/repositories/send_money_repository.dart';
import 'package:send_money_app/views/widgets/header_text.dart';
import 'package:http/http.dart' as http;

import '../../utils/modal_sheet.dart';
import '../../utils/nav_routes.dart';
import '../widgets/custom_elavated_button.dart';
import '../widgets/custom_text_field.dart';

class SendMoneyScreen extends StatelessWidget {
  late SendMoneyRepository? sendMoneyRepository;

  SendMoneyScreen({super.key, SendMoneyRepository? sendMoneyRepository}) {
    this.sendMoneyRepository = sendMoneyRepository ?? SendMoneyRepositoryImpl(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    final sendMoneyCubit = SendMoneyCubit(sendMoneyRepository);

    final sendMoneyController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, NavRoutes.login, (route) => false);
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => sendMoneyCubit,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<SendMoneyCubit, SendMoneyState>(
            listener: (context, state) {
              if (state.sendMoneyResponse != null) {
                ModalSheet().showbottomModalSheet(
                  context, 
                  "${sendMoneyCubit.amount} sent successfully!"
                );
              } else if (state.sendMoneyError != null) {
                ModalSheet().showbottomModalSheet(
                  context, 
                  state.sendMoneyError ?? "")
                ;
              }
            },
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator()
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderText(text: "Send Money"),
                    const SizedBox(height: 50),
                    CustomTextField(
                      labelText: "Amount",
                      onChanged: ((value) {
                        sendMoneyCubit.amountValueChanged(value);
                      }),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                      ],
                      controller: sendMoneyController),
                    const SizedBox(height: 20),
                    CustomElavatedButton(
                      height: 50,
                      icon: const FaIcon(FontAwesomeIcons.paperPlane),
                      callback: state.enableButton ? () async {
                        await sendMoneyCubit.sendMoney();
                      } : null,
                      labelText: "Submit")
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
