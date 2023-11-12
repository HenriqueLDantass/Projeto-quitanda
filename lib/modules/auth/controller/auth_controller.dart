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

  Future<void> validadeToken() async {}
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
        Get.offAllNamed(NamedRoutes.baseRoute);
      },
      error: (error) {
        utilsServices.messageToast(message: error, isError: true);
      },
    );
    isLoading.value = false;
  }
}
