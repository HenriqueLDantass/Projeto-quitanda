// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: json['id'] as String? ?? " ",
      description: json['description'] as String,
      imgUrl: json['picture'] as String,
      itemName: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      unit: json['unit'] as String,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'picture': instance.imgUrl,
      'title': instance.itemName,
      'price': instance.price,
      'unit': instance.unit,
    };
