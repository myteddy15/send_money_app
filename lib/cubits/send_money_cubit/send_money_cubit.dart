import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'send_money_state.dart';

class SendMoneyCubit extends Cubit<SendMoneyState> {
  SendMoneyCubit() : super(const SendMoneyState(enableButton: false));

  void amountValueChanged(String value) {
    emit(state.copyWith(enableButton: value.isNotEmpty));
  }
}
