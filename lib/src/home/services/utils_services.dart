import 'package:intl/intl.dart';

class UtilsServices {
  //metodo para converer a moeda para ptbr
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: "pt_BR");

    return numberFormat.format(price);
  }
}
