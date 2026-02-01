import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/cart/domain/repos/cart_repository.dart';

class GetCartCountUseCase {
  final CartRepository repository;

  GetCartCountUseCase(this.repository);

  Future<ApiResult<int>> call() async {
    return await repository.getCartCount();
  }
}
