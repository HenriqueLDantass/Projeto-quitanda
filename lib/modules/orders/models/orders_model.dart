import 'package:quitanda/modules/cart/models/cart_models.dart';

class OrdersModel {
  String id;
  DateTime createDatetime; //
  DateTime overdueDateTime;
  List<CartModel> items;
  String status;
  String copyAndPast; //
  double total;

  OrdersModel(
      {required this.createDatetime,
      required this.id,
      required this.items,
      required this.overdueDateTime,
      required this.copyAndPast,
      required this.status,
      required this.total});
}
