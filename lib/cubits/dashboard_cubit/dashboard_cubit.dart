import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState(showBalance: true));

  void toggleBalance() {
    emit(state.copyWith(showBalance: !state.showBalance));
  }
}
