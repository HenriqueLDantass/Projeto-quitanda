import 'package:flutter/material.dart';
import 'package:quitanda/core/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:quitanda/modules/auth/controller/auth_controller.dart';

void main() {
//certeza que o tudo esta inicializado
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<AuthControlller>(AuthControlller());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Quitanda Online",
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white.withAlpha(150)),
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      getPages: AppRoutes.pages,
    );
  }
}
