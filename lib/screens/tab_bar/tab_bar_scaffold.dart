import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinit_test_esteban/screens/dashboard/dashboard_screen.dart';
import 'package:infinit_test_esteban/screens/items/items_list_screen.dart';

class TabBarScaffold extends StatelessWidget {
  const TabBarScaffold({
    required this.child,
    super.key,
  });

  final Widget child;

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Items',
          ),
        ],
        currentIndex: calculateSelectedIndex(context),
        onTap: (idx) => onItemTapped(context, idx),
      ),
    );
  }

  static int calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    if (location.startsWith(DashboardScreen.routeName)) {
      return 0;
    }
    if (location.startsWith(ItemsListScreen.routeName)) {
      return 1;
    }

    return 0;
  }

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(DashboardScreen.routeName);
      case 1:
        context.go(ItemsListScreen.routeName);
    }
  }
}
