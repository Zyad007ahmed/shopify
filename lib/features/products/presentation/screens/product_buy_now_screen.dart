import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/widgets/cart_button.dart';
import 'package:shopify/core/widgets/custom_modal_bottom_sheet.dart';
import 'package:shopify/core/widgets/network_image_with_loader.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import 'package:shopify/features/products/presentation/screens/added_to_cart_message_screen.dart';
import 'package:shopify/features/products/presentation/screens/product_details_screen.dart';
import 'package:shopify/features/products/presentation/widgets/product_list_tile.dart';
import 'package:shopify/features/products/presentation/widgets/product_quantity.dart';
import 'package:shopify/features/products/presentation/widgets/selected_colors.dart';
import 'package:shopify/features/products/presentation/widgets/selected_size.dart';
import 'package:shopify/features/products/presentation/widgets/unit_price.dart';

class ProductBuyNowScreen extends ConsumerStatefulWidget {
  const ProductBuyNowScreen({super.key, required this.product});

  final Product product;

  @override
  ConsumerState<ProductBuyNowScreen> createState() =>
      _ProductBuyNowScreenState();
}

class _ProductBuyNowScreenState extends ConsumerState<ProductBuyNowScreen> {
  int productQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CartButton(
        price: widget.product.price,
        title: "Add to cart",
        subTitle: "Total price",
        press: () {
          customModalBottomSheet(
            context,
            isDismissible: false,
            child: AddedToCartMessageScreen(
              product: widget.product,
              productQuantity: productQuantity,
            ),
          );
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding / 2,
              vertical: defaultPadding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                Text(
                  widget.product.title,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                BookmarkBtn(product: widget.product),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: AspectRatio(
                      aspectRatio: 1.05,
                      child: NetworkImageWithLoader(widget.product.images[0]),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(defaultPadding),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: UnitPrice(price: widget.product.price)),
                        ProductQuantity(
                          numOfItem: productQuantity,
                          onIncrement: () {
                            setState(() {
                              productQuantity++;
                            });
                          },
                          onDecrement: () {
                            setState(() {
                              productQuantity--;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: Divider()),
                SliverToBoxAdapter(
                  child: SelectedColors(
                    colors: const [
                      Color(0xFFEA6262),
                      Color(0xFFB1CC63),
                      Color(0xFFFFBF5F),
                      Color(0xFF9FE1DD),
                      Color(0xFFC482DB),
                    ],
                    selectedColorIndex: 2,
                    press: (value) {},
                  ),
                ),
                SliverToBoxAdapter(
                  child: SelectedSize(
                    sizes: const ["S", "M", "L", "XL", "XXL"],
                    selectedIndex: 1,
                    press: (value) {},
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  sliver: ProductListTile(
                    title: "Size guide",
                    svgSrc: "assets/icons/Sizeguid.svg",
                    isShowBottomBorder: true,
                    press: () {},
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: defaultPadding / 2),
                        Text(
                          "Store pickup availability",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: defaultPadding / 2),
                        const Text(
                          "Select a size to check store availability and In-Store pickup options.",
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  sliver: ProductListTile(
                    title: "Check stores",
                    svgSrc: "assets/icons/Stores.svg",
                    isShowBottomBorder: true,
                    press: () {},
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: defaultPadding),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
