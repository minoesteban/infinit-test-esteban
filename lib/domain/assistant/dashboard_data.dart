class DashboardData {
  const DashboardData({
    required this.period,
    required this.total,
    required this.average,
    required this.nextPeriod,
    required this.nextPeriodEstimation,
  });

  final String period;
  final double total;
  final double average;
  final String nextPeriod;
  final double nextPeriodEstimation;
}
