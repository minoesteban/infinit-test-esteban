import 'package:infinit_test_esteban/data/assistant/dto/item_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_list_dto.g.dart';

@JsonSerializable(createToJson: false)
class ItemListDTO {
  const ItemListDTO({
    required this.items,
  });

  factory ItemListDTO.fromJson(Map<String, dynamic> json) => _$ItemListDTOFromJson(json);

  final List<ItemDTO> items;
}
