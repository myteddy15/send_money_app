import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(enableButton: false));

  String _userName = "";
  String _password = "";

  void userNameChangedValue(String value) {
    _userName = value;
    checkValues();
  }

  void passwordChangedValue(String value) {
    _password = value;
    checkValues();
  }
  
  void checkValues() {
    emit(state.copyWith(enableButton: _userName.isNotEmpty && _password.isNotEmpty));
  }

}
