import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/cart/domain/repos/cart_repository.dart';

class IsInCartUseCase {
  final CartRepository repository;

  IsInCartUseCase(this.repository);

  Future<ApiResult<bool>> call(int productId) async {
    return await repository.isInCart(productId);
  }
}
