import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:quitanda/core/shared/services/utils_services.dart';
import 'package:quitanda/modules/orders/models/orders_model.dart';

class DialogPaymant extends StatelessWidget {
  final OrdersModel order;

  DialogPaymant({super.key, required this.order});

  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //texto
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Pagamento via pix",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            //qrcode
            QrImageView(
              data: '12345asdadasdsdad67890',
              version: QrVersions.auto,
              size: 200.0,
            ),
            //data de vencimento
            Text(
              "Vencimento: ${utilsServices.updateTime(order.overdueDateTime)}",
              style: const TextStyle(fontSize: 12),
            ),
            //total
            Text(
              "Total: ${utilsServices.priceToCurrency(order.total)}",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            //botao
            OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    side: const BorderSide(width: 2, color: Colors.green)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.copy),
                label: const Text("Copiar codigo pix"))
          ],
        ),
      ),
    );
  }
}
