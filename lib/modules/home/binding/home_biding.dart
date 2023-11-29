import 'package:get/get.dart';
import 'package:quitanda/modules/home/controller/home_controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
  }
}
