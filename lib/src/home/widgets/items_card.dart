import 'package:flutter/material.dart';
import 'package:quitanda/src/home/models/home_model.dart';
import 'package:quitanda/src/home/services/utils_services.dart';

class ItemsCard extends StatelessWidget {
  ItemsCard({super.key, required this.item});

  final ItemModel item;

  UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
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
                  child: Image.asset(item.imgUrl),
                ),
                Text(
                  item.itemName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      utilsServices.priceToCurrency(item.price),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    Text(
                      " /${item.unit}",
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
        Positioned(
          right: 4,
          top: 4,
          child: Container(
            width: 35,
            height: 40,
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )),
            child: const Icon(
              Icons.shopping_cart_outlined,
              size: 18,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
