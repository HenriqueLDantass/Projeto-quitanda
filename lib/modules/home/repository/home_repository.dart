import 'package:quitanda/core/constants/endpoints.dart';
import 'package:quitanda/core/http/http_magane.dart';
import 'package:quitanda/modules/home/models/category_models.dart';
import 'package:quitanda/modules/home/models/home_model.dart';
import 'package:quitanda/modules/home/result/home_result.dart';

class HomeRepositoty {
  final HttpManager _httpManager = HttpManager();

  Future<HomeResult<CategoryModel>> getAllCategories() async {
    final result = await _httpManager.restRequest(
        url: Endpoints.getCategories, method: HttpMethods.post);

    if (result['result'] != null) {
      List<CategoryModel> data =
          (List<Map<String, dynamic>>.from(result['result']))
              .map((e) => CategoryModel.fromJson(e))
              .toList();

      return HomeResult<CategoryModel>.sucess(data);
    } else {
      return HomeResult.error("Ocorreu algum erro ao carregar as categorias");
    }
  }

  Future<HomeResult<ItemModel>> getAllProducts(
      Map<String, dynamic> body) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getProducts,
      method: HttpMethods.post,
      body: body,
    );
    if (result['result'] != null) {
      List<ItemModel> data = (List<Map<String, dynamic>>.from(result['result']))
          .map((e) => ItemModel.fromJson(e))
          .toList();

      return HomeResult<ItemModel>.sucess(data);
    } else {
      return HomeResult.error("Ocorreu algum erro ao carregar os produtos");
    }
  }
}
