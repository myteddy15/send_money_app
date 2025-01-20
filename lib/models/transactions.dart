class Transactions {
  String date;
  List<TransactionDetails> transactionDetails;

  Transactions(this.date, this.transactionDetails);
}

class TransactionDetails {
  String name;
  String amount;

  TransactionDetails(this.name, this.amount);
}