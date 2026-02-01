import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/theme/app_colors.dart';
import 'package:shopify/core/widgets/product/product_card.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import 'package:shopify/features/products/presentation/providers/products_providers.dart';
import 'package:shopify/features/products/presentation/viewmodels/products_viewmodel/products_state.dart';

class RelatedProducts extends ConsumerWidget {
  const RelatedProducts({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(relatedProductsViewModel(product.id));

    return state.maybeWhen(
      loading: () => loadingSetup(),
      loaded: (products) => loadedSetup(products),
      orElse: () => SizedBox.shrink(),
    );
  }

  Widget loadedSetup(List<Product> products) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
          left: defaultPadding,
          right: index == products.length - 1 ? defaultPadding : 0,
        ),
        child: ProductCard(product: products[index]),
      ),
    );
  }

  Widget loadingSetup() {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor,
      highlightColor: Colors.white,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: defaultPadding,
              right: index == 4 ? defaultPadding : 0,
            ),
            child: Container(
              width: 140,
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadious),
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
