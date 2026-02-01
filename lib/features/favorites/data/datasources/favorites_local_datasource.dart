import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/error/exceptions.dart';
import '../models/favorite_model.dart';

abstract class FavoritesLocalDataSource {
  Future<List<FavoriteModel>> getFavorites();
  Future<void> addFavorite(FavoriteModel favorite);
  Future<void> removeFavorite(int productId);
  Future<bool> isFavorite(int productId);
  Future<void> clearFavorites();
}

class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  static const String _boxName = 'favorites';

  Box<FavoriteModel> get _favoritesBox => Hive.box<FavoriteModel>(_boxName);

  @override
  Future<List<FavoriteModel>> getFavorites() async {
    try {
      final favorites = _favoritesBox.values.toList();

      favorites.sort((a, b) => b.addedAt.compareTo(a.addedAt));

      return favorites;
    } catch (e) {
      throw CacheException('Failed to get favorites: ${e.toString()}');
    }
  }

  @override
  Future<void> addFavorite(FavoriteModel favorite) async {
    try {
      if (_favoritesBox.containsKey(favorite.productId)) {
        return;
      }

      await _favoritesBox.put(favorite.productId, favorite);
    } catch (e) {
      throw CacheException('Failed to add favorite: ${e.toString()}');
    }
  }

  @override
  Future<void> removeFavorite(int productId) async {
    try {
      await _favoritesBox.delete(productId);
    } catch (e) {
      throw CacheException('Failed to remove favorite: ${e.toString()}');
    }
  }

  @override
  Future<bool> isFavorite(int productId) async {
    try {
      return _favoritesBox.containsKey(productId);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> clearFavorites() async {
    try {
      await _favoritesBox.clear();
    } catch (e) {
      throw CacheException('Failed to clear favorites: ${e.toString()}');
    }
  }
}
