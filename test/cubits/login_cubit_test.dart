import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:send_money_app/cubits/login_cubit/login_cubit.dart';
import 'package:send_money_app/models/response/login_response.dart';

import '../mock_generator.mocks.dart';

void main () {
  late MockLoginRepository mockLoginRepo;

  const String mockData = """
    {
      "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3Mzc0Mzk0ODAsImV4cCI6MTczNzQ0MzA4MH0._k2zxdbZS0xS5vvA2GHFZwPoKmexld1KExPmXTjYJTg",
      "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcm5hbWUiOiJlbWlseXMiLCJlbWFpbCI6ImVtaWx5LmpvaG5zb25AeC5kdW1teWpzb24uY29tIiwiZmlyc3ROYW1lIjoiRW1pbHkiLCJsYXN0TmFtZSI6IkpvaG5zb24iLCJnZW5kZXIiOiJmZW1hbGUiLCJpbWFnZSI6Imh0dHBzOi8vZHVtbXlqc29uLmNvbS9pY29uL2VtaWx5cy8xMjgiLCJpYXQiOjE3Mzc0Mzk0ODAsImV4cCI6MTc0MDAzMTQ4MH0.VZW8qkaEaGP8WsjLv6Qt9tDNXo10EZf8pn5avvUuPWk",
      "id": 1,
      "username": "emilys",
      "email": "emily.johnson@x.dummyjson.com",
      "firstName": "Emily",
      "lastName": "Johnson",
      "gender": "female",
      "image": "https://dummyjson.com/icon/emilys/128"
    }
    """;

  setUpAll(() {
    mockLoginRepo = MockLoginRepository();
  });

  blocTest("Enable button set to false when only username is populated",
   build: () => LoginCubit(mockLoginRepo),
   act: (bloc) {
    bloc.userNameChangedValue("test");
   },
   expect: () => const <LoginState>
    [
      LoginState(enableButton: false, isLoading: false),
    ], 
  );

  blocTest("Enable button set to false when only password is populated",
   build: () => LoginCubit(mockLoginRepo),
   act: (bloc) {
    bloc.passwordChangedValue("test");
   },
   expect: () => const <LoginState>
    [
      LoginState(enableButton: false, isLoading: false),
    ], 
  );

  blocTest("Enable button set to true when username and password is populated",
   build: () => LoginCubit(mockLoginRepo),
   act: (bloc) {
    bloc.userNameChangedValue("test");
    bloc.passwordChangedValue("pass");
   },
   expect: () => const <LoginState>
    [
      LoginState(enableButton: false, isLoading: false),
      LoginState(enableButton: true, isLoading: false)
    ], 
  );

  blocTest("Successful login",
    build: () {
      when(mockLoginRepo.login(userName: "test", password: "pass")).
        thenAnswer((_) async => LoginResponse.fromJson(json.decode(mockData)));
      return LoginCubit(mockLoginRepo);
    },
    act: (bloc) {
      bloc.userNameChangedValue("test");
      bloc.passwordChangedValue("pass");
      bloc.performAuth();
   },
   expect: () => const <LoginState>
    [
      LoginState(enableButton: false, isLoading: false),
      LoginState(enableButton: true, isLoading: false),
      LoginState(enableButton: true, isLoading: true),
      LoginState(enableButton: true, isLoginSuccess: true, isLoading: false)
    ], 
  );

}