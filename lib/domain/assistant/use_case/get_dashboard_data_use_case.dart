import 'package:infinit_test_esteban/domain/assistant/assistant_providers.dart';
import 'package:infinit_test_esteban/domain/assistant/dashboard_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_dashboard_data_use_case.g.dart';

@riverpod
Future<DashboardData> getDashboardDataUseCase(GetDashboardDataUseCaseRef ref) async {
  final assistantRepository = await ref.read(assistantRepositoryProvider.future);

  return await assistantRepository.getDashboardData();
}
