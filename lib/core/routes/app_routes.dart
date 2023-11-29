import 'package:get/get.dart';
import 'package:quitanda/modules/auth/pages/sing-in-screen.dart';
import 'package:quitanda/modules/auth/pages/sing-up-screen.dart';
import 'package:quitanda/modules/base/base_screen.dart';
import 'package:quitanda/modules/base/binding/base_binding.dart';
import 'package:quitanda/modules/cart/binding/cart_binding.dart';
import 'package:quitanda/modules/home/binding/home_biding.dart';
import 'package:quitanda/modules/home/widgets/productors_widget.dart';
import 'package:quitanda/modules/splash/pages/splash_screen.dart';

abstract class AppRoutes {
  static final pages = <GetPage>[
    GetPage(
      name: NamedRoutes.productWidget,
      page: () => ProductorWidget(),
    ),
    GetPage(
      name: NamedRoutes.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: NamedRoutes.signRoute,
      page: () => SingInScreen(),
    ),
    GetPage(
      name: NamedRoutes.sigUpRoute,
      page: () => SingUpScreen(),
    ),
    GetPage(
        name: NamedRoutes.baseRoute,
        page: () => const BaseScreen(),
        bindings: [
          BaseBinging(),
          HomeBiding(),
          CartBinding(),
        ])
  ];
}

abstract class NamedRoutes {
  static const String productWidget = "/product";
  static const String splashRoute = "/splash";
  static const String signRoute = "/sign";
  static const String sigUpRoute = "/singUp";
  static const String baseRoute = "/";
}
