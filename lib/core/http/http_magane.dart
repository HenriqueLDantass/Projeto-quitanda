import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = "POST";
  static const String get = "GET";
  static const String put = "PUT";
  static const String delete = "DELETE";
  static const String patch = "PATCH";
}

class HttpManager {
  Future<Map> restRequest(
      {required String url,
      required String method,
      Map? headers,
      Map? body}) async {
    Dio dio = Dio();

    //Headers de requisição
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'wK7GcEjr2V4br5q5mlR1kybQ5dvxMFDX0qtE1d6Y',
        'X-Parse-REST-API-Key': '2kahi62fkWePLWAwC7k8aMrtQkobogcgkruMxbeB'
      });

    try {
      Response response = await dio.request(
        url, // aqui ele necessita de um endpoint que estamos passando por parametro
        options: Options(
          headers: defaultHeaders,
          //options etamos especificando o metodo, que esta sendo passado por parametro
          method: method,
        ),
        data: body,
      );
      //resultado do backend
      return response.data;
    } on DioError catch (error) {
      //erro do dio requist
      return error.response?.data ?? {};
    } catch (error) {
      //retorno vazio
      return {};
    }
  }
}
