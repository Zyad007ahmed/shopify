import 'package:flutter/material.dart';
import 'package:shopify/features/products/domain/entities/category.dart';
import 'package:shopify/features/products/domain/entities/category_with_products.dart';
import 'package:shopify/features/home/presentation/widgets/categories.dart';
import 'package:shopify/features/home/presentation/widgets/category_section.dart';

class ApiSections extends StatelessWidget {
  final List<CategoryWithProducts> categoriesWithProducts;

  const ApiSections({super.key, required this.categoriesWithProducts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Categories(categories: categories),
        ...categoriesSections(),
      ],
    );
  }

  List<Category> get categories {
    final categories = <Category>[];

    for (var categoryWithProduct in categoriesWithProducts) {
      categories.add(categoryWithProduct.category);
    }

    return categories;
  }

  List<Widget> categoriesSections() {
    return [
      for (final categoryWithProducts in categoriesWithProducts)
        if (categoryWithProducts.products.isNotEmpty)
          CategorySection(categoryWithProducts: categoryWithProducts),
    ];
  }
}
