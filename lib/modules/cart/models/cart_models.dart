import 'package:quitanda/modules/home/models/home_model.dart';

class CartModel {
  ItemModel itemModel;
  int quantity;

  CartModel({
    required this.itemModel,
    required this.quantity,
  });

  double totalprice() => itemModel.price * quantity;
}
