import 'package:quitanda/modules/cart/models/cart_models.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'orders_model.g.dart';

@JsonSerializable()
class OrdersModel {
  String id;
  DateTime createDatetime;
  @JsonKey(name: "due")
  DateTime overdueDateTime;
  @JsonKey(defaultValue: [])
  List<CartModel> items;
  String status;
  @JsonKey(name: "copiaecola")
  String copyAndPast;
  double total;

  OrdersModel(
      {required this.createDatetime,
      required this.id,
      required this.items,
      required this.overdueDateTime,
      required this.copyAndPast,
      required this.status,
      required this.total});

  factory OrdersModel.fromJson(Map<String, dynamic> json) =>
      _$OrdersModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersModelToJson(this);
}
