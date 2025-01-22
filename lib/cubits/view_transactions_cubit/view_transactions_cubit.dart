import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:send_money_app/repositories/view_transactions_repository.dart';

import '../../models/transactions.dart';

part 'view_transactions_state.dart';

class ViewTransactionsCubit extends Cubit<ViewTransactionsState> {
  ViewTransactionsRepository? viewTransactionsRepository;

  ViewTransactionsCubit(this.viewTransactionsRepository) : super(const ViewTransactionsState(isLoading: false));

  Future<void> getTransactions() async {
    emit(state.copyWith(transactions: null, isLoading: true));
    try {
      final transactionResponse = await viewTransactionsRepository?.getTransactions();
      final List<Transactions>? transactions = transactionResponse?.transactions.map((e) {
        final transactionDetails = e.transactionsDetails.map((e) 
          => TransactionDetails(e.transactionName, e.amountSent.toString()));
        return Transactions(e.transactionDate, transactionDetails.toList());
      }).toList();

      transactions?.sort((a, b) => b.date.compareTo(a.date));

      emit(state.copyWith(transactions: transactions, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
