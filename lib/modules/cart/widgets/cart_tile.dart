import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/core/shared/widgets/quantity_button.dart';
import 'package:quitanda/modules/cart/controller/cart_controller.dart';
import 'package:quitanda/modules/cart/models/cart_models.dart';
import 'package:quitanda/core/shared/services/utils_services.dart';

class CartTile extends StatefulWidget {
  final CartModel cartModel;
  final Function(CartModel) removerItem;
  const CartTile(
      {super.key, required this.cartModel, required this.removerItem});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  UtilsServices utilsServices = UtilsServices();
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //image
        leading: Image.network(
          widget.cartModel.itemModel.imgUrl,
          height: 60,
          width: 60,
        ),
        //text
        title: Text(
          widget.cartModel.itemModel.itemName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          utilsServices.priceToCurrency(widget.cartModel.totalprice()),
          style: const TextStyle(
            color: Colors.green,
          ),
        ),
        //total
        //quantidade
        trailing: QuantityButton(
          remover: true,
          value: widget.cartModel.quantity,
          suffixText: widget.cartModel.itemModel.unit,
          results: (quantity) {
            controller.changeItemQuantity(
                cartModel: widget.cartModel, quantity: quantity);
          },
        ),
      ),
    );
  }
}
