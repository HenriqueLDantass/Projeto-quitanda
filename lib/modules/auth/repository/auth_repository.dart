import 'package:quitanda/core/constants/endpoints.dart';
import 'package:quitanda/core/http/http_magane.dart';
import 'package:quitanda/modules/auth/result/auth_result.dart';
import 'package:quitanda/modules/profile/models/profile_model.dart';
import 'package:quitanda/modules/auth/repository/auth_erros.dart' as erros;

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = ProfileModel.fromJson(result['result']);
      return AuthResult.sucess(user);
    } else {
      return AuthResult.error(erros.authErrorsString(result['error']));
    }
  }

  Future<AuthResult> validadeToken(String token) async {
    final result = await _httpManager.restRequest(
        url: Endpoints.validadeToken,
        method: HttpMethods.post,
        headers: {"X-Parse-Session-Token": token});

    return handleleUserOrError(result);
  }

  Future<AuthResult> signin(
      {required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );
    return handleleUserOrError(result);
  }

  Future<AuthResult> signUp(ProfileModel user) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signUp,
      method: HttpMethods.post,
      body: user.toJson(),
    );
    return handleleUserOrError(result);
  }

  Future<void> resetSenha(String email) async {
    await _httpManager.restRequest(
      url: Endpoints.resetSenha,
      method: HttpMethods.post,
      body: {"email": email},
    );
  }
}
