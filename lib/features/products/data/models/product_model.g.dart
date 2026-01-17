// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(
  Map<String, dynamic> json,
) => _ProductModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  price: (json['price'] as num).toDouble(),
  description: json['description'] as String,
  category: CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  creationAt: json['creationAt'] as String,
  updatedAt: json['updatedAt'] as String,
);

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'images': instance.images,
      'creationAt': instance.creationAt,
      'updatedAt': instance.updatedAt,
    };
