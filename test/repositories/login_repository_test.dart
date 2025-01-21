import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:send_money_app/models/login_payload.dart';
import 'package:send_money_app/repositories/login_repository.dart';
import '../mock_generator.mocks.dart';

void main() {
  late MockClient mockClient;
  late LoginRepository loginRepo;
  late Uri url;
  late LoginPayload loginPayload;

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
    mockClient = MockClient();
    loginRepo = LoginRepository(mockClient);
    url = Uri.parse("https://dummyjson.com/auth/login");
    loginPayload = LoginPayload(username: "username", password: "password");
  });

  test("Login repository successful authentication", () async {
    when(
      mockClient.post(url, body: loginPayload.toJson()))
      .thenAnswer((_) async => http.Response(mockData, 201));

    final loginRespnse = await loginRepo.login(userName: "username", password: "password");

    expect(loginRespnse.firstName, "Emily");
  });

  test("Login repository failed authentication", () async {
    when(
      mockClient.post(url, body: loginPayload.toJson()))
      .thenAnswer((_) async => http.Response(mockData, 400));

    expect(loginRepo.login(userName: "username", password: "password"), throwsException);
  });

 }