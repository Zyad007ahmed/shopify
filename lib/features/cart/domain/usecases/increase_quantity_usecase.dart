import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/cart/domain/repos/cart_repository.dart';

class IncreaseQuantityUseCase {
  final CartRepository repository;

  IncreaseQuantityUseCase(this.repository);

  Future<ApiResult<void>> call(int productId) async {
    return await repository.increaseQuantity(productId);
  }
}
