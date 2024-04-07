import 'package:infinit_test_esteban/data/assistant/dto/dashboard_data_dto.dart';
import 'package:infinit_test_esteban/data/assistant/dto/item_list_dto.dart';

abstract class AssistantRemoteDataSource {
  Future<ItemListDTO> getItemsList({required int page});

  Future<DashboardDataDTO> getDashboardData();
}
