import 'package:infinit_test_esteban/data/assistant/dto/item_dto.dart';
import 'package:infinit_test_esteban/data/utils/bidirectional_mapper.dart';
import 'package:infinit_test_esteban/domain/assistant/item.dart';

class ItemDTOMapper implements BidirectionalMapper<ItemDTO, Item> {
  const ItemDTOMapper();

  @override
  ItemDTO from(Item data) {
    return ItemDTO(
      name: data.name,
      description: data.description,
      content: data.content,
    );
  }

  @override
  Item to(ItemDTO data) {
    return Item(
      name: data.name,
      description: data.description,
      content: data.content,
    );
  }
}
