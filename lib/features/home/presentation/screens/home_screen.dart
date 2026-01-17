import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shopify/core/constants/app_strings.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/widgets/banner/s/banner_s_style_1.dart';
import 'package:shopify/core/widgets/banner/s/banner_s_style_5.dart';
import 'package:shopify/core/widgets/error_dialog.dart';
import 'package:shopify/features/home/presentation/providers/home_providers.dart';
import 'package:shopify/features/home/presentation/widgets/loading_home_skelton.dart';
import 'package:shopify/features/products/domain/entities/category_with_products.dart';
import 'package:shopify/features/home/presentation/viewmodels/home_viewmodel/home_state.dart';
import 'package:shopify/features/home/presentation/widgets/api_sections.dart';
import 'package:shopify/features/home/presentation/widgets/fake_sections/best_sellers.dart';
import 'package:shopify/features/home/presentation/widgets/fake_sections/flash_sale.dart';
import 'package:shopify/features/home/presentation/widgets/fake_sections/most_popular.dart';
import 'package:shopify/features/home/presentation/widgets/fake_sections/offers_carousel.dart';
import 'package:shopify/features/home/presentation/widgets/fake_sections/popular_products.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);
    listenForError(context, ref);

    return Scaffold(
      body: SafeArea(
        child: state.maybeWhen(
          loading: () => const LoadingHomeSkelton(),
          loaded: (categoriesWithProducts) =>
              loadedSetup(categoriesWithProducts, ref),
          orElse: () => SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget loadedSetup(
    List<CategoryWithProducts> categoriesWithProducts,
    WidgetRef ref,
  ) {
    return RefreshIndicator(
      onRefresh: () => onRefesh(ref),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: OffersCarousel()),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
            sliver: SliverToBoxAdapter(
              child: ApiSections(
                categoriesWithProducts: categoriesWithProducts,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: PopularProducts()),
          const SliverPadding(
            padding: EdgeInsets.only(top: defaultPadding * 1.5),
            sliver: SliverToBoxAdapter(child: FlashSale()),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                BannerSStyle1(
                  title: "New \narrival",
                  subtitle: "SPECIAL OFFER",
                  discountParcent: 50,
                  press: () {
                    // Navigator.pushNamed(context, onSaleScreenRoute);
                  },
                ),
                const SizedBox(height: defaultPadding / 4),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: BestSellers()),
          const SliverToBoxAdapter(child: MostPopular()),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: defaultPadding * 1.5),

                const SizedBox(height: defaultPadding / 4),
                BannerSStyle5(
                  title: "Black \nfriday",
                  subtitle: "50% Off",
                  bottomText: "Collection".toUpperCase(),
                  press: () {
                    // Navigator.pushNamed(context, onSaleScreenRoute);
                  },
                ),
                const SizedBox(height: defaultPadding / 4),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void listenForError(BuildContext context, WidgetRef ref) {
    ref.listen(homeViewModelProvider, (_, state) {
      state.whenOrNull(
        error: (message) => showDialog(
          context: context,
          builder: (context) {
            return ErrorDialog(
              title: AppStrings.loadingFailed,
              message: message,
            );
          },
        ),
      );
    });
  }

  Future<void> onRefesh(WidgetRef ref) async {
    ref.read(homeViewModelProvider.notifier).loadCategoriesWithProducts();
  }
}
