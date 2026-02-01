import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/core/utils/functions.dart';
import 'package:shopify/features/cart/domain/repos/cart_repository.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

import '../../domain/entities/cart_item_entity.dart';
import '../datasources/cart_local_datasource.dart';
import '../models/cart_item_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;

  CartRepositoryImpl(this.localDataSource);

  @override
  Future<ApiResult<List<CartItem>>> getCartItems() async {
    return await tryAndHandleError<List<CartItem>>(() async {
      final cartItemModels = await localDataSource.getCartItems();
      final cartItems = cartItemModels
          .map((model) => model.toEntity())
          .toList();
      return cartItems;
    });
  }

  @override
  Future<ApiResult<void>> addToCart(Product product, [int quantity = 1]) async {
    return await tryAndHandleError<void>(() async {
      final cartItemModel = CartItemModel.fromProduct(
        product,
        quantity: quantity,
      );
      await localDataSource.addToCart(cartItemModel);
    });
  }

  @override
  Future<ApiResult<void>> updateQuantity(int productId, int quantity) async {
    return await tryAndHandleError<void>(() async {
      await localDataSource.updateQuantity(productId, quantity);
    });
  }

  @override
  Future<ApiResult<void>> removeFromCart(int productId) async {
    return await tryAndHandleError<void>(() async {
      await localDataSource.removeFromCart(productId);
    });
  }

  @override
  Future<ApiResult<void>> clearCart() async {
    return await tryAndHandleError<void>(() async {
      await localDataSource.clearCart();
    });
  }

  @override
  Future<ApiResult<int>> getCartCount() async {
    return await tryAndHandleError<int>(() async {
      final count = await localDataSource.getCartCount();
      return count;
    });
  }

  @override
  Future<ApiResult<double>> getCartTotal() async {
    return await tryAndHandleError<double>(() async {
      final total = await localDataSource.getCartTotal();
      return total;
    });
  }

  @override
  Future<ApiResult<bool>> isInCart(int productId) async {
    return await tryAndHandleError<bool>(() async {
      final isInCart = await localDataSource.isInCart(productId);
      return isInCart;
    });
  }

  @override
  Future<ApiResult<void>> increaseQuantity(int productId) async {
    return await tryAndHandleError<void>(() async {
      final items = await localDataSource.getCartItems();
      final item = items.firstWhere((item) => item.productId == productId);

      final newQuantity = item.quantity + 1;
      return await updateQuantity(productId, newQuantity);
    });
  }

  @override
  Future<ApiResult<void>> decreaseQuantity(int productId) async {
    return await tryAndHandleError<void>(() async {
      final items = await localDataSource.getCartItems();
      final item = items.firstWhere((item) => item.productId == productId);

      final newQuantity = item.quantity - 1;
      return await updateQuantity(productId, newQuantity);
    });
  }
}
