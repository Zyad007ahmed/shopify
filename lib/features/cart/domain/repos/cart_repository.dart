import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

import '../entities/cart_item_entity.dart';

abstract class CartRepository {
  Future<ApiResult<List<CartItem>>> getCartItems();
  Future<ApiResult<void>> addToCart(Product product, int quantity);
  Future<ApiResult<void>> updateQuantity(int productId, int quantity);
  Future<ApiResult<void>> increaseQuantity(int productId);
  Future<ApiResult<void>> decreaseQuantity(int productId);
  Future<ApiResult<void>> removeFromCart(int productId);
  Future<ApiResult<void>> clearCart();
  Future<ApiResult<int>> getCartCount();
  Future<ApiResult<double>> getCartTotal();
  Future<ApiResult<bool>> isInCart(int productId);
}
