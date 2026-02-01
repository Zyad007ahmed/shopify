import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/cart/domain/repos/cart_repository.dart';

class DecreaseQuantityUseCase {
  final CartRepository repository;

  DecreaseQuantityUseCase(this.repository);

  Future<ApiResult<void>> call(int productId) async {
    return await repository.decreaseQuantity(productId);
  }
}
