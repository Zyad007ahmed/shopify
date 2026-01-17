import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/demos/demos.dart';
import 'package:shopify/core/widgets/banner/m/banner_m_with_counter.dart';
import 'package:shopify/core/widgets/product/product_card.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // While loading show 👇
        // const BannerMWithCounterSkelton(),
        BannerMWithCounter(
          duration: const Duration(hours: 8),
          text: "Super Flash Sale \n50% Off",
          press: () {},
        ),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "Flash sale",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading show 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: demoFlashSaleProducts.length,
            itemBuilder: (context, index) {
              final int dicountPercent = Random().nextInt(50);

              return Padding(
                padding: EdgeInsets.only(
                  left: defaultPadding,
                  right: index == demoFlashSaleProducts.length - 1
                      ? defaultPadding
                      : 0,
                ),
                child: ProductCard(
                  product: demoFlashSaleProducts[index],
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
