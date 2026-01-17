import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/usecases/get_category_products_usecase.dart';
import 'package:shopify/features/products/domain/usecases/get_related_products_usecase.dart';
import 'package:shopify/features/products/presentation/viewmodels/products_viewmodel/products_state.dart';

class ProductsViewmodel extends StateNotifier<ProductsState> {
  final GetCategoryProductsUsecase getCategoryProductsUsecase;
  final GetRelatedProductsUsecase getRelatedProductsUsecase;

  ProductsViewmodel({
    required this.getCategoryProductsUsecase,
    required this.getRelatedProductsUsecase,
  }) : super(const ProductsState.initial());

  Future<void> getCategoryProducts(
    int categoryId, {
    int offset = 0,
    int limit = 10,
  }) async {
    state = ProductsState.loading();

    final result = await getCategoryProductsUsecase(
      categoryId,
      offset: offset,
      limit: limit,
    );

    result.when(
      success: (products) => state = ProductsState.loaded(products),
      failure: (error) => state = ProductsState.error(error.message!),
    );
  }

  Future<void> getRelatedProducts(
    int productId, {
    int offset = 0,
    int limit = 10,
  }) async {
    state = ProductsState.loading();

    final result = await getRelatedProductsUsecase(
      productId,
      offset: offset,
      limit: limit,
    );

    result.when(
      success: (products) => state = ProductsState.loaded(products),
      failure: (error) => state = ProductsState.error(error.message!),
    );
  }
}
