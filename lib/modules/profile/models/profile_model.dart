import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey(name: 'fullname')
  String? name;
  String? password;
  String? cpf;
  String? email;
  String? phone;
  String? token;
  String? id;

  ProfileModel({
    this.name,
    this.cpf,
    this.email,
    this.phone,
    this.password,
    this.token,
    this.id,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  @override
  String toString() {
    return 'ProfileModel{\n'
        '  name: $name,\n'
        '  password: $password,\n'
        '  cpf: $cpf,\n'
        '  email: $email,\n'
        '  phone: $phone,\n'
        '  token: $token,\n'
        '  id: $id\n'
        '}';
  }
}
