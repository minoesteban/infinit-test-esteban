import 'package:infinit_test_esteban/domain/assistant/assistant_providers.dart';
import 'package:infinit_test_esteban/domain/assistant/item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_items_list_use_case.g.dart';

@riverpod
Future<List<Item>> getItemsListUseCase(GetItemsListUseCaseRef ref, int page) async {
  final assistantRepository = await ref.read(assistantRepositoryProvider.future);

  return await assistantRepository.getItemsList(page: page);
}
