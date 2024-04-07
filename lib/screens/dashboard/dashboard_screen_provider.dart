import 'dart:async';

import 'package:infinit_test_esteban/domain/assistant/use_case/get_dashboard_data_use_case.dart';
import 'package:infinit_test_esteban/screens/dashboard/dashboard_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_screen_provider.g.dart';

@riverpod
class DashboardScreenNotifier extends _$DashboardScreenNotifier {
  @override
  Future<DashboardScreenState> build() async {
    state = const AsyncValue.loading();

    final data = await ref.watch(getDashboardDataUseCaseProvider.future);

    return DashboardScreenState.idle(data);
  }
}
