import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/core/utils/functions.dart';
import 'package:shopify/features/favorites/domain/repos/favorites_repository.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

import '../../domain/entities/favorite_entity.dart';
import '../datasources/favorites_local_datasource.dart';
import '../models/favorite_model.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final FavoritesLocalDataSource localDataSource;

  FavoritesRepositoryImpl(this.localDataSource);

  @override
  Future<ApiResult<List<Favorite>>> getFavorites() async {
    return await tryAndHandleError<List<Favorite>>(() async {
      final favoriteModels = await localDataSource.getFavorites();
      final favorites = favoriteModels
          .map((model) => model.toEntity())
          .toList();
      return favorites;
    });
  }

  @override
  Future<ApiResult<bool>> isFavorite(int productId) async {
    return await tryAndHandleError<bool>(() async {
      final isFav = await localDataSource.isFavorite(productId);
      return isFav;
    });
  }

  @override
  Future<ApiResult<void>> clearFavorites() async {
    return await tryAndHandleError<void>(() async {
      await localDataSource.clearFavorites();
    });
  }

  @override
  Future<ApiResult<void>> toggleFavorite(Product product) async {
    return await tryAndHandleError<void>(() async {
      final isFav = await localDataSource.isFavorite(product.id);

      if (isFav) {
        await localDataSource.removeFavorite(product.id);
      } else {
        final favoriteModel = FavoriteModel.fromProduct(product);
        await localDataSource.addFavorite(favoriteModel);
      }
    });
  }
}
