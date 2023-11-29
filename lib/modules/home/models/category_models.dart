// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:quitanda/modules/home/models/home_model.dart';

part 'category_models.g.dart';

@JsonSerializable()
class CategoryModel {
  String title;
  String id;
  @JsonKey(defaultValue: 0)
  int pagination;
  @JsonKey(defaultValue: [])
  List<ItemModel> items;

  CategoryModel(
      {required this.title,
      required this.id,
      required this.pagination,
      required this.items});
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  String toString() => 'CategoryModel(title: $title, id: $id)';
}
