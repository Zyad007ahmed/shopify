import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/favorites/domain/repos/favorites_repository.dart';

class IsFavoriteUseCase {
  final FavoritesRepository repository;

  IsFavoriteUseCase(this.repository);

  Future<ApiResult<bool>> call(int productId) async {
    return await repository.isFavorite(productId);
  }
}
