// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
      name: json['fullname'] as String?,
      cpf: json['cpf'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      token: json['token'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'fullname': instance.name,
      'password': instance.password,
      'cpf': instance.cpf,
      'email': instance.email,
      'phone': instance.phone,
      'token': instance.token,
      'id': instance.id,
    };
