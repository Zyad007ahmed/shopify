import 'package:hive/hive.dart';
import 'package:shopify/features/favorites/domain/entities/favorite_entity.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

@HiveType(typeId: 0)
class FavoriteModel {
  @HiveField(0)
  final int productId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final List<String> images;

  @HiveField(4)
  final String? categoryName;

  @HiveField(5)
  final DateTime addedAt;

  @HiveField(6)
  final String description;

  FavoriteModel({
    required this.productId,
    required this.title,
    required this.price,
    required this.images,
    required this.categoryName,
    required this.addedAt,
    required this.description,
  });

  factory FavoriteModel.fromProduct(Product product) {
    return FavoriteModel(
      productId: product.id,
      title: product.title,
      price: product.price,
      images: product.images,
      categoryName: product.category?.name,
      addedAt: DateTime.now(),
      description: product.description!,
    );
  }

  Favorite toEntity() {
    return Favorite(
      productId: productId,
      title: title,
      price: price,
      images: images,
      categoryName: categoryName,
      addedAt: addedAt,
      description: description,
    );
  }
}
