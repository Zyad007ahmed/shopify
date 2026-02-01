import 'package:shopify/features/products/domain/entities/category.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String? description;
  final Category? category;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    this.description,
    this.category,
    required this.images,
  });

  String? get mainImage => images.isNotEmpty ? images.first : null;

  bool get hasMultipleImages => images.length > 1;

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';
}
