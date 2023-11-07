import 'package:get/get.dart';
import 'package:quitanda/modules/auth/repository/auth_repository.dart';

class AuthControlller extends GetxController {
  RxBool isLoading = false.obs;
  final authRepository = AuthRepository();

//Loding do botao entrar
  Future<void> signLoading({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    await authRepository.signin(email: email, password: password);
    isLoading.value = false;
  }
}
