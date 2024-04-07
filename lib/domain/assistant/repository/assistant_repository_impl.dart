import 'package:infinit_test_esteban/data/assistant/assistant_remote_data_source.dart';
import 'package:infinit_test_esteban/data/assistant/mapper/dashboard_data_dto_mapper.dart';
import 'package:infinit_test_esteban/data/assistant/mapper/item_dto_mapper.dart';
import 'package:infinit_test_esteban/domain/assistant/dashboard_data.dart';
import 'package:infinit_test_esteban/domain/assistant/item.dart';
import 'package:infinit_test_esteban/domain/assistant/repository/assistant_repository.dart';

class AssistantRepositoryImpl implements AssistantRepository {
  const AssistantRepositoryImpl(this._assistantRemoteDataSource);

  final AssistantRemoteDataSource _assistantRemoteDataSource;

  ItemDTOMapper get _itemDTOMapper => const ItemDTOMapper();
  DashboardDataDTOMapper get _dashboardDataDTOMapper => const DashboardDataDTOMapper();

  @override
  Future<List<Item>> getItemsList({required int page}) async {
    final itemListDTO = await _assistantRemoteDataSource.getItemsList(page: page);
    return itemListDTO.items.map(_itemDTOMapper.to).toList();
  }

  @override
  Future<DashboardData> getDashboardData() async {
    final dashboardDataDTO = await _assistantRemoteDataSource.getDashboardData();
    return _dashboardDataDTOMapper.to(dashboardDataDTO);
  }
}
