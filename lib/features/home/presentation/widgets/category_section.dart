import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/widgets/product/product_card.dart';
import 'package:shopify/features/products/domain/entities/category_with_products.dart';

class CategorySection extends StatelessWidget {
  final CategoryWithProducts categoryWithProducts;

  const CategorySection({super.key, required this.categoryWithProducts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            categoryWithProducts.category.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryWithProducts.products.length,
            itemBuilder: (context, index) {
              final int dicountPercent = Random().nextInt(50);

              return Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding,
                  right: index == categoryWithProducts.products.length - 1
                      ? defaultPadding
                      : 0,
                ),
                child: ProductCard(
                  product: categoryWithProducts.products[index],
                  dicountpercent: dicountPercent,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
