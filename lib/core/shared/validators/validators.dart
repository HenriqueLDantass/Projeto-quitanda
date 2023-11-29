import 'package:get/get.dart';

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return "Digite seu Email!";
  }

  if (!email.isEmail) {
    return "Digite um Email valido!";
  }

  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return "Digite uma senha!";
  } else if (password.length < 7) {
    return "Digite uma senha com pelo menos 7 caracteres";
  }

  return null;
}

String? nameValidator(String? name) {
  if (name == null || name.isEmpty) {
    return "Digite um nome!";
  }
  final names = name.split(' ');
//verificando a lista, se a lista for igual a um significa que o usuario digitou somente o primeiro nome
  if (names.length == 1) return "Digite o nome completo";

  return null;
}

String? phoneValidator(String? phone) {
  if (phone == null || phone.isEmpty) {
    return "Digite seu phone!";
  }
  if (phone.length < 14 && !phone.isPhoneNumber) {
    return "Digite um numero valido";
  }

  return null;
}

String? cpfValidator(String? cpf) {
  if (cpf == null || cpf.isEmpty) {
    return "Digite seu cpf";
  }
  if (!cpf.isCpf) return "Digite um cpf válido!";

  return null;
}
