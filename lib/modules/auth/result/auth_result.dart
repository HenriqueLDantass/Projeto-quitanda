import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quitanda/modules/profile/models/profile_model.dart';

part 'auth_result.freezed.dart';

@freezed
class AuthResult with _$AuthResult {
  factory AuthResult.sucess(ProfileModel user) = sucess;
  factory AuthResult.error(String mensagem) = Error;
}
