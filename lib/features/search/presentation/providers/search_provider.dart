import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/features/products/presentation/providers/products_providers.dart';
import 'package:shopify/features/search/presentation/viewmodel/search_viewmodel/search_state.dart';
import 'package:shopify/features/search/presentation/viewmodel/search_viewmodel/search_viewmodel.dart';

final searchViewModelProvider =
    StateNotifierProvider<SearchViewmodel, SearchState>((ref) {
      return SearchViewmodel(
        searchProductsUsecase: ref.watch(searchProductsUsecaseProvider),
      );
    });
