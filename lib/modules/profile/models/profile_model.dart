class ProfileModel {
  String name;
  String cpf;
  String email;
  String celular;
  String senha;

  ProfileModel(
      {required this.celular,
      required this.cpf,
      required this.name,
      required this.email,
      required this.senha});
}
