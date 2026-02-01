import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/core/constants/app_strings.dart';
import 'package:shopify/core/widgets/error_dialog.dart';
import 'package:shopify/features/favorites/domain/entities/favorite_entity.dart';
import 'package:shopify/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:shopify/features/favorites/presentation/viewmodel/favorites_state.dart';
import 'package:shopify/features/home/presentation/widgets/products_list.dart';

class FavoritiesScreen extends ConsumerWidget {
  const FavoritiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(favoritesViewModelProvider);
    listenForError(context, ref);

    return state.maybeWhen(
      initial: () => SizedBox.shrink(),
      loading: () => loadingSetup(),
      loaded: (favorites) => loadedSetup(favorites),
      empty: () => emptySetup(),
      orElse: () => SizedBox.shrink(),
    );
  }

  Widget loadingSetup() {
    return Center(child: CircularProgressIndicator());
  }

  Widget loadedSetup(List<Favorite> favorites) {
    final products = favorites.map((favorite) => favorite.toProtuct()).toList();

    return ProductsList(products: products);
  }

  Widget emptySetup() {
    return Center(
      child: Text(
        'There is no Bookmarked items yet!',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  void listenForError(BuildContext context, WidgetRef ref) {
    ref.listen(favoritesViewModelProvider, (_, state) {
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
}
