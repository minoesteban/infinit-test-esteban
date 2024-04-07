import 'package:json_annotation/json_annotation.dart';

part 'dashboard_data_dto.g.dart';

@JsonSerializable(createToJson: false)
class DashboardDataDTO {
  const DashboardDataDTO({
    required this.period,
    required this.total,
    required this.average,
    required this.nextPeriod,
    required this.nextPeriodEstimation,
  });

  factory DashboardDataDTO.fromJson(Map<String, dynamic> json) => _$DashboardDataDTOFromJson(json);

  final String period;
  final double total;
  final double average;
  final String nextPeriod;
  final double nextPeriodEstimation;
}
