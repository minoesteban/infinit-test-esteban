import 'package:infinit_test_esteban/data/assistant/dto/dashboard_data_dto.dart';
import 'package:infinit_test_esteban/data/utils/bidirectional_mapper.dart';
import 'package:infinit_test_esteban/domain/assistant/dashboard_data.dart';

class DashboardDataDTOMapper implements BidirectionalMapper<DashboardDataDTO, DashboardData> {
  const DashboardDataDTOMapper();

  @override
  DashboardDataDTO from(DashboardData data) {
    return DashboardDataDTO(
      period: data.period,
      total: data.total,
      average: data.average,
      nextPeriod: data.nextPeriod,
      nextPeriodEstimation: data.nextPeriodEstimation,
    );
  }

  @override
  DashboardData to(DashboardDataDTO data) {
    return DashboardData(
      period: data.period,
      total: data.total,
      average: data.average,
      nextPeriod: data.nextPeriod,
      nextPeriodEstimation: data.nextPeriodEstimation,
    );
  }
}
