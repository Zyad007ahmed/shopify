import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/cart_item_entity.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.loaded({
    required List<CartItem> items,
    required double subtotal,
    required int totalItems,
  }) = CartLoaded;
  const factory CartState.empty() = _Empty;
  const factory CartState.error(String message) = _Error;
}
