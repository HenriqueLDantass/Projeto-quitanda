//mapeando os possiveis erros
String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return "Usuário ou senha inválidos!";
    case "Invalid session token":
      return "Token invalído";
    default:
      return "um erro indefinido occoreu!";
  }
}
