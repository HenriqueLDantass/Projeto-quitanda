import 'package:quitanda/core/constants/endpoints.dart';
import 'package:quitanda/core/http/http_magane.dart';
import 'package:quitanda/modules/cart/models/cart_models.dart';
import 'package:quitanda/modules/cart/result/cart_result.dart';
import 'package:quitanda/modules/orders/models/orders_model.dart';

class CartRepository {
  final HttpManager _httpmanager = HttpManager();

  Future<CartResult<List<CartModel>>> getCartItems(
      {required String token, required String userId}) async {
    final result = await _httpmanager.restRequest(
        url: Endpoints.getCartItems,
        method: HttpMethods.post,
        //passar token no headers
        headers: {
          'X-Parse-Session-Token': token
        },
        body: {
          'user': userId,
        });

    if (result['result'] != null) {
      List<CartModel> data = List<Map<String, dynamic>>.from(result['result'])
          .map(CartModel.fromJson)
          .toList();

      return CartResult<List<CartModel>>.sucess(data);
    } else {
      return CartResult.error("Erro ao buscar itens no carrinho!");
    }
  }

  Future<CartResult<String>> addItemToCart(
      {required int quantity,
      required String userId,
      required String productId,
      required String token}) async {
    final result = await _httpmanager.restRequest(
        url: Endpoints.addItemCart,
        method: HttpMethods.post,
        headers: {
          'X-Parse-Session-Token': token
        },
        body: {
          "user": userId,
          "quantity": quantity,
          "productId": productId,
        });

    if (result['result'] != null) {
      return CartResult.sucess(result['result']['id']);
    } else {
      return CartResult.error("aconteceu algum erro!");
    }
  }

  Future<bool> changeItemQuantity(
      {required String token,
      required String idItem,
      required int quantity}) async {
    final result = await _httpmanager.restRequest(
      url: Endpoints.changeQuantity,
      method: HttpMethods.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
      body: {
        'cartItemId': idItem,
        'quantity': quantity,
      },
    );

    return result.isEmpty;
  }

  Future<CartResult<OrdersModel>> chechout({
    required String token,
    required double total,
  }) async {
    final result = await _httpmanager.restRequest(
      url: Endpoints.checkout,
      method: HttpMethods.post,
      body: {"total": total},
      headers: {
        'X-Parse-Session-Token': token,
      },
    );
    if (result['result'] != null) {
      final order = OrdersModel.fromJson(result['result']);

      return CartResult<OrdersModel>.sucess(order);
    } else {
      return CartResult.error("nao foi possivel realizar o pedido!");
    }
  }
}
