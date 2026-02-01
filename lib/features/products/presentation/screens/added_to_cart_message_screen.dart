import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/core/utils/extensions.dart';
import 'package:shopify/features/cart/presentation/providers/cart_provider.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

class AddedToCartMessageScreen extends ConsumerWidget {
  final Product product;
  final int productQuantity;

  const AddedToCartMessageScreen({
    super.key,
    required this.product,
    required this.productQuantity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                "assets/Illustration/success.png",
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              const Spacer(flex: 2),
              Text(
                "Added to cart",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              const Text(
                "Click the checkout button to complete the purchase process.",
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 2),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, entryPointScreenRoute);
                },
                child: const Text("Continue shopping"),
              ),
              const SizedBox(height: defaultPadding),
              ElevatedButton(
                child: const Text("Checkout"),
                onPressed: () {
                  ref
                      .read(cartViewModelProvider.notifier)
                      .addToCart(product, productQuantity);
                  context.pop();
                  context.pop();
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
