import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/entities/category_with_products.dart';
import 'package:shopify/features/products/domain/usecases/get_categories_usecase.dart';
import 'package:shopify/features/products/domain/usecases/get_category_products_usecase.dart';
import 'package:shopify/features/home/presentation/viewmodels/home_viewmodel/home_state.dart';

class HomeViewmodel extends StateNotifier<HomeState> {
  final GetCategoriesUsecase getCategoriesUsecase;
  final GetCategoryProductsUsecase getCategoryProductsUsecase;

  HomeViewmodel({
    required this.getCategoriesUsecase,
    required this.getCategoryProductsUsecase,
  }) : super(const HomeState.initial()) {
    loadCategoriesWithProducts();
  }

  Future<void> loadCategoriesWithProducts({int productsPerCategory = 5}) async {
    state = HomeState.loading();

    final categoriesResult = await getCategoriesUsecase();

    categoriesResult.when(
      success: (categories) async {
        final futures = categories.map((category) {
          return getCategoryProductsUsecase(
            category.id,
            limit: productsPerCategory,
          );
        }).toList();

        final results = await Future.wait(futures);

        final categoriesProducts = <CategoryWithProducts>[];

        for (int i = 0; i < categories.length; i++) {
          results[i].when(
            success: (products) {
              categoriesProducts.add(
                CategoryWithProducts(
                  category: categories[i],
                  products: products,
                ),
              );
              state = HomeState.loaded(categoriesProducts);
            },
            failure: (_) {},
          );
        }
      },
      failure: (error) => state = HomeState.error(error.message!),
    );
  }
}
