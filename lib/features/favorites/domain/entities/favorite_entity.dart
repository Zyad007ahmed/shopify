import 'package:shopify/features/products/domain/entities/product.dart';

class Favorite {
  final int productId;
  final String title;
  final double price;
  final List<String> images;
  final String? categoryName;
  final DateTime addedAt;
  final String description;

  const Favorite({
    required this.productId,
    required this.title,
    required this.price,
    required this.images,
    required this.categoryName,
    required this.addedAt,
    required this.description,
  });

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';

  Product toProtuct() => Product(
    id: productId,
    title: title,
    price: price,
    images: images,
    description: description,
  );
}
