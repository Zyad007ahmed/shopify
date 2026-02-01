import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/cart/domain/repos/cart_repository.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

class AddToCartUseCase {
  final CartRepository repository;

  AddToCartUseCase(this.repository);

  Future<ApiResult<void>> call(Product product, [int quantity = 1]) async {
    return await repository.addToCart(product, quantity);
  }
}
