import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/core/routes/app_routes.dart';
import 'package:quitanda/modules/cart/controller/cart_controller.dart';
import 'package:quitanda/modules/home/models/home_model.dart';
import 'package:quitanda/core/shared/services/utils_services.dart';
import 'package:quitanda/modules/home/widgets/productors_widget.dart';

class ItemsCard extends StatefulWidget {
  const ItemsCard(
      {super.key, required this.item, required this.cartAnimationMethod});

  final ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;

  @override
  State<ItemsCard> createState() => _ItemsCardState();
}

class _ItemsCardState extends State<ItemsCard> {
  final GlobalKey gkImage = GlobalKey();

  IconData titleIcon = Icons.shopping_cart_outlined;

  Future<void> switchIcon() async {
    setState(() => titleIcon = Icons.check);
    await Future.delayed(const Duration(milliseconds: 1200));

    setState(() => titleIcon = Icons.shopping_cart_outlined);
  }

  UtilsServices utilsServices = UtilsServices();
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(NamedRoutes.productWidget, arguments: widget.item);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 2,
            shadowColor: Colors.grey.shade500,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: widget.item.imgUrl,
                      child: Image.network(
                        widget.item.imgUrl,
                        key: gkImage,
                      ),
                    ),
                  ),
                  Text(
                    widget.item.itemName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        utilsServices.priceToCurrency(widget.item.price),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                      ),
                      Text(
                        " /${widget.item.unit}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 4,
          top: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  switchIcon();
                  controller.addItemCart(itemModel: widget.item);
                  widget.cartAnimationMethod(gkImage);
                },
                child: Ink(
                  width: 35,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Icon(
                    titleIcon,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
