const String baseUrl = "https://parseapi.back4app.com/functions";

abstract class Endpoints {
  static const String signin = "$baseUrl/login";
  static const String signUp = "$baseUrl/signup";
  static const String validadeToken = "$baseUrl/validate-token";
  static const String resetSenha = "$baseUrl/reset-password";
  static const String getCategories = "$baseUrl/get-category-list";
  static const String getProducts = "$baseUrl/get-product-list";
  static const String getCartItems = "$baseUrl/get-cart-items";
  static const String addItemCart = "$baseUrl/add-item-to-cart";
  static const String changeQuantity = "$baseUrl/modify-item-quantity";
  static const String checkout = "$baseUrl/checkout";
}
