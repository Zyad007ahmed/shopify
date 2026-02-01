import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/favorites/domain/repos/favorites_repository.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

class ToggleFavoriteUseCase {
  final FavoritesRepository repository;

  ToggleFavoriteUseCase(this.repository);

  Future<ApiResult<void>> call(Product product) async {
    return await repository.toggleFavorite(product);
  }
}
