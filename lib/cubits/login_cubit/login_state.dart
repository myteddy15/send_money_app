part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool enableButton;

  const LoginState({required this.enableButton});

  LoginState copyWith({bool? enableButton}) {
    return LoginState(enableButton: enableButton ?? this.enableButton);
  }
  
  @override
  List<Object?> get props => [enableButton];
}

