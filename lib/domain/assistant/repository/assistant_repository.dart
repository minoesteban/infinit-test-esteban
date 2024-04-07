import 'package:infinit_test_esteban/domain/assistant/dashboard_data.dart';
import 'package:infinit_test_esteban/domain/assistant/item.dart';

abstract class AssistantRepository {
  Future<List<Item>> getItemsList({required int page});

  Future<DashboardData> getDashboardData();
}
