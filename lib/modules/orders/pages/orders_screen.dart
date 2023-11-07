import 'package:flutter/material.dart';
import 'package:quitanda/modules/home/mocks/home_item_data.dart' as appData;
import 'package:quitanda/modules/orders/widgets/card_custom.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pedidos"),
        ),
        body: ListView.separated(
          separatorBuilder: (_, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: appData.orders.length,
          itemBuilder: (_, index) {
            return CardCustom(
              orders: appData.orders[index],
            );
          },
        ));
  }
}
