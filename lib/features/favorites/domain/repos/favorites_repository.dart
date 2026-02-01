import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

import '../entities/favorite_entity.dart';

abstract class FavoritesRepository {
  Future<ApiResult<List<Favorite>>> getFavorites();
  Future<ApiResult<bool>> isFavorite(int productId);
  Future<ApiResult<void>> toggleFavorite(Product product);
  Future<ApiResult<void>> clearFavorites();
}
