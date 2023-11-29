// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class ItemModel {
  String id;
  String description;
  @JsonKey(name: "picture")
  String imgUrl;
  @JsonKey(name: "title")
  String itemName;
  double price;
  String unit;

  ItemModel({
    this.id = " ",
    required this.description,
    required this.imgUrl,
    required this.itemName,
    required this.price,
    required this.unit,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  @override
  String toString() {
    return 'ItemModel(id: $id, description: $description, imgUrl: $imgUrl, itemName: $itemName, price: $price, unit: $unit)';
  }
}
