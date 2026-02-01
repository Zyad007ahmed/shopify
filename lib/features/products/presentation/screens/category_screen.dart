import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shopify/core/constants/app_strings.dart';
import 'package:shopify/core/widgets/error_dialog.dart';
import 'package:shopify/features/home/presentation/widgets/products_list.dart';
import 'package:shopify/features/products/domain/entities/category.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import 'package:shopify/features/products/presentation/providers/products_providers.dart';
import 'package:shopify/features/products/presentation/viewmodels/products_viewmodel/products_state.dart';

class CategoryScreen extends ConsumerWidget {
  final Category category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoryProductsViewModel(category.id));
    listenForError(context, ref);

    return Scaffold(
      appBar: getAppBar(),
      body: state.maybeWhen(
        loading: () => loadingSetup(),
        loaded: (products) => loadedSetup(products),
        empty: () => emptySetup(ref),
        orElse: () => SizedBox.shrink(),
      ),
    );
  }

  void listenForError(BuildContext context, WidgetRef ref) {
    ref.listen(categoryProductsViewModel(category.id), (_, state) {
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
    return Center(child: Text(AppStrings.noProductsInCategoryResults));
  }

  Widget loadingSetup() {
    return Center(child: CircularProgressIndicator());
  }

  Widget loadedSetup(List<Product> products) {
    return ProductsList(products: products);
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(title: Text(category.name), centerTitle: true);
  }
}
