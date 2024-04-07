import 'dart:async';
import 'package:infinit_test_esteban/domain/assistant/use_case/get_items_list_use_case.dart';
import 'package:infinit_test_esteban/screens/items/items_list_screen_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'items_list_screen_provider.g.dart';

@riverpod
class ItemsListScreenNotifier extends _$ItemsListScreenNotifier {
  int _page = 1;

  @override
  Future<ItemsListScreenState> build() async {
    state = AsyncValue.data(
      ItemsListScreenState.loading(_page),
    );

    final data = await ref.watch(getItemsListUseCaseProvider(_page).future);

    return ItemsListScreenState.idle(_page, data);
  }

  void nextPage() async {
    _page++;
    state = AsyncValue.data(
      ItemsListScreenState.loading(_page),
    );

    final data = await ref.watch(getItemsListUseCaseProvider(_page).future);

    state = AsyncValue.data(
      ItemsListScreenState.idle(_page, data),
    );
  }

  void previousPage() async {
    if (_page > 1) {
      _page--;
      state = AsyncValue.data(
        ItemsListScreenState.loading(_page),
      );

      final data = await ref.watch(getItemsListUseCaseProvider(_page).future);

      state = AsyncValue.data(
        ItemsListScreenState.idle(_page, data),
      );
    }
  }
}
