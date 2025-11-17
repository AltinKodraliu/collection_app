import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String name;
  final String image;
  final String quantity;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.quantity,
    required this.description,
  });

  /// JSON → Model
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  /// Model → JSON
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
