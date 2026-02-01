import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/demos/demos.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/core/theme/app_colors.dart';
import 'package:shopify/core/utils/extensions.dart';
import 'package:shopify/core/widgets/network_image_with_loader.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

class ProductCardTile extends StatelessWidget {
  const ProductCardTile({
    super.key,
    required this.product,
    this.dicountpercent = 0,
  });

  final Product product;
  final int dicountpercent;

  double get priceAfterDiscount => (100 - dicountpercent) / 100 * product.price;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPress(context),
      style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.15,
            child: Stack(
              children: [
                NetworkImageWithLoader(
                  product.images[0],
                  radius: defaultBorderRadious,
                ),
                if (dicountpercent != 0)
                  Positioned(
                    right: defaultPadding / 2,
                    top: defaultPadding / 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2,
                      ),
                      height: 16,
                      decoration: const BoxDecoration(
                        color: AppColors.errorColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(defaultBorderRadious),
                        ),
                      ),
                      child: Text(
                        "$dicountpercent% off",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding / 2,
                vertical: defaultPadding / 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    demoBrandName.toUpperCase(),
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(fontSize: 10),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(
                      context,
                    ).textTheme.titleSmall!.copyWith(fontSize: 12),
                  ),
                  const Spacer(),
                  dicountpercent != 0
                      ? Row(
                          children: [
                            Text(
                              product.formattedPrice,
                              style: const TextStyle(
                                color: Color(0xFF31B0D8),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: defaultPadding / 4),
                            Text(
                              "\$${product.price}",
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.color,
                                fontSize: 10,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        )
                      : Text(
                          "\$${product.price}",
                          style: const TextStyle(
                            color: Color(0xFF31B0D8),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPress(BuildContext context) {
    context.pushNamed(productDetailsScreenRoute, arguments: product);
  }
}
