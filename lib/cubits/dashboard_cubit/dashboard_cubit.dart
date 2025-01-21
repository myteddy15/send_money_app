import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:send_money_app/models/response/dashboard_response.dart';
import 'package:send_money_app/repositories/dashboard_repository.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardRepository? dashboardRepository;

  DashboardCubit(this.dashboardRepository) : super(const DashboardState(showBalance: true, isLoading: false));

  void toggleBalance() {
    emit(state.copyWith(showBalance: !state.showBalance));
  }

  Future<void> fetchWalletBalance() async {
    emit(state.copyWith(isLoading: true));
    try {
      final dashboardResponse = await dashboardRepository?.fetchWalletBalance();
      emit(state.copyWith(dashboardResponse: dashboardResponse, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      throw Exception(e);
    }
  }
}
