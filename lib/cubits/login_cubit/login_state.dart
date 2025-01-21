part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool enableButton;
  final bool? isLoginSuccess;
  final bool isLoading;

  const LoginState({
    required this.enableButton, 
    required this.isLoading,
    this.isLoginSuccess
  });

  LoginState copyWith({
    bool? enableButton, 
    bool? isLoginSuccess,
    bool? isLoading}) {
      return LoginState(
        enableButton: enableButton ?? this.enableButton,
        isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
        isLoading: isLoading ?? this.isLoading
      );
  }
  
  @override
  List<Object?> get props => [enableButton, isLoginSuccess, isLoading];
}

