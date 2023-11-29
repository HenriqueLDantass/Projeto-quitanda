// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:quitanda/modules/home/models/home_model.dart';

part 'cart_models.g.dart';

@JsonSerializable()
class CartModel {
  @JsonKey(name: 'product')
  ItemModel itemModel;
  int quantity;
  String id;

  CartModel({
    required this.id,
    required this.itemModel,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  double totalprice() => itemModel.price * quantity;

  @override
  String toString() =>
      'CartModel(itemModel: $itemModel, quantity: $quantity, id: $id)';
}
