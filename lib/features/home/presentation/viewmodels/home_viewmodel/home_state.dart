import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopify/features/products/domain/entities/category_with_products.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded(
    List<CategoryWithProducts> categoriesWithProducts,
  ) = _Loaded;
  const factory HomeState.error(String message) = _Error;
}
