import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/favorites/presentation/providers/favorites_provider.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/toggle_favorite_usecase.dart';
import 'favorites_state.dart';

class FavoritesViewModel extends StateNotifier<FavoritesState> {
  final GetFavoritesUseCase getFavoritesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;
  final Ref ref;

  FavoritesViewModel({
    required this.getFavoritesUseCase,
    required this.toggleFavoriteUseCase,
    required this.ref,
  }) : super(const FavoritesState.initial()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    state = const FavoritesState.loading();

    final result = await getFavoritesUseCase();

    result.when(
      failure: (error) => state = FavoritesState.error(error.message!),
      success: (favorites) {
        if (favorites.isEmpty) {
          state = const FavoritesState.empty();
        } else {
          state = FavoritesState.loaded(favorites);
        }
      },
    );
  }

  Future<void> toggleFavorite(Product product) async {
    final result = await toggleFavoriteUseCase(product);

    result.when(failure: (_) {}, success: (_) => loadFavorites());

    ref.invalidate(isProductFavoriteProvider(product.id));
  }
}
