import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/products/data/models/category_model.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required int id,
    required String title,
    required double price,
    required String description,
    required CategoryModel category,
    required List<String> images,
    required String creationAt,
    required String updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Product toEntity() => Product(
    id: id,
    title: title,
    price: price,
    images: images,
    description: description,
    category: category.toEntity(),
  );
}
