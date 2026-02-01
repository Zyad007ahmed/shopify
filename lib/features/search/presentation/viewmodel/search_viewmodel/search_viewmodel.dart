import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/usecases/search_products_usecase.dart';
import 'package:shopify/features/search/presentation/viewmodel/search_viewmodel/search_state.dart';

class SearchViewmodel extends StateNotifier<SearchState> {
  final SearchProductsUsecase searchProductsUsecase;

  SearchViewmodel({required this.searchProductsUsecase})
    : super(const SearchState.initial());

  final TextEditingController searchController = TextEditingController();

  Future<void> search(String query) async {
    if (query.trim().length <= 2) {
      state = SearchState.initial();
      return;
    }

    state = SearchState.loading();

    final result = await searchProductsUsecase(query.trim());

    result.when(
      success: (products) {
        if (products.isEmpty) {
          state = SearchState.empty();
        } else {
          state = SearchState.loaded(products);
        }
      },
      failure: (error) => state = SearchState.error(error.message!),
    );
  }

  void clearSearch() {
    state = SearchState.initial();
    searchController.clear();
  }
}
