import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/favorites/data/repos/favorites_repository_impl.dart';
import 'package:shopify/features/favorites/domain/repos/favorites_repository.dart';
import 'package:shopify/features/favorites/presentation/viewmodel/favorites_state.dart';
import 'package:shopify/features/favorites/presentation/viewmodel/favorites_viewmodel.dart';
import '../../data/datasources/favorites_local_datasource.dart';
import '../../domain/usecases/get_favorites_usecase.dart';
import '../../domain/usecases/is_favorite_usecase.dart';
import '../../domain/usecases/toggle_favorite_usecase.dart';

// DATA SOURCE PROVIDER
final favoritesLocalDataSourceProvider = Provider<FavoritesLocalDataSource>((
  ref,
) {
  return FavoritesLocalDataSourceImpl();
});

// REPOSITORY PROVIDER
final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  final localDataSource = ref.watch(favoritesLocalDataSourceProvider);
  return FavoritesRepositoryImpl(localDataSource);
});

// USE CASE PROVIDERS

final getFavoritesUseCaseProvider = Provider<GetFavoritesUseCase>((ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  return GetFavoritesUseCase(repository);
});

final isFavoriteUseCaseProvider = Provider<IsFavoriteUseCase>((ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  return IsFavoriteUseCase(repository);
});

final toggleFavoriteUseCaseProvider = Provider<ToggleFavoriteUseCase>((ref) {
  final repository = ref.watch(favoritesRepositoryProvider);
  return ToggleFavoriteUseCase(repository);
});

// VIEWMODEL PROVIDER

final favoritesViewModelProvider =
    StateNotifierProvider<FavoritesViewModel, FavoritesState>((ref) {
      return FavoritesViewModel(
        getFavoritesUseCase: ref.watch(getFavoritesUseCaseProvider),
        toggleFavoriteUseCase: ref.watch(toggleFavoriteUseCaseProvider),
        ref: ref,
      );
    });

// HELPER PROVIDERS

final isProductFavoriteProvider = FutureProvider.family<bool, int>((
  ref,
  productId,
) async {
  final useCase = ref.watch(isFavoriteUseCaseProvider);
  final result = await useCase(productId);

  return result.when(
    failure: (failure) => false,
    success: (isFavorite) => isFavorite,
  );
});

final watchFavoritesCountProvider = Provider<int>((ref) {
  final favoritesState = ref.watch(favoritesViewModelProvider);

  return favoritesState.maybeWhen(
    loaded: (favorites) => favorites.length,
    orElse: () => 0,
  );
});
