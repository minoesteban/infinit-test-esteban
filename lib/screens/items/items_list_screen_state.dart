import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinit_test_esteban/domain/assistant/item.dart';

part 'items_list_screen_state.freezed.dart';

@freezed
class ItemsListScreenState with _$ItemsListScreenState {
  const factory ItemsListScreenState.init() = _ItemsListScreenStateInit;

  const factory ItemsListScreenState.loading(int page) = _ItemsListScreenStateLoading;

  const factory ItemsListScreenState.idle(int page, List<Item> items) = _ItemsListScreenStateIdle;
}
