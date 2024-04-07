import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinit_test_esteban/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: InfinitApp(),
    ),
  );
}

class InfinitApp extends ConsumerWidget {
  const InfinitApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Infinit',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
