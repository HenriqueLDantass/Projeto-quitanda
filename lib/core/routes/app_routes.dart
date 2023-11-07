import 'package:get/get.dart';
import 'package:quitanda/modules/auth/pages/sing-in-screen.dart';
import 'package:quitanda/modules/auth/pages/sing-up-screen.dart';
import 'package:quitanda/modules/base/base_screen.dart';
import 'package:quitanda/modules/splash/pages/splash_screen.dart';

abstract class AppRoutes {
  static final pages = <GetPage>[
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
    )
  ];
}

abstract class NamedRoutes {
  static const String splashRoute = "/splash";
  static const String signRoute = "/sign";
  static const String sigUpRoute = "/singUp";
  static const String baseRoute = "/";
}
