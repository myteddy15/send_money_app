part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final bool showBalance;

  const DashboardState({required this.showBalance});

  DashboardState copyWith({bool? showBalance}) {
    return DashboardState(showBalance: showBalance ?? this.showBalance);
  }

  @override
  List<Object> get props => [showBalance];
}
