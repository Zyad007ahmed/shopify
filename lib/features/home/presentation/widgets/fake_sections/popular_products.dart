import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/demos/demos.dart';
import 'package:shopify/core/widgets/product/product_card.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Popular products",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: demoPopularProducts.length,
            itemBuilder: (context, index) {
              final int dicountPercent = Random().nextInt(50);

              return Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding,
                  right: index == demoPopularProducts.length - 1
                      ? defaultPadding
                      : 0,
                ),
                child: ProductCard(
                  product: demoPopularProducts[index],
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
