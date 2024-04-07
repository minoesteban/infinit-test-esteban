import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinit_test_esteban/domain/assistant/dashboard_data.dart';

part 'dashboard_screen_state.freezed.dart';

@freezed
class DashboardScreenState with _$DashboardScreenState {
  const factory DashboardScreenState.init() = _DashboardScreenStateInit;

  const factory DashboardScreenState.idle(DashboardData data) = _DashboardScreenStateIdle;
}
