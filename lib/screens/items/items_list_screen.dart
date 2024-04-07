import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinit_test_esteban/screens/items/item_details_screen.dart';
import 'package:infinit_test_esteban/screens/items/items_list_screen_provider.dart';

class ItemsListScreen extends HookConsumerWidget {
  const ItemsListScreen({super.key});

  static const routeName = '/items';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(itemsListScreenNotifierProvider.notifier);
    final state = ref.watch(itemsListScreenNotifierProvider);
    return state.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (data) => data.when(
        init: () => const Center(
          child: CircularProgressIndicator(),
        ),
        idle: (page, data) => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];

                  return Card(
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Text(item.description),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      ),
                      onTap: () => context.push(
                        '$routeName/${ItemDetailsScreen.routeName}',
                        extra: {'item': item},
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PageIndicator(
                page: page,
                onNextPage: notifier.nextPage,
                onPreviousPage: notifier.previousPage,
              ),
            ),
          ],
        ),
        loading: (page) => Stack(
          children: [
            const Center(
              child: CircularProgressIndicator(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: PageIndicator(
                page: page,
                onNextPage: notifier.nextPage,
                onPreviousPage: notifier.previousPage,
              ),
            ),
          ],
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

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    required this.page,
    required this.onNextPage,
    required this.onPreviousPage,
    super.key,
  });

  final int page;
  final VoidCallback onNextPage;
  final VoidCallback onPreviousPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: onPreviousPage,
            ),
            const Spacer(),
            Text(
              'Page $page',
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: onNextPage,
            ),
          ],
        ),
      ),
    );
  }
}
