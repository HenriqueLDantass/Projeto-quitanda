import 'package:get/get.dart';
import 'package:quitanda/core/routes/app_routes.dart';
import 'package:quitanda/core/shared/services/utils_services.dart';
import 'package:quitanda/modules/auth/repository/auth_repository.dart';
import 'package:quitanda/modules/auth/result/auth_result.dart';
import 'package:quitanda/modules/profile/models/profile_model.dart';

class AuthControlller extends GetxController {
  RxBool isLoading = false.obs;
  final authRepository = AuthRepository();
  final UtilsServices utilsServices = UtilsServices();
  ProfileModel user = ProfileModel();

  saveTokenAndProcessedToBase() {
    utilsServices.savarLocalData(key: "token", data: user.token!);
    Get.offAllNamed(NamedRoutes.baseRoute);
  }

  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  Future<void> validateToken() async {
    //recuperar token
    final String? token = await utilsServices.readLocalData(key: "token");
    //ir para tela base
    if (token == null) {
      Get.offAllNamed(NamedRoutes.signRoute);
      return;
    }

    AuthResult result = await authRepository.validadeToken(token);

    result.when(
      sucess: (user) {
        this.user = user;
        saveTokenAndProcessedToBase();
      },
      error: (message) {
        singOut();
      },
    );
  }

  Future<void> singOut() async {
    //zerar user
    user = ProfileModel();

    //remover token local
    await utilsServices.deleteLocalData(key: "token");

    //ir para login
    Get.offAllNamed(NamedRoutes.signRoute);
  }

//Loding do botao entrar
  Future<void> signLoading({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signin(email: email, password: password);

    result.when(
      sucess: (user) {
        this.user = user;
        saveTokenAndProcessedToBase();
      },
      error: (error) {
        utilsServices.messageToast(message: error, isError: true);
      },
    );
    isLoading.value = false;
  }
}
