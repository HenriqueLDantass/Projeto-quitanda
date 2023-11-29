import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quitanda/core/shared/widgets/dialog_paymant.dart';
import 'package:quitanda/modules/cart/controller/cart_controller.dart';
import 'package:quitanda/modules/cart/models/cart_models.dart';
import 'package:quitanda/modules/cart/widgets/cart_tile.dart';
import 'package:quitanda/core/shared/services/utils_services.dart';
import 'package:quitanda/modules/home/mocks/home_item_data.dart' as appData;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  UtilsServices utilsServices = UtilsServices();

  void removeCard(CartModel cardItem) {
    setState(() {
      appData.cartItems.remove(cardItem);
      if (cardItem.quantity == 0) {
        UtilsServices().messageToast(
            message:
                "Produto: ${cardItem.itemModel.itemName} removido com sucesso!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carrinho"),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartController>(
              builder: (controller) {
                if (controller.cartItems.isEmpty) {
                  return const Column(
                    children: [Text("Não tem nada no carrinho!")],
                  );
                }

                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (_, index) {
                    return CartTile(
                      removerItem: removeCard,
                      cartModel: controller.cartItems[index],
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: 150,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 3.0,
                  spreadRadius: 2.0,
                )
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(45),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Total geral"),
                GetBuilder<CartController>(
                  builder: (controller) {
                    return Text(
                      utilsServices.priceToCurrency(controller.precoTotal()),
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 45,
                    child: ElevatedButton(
                        onPressed: () async {
                          bool? resultado = await confirmaCompra();
                          if (resultado ?? false) {
                            return showDialog(
                                context: context,
                                builder: (_) {
                                  return DialogPaymant(
                                      order: appData.orders.first);
                                });
                          } else {
                            UtilsServices().messageToast(
                                message: "Pedido cancelado", isError: true);
                          }
                        },
                        child: const Text("Concluir pedido")))
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> confirmaCompra() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text("Confirmação"),
            content: const Text("Deseja confirma a compra?"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("Sim")),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                icon: const Text("Não"),
              ),
            ],
          );
        });
  }
}
