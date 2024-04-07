import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinit_test_esteban/domain/assistant/item.dart';
import 'package:infinit_test_esteban/screens/dashboard/dashboard_screen.dart';
import 'package:infinit_test_esteban/screens/items/item_details_screen.dart';
import 'package:infinit_test_esteban/screens/items/items_list_screen.dart';
import 'package:infinit_test_esteban/screens/tab_bar/tab_bar_scaffold.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final navigatorKey = GlobalKey<NavigatorState>();

  final router = GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: false,
    initialLocation: DashboardScreen.routeName,
    routes: [
      tabsRouter,
    ],
  );

  ref.onDispose(router.dispose);

  return router;
}

@visibleForTesting
final tabsRouter = ShellRoute(
  builder: (context, state, child) => TabBarScaffold(child: child),
  routes: [
    dashboardTabRoute,
    itemsTabRoute,
  ],
);

@visibleForTesting
final dashboardTabRoute = GoRoute(
  path: DashboardScreen.routeName,
  builder: (ctx, state) => const DashboardScreen(),
);

@visibleForTesting
final itemsTabRoute = GoRoute(
  path: ItemsListScreen.routeName,
  builder: (ctx, state) => const ItemsListScreen(),
  routes: [
    itemDetailsRoute,
  ],
);

@visibleForTesting
final itemDetailsRoute = GoRoute(
  path: ItemDetailsScreen.routeName,
  builder: (ctx, state) {
    final args = state.extra as Map<String, dynamic>;
    return ItemDetailsScreen(item: args['item'] as Item);
  },
);
