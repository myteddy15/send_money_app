import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:send_money_app/repositories/dashboard_repository.dart';
import 'package:send_money_app/repositories/login_repository.dart';

@GenerateNiceMocks([
  MockSpec<http.Client>(),
  MockSpec<LoginRepository>(),
  MockSpec<DashboardRepository>()
])
void main() {

}