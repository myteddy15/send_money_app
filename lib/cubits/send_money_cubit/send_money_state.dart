part of 'send_money_cubit.dart';

class SendMoneyState extends Equatable {
  final bool enableButton;
  final bool isLoading;
  final SendMoneyResponse? sendMoneyResponse;
  final String? sendMoneyError;

  const SendMoneyState({
    required this.enableButton,
    required this.isLoading,
    this.sendMoneyResponse,
    this.sendMoneyError
  });

  SendMoneyState copyWith({
    bool? enableButton,
    bool? isLoading,
    SendMoneyResponse? sendMoneyResponse,
    String? sendMoneyError
    }) {
      return SendMoneyState(
        enableButton: enableButton ?? this.enableButton,
        isLoading: isLoading ?? this.isLoading,
        sendMoneyResponse: sendMoneyResponse,
        sendMoneyError: sendMoneyError
      );
  }

  @override
  List<Object?> get props => [enableButton, isLoading, sendMoneyResponse, sendMoneyError];
}
