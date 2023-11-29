// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersModel _$OrdersModelFromJson(Map<String, dynamic> json) => OrdersModel(
      createDatetime: DateTime.parse(json['createDatetime'] as String),
      id: json['id'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      overdueDateTime: DateTime.parse(json['due'] as String),
      copyAndPast: json['copiaecola'] as String,
      status: json['status'] as String,
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$OrdersModelToJson(OrdersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createDatetime': instance.createDatetime.toIso8601String(),
      'due': instance.overdueDateTime.toIso8601String(),
      'items': instance.items,
      'status': instance.status,
      'copiaecola': instance.copyAndPast,
      'total': instance.total,
    };
