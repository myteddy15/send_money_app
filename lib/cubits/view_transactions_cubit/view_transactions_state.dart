part of 'view_transactions_cubit.dart';

class ViewTransactionsState extends Equatable {
  final bool isLoading;
  final List<Transactions>? transactions;

  const ViewTransactionsState({
    required this.isLoading,
    this.transactions
  });

  ViewTransactionsState copyWith({
    bool? isLoading,
    List<Transactions>? transactions
  }) {
    return ViewTransactionsState(
      isLoading: isLoading ?? this.isLoading,
      transactions: transactions
    );
  }

  @override
  List<Object?> get props => [isLoading, transactions];
}

