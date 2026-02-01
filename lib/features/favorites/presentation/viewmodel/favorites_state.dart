import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/favorites/domain/entities/favorite_entity.dart';

part 'favorites_state.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState.initial() = _Initial;
  const factory FavoritesState.loading() = _Loading;
  const factory FavoritesState.loaded(List<Favorite> favorites) = _Loaded;
  const factory FavoritesState.empty() = _Empty;
  const factory FavoritesState.error(String message) = _Error;
}
