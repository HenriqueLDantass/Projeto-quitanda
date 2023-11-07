import 'package:flutter/material.dart';
import 'package:quitanda/core/shared/widgets/dialog_paymant.dart';
import 'package:quitanda/core/shared/services/utils_services.dart';
import 'package:quitanda/modules/orders/models/orders_model.dart';
import 'package:quitanda/modules/orders/widgets/status_widget.dart';

class CardCustom extends StatelessWidget {
  final OrdersModel orders;
  CardCustom({super.key, required this.orders});

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
          20,
        )),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: orders.status == 'pending_payment',
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pedido: ${orders.id}"),
                Text(
                  utilsServices.updateTime(orders.createDatetime),
                ),
              ],
            ),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: SizedBox(
                          height: 150,
                          child: ListView(
                            children: orders.items.map(
                              (ordersItem) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "${ordersItem.quantity} ${ordersItem.itemModel.unit}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Expanded(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child:
                                            Text(ordersItem.itemModel.itemName),
                                      )),
                                      Text(utilsServices.priceToCurrency(
                                          ordersItem.totalprice())),
                                    ],
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        )),
                    VerticalDivider(
                      color: Colors.grey[300],
                      thickness: 2,
                    ),
                    Expanded(
                      flex: 2,
                      child: StatusWidget(
                        status: orders.status,
                        overDue: orders.overdueDateTime.isBefore(
                            DateTime.now()), // verificando se a data passa
                      ),
                    ),
                  ],
                ),
              ),
              //valor total
              Text.rich(
                TextSpan(
                  style: const TextStyle(fontSize: 20),
                  children: [
                    const TextSpan(
                        text: "Total: ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: utilsServices.priceToCurrency(orders.total),
                    )
                  ],
                ),
              )
              //botao
              ,
              Visibility(
                visible: orders.status == "pending_payment",
                child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return DialogPaymant(
                              order: orders,
                            );
                          });
                    },
                    icon: Image.asset(
                      "assets/appimages/pix.png",
                      height: 18,
                    ),
                    label: const Text("Ver QrCode pix")),
              )
            ],
          ),
        ));
  }
}
