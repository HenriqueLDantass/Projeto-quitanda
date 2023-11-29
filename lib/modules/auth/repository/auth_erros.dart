//mapeando os possiveis erros
String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return "Usuário ou senha inválidos!";

    case "Invalid session token":
      return "Token invalído";

    case "INVALID_FULLNAME":
      return "ocorreu um erro ao cadastar: nome inválido";

    case "INVALID_PHONE":
      return "ocorreu um erro ao cadastar: numero inválido";

    case "INVALID_CPF":
      return "Token invalído";
    default:
      return "ocorreu um erro ao cadastar: cpf inválido";
  }
}
