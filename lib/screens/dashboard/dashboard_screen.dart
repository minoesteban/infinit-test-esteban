import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinit_test_esteban/screens/dashboard/dashboard_screen_provider.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardScreenNotifierProvider);
    return state.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (data) => data.when(
        init: () => const Center(
          child: CircularProgressIndicator(),
        ),
        idle: (data) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Period ${data.period}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  'Total: ${data.total.toString()}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 20),
                Text(
                  'Avg: ${data.average.toString()}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 60),
                Text(
                  'Next Period: ${data.nextPeriod}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  'Estimation: ${data.nextPeriodEstimation.toString()}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ),
      error: (error, stackTrace) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
