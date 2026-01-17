import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/demos/demos.dart';
import 'package:shopify/core/widgets/product/product_card.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Best sellers",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: demoBestSellersProducts.length,
            itemBuilder: (context, index) {
              final int dicountPercent = Random().nextInt(50);

              return Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding,
                  right: index == demoBestSellersProducts.length - 1
                      ? defaultPadding
                      : 0,
                ),
                child: ProductCard(
                  product: demoBestSellersProducts[index],
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
