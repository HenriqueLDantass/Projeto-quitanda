import 'package:get/get.dart';
import 'package:quitanda/modules/cart/controller/cart_controller.dart';

class CartBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
