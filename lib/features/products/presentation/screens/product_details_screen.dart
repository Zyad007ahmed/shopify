import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/demos/demos.dart';
import 'package:shopify/core/widgets/cart_button.dart';
import 'package:shopify/core/widgets/custom_modal_bottom_sheet.dart';
import 'package:shopify/core/widgets/review_card.dart';
import 'package:shopify/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import 'package:shopify/features/products/presentation/screens/product_buy_now_screen.dart';
import 'package:shopify/features/products/presentation/widgets/notify_me_card.dart';
import 'package:shopify/features/products/presentation/widgets/product_images.dart';
import 'package:shopify/features/products/presentation/widgets/product_info.dart';
import 'package:shopify/features/products/presentation/widgets/product_list_tile.dart';
import 'package:shopify/features/products/presentation/widgets/related_products.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
    this.isProductAvailable = true,
  });

  final bool isProductAvailable;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: isProductAvailable
          ? CartButton(
              price: product.price,
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: ProductBuyNowScreen(product: product),
                );
              },
            )
          :
            /// If profuct is not available then show [NotifyMeCard]
            NotifyMeCard(isNotify: false, onChanged: (value) {}),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              actions: [BookmarkBtn(product: product)],
            ),
            ProductImages(images: product.images),
            ProductInfo(
              brand: demoBrandName,
              title: product.title,
              isAvailable: isProductAvailable,
              description: product.description ?? demoDescription,
              rating: 4.4,
              numOfReviews: 126,
            ),
            ProductListTile(
              svgSrc: "assets/icons/Product.svg",
              title: "Product Details",
              press: () {},
            ),
            ProductListTile(
              svgSrc: "assets/icons/Delivery.svg",
              title: "Shipping Information",
              press: () {},
            ),
            ProductListTile(
              svgSrc: "assets/icons/Return.svg",
              title: "Returns",
              isShowBottomBorder: true,
              press: () {},
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: ReviewCard(
                  rating: 4.3,
                  numOfReviews: 128,
                  numOfFiveStar: 80,
                  numOfFourStar: 30,
                  numOfThreeStar: 5,
                  numOfTwoStar: 4,
                  numOfOneStar: 1,
                ),
              ),
            ),
            ProductListTile(
              svgSrc: "assets/icons/Chat.svg",
              title: "Reviews",
              isShowBottomBorder: true,
              press: () {},
            ),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "You may also like",
                  style: Theme.of(context).textTheme.titleSmall!,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: RelatedProducts(product: product),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: defaultPadding)),
          ],
        ),
      ),
    );
  }
}

class BookmarkBtn extends ConsumerWidget {
  const BookmarkBtn({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavResult = ref.watch(isProductFavoriteProvider(product.id));

    return isFavResult.when(
      data: (isFav) => IconButton(
        onPressed: () {
          ref.read(favoritesViewModelProvider.notifier).toggleFavorite(product);
        },
        icon: SvgPicture.asset(
          "assets/icons/Bookmark.svg",
          colorFilter: ColorFilter.mode(
            isFav ? Colors.yellow : Colors.black,
            BlendMode.srcIn,
          ),
          fit: BoxFit.contain,
        ),
      ),
      error: (_, _) => IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/Bookmark.svg",
          colorFilter: ColorFilter.mode(
            Theme.of(context).textTheme.bodyLarge!.color!,
            BlendMode.srcIn,
          ),
        ),
      ),
      loading: () => SizedBox.shrink(),
    );
  }
}
