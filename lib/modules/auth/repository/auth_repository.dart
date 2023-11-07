import 'package:quitanda/core/constants/endpoints.dart';
import 'package:quitanda/core/http/http_magane.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signin({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result['result'] != null) {
      print("Deu certo!");
      print(result['result']);
    } else {
      print("não deu certo");
      print(result['error']);
    }
  }
}
