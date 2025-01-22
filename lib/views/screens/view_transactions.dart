// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:send_money_app/cubits/view_transactions_cubit/view_transactions_cubit.dart';
import 'package:send_money_app/repositories/view_transactions_repository.dart';
import 'package:send_money_app/views/widgets/transaction_list.dart';
import 'package:http/http.dart' as http;

class ViewTransactionsScreen extends StatelessWidget {
  late ViewTransactionsRepository? viewTransactionsRepository;

  ViewTransactionsScreen({super.key, 
    ViewTransactionsRepository? viewTransactionsRepository}) {
      this.viewTransactionsRepository = viewTransactionsRepository ??
        ViewTransactionsRepositoryImpl(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocProvider(
            create: (context) =>
                ViewTransactionsCubit(viewTransactionsRepository)
                  ..getTransactions(),
            child: BlocBuilder<ViewTransactionsCubit, ViewTransactionsState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator()
                  );
                } else {
                  return TransactonList(trancationData: state.transactions ?? []);
                }
              },
            ),
          )),
    );
  }
}
