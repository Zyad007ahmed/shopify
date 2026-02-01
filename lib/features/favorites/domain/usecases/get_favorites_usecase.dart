import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/favorites/domain/entities/favorite_entity.dart';
import 'package:shopify/features/favorites/domain/repos/favorites_repository.dart';

class GetFavoritesUseCase {
  final FavoritesRepository repository;

  GetFavoritesUseCase(this.repository);

  Future<ApiResult<List<Favorite>>> call() async {
    return await repository.getFavorites();
  }
}
