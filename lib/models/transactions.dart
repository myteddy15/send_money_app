import 'package:equatable/equatable.dart';

class Transactions extends Equatable {
  final String date;
  final List<TransactionDetails> transactionDetails;

  const Transactions(this.date, this.transactionDetails);
  
  @override
  List<Object?> get props => [date, transactionDetails];
}

class TransactionDetails extends Equatable {
  final String name;
  final String amount;

  const TransactionDetails(this.name, this.amount);
  
  @override
  List<Object?> get props => [name, amount];
}