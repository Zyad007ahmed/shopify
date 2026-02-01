import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/cart/domain/repos/cart_repository.dart';

class UpdateQuantityUseCase {
  final CartRepository repository;

  UpdateQuantityUseCase(this.repository);

  Future<ApiResult<void>> call(int productId, int quantity) async {
    return await repository.updateQuantity(productId, quantity);
  }
}
