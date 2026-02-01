import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/cart/domain/entities/cart_item_entity.dart';
import 'package:shopify/features/cart/domain/usecases/decrease_quantity_usecase.dart';
import 'package:shopify/features/cart/domain/usecases/increase_quantity_usecase.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import '../../domain/usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/clear_cart_usecase.dart';
import '../../domain/usecases/get_cart_items_usecase.dart';
import '../../domain/usecases/remove_from_cart_usecase.dart';
import 'cart_state.dart';

class CartViewModel extends StateNotifier<CartState> {
  final GetCartItemsUseCase getCartItemsUseCase;
  final AddToCartUseCase addToCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final IncreaseQuantityUseCase increaseQuantityUseCase;
  final DecreaseQuantityUseCase decreaseQuantityUseCase;
  final ClearCartUseCase clearCartUseCase;

  CartViewModel({
    required this.getCartItemsUseCase,
    required this.addToCartUseCase,
    required this.removeFromCartUseCase,
    required this.increaseQuantityUseCase,
    required this.decreaseQuantityUseCase,
    required this.clearCartUseCase,
  }) : super(const CartState.initial()) {
    loadCart();
  }

  Future<void> loadCart() async {
    state = const CartState.loading();

    final result = await getCartItemsUseCase();

    result.when(
      failure: (failure) => state = CartState.error(failure.message!),
      success: (items) {
        if (items.isEmpty) {
          state = const CartState.empty();
        } else {
          double subtotal = _getSubTotal(items);

          int totalItems = _getTotalItems(items);

          state = CartState.loaded(
            items: items,
            subtotal: subtotal,
            totalItems: totalItems,
          );
        }
      },
    );
  }

  int _getTotalItems(List<CartItem> items) {
    int totalItems = 0;
    for (var item in items) {
      totalItems += item.quantity;
    }
    return totalItems;
  }

  double _getSubTotal(List<CartItem> items) {
    double subtotal = 0.0;
    for (var item in items) {
      subtotal += item.itemTotal;
    }
    return subtotal;
  }

  Future<void> addToCart(Product product, [int quantity = 1]) async {
    final result = await addToCartUseCase(product, quantity);

    result.when(failure: (_) {}, success: (_) => loadCart());
  }

  Future<void> removeFromCart(int productId) async {
    final result = await removeFromCartUseCase(productId);

    result.when(failure: (_) {}, success: (_) => loadCart());
  }

  Future<void> increaseQuantity(int productId) async {
    final result = await increaseQuantityUseCase(productId);

    result.when(failure: (_) {}, success: (_) => loadCart());
  }

  Future<void> decreaseQuantity(int productId) async {
    final result = await decreaseQuantityUseCase(productId);

    result.when(failure: (_) {}, success: (_) => loadCart());
  }

  Future<void> clearCart() async {
    final result = await clearCartUseCase();

    result.when(
      failure: (failure) => state = CartState.error(failure.message!),
      success: (_) => state = const CartState.empty(),
    );
  }

  Future<void> refreshCart() async {
    await loadCart();
  }
}
