import 'package:shopify/features/products/domain/entities/category.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

class CategoryWithProducts {
  final Category category;
  final List<Product> products;

  CategoryWithProducts({required this.category, required this.products});
}
