import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/demos/demos.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/core/widgets/product/secondary_product_card.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Most popular",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // SeconderyProductsSkelton(),
        SizedBox(
          height: 114,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: demoPopularProducts.length,
            itemBuilder: (context, index) {
              final int dicountPercent = Random().nextInt(50);
              final double priceAfetrDiscount =
                  demoPopularProducts[index].price *
                  (100 - dicountPercent) /
                  100;

              return Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding,
                  right: index == demoPopularProducts.length - 1
                      ? defaultPadding
                      : 0,
                ),
                child: SecondaryProductCard(
                  image: demoPopularProducts[index].images[0],
                  brandName: brandName,
                  title: demoPopularProducts[index].title,
                  price: demoPopularProducts[index].price,
                  priceAfetDiscount: priceAfetrDiscount,
                  dicountpercent: dicountPercent,
                  press: () {
                    Navigator.pushNamed(
                      context,
                      productDetailsScreenRoute,
                      arguments: index.isEven,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
