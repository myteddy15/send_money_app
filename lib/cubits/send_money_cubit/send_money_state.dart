part of 'send_money_cubit.dart';

class SendMoneyState extends Equatable {
  final bool enableButton;

  const SendMoneyState({required this.enableButton});

  SendMoneyState copyWith({bool? enableButton}) {
    return SendMoneyState(enableButton: enableButton ?? this.enableButton);
  }

  @override
  List<Object> get props => [];
}
