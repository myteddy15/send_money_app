import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/login_response.dart';
import '../../repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(enableButton: false, isLoading: false));

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

  Future<void> performAuth() async {
    emit(state.copyWith(isLoading: true));
    try {
      await LoginRepository().login(userName: _userName, password: _password);
      emit(state.copyWith(isLoginSuccess: true, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      throw Exception(e);
    }
  }

}
