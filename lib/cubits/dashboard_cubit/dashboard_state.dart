part of 'dashboard_cubit.dart';

class DashboardState extends Equatable {
  final bool showBalance;
  final bool isLoading;
  final DashboardResponse? dashboardResponse;

  const DashboardState({
    required this.showBalance,
    required this.isLoading,
    this.dashboardResponse
  });

  DashboardState copyWith({
    bool? showBalance,
    bool? isLoading,
    DashboardResponse? dashboardResponse
  }) {
    return DashboardState(
      showBalance: showBalance ?? this.showBalance,
      isLoading: isLoading ?? this.isLoading,
      dashboardResponse: dashboardResponse ?? this.dashboardResponse
    );
  }

  @override
  List<Object?> get props => [showBalance, isLoading, dashboardResponse];
}
