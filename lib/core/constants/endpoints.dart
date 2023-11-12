const String baseUrl = "https://parseapi.back4app.com/functions";

abstract class Endpoints {
  static const String signin = "$baseUrl/login";
  static const String signUp = "$baseUrl/signup";
  static const String validadeToken = "$baseUrl//validate-token";
}
