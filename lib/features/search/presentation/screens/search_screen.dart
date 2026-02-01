import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shopify/core/constants/app_strings.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/widgets/error_dialog.dart';
import 'package:shopify/features/home/presentation/widgets/products_list.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import 'package:shopify/features/search/presentation/providers/search_provider.dart';
import 'package:shopify/features/search/presentation/viewmodel/search_viewmodel/search_state.dart';
import 'package:shopify/features/search/presentation/widgets/search_form.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchViewModelProvider);
    listenForError(context, ref);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: SearchForm(),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                child: searchResult(state, ref),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchResult(SearchState state, WidgetRef ref) {
    return state.maybeWhen(
      loading: () => loadingSetup(),
      loaded: (products) => loadedSetup(products),
      empty: () => emptySetup(ref),
      orElse: () => SizedBox.shrink(),
    );
  }

  Widget loadingSetup() {
    return Center(child: CircularProgressIndicator());
  }

  Widget loadedSetup(List<Product> products) {
    return ProductsList(products: products);
  }

  void listenForError(BuildContext context, WidgetRef ref) {
    ref.listen(searchViewModelProvider, (_, state) {
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

  Widget emptySetup(WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Text(AppStrings.noSearchResults),
          const SizedBox(height: defaultPadding),
          Text(
            ref.read(searchViewModelProvider.notifier).searchController.text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
