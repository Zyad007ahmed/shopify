import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/features/home/presentation/viewmodels/home_viewmodel/home_state.dart';
import 'package:shopify/features/home/presentation/viewmodels/home_viewmodel/home_viewmodel.dart';
import 'package:shopify/features/products/presentation/providers/products_providers.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewmodel, HomeState>((
  ref,
) {
  return HomeViewmodel(
    getCategoriesUsecase: ref.watch(getCategoriesUsecaseProvider),
    getCategoryProductsUsecase: ref.watch(getCategoryProductsUsecaseProvider),
  );
});
