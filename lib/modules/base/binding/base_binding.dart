import 'package:get/get.dart';
import 'package:quitanda/modules/base/controller/navigation_controller.dart';

class BaseBinging extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigatorController());
  }
}
