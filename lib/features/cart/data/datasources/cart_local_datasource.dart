import 'package:hive_flutter/hive_flutter.dart';
import '../../../../core/error/exceptions.dart';
import '../models/cart_item_model.dart';

abstract class CartLocalDataSource {
  Future<List<CartItemModel>> getCartItems();
  Future<void> addToCart(CartItemModel cartItem);
  Future<void> updateQuantity(int productId, int quantity);
  Future<void> removeFromCart(int productId);
  Future<void> clearCart();
  Future<int> getCartCount();
  Future<double> getCartTotal();
  Future<bool> isInCart(int productId);
}

class CartLocalDataSourceImpl implements CartLocalDataSource {
  static const String _boxName = 'cart';

  Box<CartItemModel> get _cartBox => Hive.box<CartItemModel>(_boxName);

  @override
  Future<List<CartItemModel>> getCartItems() async {
    try {
      final items = _cartBox.values.toList();

      items.sort((a, b) => b.addedAt.compareTo(a.addedAt));

      return items;
    } catch (e) {
      throw CacheException('Failed to get cart items: ${e.toString()}');
    }
  }

  @override
  Future<void> addToCart(CartItemModel cartItem) async {
    try {
      if (_cartBox.containsKey(cartItem.productId)) {
        final existingItem = _cartBox.get(cartItem.productId);
        if (existingItem != null) {
          final updatedItem = existingItem.copyWith(
            quantity: existingItem.quantity + cartItem.quantity,
          );
          await _cartBox.put(cartItem.productId, updatedItem);
        }
      } else {
        await _cartBox.put(cartItem.productId, cartItem);
      }
    } catch (e) {
      throw CacheException('Failed to add to cart: ${e.toString()}');
    }
  }

  @override
  Future<void> updateQuantity(int productId, int quantity) async {
    try {
      final item = _cartBox.get(productId);

      if (item == null) {
        throw CacheException('Item not found in cart');
      }

      final updatedItem = item.copyWith(quantity: quantity);
      await _cartBox.put(productId, updatedItem);
    } catch (e) {
      throw CacheException('Failed to update quantity: ${e.toString()}');
    }
  }

  @override
  Future<void> removeFromCart(int productId) async {
    try {
      await _cartBox.delete(productId);
    } catch (e) {
      throw CacheException('Failed to remove from cart: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      await _cartBox.clear();
    } catch (e) {
      throw CacheException('Failed to clear cart: ${e.toString()}');
    }
  }

  @override
  Future<int> getCartCount() async {
    try {
      int total = 0;
      for (var item in _cartBox.values) {
        total += item.quantity;
      }
      return total;
    } catch (e) {
      return 0;
    }
  }

  @override
  Future<double> getCartTotal() async {
    try {
      double total = 0.0;
      for (var item in _cartBox.values) {
        total += item.itemTotal;
      }
      return total;
    } catch (e) {
      return 0.0;
    }
  }

  @override
  Future<bool> isInCart(int productId) async {
    try {
      return _cartBox.containsKey(productId);
    } catch (e) {
      return false;
    }
  }
}
