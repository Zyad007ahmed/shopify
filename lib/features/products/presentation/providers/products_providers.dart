import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/core/providers/core_providers.dart';
import 'package:shopify/features/products/data/datasources/products_remote_data_source.dart';
import 'package:shopify/features/products/data/repos/products_repository_impl.dart';
import 'package:shopify/features/products/domain/usecases/get_categories_usecase.dart';
import 'package:shopify/features/products/domain/usecases/get_category_products_usecase.dart';
import 'package:shopify/features/products/domain/usecases/get_related_products_usecase.dart';
import 'package:shopify/features/products/domain/usecases/search_products_usecase.dart';
import 'package:shopify/features/products/presentation/viewmodels/products_viewmodel/products_state.dart';
import 'package:shopify/features/products/presentation/viewmodels/products_viewmodel/products_viewmodel.dart';

// DATA SOURCE PROVIDER
final productsRemoteDataSourceProvider = Provider<ProductsRemoteDataSource>((
  ref,
) {
  final dio = ref.watch(dioProvider);
  return ProductsRemoteDataSource(dio);
});

// REPOSITORY PROVIDER
final productsRepositoryProvider = Provider<ProductsRepositoryImpl>((ref) {
  final dataSource = ref.watch(productsRemoteDataSourceProvider);
  return ProductsRepositoryImpl(dataSource: dataSource);
});

// USE CASE PROVIDERS
final getCategoriesUsecaseProvider = Provider<GetCategoriesUsecase>((ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return GetCategoriesUsecase(repository);
});

final getCategoryProductsUsecaseProvider = Provider<GetCategoryProductsUsecase>(
  (ref) {
    final repository = ref.watch(productsRepositoryProvider);
    return GetCategoryProductsUsecase(repository);
  },
);

final getRelatedProductsUsecaseProvider = Provider<GetRelatedProductsUsecase>((
  ref,
) {
  final repository = ref.watch(productsRepositoryProvider);
  return GetRelatedProductsUsecase(repository);
});

final searchProductsUsecaseProvider = Provider<SearchProductsUsecase>((ref) {
  final repository = ref.watch(productsRepositoryProvider);
  return SearchProductsUsecase(repository);
});

// VIEWMODELS PROVIDERS
final categoryProductsViewModel =
    StateNotifierProvider.family<ProductsViewmodel, ProductsState, int>((
      ref,
      categoryId,
    ) {
      final viewModel = ProductsViewmodel(
        getCategoryProductsUsecase: ref.watch(
          getCategoryProductsUsecaseProvider,
        ),
        getRelatedProductsUsecase: ref.watch(getRelatedProductsUsecaseProvider),
      );

      viewModel.getCategoryProducts(categoryId);

      return viewModel;
    });

final relatedProductsViewModel =
    StateNotifierProvider.family<ProductsViewmodel, ProductsState, int>((
      ref,
      productId,
    ) {
      final viewModel = ProductsViewmodel(
        getCategoryProductsUsecase: ref.watch(
          getCategoryProductsUsecaseProvider,
        ),
        getRelatedProductsUsecase: ref.watch(getRelatedProductsUsecaseProvider),
      );

      viewModel.getRelatedProducts(productId);

      return viewModel;
    });
