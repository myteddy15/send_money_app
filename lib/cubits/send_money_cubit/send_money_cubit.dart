import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:send_money_app/models/response/send_money_response.dart';
import 'package:send_money_app/repositories/send_money_repository.dart';

part 'send_money_state.dart';

class SendMoneyCubit extends Cubit<SendMoneyState> {
  SendMoneyRepository? sendMoneyRepository;

  SendMoneyCubit(this.sendMoneyRepository) : super(const SendMoneyState(enableButton: false, isLoading: false));

  String amount = "";

  void amountValueChanged(String value) {
    amount = value;
    emit(state.copyWith(enableButton: value.isNotEmpty));
  }

  Future<void> sendMoney() async {
    emit(state.copyWith(sendMoneyError: null, sendMoneyResponse: null, isLoading: true));
    if (int.parse(amount) >= 300) {
      try {
        final sendMoneyResponse = await sendMoneyRepository?.sendMoney(amount: amount);
        emit(state.copyWith(sendMoneyResponse: sendMoneyResponse, isLoading: false));
      } catch (e) {
        emit(state.copyWith(sendMoneyError: "Error sending money.", sendMoneyResponse: null, isLoading: false));
      }
    } else {
      emit(state.copyWith(sendMoneyError: "Amount must be 300 or higher.", sendMoneyResponse: null, isLoading: false));
    }
  }

}
