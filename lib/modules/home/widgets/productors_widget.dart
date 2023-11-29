import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/core/shared/widgets/quantity_button.dart';
import 'package:quitanda/modules/base/controller/navigation_controller.dart';
import 'package:quitanda/modules/cart/controller/cart_controller.dart';
import 'package:quitanda/modules/home/models/home_model.dart';
import 'package:quitanda/core/shared/services/utils_services.dart';

class ProductorWidget extends StatefulWidget {
  ProductorWidget({super.key});
  final ItemModel item = Get.arguments;

  @override
  State<ProductorWidget> createState() => _ProductorWidgetState();
}

class _ProductorWidgetState extends State<ProductorWidget> {
  int quantidade = 1;

  UtilsServices utilsServices = UtilsServices();
  final navigationController = Get.find<NavigatorController>();
  final cartcontroller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
              //IMAGEM
              Expanded(
                child: Hero(
                  tag: widget.item.imgUrl,
                  child: Image.network(widget.item.imgUrl),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 15),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(45),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //NOME, ADICIONAR
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            QuantityButton(
                              suffixText: widget.item.unit,
                              value: quantidade,
                              results: (int quantity) {
                                setState(() {
                                  quantidade = quantity;
                                });
                              },
                            )
                          ],
                        ),
                        //PREÇO
                        Text(
                          utilsServices.priceToCurrency(widget.item.price),
                          style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //DESCRIÇÃO
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Text(
                              widget.item.description,
                              style: const TextStyle(height: 1.5),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 55,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45))),
                            onPressed: () {
                              Get.back();

                              cartcontroller.addItemCart(
                                  itemModel: widget.item, quantity: quantidade);

                              navigationController.navigatePageView(
                                  page: NavigatorName.cart);
                            },
                            icon: const Icon(Icons.shopping_cart_outlined),
                            label: const Text("Add ao Carrinho"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: 1,
            top: 50,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
