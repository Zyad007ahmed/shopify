import 'package:flutter/material.dart';
import 'package:shopify/core/widgets/product/product_card_tile.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;

  const ProductsList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.80,
        crossAxisCount: 2,
      ),
      itemBuilder: (_, index) => ProductCardTile(product: products[index]),
    );
  }
}
