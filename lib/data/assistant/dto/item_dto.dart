import 'package:json_annotation/json_annotation.dart';

part 'item_dto.g.dart';

@JsonSerializable(createToJson: false)
class ItemDTO {
  const ItemDTO({
    required this.name,
    required this.description,
    required this.content,
  });

  factory ItemDTO.fromJson(Map<String, dynamic> json) => _$ItemDTOFromJson(json);

  final String name;
  final String description;
  final String content;
}
