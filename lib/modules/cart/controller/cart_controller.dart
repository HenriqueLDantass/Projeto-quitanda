import 'package:get/get.dart';
import 'package:quitanda/core/shared/services/utils_services.dart';
import 'package:quitanda/modules/auth/controller/auth_controller.dart';
import 'package:quitanda/modules/cart/models/cart_models.dart';
import 'package:quitanda/modules/cart/repository/cart_repository.dart';
import 'package:quitanda/modules/cart/result/cart_result.dart';
import 'package:quitanda/modules/home/models/home_model.dart';

class CartController extends GetxController {
  final AuthControlller authcontroller = Get.find<AuthControlller>();
  final CartRepository cartRepository = CartRepository();
  final UtilsServices utilsServices = UtilsServices();

  List<CartModel> cartItems = [];

  @override
  void onInit() {
    super.onInit();
    getCartItem();
  }

  Future<void> getCartItem() async {
    final CartResult<List<CartModel>> result =
        await cartRepository.getCartItems(
      token: authcontroller.user.token!,
      userId: authcontroller.user.id!,
    );

    result.when(sucess: (data) {
      cartItems = data;
      update();
    }, error: (error) {
      utilsServices.messageToast(
          message: "Aconteceu algum erro ao carregar os itens do carrinho!",
          isError: true);
    });
  }

  double precoTotal() {
    double preco = 0;

    for (final cart in cartItems) {
      preco += cart.totalprice();
    }
    return preco;
  }

  Future chechout() async {
    cartRepository.chechout(
      token: authcontroller.user.token!,
      total: precoTotal(),
    );
  }

//recuperando o index
  int indexCartItem(ItemModel cartModel) {
    return cartItems
        .indexWhere((itemList) => itemList.itemModel.id == cartModel.id);
  }

  Future<bool> changeItemQuantity(
      {required CartModel cartModel, required int quantity}) async {
    final result = await cartRepository.changeItemQuantity(
        token: authcontroller.user.token!,
        idItem: cartModel.id,
        quantity: quantity);

    if (result) {
      if (quantity == 0) {
        cartItems.removeWhere((element) => element.id == cartModel.id);
      } else {
        cartItems.firstWhere((element) => element.id == cartModel.id).quantity =
            quantity;
      }
      update();
    } else {
      utilsServices.messageToast(
          message: "Aconteceu algum erro ao alterar quantidade do produto!",
          isError: true);
    }
    return result;
  }

  Future<void> addItemCart(
      {int quantity = 1, required ItemModel itemModel}) async {
    final indexCart = indexCartItem(itemModel);

    if (indexCart >= 0) {
      final product = cartItems[indexCart];
      final result = await changeItemQuantity(
          cartModel: product, quantity: (product.quantity + quantity));

      if (result) {
        cartItems[indexCart].quantity += quantity;
      } else {
        utilsServices.messageToast(
            message: "aconteceu algum erro", isError: true);
      }
    } else {
      final CartResult<String> cartResult = await cartRepository.addItemToCart(
          quantity: quantity,
          userId: authcontroller.user.id!,
          productId: itemModel.id,
          token: authcontroller.user.token!);

      cartResult.when(
        sucess: (data) {
          cartItems.add(
            CartModel(
              id: data,
              itemModel: itemModel,
              quantity: quantity,
            ),
          );
        },
        error: (erro) {
          return "Aconteceu algum erro";
        },
      );
    }
    update();
  }
}
